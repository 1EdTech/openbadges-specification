---
title: "Competency - Skill"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-09
description: "Evidence Competency - Skill example for TrustEd Credential 1.0 implementations"
---

#### Master a competency / skill

This example describes a TrustEd Credential of a learner that has passed the competency
`Data Literacy and Analysis`, issued by the `Example University` institution.
The competency is graded by a rubric, defining the levels:

- `Emerging`
- `Developing`
- `Proficient`
- `Advanced`

The learned mastered the competency with the `Advanced` level. The credential also
links to a portfolio, located at `https://example.org/evidence/learner123/data-analysis-portfolio.pdf`.

```obv3p0
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
  ],
  "id": "https://example.org/credentials/data-literacy-badge-001",
  "type": ["VerifiableCredential", "AchievementCredential"],
  "name": "Data Literacy and Analysis Competency Badge",
  "issuer": {
    "id": "https://example.edu/issuers/1",
    "type": ["Profile"],
    "name": "Example University",
    "url": "https://example.edu",
    "email": "credentials@example.edu"
  },
  "validFrom": "2025-03-15T09:00:00Z",
  "credentialSubject": {
    "id": "did:example:learner123",
    "type": ["AchievementSubject"],
    "achievement": {
      "id": "https://example.org/achievements/data-literacy",
      "type": ["Achievement"],
      "achievementType": "Competency",
      "name": "Data Literacy and Analysis",
      "description": "Demonstrates the ability to collect, clean, interpret, and communicate insights from structured datasets using appropriate tools and methodologies.",
      "criteria": {
        "narrative": "The learner must demonstrate proficiency across all dimensions of the Data Literacy rubric: data collection, data cleaning, analysis, and communication of findings. A minimum level of **Proficient** is required."
      },
      "resultDescription": [
        {
          "id": "https://example.org/achievements/data-literacy/rubric/rd-01",
          "type": ["ResultDescription"],
          "name": "Data Literacy Rubric",
          "resultType": "RubricCriterionLevel",
          "requiredLevel": "https://example.org/achievements/data-literacy/rubric/proficient",
          "rubricCriterionLevel": [
            {
              "id": "https://example.org/achievements/data-literacy/rubric/emerging",
              "type": ["RubricCriterionLevel"],
              "name": "Emerging",
              "description": "Demonstrates basic awareness of data concepts but requires significant guidance to collect, clean, or interpret data.",
              "level": "1",
              "points": "1"
            },
            {
              "id": "https://example.org/achievements/data-literacy/rubric/developing",
              "type": ["RubricCriterionLevel"],
              "name": "Developing",
              "description": "Can perform basic data tasks with some guidance. Identifies common patterns but struggles with complex datasets or edge cases.",
              "level": "2",
              "points": "2"
            },
            {
              "id": "https://example.org/achievements/data-literacy/rubric/proficient",
              "type": ["RubricCriterionLevel"],
              "name": "Proficient",
              "description": "Independently collects, cleans, analyses, and communicates findings from structured datasets with appropriate tools. Applies sound methodological choices.",
              "level": "3",
              "points": "3"
            },
            {
              "id": "https://example.org/achievements/data-literacy/rubric/advanced",
              "type": ["RubricCriterionLevel"],
              "name": "Advanced",
              "description": "Consistently produces high-quality, reproducible analyses. Demonstrates sophisticated methodological awareness, handles ambiguity, and clearly communicates nuanced findings to diverse audiences.",
              "level": "4",
              "points": "4"
            }
          ]
        }
      ]
    },
    "result": [
      {
        "type": ["Result"],
        "resultDescription": "https://example.org/achievements/data-literacy/rubric/rd-01",
        "achievedLevel": "https://example.org/achievements/data-literacy/rubric/advanced"
      }
    ]
  },
  "evidence": [
    {
      "id": "https://example.org/evidence/learner123/data-analysis-portfolio.pdf",
      "type": ["Evidence"],
      "name": "Data Analysis Portfolio",
      "description": "A portfolio document containing the learner's annotated data analysis project, including data collection methodology, cleaning scripts, analysis outputs, and a written summary of findings."
    }
  ]
}
```
