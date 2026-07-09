---
title: "Achievement Endorsement"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-09
description: "Achievement Endorsement example for TrustEd Credential 1.0 implementations"
---

##### Achievement Endorsement Example

This example describes an `Achievement` for the course `Data Structures and Algorithms`,
endorsed by the company `ACME.com` as a strong preparation for software engineering
internship applicants.

> **TODO**: Sign the endorsement when approved

```json
{
  "id": "https://example.edu/achievements/data-structures-and-algorithms",
  "type": ["Achievement"],
  "name": "Data Structures and Algorithms",
  "description": "A semester-long course covering fundamental data structures (arrays, linked lists, trees, graphs, hash tables) and algorithm design and analysis, including complexity analysis and common algorithmic paradigms.",
  "achievementType": "Course",
  "fieldOfStudy": "Computer Science",
  "creditsAvailable": 3.0,
  "criteria": {
    "narrative": "Complete all weekly programming assignments, pass the midterm and final exams with a combined average of 70% or higher, and complete a capstone project implementing a graph-based pathfinding algorithm."
  },
  "endorsement": [
    {
      "@context": [
        "https://www.w3.org/ns/credentials/v2",
        "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
      ],
      "id": "https://acme.com/endorsements/dsa-course-2026",
      "type": ["VerifiableCredential", "EndorsementCredential"],
      "name": "ACME.com Endorsement of Data Structures and Algorithms Course",
      "description": "ACME.com's endorsement of this achievement as strong preparation for software engineering internship applicants.",
      "issuer": {
        "id": "https://acme.com/issuers/acme",
        "type": ["Profile"],
        "name": "ACME.com",
        "url": "https://acme.com"
      },
      "validFrom": "2026-07-09T00:00:00Z",
      "credentialSubject": {
        "id": "https://example.edu/achievements/data-structures-and-algorithms",
        "type": ["EndorsementSubject"],
        "endorsementComment": "ACME.com's engineering hiring team has reviewed this course's curriculum and capstone requirements and considers it a strong, reliable signal of readiness for software engineering internship roles. Applicants who hold this achievement are recognized as having demonstrated practical proficiency in core data structures and algorithmic problem-solving expected at the internship level."
      }
    }
  ]
}
```
