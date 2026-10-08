---
title: "Institution Creator"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-13
description: "Institution Creator example for TrustEd Credential 1.0 implementations"
---

##### Institution

This example describes an `Achievement` for the certificate `Advanced Data Analytics Certificate`,
created by the `Northbridge Institute of Technology` institution. The profile of this institution
contains all optional fields - except `endorsement` and `endorsementJwk`, including the organizational
fields.

The personal-name fields (familyName, givenName, etc.) are semantically meant for a Profile representing a person — here the institution's creator Profile is an organization. Therefore, they contain the
data of the "authorized official" named in `official` (Dr. Miriam Ashworth).

It also contains a minimal information of the parent organization (`Northbridge University System`).

```json
{
  "id": "https://catalog.northbridge.edu/achievements/advanced-data-analytics-certificate",
  "type": [
    "Achievement"
  ],
  "achievementType": "Certificate",
  "name": "Advanced Data Analytics Certificate",
  "description": "Awarded to learners who demonstrate proficiency in statistical analysis, data visualization, and applied machine learning techniques.",
  "criteria": {
    "id": "https://catalog.northbridge.edu/achievements/advanced-data-analytics-certificate/criteria",
    "narrative": "Recipients must complete four graduate-level analytics courses and pass a capstone project evaluated by faculty reviewers."
  },
  "fieldOfStudy": "Data Analytics",
  "creditsAvailable": 12.0,
  "creator": {
    "id": "https://northbridge.edu/profile.json",
    "type": [
      "Profile"
    ],
    "name": "Northbridge Institute of Technology",
    "url": "https://northbridge.edu",
    "phone": "+1-617-555-0148",
    "description": "An accredited research university offering graduate and undergraduate programs in engineering, computing, and applied sciences.",
    "image": {
      "id": "https://northbridge.edu/assets/institution-logo.png",
      "type": "Image",
      "caption": "Northbridge Institute of Technology seal"
    },
    "email": "credentials@northbridge.edu",
    "address": {
      "type": [
        "Address"
      ],
      "addressCountry": "United States",
      "addressCountryCode": "US",
      "addressRegion": "Massachusetts",
      "addressLocality": "Northbridge",
      "streetAddress": "1200 Innovation Way",
      "postalCode": "01534",
      "geo": {
        "type": "GeoCoordinates",
        "latitude": 42.1215,
        "longitude": -71.6544
      }
    },
    "otherIdentifier": [
      {
        "type": "IdentifierEntry",
        "identifier": "003456789",
        "identifierType": "systemId"
      },
      {
        "type": "IdentifierEntry",
        "identifier": "credentials@northbridge.edu",
        "identifierType": "emailAddress"
      }
    ],
    "official": "Dr. Miriam Ashworth, Registrar",
    "parentOrg": {
      "id": "https://northbridge-university-system.edu/profile.json",
      "type": [
        "Profile"
      ],
      "name": "Northbridge University System"
    },
    "familyName": "van Ashworth",
    "givenName": "Miriam",
    "additionalName": "Elaine",
    "patronymicName": "Petrovna",
    "honorificPrefix": "Dr.",
    "honorificSuffix": "Ph.D.",
    "familyNamePrefix": "van",
    "dateOfBirth": "1971-04-09"
  }
}
```
