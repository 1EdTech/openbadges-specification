---
title: "Degree"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-02
description: "Evidence Degree example for TrustEd Credential 1.0 implementations"
---

#### Earn a Degree

##### GPA

This example describes a TrustEd Credential of a learner that has successfully
completed the degree `Bachelor of Science in Computer Science`, issued
by the `Example University` institution. The degree is graded by a GPA,
being a `2.0` the minimum for passing.

The learned did well, because its GPA is `3.85`. The credential also
links to the report, located at `https://example.edu/registrar/degree-conferral/3732.pdf`.

```obv3p0
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
  ],
  "id": "https://example.edu/credentials/3732",
  "type": [
    "VerifiableCredential",
    "AchievementCredential"
  ],
  "name": "Bachelor of Science in Computer Science",
  "description": "Awarded to a student who has successfully completed all requirements for the Bachelor of Science in Computer Science degree program.",
  "issuer": {
    "id": "https://example.edu/issuers/registrar",
    "type": ["Profile"],
    "name": "Example University",
    "url": "https://example.edu"
  },
  "validFrom": "2026-05-15T00:00:00Z",
  "awardedDate": "2026-05-15T00:00:00Z",
  "evidence": [
    {
      "id": "https://example.edu/registrar/degree-conferral/3732.pdf",
      "type": ["Evidence"],
      "name": "Degree Conferral Confirmation",
      "description": "Official letter confirming successful completion of all degree requirements.",
      "narrative": "This document, issued by the Office of the Registrar, confirms that the recipient completed all coursework, credit-hour, and residency requirements for the Bachelor of Science in Computer Science and was conferred the degree on the awarded date."
    }
  ],
  "credentialSubject": {
    "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
    "type": ["AchievementSubject"],
    "result": [
      {
        "type": ["Result"],
        "resultDescription": "https://example.edu/achievements/bscs-degree/results/cumulative-gpa",
        "value": "3.85"
      }
    ],
    "achievement": {
      "id": "https://example.edu/achievements/bscs-degree",
      "type": ["Achievement"],
      "achievementType": "Degree",
      "name": "Bachelor of Science in Computer Science",
      "description": "A four-year undergraduate degree program covering the theoretical foundations and practical application of computer science, including algorithms, software engineering, systems, and mathematics.",
      "criteria": {
        "narrative": "Awarded to students who complete a minimum of 120 credit hours, including all required computer science core courses, mathematics requirements, general education requirements, and a capstone project, while maintaining the university's minimum cumulative GPA standard."
      },
      "fieldOfStudy": "Computer Science",
      "resultDescription": [
        {
          "id": "https://example.edu/achievements/bscs-degree/results/cumulative-gpa",
          "type": ["ResultDescription"],
          "name": "Cumulative Grade Point Average",
          "resultType": "GradePointAverage",
          "valueMin": "0.0",
          "valueMax": "4.0",
          "requiredValue": "2.0"
        }
      ]
    }
  }
}
```

In this example:

- `achievementType`: `Degree` — one of the enumerated `AchievementType` values, set directly on the `Achievement` object.
- Single `ResultDescription` — nested inside `Achievement.resultDescription` (cardinality 0..*, here just one).
- `resultType`: `GradePointAverage` is the enumerated `ResultType` value; `valueMax` gives the maximum allowed value and `requiredValue` the passing threshold.
- The actual `result` — asserted on `AchievementSubject.result`, which links back to the ResultDescription via its `id` (the `resultDescription` property on `Result` is a URI reference, not an inline object) and carries the earned value (`3.85`).
- Evidence — on the top-level `AchievementCredential.evidence` array. `id` is the URI of the file describing successful completion; `narrative` and `description` add human-readable context.
- It uses a `did:example:...` for the subject `id` as a placeholder — in a real credential this would identify the actual recipient (DID, `identifier`, etc.), and per AchievementSubject rules, either `id` or an `identifier` entry must be present.

##### Numeric Grade

This example describes a TrustEd Credential of a learner that has successfully
completed the same degree, but graded with numerical values instead of GPA.
The possible grades are from 0.0 to 10.0, being 5.0 the required value to pass
the degree.

```obv3p0
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
  ],
  "id": "https://example.edu/credentials/3732",
  "type": [
    "VerifiableCredential",
    "AchievementCredential"
  ],
  "name": "Bachelor of Science in Computer Science",
  "description": "Awarded to a student who has successfully completed all requirements for the Bachelor of Science in Computer Science degree program.",
  "issuer": {
    "id": "https://example.edu/issuers/registrar",
    "type": [
      "Profile"
    ],
    "name": "Example University",
    "url": "https://example.edu"
  },
  "validFrom": "2026-05-15T00:00:00Z",
  "awardedDate": "2026-05-15T00:00:00Z",
  "evidence": [
    {
      "id": "https://example.edu/registrar/degree-conferral/3732.pdf",
      "type": [
        "Evidence"
      ],
      "name": "Degree Conferral Confirmation",
      "description": "Official letter confirming successful completion of all degree requirements.",
      "narrative": "This document, issued by the Office of the Registrar, confirms that the recipient completed all coursework, credit-hour, and residency requirements for the Bachelor of Science in Computer Science and was conferred the degree on the awarded date."
    }
  ],
  "credentialSubject": {
    "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
    "type": [
      "AchievementSubject"
    ],
    "result": [
      {
        "type": [
          "Result"
        ],
        "resultDescription": "https://example.edu/achievements/bscs-degree/results/raw",
        "value": "8.7"
      }
    ],
    "achievement": {
      "id": "https://example.edu/achievements/bscs-degree",
      "type": [
        "Achievement"
      ],
      "achievementType": "Degree",
      "name": "Bachelor of Science in Computer Science",
      "description": "A four-year undergraduate degree program covering the theoretical foundations and practical application of computer science, including algorithms, software engineering, systems, and mathematics.",
      "criteria": {
        "narrative": "Awarded to students who complete a minimum of 120 credit hours, including all required computer science core courses, mathematics requirements, general education requirements, and a capstone project."
      },
      "fieldOfStudy": "Computer Science",
      "resultDescription": [
        {
          "id": "https://example.edu/achievements/bscs-degree/results/raw",
          "type": [
            "ResultDescription"
          ],
          "name": "Cumulative Grade Point Average",
          "resultType": "RawScore",
          "valueMin": "0.0",
          "valueMax": "10.0",
          "requiredValue": "5.0"
        }
      ]
    }
  }
}
```

In this example:

- `resultType`: `RawScore` is the enumerated `ResultType` value, because the value can be any number from `0.0`
to `10.0`. If we wanted to have a scaled value, we would choose `ScaledValue` instead.
