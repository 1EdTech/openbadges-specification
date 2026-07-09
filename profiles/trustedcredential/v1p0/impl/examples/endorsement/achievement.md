---
title: "Institution Endorsement"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-09
description: "Institution Endorsement example for TrustEd Credential 1.0 implementations"
---

##### Institution Endorsement Example

This example describes a Profile of the institution `ACME Institution`,
endorsed by the company `ACME.com` as one of its gold partner.

> **TODO**: Sign the endorsement when approved

```json
{
  "id": "https://example-institution.edu/issuer",
  "type": ["Profile"],
  "name": "Example Institution",
  "url": "https://example-institution.edu",
  "email": "info@example-institution.edu",
  "description": "A provider of professional development and continuing education courses.",
  "endorsement": [
    {
      "@context": [
        "https://www.w3.org/ns/credentials/v2",
        "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
      ],
      "id": "https://acme.com/endorsements/example-institution-gold-partner",
      "type": ["VerifiableCredential", "EndorsementCredential"],
      "name": "ACME Gold Partner Endorsement",
      "description": "Endorsement of Example Institution's status as an ACME Gold Partner for professional course delivery.",
      "issuer": {
        "id": "https://acme.com/issuer",
        "type": ["Profile"],
        "name": "ACME.com",
        "url": "https://acme.com"
      },
      "credentialSubject": {
        "id": "https://example-institution.edu/issuer",
        "type": ["EndorsementSubject"],
        "endorsementComment": "Example Institution is recognized as a **Gold Partner** of ACME.com, having met ACME's highest standards for the quality, consistency, and outcomes of its delivery of ACME's professional courses."
      },
      "awardedDate": "2026-01-15T00:00:00Z",
      "validFrom": "2026-01-15T00:00:00Z",
      "validUntil": "2027-01-15T00:00:00Z"
    }
  ]
}
```
