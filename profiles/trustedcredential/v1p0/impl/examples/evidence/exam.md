---
title: "Exam"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-02
description: "Evidence Exam example for TrustEd Credential 1.0 implementations"
---

#### Pass an exam

This example describes a TrustEd Credential of a learner that has passed the Exam
related to the assignment `Introduction to Statistics - Assignment 3`, issued
by the `Example University` institution. The exam is graded by a letter grade,
being a `C` the minimum for passing.

The learned did well, because it passed the exam with an `A`. The credential also
links to the report, located at `https://example.org/evidence/exam-completion-report.pdf`.

```obv3p0
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
  ],
  "id": "https://example.org/credentials/3732",
  "type": ["VerifiableCredential", "OpenBadgeCredential"],
  "name": "Introduction to Statistics - Assignment 3",
  "description": "Awarded for successful completion of the Assignment 3 exam.",
  "issuer": {
    "id": "https://example.org/issuers/1",
    "type": ["Profile"],
    "name": "Example University",
    "url": "https://example.org"
  },
  "validFrom": "2026-07-01T00:00:00Z",
  "awardedDate": "2026-06-28T00:00:00Z",

  "credentialSubject": {
    "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
    "type": ["AchievementSubject"],

    "achievement": {
      "id": "https://example.org/achievements/assignment-3",
      "type": ["Achievement"],
      "achievementType": "Assignment",
      "name": "Assignment 3 Exam",
      "description": "An assignment consisting of a single graded exam covering descriptive statistics.",
      "criteria": {
        "narrative": "Recipient must complete the Assignment 3 exam and receive a passing letter grade of C or higher."
      },
      "resultDescription": [
        {
          "id": "https://example.org/achievements/assignment-3/results/exam-grade",
          "type": ["ResultDescription"],
          "name": "Exam Grade",
          "resultType": "LetterGrade",
          "allowedValue": ["F", "D", "C", "B", "A"],
          "requiredValue": "C"
        }
      ]
    },

    "result": [
      {
        "type": ["Result"],
        "resultDescription": "https://example.org/achievements/assignment-3/results/exam-grade",
        "value": "A"
      }
    ]
  },

  "evidence": [
    {
      "id": "https://example.org/evidence/exam-completion-report.pdf",
      "type": ["Evidence"],
      "name": "Exam Completion Report",
      "description": "A document describing the successful completion of the Assignment 3 exam.",
      "narrative": "The recipient completed the exam on 2026-06-28 and achieved a letter grade of A, exceeding the required passing grade of C."
    }
  ]
}
```

In this example:

- `achievementType`: `Assignment` — one of the enumerated `AchievementType` values, set directly on the `Achievement` object.
- Single `ResultDescription` — nested inside `Achievement.resultDescription` (cardinality 0..*, here just one).
- `resultType`: `LetterGrade` is the enumerated `ResultType` value; `allowedValue` gives the possible grades and `requiredValue` the passing threshold.
- The actual `result` — asserted on `AchievementSubject.result`, which links back to the ResultDescription via its `id` (the `resultDescription` property on `Result` is a URI reference, not an inline object) and carries the earned value (`A`).
- Evidence — on the top-level `AchievementCredential.evidence` array. `id` is the URI of the file describing successful completion; `narrative` and `description` add human-readable context.
- It uses a `did:example:...` for the subject `id` as a placeholder — in a real credential this would identify the actual recipient (DID, `identifier`, etc.), and per AchievementSubject rules, either `id` or an `identifier` entry must be present.
