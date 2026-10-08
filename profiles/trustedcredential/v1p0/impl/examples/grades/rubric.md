---
title: "Rubric"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-02
description: "Rubric example for TrustEd Credential 1.0 implementations"
---

##### Rubric Example

This example describes a TrustEd Credential of a learner that has passed the
generic Achievement `Persuasive Essay Writing`, issued
by the `Example Unified School District` institution.

The achievement is graded using the rubric with name `Argument Development`
and built as:

| Rubric Criterion Level | Description | CASE Item |
| ---------------------- | ----------- | --------- |
| Emerging | States a claim but provides little or no supporting reasoning or evidence. | Argument Development - Emerging |
| Developing | States a claim and provides some reasoning or evidence, though support is inconsistent or underdeveloped. | Argument Development - Developing |
| Proficient | States a clear claim and supports it with relevant reasoning and evidence throughout the essay. | Argument Development - Proficient |
| Advanced | States a compelling claim and supports it with well-chosen, thoroughly analyzed reasoning and evidence, while anticipating counterarguments. | Argument Development - Advanced |

The learner's result for this achievement was the Rubric Criterion Level `Proficient`.

```obv3p0
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
  ],
  "id": "https://example.edu/credentials/3732",
  "type": ["VerifiableCredential", "OpenBadgeCredential"],
  "name": "Persuasive Essay Writing",
  "description": "Awarded to students who demonstrate persuasive essay writing skills, assessed against the Argument Development rubric criterion.",
  "issuer": {
    "id": "https://example.edu/issuers/1",
    "type": ["Profile"],
    "name": "Example Unified School District",
    "url": "https://example.edu"
  },
  "validFrom": "2026-06-15T00:00:00Z",
  "awardedDate": "2026-06-15T00:00:00Z",
  "credentialSubject": {
    "type": ["AchievementSubject"],
    "identifier": [
      {
        "type": "IdentifierEntry",
        "identifier": "student-9182",
        "identifierType": "sourcedId"
      }
    ],
    "achievement": {
      "id": "https://example.edu/achievements/persuasive-essay-writing",
      "type": ["Achievement"],
      "name": "Persuasive Essay Writing",
      "description": "Recognizes a student's ability to write a persuasive essay that develops and supports an argument for a specific audience.",
      "achievementType": "Assignment",
      "criteria": {
        "narrative": "Recipient submitted a persuasive essay that was scored against the 'Argument Development' rubric criterion and achieved at least the 'Proficient' level."
      },
      "resultDescription": [
        {
          "id": "https://example.edu/achievements/persuasive-essay-writing/results/argument-development",
          "type": ["ResultDescription"],
          "name": "Argument Development",
          "resultType": "RubricCriterionLevel",
          "requiredLevel": "https://example.edu/achievements/persuasive-essay-writing/results/argument-development/levels/proficient",
          "rubricCriterionLevel": [
            {
              "id": "https://example.edu/achievements/persuasive-essay-writing/results/argument-development/levels/emerging",
              "type": ["RubricCriterionLevel"],
              "name": "Emerging",
              "level": "1",
              "description": "States a claim but provides little or no supporting reasoning or evidence.",
              "alignment": [
                {
                  "type": ["Alignment"],
                  "targetName": "Argument Development - Emerging",
                  "targetUrl": "https://case.example.org/ims/case/v1p0/CFItems/8e2f1a10-0001-4a2e-9c3a-argdev-emerging",
                  "targetFramework": "Example State ELA Writing Rubric Framework",
                  "targetType": "CFItem"
                }
              ]
            },
            {
              "id": "https://example.edu/achievements/persuasive-essay-writing/results/argument-development/levels/developing",
              "type": ["RubricCriterionLevel"],
              "name": "Developing",
              "level": "2",
              "description": "States a claim and provides some reasoning or evidence, though support is inconsistent or underdeveloped.",
              "alignment": [
                {
                  "type": ["Alignment"],
                  "targetName": "Argument Development - Developing",
                  "targetUrl": "https://case.example.org/ims/case/v1p0/CFItems/8e2f1a10-0002-4a2e-9c3a-argdev-developing",
                  "targetFramework": "Example State ELA Writing Rubric Framework",
                  "targetType": "CFItem"
                }
              ]
            },
            {
              "id": "https://example.edu/achievements/persuasive-essay-writing/results/argument-development/levels/proficient",
              "type": ["RubricCriterionLevel"],
              "name": "Proficient",
              "level": "3",
              "description": "States a clear claim and supports it with relevant reasoning and evidence throughout the essay.",
              "alignment": [
                {
                  "type": ["Alignment"],
                  "targetName": "Argument Development - Proficient",
                  "targetUrl": "https://case.example.org/ims/case/v1p0/CFItems/8e2f1a10-0003-4a2e-9c3a-argdev-proficient",
                  "targetFramework": "Example State ELA Writing Rubric Framework",
                  "targetType": "CFItem"
                }
              ]
            },
            {
              "id": "https://example.edu/achievements/persuasive-essay-writing/results/argument-development/levels/advanced",
              "type": ["RubricCriterionLevel"],
              "name": "Advanced",
              "level": "4",
              "description": "States a compelling claim and supports it with well-chosen, thoroughly analyzed reasoning and evidence, while anticipating counterarguments.",
              "alignment": [
                {
                  "type": ["Alignment"],
                  "targetName": "Argument Development - Advanced",
                  "targetUrl": "https://case.example.org/ims/case/v1p0/CFItems/8e2f1a10-0004-4a2e-9c3a-argdev-advanced",
                  "targetFramework": "Example State ELA Writing Rubric Framework",
                  "targetType": "CFItem"
                }
              ]
            }
          ]
        }
      ]
    },

    "result": [
      {
        "type": ["Result"],
        "resultDescription": "https://example.edu/achievements/persuasive-essay-writing/results/argument-development",
        "achievedLevel": "https://example.edu/achievements/persuasive-essay-writing/results/argument-development/levels/proficient"
      }
    ]
  }
}
```
