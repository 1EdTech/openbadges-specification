---
title: "Person Creator"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-13
description: "Person Creator example for TrustEd Credential 1.0 implementations"
---

##### Person

This example describes an `Achievement` for the course `Data Privacy Fundamentals`,
created by the person `Dr. Elena de Boer Andrésdóttir, Ph.D.`. The profile of this person
contains all optional fields - except `official`, `parentOrg`, `endorsement`, and `endorsementJwk`.

`otherIdentifier` demonstrates an external identifier (ORCID-style) using identifierType: "identifier" — the IdentifierTypeEnum vocabulary has no dedicated orcid value, so identifier is the correct generic fallback for identifier schemes not explicitly enumerated.

```json
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
  ],
  "id": "https://example.edu/achievements/data-privacy-fundamentals",
  "type": ["Course"],
  "name": "Data Privacy Fundamentals",
  "description": "Awarded to learners who demonstrate foundational competency in data privacy principles, regulatory frameworks, and privacy-by-design practices.",
  "achievementType": "Certificate",
  "creditsAvailable": 1.5,
  "fieldOfStudy": "Information Privacy and Data Ethics",
  "humanCode": "DPF-101",
  "criteria": {
    "narrative": "Recipients must complete all four course modules and pass the final assessment with a score of 80% or higher."
  },
  "image": {
    "id": "https://example.edu/images/achievements/data-privacy-fundamentals.png",
    "type": "Image",
    "caption": "Data Privacy Fundamentals badge artwork"
  },
  "creator": {
    "id": "https://example.edu/profiles/elena-de-boer",
    "type": ["Profile"],
    "name": "Dr. Elena de Boer Andr\u00e9sd\u00f3ttir, Ph.D.",
    "honorificPrefix": "Dr.",
    "givenName": "Elena",
    "additionalName": "Sofia",
    "familyNamePrefix": "de",
    "familyName": "Boer",
    "patronymicName": "Andr\u00e9sd\u00f3ttir",
    "honorificSuffix": "Ph.D.",
    "dateOfBirth": "1985-03-22",
    "email": "elena.deboer@example.edu",
    "phone": "+1-303-555-0142",
    "url": "https://example.edu/faculty/elena-de-boer",
    "description": "Senior instructional designer and curriculum architect specializing in privacy and data ethics education.",
    "image": {
      "id": "https://example.edu/images/profiles/elena-de-boer.png",
      "type": "Image",
      "caption": "Headshot of Dr. Elena de Boer"
    },
    "address": {
      "type": "Address",
      "streetAddress": "1200 Larimer St",
      "addressLocality": "Denver",
      "addressRegion": "CO",
      "postalCode": "80204",
      "addressCountry": "United States",
      "addressCountryCode": "US",
      "geo": {
        "type": "GeoCoordinates",
        "latitude": 39.7508,
        "longitude": -104.9963
      }
    },
    "otherIdentifier": [
      {
        "type": "IdentifierEntry",
        "identifier": "0000-0002-1825-0097",
        "identifierType": "identifier"
      }
    ]
  }
}
```
