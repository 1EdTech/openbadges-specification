---
title: "Testing Center Creator"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-13
description: "Testing Center Creator example for TrustEd Credential 1.0 implementations"
---

#### Source Example

The following `AchievementCredential` describes the awarding of the `Advanced Calculus Placement Exam` exam `Achievement` assessed by the `National Testing Center`.

```obv3p0
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
  ],
  "id": "urn:uuid:8f14e45f-ceea-467f-9d4c-92e0f9a2b1a1",
  "type": ["VerifiableCredential", "OpenBadgeCredential"],
  "name": "Advanced Calculus Placement Exam",
  "description": "Awarded to students who pass the Advanced Calculus Placement Exam, granting placement credit toward the Calculus II requirement.",
  "issuer": {
    "id": "https://riverside.edu/issuers/registrar",
    "type": ["Profile"],
    "name": "Riverside State University, Office of the Registrar",
    "url": "https://riverside.edu",
    "email": "registrar@riverside.edu"
  },
  "validFrom": "2026-05-20T00:00:00Z",
  "awardedDate": "2026-05-20T00:00:00Z",
  "credentialSubject": {
    "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
    "type": ["AchievementSubject"],
    "source": {
      "id": "https://nationaltestingcenter.example.org/profile",
      "type": ["Profile"],
      "name": "National Testing Center",
      "url": "https://nationaltestingcenter.example.org",
      "email": "info@nationaltestingcenter.example.org",
      "description": "Independent proctored testing center that administers and scores standardized placement exams on behalf of partner institutions."
    },
    "achievement": {
      "id": "https://riverside.edu/achievements/calc-placement-exam",
      "type": ["Achievement"],
      "achievementType": "Assessment",
      "name": "Advanced Calculus Placement Exam",
      "description": "A proctored, timed exam covering limits, derivatives, integrals, and series, used to determine placement out of Calculus I.",
      "criteria": {
        "narrative": "Earners must complete the 90-minute proctored exam at an approved testing center and achieve a scaled score of 70 or higher, as scored by the administering testing center and reported to the issuing institution."
      },
      "fieldOfStudy": "Mathematics",
      "tag": ["mathematics", "calculus", "placement-exam"]
    }
  }
}
```
