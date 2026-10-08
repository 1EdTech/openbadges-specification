---
title: "Mastery Levels"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-06
description: "Mastery Levels example for TrustEd Credential 1.0 implementations"
---

##### Mastery Levels

This example describes a TrustEd Credential of a learner that has passed the Course
`General English Language Course`, issued by the
`Cambridge English & British Council Language Center` institution.

The course is graded by the mastery levels `First`, `Advanced`, and
`Proficiency`, defined as `rubricCriterionLevel`.

The learner got an `Advanced` level, as shown in the `result` field of
the `AchievementSubject`.

```obv3p0
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
  ],
  "id": "urn:uuid:8f3b2e1a-6d4c-4a2f-9b1e-2c7d5f9a1b3e",
  "type": ["VerifiableCredential", "OpenBadgeCredential"],
  "issuer": {
    "id": "https://example.org/issuers/cambridge-english",
    "type": ["Profile"],
    "name": "Cambridge English & British Council Language Center",
    "url": "https://example.org"
  },
  "validFrom": "2026-06-15T00:00:00Z",
  "name": "General English Language Course — Certificate",
  "credentialSubject": {
    "type": ["AchievementSubject"],
    "identifier": [
      {
        "type": "IdentityObject",
        "hashed": false,
        "identityHash": "learner@example.org",
        "identityType": "emailAddress"
      }
    ],
    "achievement": {
      "id": "https://example.org/achievements/general-english-course",
      "type": ["Achievement"],
      "achievementType": "Course",
      "name": "General English Language Course",
      "description": "A general English course assessed against three internationally recognized mastery levels, aligned with Cambridge English / British Council exam levels.",
      "criteria": {
        "narrative": "Complete all course modules and pass the final assessment, which places the learner at one of three mastery levels: First, Advanced, or Proficiency."
      },
      "resultDescription": [
        {
          "id": "https://example.org/achievements/general-english-course/results/mastery-level",
          "type": ["ResultDescription"],
          "name": "English Mastery Level",
          "resultType": "RubricCriterionLevel",
          "rubricCriterionLevel": [
            {
              "id": "https://example.org/achievements/general-english-course/levels/first",
              "type": ["RubricCriterionLevel"],
              "name": "First",
              "level": "1",
              "description": "Upper-intermediate command of English (CEFR B2). Can interact with a degree of fluency in familiar and some unfamiliar contexts.",
              "points": "1"
            },
            {
              "id": "https://example.org/achievements/general-english-course/levels/advanced",
              "type": ["RubricCriterionLevel"],
              "name": "Advanced",
              "level": "2",
              "description": "Advanced command of English (CEFR C1). Can communicate effectively in academic and professional settings.",
              "points": "2"
            },
            {
              "id": "https://example.org/achievements/general-english-course/levels/proficiency",
              "type": ["RubricCriterionLevel"],
              "name": "Proficiency",
              "level": "3",
              "description": "Mastery-level command of English (CEFR C2). Can understand and express virtually anything with precision, nuance, and fluency comparable to an educated native speaker.",
              "points": "3"
            }
          ]
        }
      ]
    },
    "result": [
      {
        "type": ["Result"],
        "resultDescription": "https://example.org/achievements/general-english-course/results/mastery-level",
        "achievedLevel": "https://example.org/achievements/general-english-course/levels/advanced"
      }
    ]
  }
}
```
