---
title: "Numeric Grades"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-12
description: "Numeric Grades Credential example for TrustEd Credential 1.0 implementations"
---

#### Numeric Grades

This example describes a TrustEd Credential of a learner that has passed the Course
`Introduction to Data Science`, issued by the `Example University` institution.

The course is graded by a number score, from `0` to `10`. Learners should score at
least a `5` for passing.

The learned did well, because it passed the course with an `8.5`.

```obv3p0
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
  ],
  "id": "urn:uuid:a1b2c3d4-1234-5678-9abc-def012345678",
  "type": ["VerifiableCredential", "OpenBadgeCredential"],
  "name": "Introduction to Data Science",
  "description": "Certifies successful completion of the Introduction to Data Science course.",
  "issuer": {
    "id": "https://example.edu/issuers/564",
    "type": ["Profile"],
    "name": "Example University",
    "url": "https://example.edu"
  },
  "validFrom": "2026-06-15T00:00:00Z",
  "credentialSubject": {
    "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
    "type": ["AchievementSubject"],
    "achievement": {
      "id": "https://example.edu/achievements/intro-data-science",
      "type": ["Achievement"],
      "achievementType": "Course",
      "name": "Introduction to Data Science",
      "description": "A one-semester course covering statistics, data wrangling, and visualization.",
      "criteria": {
        "narrative": "Complete all course modules and score at least 5 on the final exam (0–10 scale)."
      },
      "resultDescription": [
        {
          "id": "https://example.edu/achievements/intro-data-science/results/final-grade",
          "type": ["ResultDescription"],
          "name": "Final Course Grade",
          "resultType": "RawScore",
          "valueMin": "0",
          "valueMax": "10",
          "requiredValue": "5"
        }
      ]
    },
    "result": [
      {
        "type": ["Result"],
        "resultDescription": "https://example.edu/achievements/intro-data-science/results/final-grade",
        "value": "8.5"
      }
    ]
  }
}
```
