---
title: "Machine Readability and Interoperability"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-12
description: "Machine Readability and Interoperability for TrustEd Credential 1.0 implementations"
---

## Machine Readability and Interoperability

Structured and consistent metadata improves the ability of wallets, learner records, talent systems, and verification services to interpret credentials accurately.

Issuers implementing TrustEd Credentials are encouraged to:

- use stable identifiers and URIs;
- avoid embedding critical semantics exclusively in free text;
- use structured vocabularies where possible;
- maintain consistent metadata practices across credentials; and
- preserve backward compatibility when revising credential definitions.

Implementers SHOULD consider both human readability and machine readability when designing credential metadata structures.

### Bad example

In this example, machine readability is avoided in favour of human readability, and
everything is flattened into `description` and `criteria.narrative`: the credit hours,
the pass thresholds, the rubric levels, and the competency codes+URLs are all just prose.

Nothing here is queryable, comparable, or verifiable by a consumer — a wallet or verifier
can't check "did they hit 70%?" or "is this aligned to DA-2?" without parsing free text.
achievementType and creditsAvailable are also omitted even though dedicated fields exist for them.

```json
{
  "id": "https://example.edu/achievements/applied-data-analysis-course-bad",
  "type": ["Achievement"],
  "name": "Applied Data Analysis",
  "description": "This is a 4.5-credit undergraduate course in the Data Science program. To earn this achievement, a student must (1) pass a final written exam covering statistical inference and data interpretation, scoring at least 70%, and (2) complete a practical data analysis project, which is graded on a rubric with three levels: Emerging, Proficient, and Mastered. A grade of Proficient or higher is required to pass. This course aligns with the 'Data Analysis' (code DA-2) and 'Statistical Reasoning' (code SR-1) competencies defined in the Example Institute Competency Framework, available at https://example.org/competencies/data-analysis and https://example.org/competencies/statistical-reasoning.",
  "criteria": {
    "narrative": "See the description above for the full list of requirements, grading thresholds, and competency alignments."
  }
}
```

### Good example

The previous credential should have been expressed as this example, where the same
data is placed in structure:

- `achievementType: "Course"` and `creditsAvailable: 4.5` replace prose statements of course type/credit load.
- Achievement-level `alignment` (two `CFItem` entries, DA-2 and SR-1) expresses the overall competency mapping for the course as a whole.
- `criteria.narrative` is kept, but now only for the human-readable summary of what's required — the actual thresholds live in structured fields, so the narrative and data can't drift out of sync in a way that matters to machines.
- Two `resultDescription` entries model the two distinct assessments:
  - `Final exam` with a `resultType: "Percent"` and `valueMin`/`valueMax`/`requiredValue` as strings — a continuous numeric scale, so min/max/required is the right shape (not `allowedValue`). It carries its own alignment to SR-1, since the exam specifically targets statistical reasoning rather than the whole course.
  - `Practical assessment` with a `resultType: "RubricCriterionLevel"` and an ordered `rubricCriterionLevel` array (Emerging → Proficient → Mastered) and `requiredLevel` pointing at the Proficient level's `id`. This is a discrete ordered scale, so per-level entries are correct rather than a numeric range.
- Each rubric level carries its own `alignment`, using `targetType: "CFRubricCriterionLevel"` pointing at a CASE-published rubric level — distinct from the `CFItem` alignments at the achievement/resultDescription level. That's the pattern your memory already flagged: CASE alignment on individual `RubricCriterionLevel` entries uses CFRubricCriterionLevel/CFRubric targets, while broader achievement- or result-level alignment to a competency itself uses `CFItem`.

