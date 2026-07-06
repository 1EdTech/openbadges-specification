---
title: "Institution Accreditation"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-06
description: "Institution Accreditation example for TrustEd Credential 1.0 implementations"
---

##### Institution Accreditation Example

This example describe a Profile of the institution `ACME Institution`,
accredited by the `International Association of Universities (IAU) / UNESCO World Higher Education Database (WHED)`.

> **Note**: `International Association of Universities (IAU) / UNESCO World Higher Education Database (WHED)` is used in this example for learning purposes.

```json
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json",
    "https://purl.imsglobal.org/spec/ob-accred/v2p0/context"
  ],
  "id": "https://acme.edu/issuers/1",
  "type": [
    "Profile",
    "IssuerAccreditationProfile"
  ],
  "name": "ACME Institution",
  "url": "https://acme.edu",
  "email": "registrar@acme.edu",
  "description": "ACME Institution is a higher education institution offering undergraduate and graduate programs.",
  "address": {
    "type": ["Address"],
    "streetAddress": "1 Innovation Way",
    "addressLocality": "Springfield",
    "addressRegion": "IL",
    "addressCountry": "United States",
    "addressCountryCode": "US",
    "postalCode": "62701"
  },
  "accreditations": [
    {
      "type": [
        "Profile",
        "AccreditationProfile"
      ],
      "name": "International Association of Universities (IAU) / UNESCO World Higher Education Database (WHED)",
      "url": "https://www.whed.net",
      "contactInstructions": "Contact IAU via the WHED website contact form",
      "description": "ACME Institution is listed in the World Higher Education Database (WHED), a joint IAU/UNESCO service that recognizes institutions as bona fide, officially licensed or accredited higher education providers.",
      "areaServed": "Global",
      "accreditationDate": "2015-09-01",
      "educationalSector": "Postsecondary"
    }
  ]
}
```
