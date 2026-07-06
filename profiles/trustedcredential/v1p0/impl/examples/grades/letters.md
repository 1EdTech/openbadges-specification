---
title: "Letter Grades"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-06
description: "Letter Grades Credential example for TrustEd Credential 1.0 implementations"
---

##### Letter Grades

This example describes a TrustEd Credential of a learner that has passed the Course
`Introduction to Data Science`, issued by the `Example University` institution.

The course is graded by a letter grade, being a `C` the minimum for passing.

The learned did well, because it passed the exam with an `A`.

```obv3p0
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
  ],
  "id": "https://example.edu/credentials/3732",
  "type": ["VerifiableCredential", "OpenBadgeCredential"],
  "name": "Introduction to Data Science",
  "description": "Awarded for successful completion of the Introduction to Data Science course, including a final letter grade.",
  "issuer": {
    "id": "https://example.edu/issuers/565049",
    "type": ["Profile"],
    "name": "Example University",
    "url": "https://example.edu"
  },
  "validFrom": "2026-06-15T00:00:00Z",
  "awardedDate": "2026-06-15T00:00:00Z",
  "credentialSubject": {
    "type": ["AchievementSubject"],
    "identifier": [
      {
        "type": "IdentityObject",
        "hashed": false,
        "identityType": "emailAddress",
        "identityHash": "learner@example.edu"
      }
    ],
    "achievement": {
      "id": "https://example.edu/achievements/intro-data-science",
      "type": ["Achievement"],
      "achievementType": "Course",
      "name": "Introduction to Data Science",
      "description": "A one-semester course covering foundational data science concepts, including statistics, data wrangling, and visualization.",
      "criteria": {
        "narrative": "Recipients must complete all course assignments, exams, and the final project, earning a passing letter grade of D or higher."
      },
      "creditsAvailable": 3.0,
      "fieldOfStudy": "Data Science",
      "resultDescription": [
        {
          "id": "https://example.edu/achievements/intro-data-science/results/final-grade",
          "type": ["ResultDescription"],
          "name": "Final Letter Grade",
          "resultType": "LetterGrade",
          "allowedValue": ["F", "D", "C", "B", "A"],
          "requiredValue": "C"
        }
      ]
    },
    "result": [
      {
        "type": ["Result"],
        "resultDescription": "https://example.edu/achievements/intro-data-science/results/final-grade",
        "value": "A"
      }
    ]
  }
}
```
