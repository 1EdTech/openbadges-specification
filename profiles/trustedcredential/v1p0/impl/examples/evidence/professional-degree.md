---
title: "Professional Degree"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-09-03
description: "Evidence Professional Degree example for TrustEd Credential 1.0 implementations"
---

#### Earn a professional certification exam

This example describes a TrustEd Credential of a learner that has passed the PMP
(Project Management Professional) certification, issued by the
`ACME University Continuing Education` institution.

Having the credential means that the learner did pass certification. The credential also
links to the report, located at `https://example.org/evidence/exam-completion-report.pdf`.

```obv3p0
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
  ],
  "id": "https://example.edu/credentials/pmp-cred-7f3a2c1d",
  "type": [
    "VerifiableCredential",
    "OpenBadgeCredential"
  ],
  "name": "Project Management Professional (PMP)",
  "description": "Awarded to individuals who have demonstrated the education, experience, and examination performance required to earn the PMP certification.",
  "issuer": {
    "id": "https://example.edu/issuers/acme-university",
    "type": ["Profile"],
    "name": "ACME University Continuing Education",
    "url": "https://example.edu"
  },
  "awardedDate": "2026-08-15T00:00:00Z",
  "validFrom": "2026-08-15T00:00:00Z",
  "credentialSubject": {
    "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
    "type": ["AchievementSubject"],
    "achievement": {
      "id": "https://example.edu/achievements/pmp-certificate",
      "type": ["Achievement"],
      "achievementType": "Certification",
      "name": "Project Management Professional (PMP)",
      "description": "The PMP certification recognizes demonstrated competency in leading and directing projects, validated through a combination of eligible experience and a formal examination.",
      "criteria": {
        "narrative": "Successfully pass the PMP certification examination after satisfying the eligibility requirements for project management education and experience."
      }
    }
  },
  "evidence": [
    {
      "id": "https://example.edu/evidence/pmp-completion-letter",
      "type": ["Evidence"],
      "name": "PMP Certification Completion Letter",
      "description": "A letter confirming successful completion of the PMP certification examination and all associated eligibility requirements.",
      "narrative": "This document, issued by the certifying body, confirms that the recipient met all eligibility requirements and successfully passed the PMP examination."
    }
  ]
}
```

In this example:

- `achievementType`: `Certification` — one of the enumerated `AchievementType` values, set directly on the `Achievement` object.
- Evidence — on the top-level `AchievementCredential.evidence` array. `id` is the URI of the file describing successful completion; `narrative` and `description` add human-readable context.
- It uses a `did:example:...` for the subject `id` as a placeholder — in a real credential this would identify the actual recipient (DID, `identifier`, etc.), and per AchievementSubject rules, either `id` or an `identifier` entry must be present.