```json
{
  "id": "https://example.edu/achievements/applied-data-analysis-course",
  "type": ["Achievement"],
  "achievementType": "Course",
  "name": "Applied Data Analysis",
  "description": "A 4.5-credit undergraduate course covering statistical reasoning and applied data analysis techniques, assessed through a final written exam and a practical data analysis project.",
  "fieldOfStudy": "Data Science",
  "creditsAvailable": 4.5,
  "criteria": {
    "id": "https://example.edu/achievements/applied-data-analysis-course/criteria",
    "narrative": "To earn this achievement, a learner must complete Applied Data Analysis (4.5 credits) by (1) passing the final exam with a score of at least 70%, and (2) completing the practical data analysis project at or above the 'Proficient' rubric level. See the linked `resultDescription` entries for the specific measures and thresholds."
  },
  "alignment": [
    {
      "type": ["Alignment"],
      "targetName": "Data Analysis",
      "targetDescription": "Ability to collect, clean, analyze, and interpret data to inform decisions.",
      "targetUrl": "https://example.org/competencies/data-analysis",
      "targetFramework": "Example Institute Competency Framework",
      "targetType": "CFItem",
      "targetCode": "DA-2"
    },
    {
      "type": ["Alignment"],
      "targetName": "Statistical Reasoning",
      "targetDescription": "Ability to apply statistical methods and reasoning to draw valid conclusions from data.",
      "targetUrl": "https://example.org/competencies/statistical-reasoning",
      "targetFramework": "Example Institute Competency Framework",
      "targetType": "CFItem",
      "targetCode": "SR-1"
    }
  ],
  "resultDescription": [
    {
      "id": "https://example.edu/achievements/applied-data-analysis-course/results/final-exam",
      "type": ["ResultDescription"],
      "name": "Final Exam Score",
      "resultType": "Percent",
      "valueMin": "0",
      "valueMax": "100",
      "requiredValue": "70",
      "alignment": [
        {
          "type": ["Alignment"],
          "targetName": "Statistical Reasoning",
          "targetUrl": "https://example.org/competencies/statistical-reasoning",
          "targetFramework": "Example Institute Competency Framework",
          "targetType": "CFItem",
          "targetCode": "SR-1"
        }
      ]
    },
    {
      "id": "https://example.edu/achievements/applied-data-analysis-course/results/practical-assessment",
      "type": ["ResultDescription"],
      "name": "Practical Data Analysis Assessment",
      "resultType": "RubricCriterionLevel",
      "requiredLevel": "https://example.edu/achievements/applied-data-analysis-course/results/practical-assessment/levels/proficient",
      "rubricCriterionLevel": [
        {
          "id": "https://example.edu/achievements/applied-data-analysis-course/results/practical-assessment/levels/emerging",
          "type": ["RubricCriterionLevel"],
          "name": "Emerging",
          "level": "1",
          "points": "1",
          "description": "Applies data analysis techniques with significant guidance; conclusions are only partially supported by the data.",
          "alignment": [
            {
              "type": ["Alignment"],
              "targetName": "Data Analysis \u2013 Emerging",
              "targetUrl": "https://case.example.org/rubrics/data-analysis-project/criteria/technique/levels/emerging",
              "targetFramework": "Example Institute Data Analysis Project Rubric (CASE)",
              "targetType": "CFRubricCriterionLevel",
              "targetCode": "DA-2.1"
            }
          ]
        },
        {
          "id": "https://example.edu/achievements/applied-data-analysis-course/results/practical-assessment/levels/proficient",
          "type": ["RubricCriterionLevel"],
          "name": "Proficient",
          "level": "2",
          "points": "2",
          "description": "Independently applies appropriate data analysis techniques and draws conclusions that are well-supported by the data.",
          "alignment": [
            {
              "type": ["Alignment"],
              "targetName": "Data Analysis \u2013 Proficient",
              "targetUrl": "https://case.example.org/rubrics/data-analysis-project/criteria/technique/levels/proficient",
              "targetFramework": "Example Institute Data Analysis Project Rubric (CASE)",
              "targetType": "CFRubricCriterionLevel",
              "targetCode": "DA-2.2"
            }
          ]
        },
        {
          "id": "https://example.edu/achievements/applied-data-analysis-course/results/practical-assessment/levels/mastered",
          "type": ["RubricCriterionLevel"],
          "name": "Mastered",
          "level": "3",
          "points": "3",
          "description": "Applies advanced data analysis techniques, critically evaluates methodology, and communicates nuanced, well-supported conclusions.",
          "alignment": [
            {
              "type": ["Alignment"],
              "targetName": "Data Analysis \u2013 Mastered",
              "targetUrl": "https://case.example.org/rubrics/data-analysis-project/criteria/technique/levels/mastered",
              "targetFramework": "Example Institute Data Analysis Project Rubric (CASE)",
              "targetType": "CFRubricCriterionLevel",
              "targetCode": "DA-2.3"
            }
          ]
        }
      ]
    }
  ]
}
```