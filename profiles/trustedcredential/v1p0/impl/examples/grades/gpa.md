---
title: "GPA"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-06
description: "GPA Credential example for TrustEd Credential 1.0 implementations"
---

#### GPA

This example describes a TrustEd Credential of a learner that has passed the Degree
`Bachelor of Science in Computer Science`, issued by the `Example University` institution.

The degree is graded by a GPA, from `0` to `7`. Learners should score at
least a `4` for passing.

The learned passed the degree with an GPA of `5.8`.

```obv3p0
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
  ],
  "id": "urn:uuid:a1b2c3d4-e5f6-4a5b-8c9d-0e1f2a3b4c5d",
  "type": ["VerifiableCredential", "OpenBadgeCredential"],
  "name": "Bachelor of Science in Computer Science",
  "issuer": {
    "id": "https://university.example.edu/issuer.json",
    "type": ["Profile"],
    "name": "Example University"
  },
  "validFrom": "2026-06-15T00:00:00Z",
  "credentialSubject": {
    "type": ["AchievementSubject"],
    "identifier": [
      {
        "type": "IdentityObject",
        "hashed": false,
        "identityHash": "student@example.edu",
        "identityType": "emailAddress"
      }
    ],
    "achievement": {
      "id": "https://university.example.edu/achievements/bsc-cs",
      "type": ["Achievement"],
      "achievementType": "Degree",
      "name": "Bachelor of Science in Computer Science",
      "description": "Awarded upon successful completion of the BSc Computer Science program.",
      "criteria": {
        "narrative": "Completion of all required coursework with a minimum cumulative GPA of 4.0 out of 7.0."
      },
      "resultDescription": [
        {
          "id": "https://university.example.edu/achievements/bsc-cs/results/gpa",
          "type": ["ResultDescription"],
          "name": "GPA",
          "resultType": "GradePointAverage",
          "valueMin": "0",
          "valueMax": "7",
          "requiredValue": "4"
        }
      ]
    },
    "result": [
      {
        "type": ["Result"],
        "resultDescription": "https://university.example.edu/achievements/bsc-cs/results/gpa",
        "value": "5.8"
      }
    ]
  }
}
```
