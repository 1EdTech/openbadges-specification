---
title: "Credit Hour"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-11-13
description: "Credit Hour example for TrustEd Credential 1.0 implementations"
---

#### Credit Hour Example

The following example describes a 3.0 credits course named `Introduction to Data Analysis`
issued from the `Example University` institution.

The learned received 3.0 credits from the completion of this course.

```obv3p0
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json",
    "https://purl.imsglobal.org/spec/ob/v3p0/extensions.json",
    "https://purl.imsglobal.org/spec/ob/v3p0/obtc/v1p0/context.json"
  ],
  "id": "https://example.edu/credentials/academic-credit-001",
  "type": [
    "VerifiableCredential",
    "OpenBadgeCredential"
  ],
  "name": "Introduction to Data Analysis",
  "description": "Awarded for successful completion of a credit-bearing introductory data analysis course.",
  "issuer": {
    "id": "https://example.edu/issuers/registrar",
    "type": ["Profile"],
    "name": "Example University",
    "url": "https://example.edu",
    "description": "An example postsecondary institution.",
    "email": "registrar@example.edu"
  },
  "validFrom": "2026-05-22T00:00:00Z",
  "awardedDate": "2026-05-22T00:00:00Z",
  "credentialSubject": {
    "id": "did:example:learner-456",
    "type": ["AchievementSubject"],
    "creditsEarned": 3.0,
    "achievement": {
      "id": "https://example.edu/achievements/introduction-to-data-analysis",
      "type": ["Achievement"],
      "name": "Introduction to Data Analysis",
      "description": "The learner can organize, analyze, and interpret data using introductory statistical methods and spreadsheet tools.",
      "achievementType": "Course",
      "creditsAvailable": 3.0,
      "criteria": {
        "narrative": "Learners must complete all required coursework and assessments for this 3-credit academic course. The credit value represents formally awarded academic credit under Example University's semester credit hour system."
      },
      "alignment": [
        {
          "type": ["Alignment"],
          "targetName": "Analyze and interpret data using introductory statistical methods",
          "targetUrl": "https://case.example.org/ims/case/v1p0/CFItems/5b1c2d3e-0001-4f6a-8b7c-data-analysis-intro",
          "targetFramework": "Example State Data Literacy Framework",
          "targetType": "CFItem",
          "targetCode": "DA-1"
        }
      ]
    }
  },
  "credentialSchema": [
    {
      "id": "https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_achievementcredential_schema.json",
      "type": "1EdTechJsonSchemaValidator2019"
    },
    {
      "id": "https://purl.imsglobal.org/spec/ob/v3p0/obtc/v1p0/schema/json/ob_v3p0_obtc_v1p0_achievementcredential-jsonschema1.json",
      "type": "1EdTechJsonSchemaValidator2019"
    }
  ]
}
```
