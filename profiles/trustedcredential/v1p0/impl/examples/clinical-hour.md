---
title: "Clinical Hour"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-06
description: "Clinical Hour example for TrustEd Credential 1.0 implementations"
---

#### Clinical Hours Example

The following example describes a 120.0 clinical hours achievement
named `Supervised Clinical Practice: Patient Care Foundations`
issued from the `Example Health Sciences Program` institution.

The learned received 120.0 credits from the completion of this achievement.

```obv3p0
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
  ],
  "id": "https://example.org/credentials/clinical-hours-001",
  "type": [
    "VerifiableCredential",
    "OpenBadgeCredential"
  ],
  "name": "Supervised Clinical Practice: Patient Care Foundations",
  "description": "Awarded for completing supervised clinical practice hours in patient care settings.",
  "issuer": {
    "id": "https://example.org/issuers/health-sciences-program",
    "type": ["Profile"],
    "name": "Example Health Sciences Program",
    "url": "https://example.org",
    "description": "An example clinical education provider.",
    "email": "credentials@example.org"
  },
  "validFrom": "2026-05-22T00:00:00Z",
  "awardedDate": "2026-05-22T00:00:00Z",
  "credentialSubject": {
    "id": "did:example:learner-789",
    "type": ["AchievementSubject"],
    "creditsEarned": 120.0,
    "activityStartDate": "2026-01-12T00:00:00Z",
    "activityEndDate": "2026-05-08T00:00:00Z",
    "achievement": {
      "id": "https://example.org/achievements/supervised-clinical-practice-patient-care-foundations",
      "type": ["Achievement"],
      "name": "Supervised Clinical Practice: Patient Care Foundations",
      "description": "The learner completed supervised clinical practice demonstrating foundational patient care skills.",
      "achievementType": "Fieldwork",
      "creditsAvailable": 120.0,
      "criteria": {
        "narrative": "Learners must complete 120 supervised clinical clock hours in an approved patient care setting. The value in creditsAvailable and creditsEarned represents clinical clock hours, not academic credit hours. Hours are verified by an approved clinical supervisor."
      }
    },
    "source": {
      "id": "https://example.org/profiles/clinical-supervisor-office",
      "type": ["Profile"],
      "name": "Clinical Supervisor Office",
      "url": "https://example.org/clinical-supervision",
      "description": "The office responsible for verifying supervised clinical practice hours."
    }
  }
}
```
