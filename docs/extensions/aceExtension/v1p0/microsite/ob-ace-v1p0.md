---
author: 1Edtech Consortium
category: Extension
title: Open Badges American Council for Education (ACE) Extension
shortcode: OB-ACE-10
status: Candidate Final Public
lastUpdated: 2025-10-09
version: '1.0'
nature: normative
docType: specification
specTitle: Open Badges Specification
contributors:
  - name: Xavi Aracil
    affiliation: 1Edtech
    companyUrl: ''
    role: Editor
releases:
  - version: Working Document
    docVersion: 1.0
    date: 2025-07-08
    comments: Initial proof of concept.
  - version: Candidate Final Public
    docVersion: 1.0
    date: 2025-10-09
    comments: Candidate Final Public
---

## Abstract

An extension to Open Badges that allows inserting American Council for Education credit recommendations and learning evaluation data.

## Overview

## Introduction{.informative}

This extension provides information about ACE's learning evaluation and credit recommendations for an Achievement. It allows for the inclusion of ACE's credit recommendations and learning evaluation data within the Open Badges framework.

To ensure integrity and verifiability, this information is embedded in an `OpenBadgeCredential` as an `EndorsementCredential`. This way, the information can be easily verified by a verifier using common Verifiable Credentials patterns.

Issuer MAY opt to embed ACE's `EndorsementCredential` directly within the Achievement, so it's embedded in subsequents `OpenBadgeCredential`s.

### Use cases{.informative}

* Describe the ACE's credit recommendations of an Achievement.
* Describe the ACE's learning evaluation of an Achievement.

### Terminology

The terminology used in this document is consistent with the terminology established in the Open Badges 3.0 specification [[OB-30]].

ACE
: American Council of Education

### Document Set

#### Normative Documents

Open Badges 3.0
: Main specification of this extension: [[[OB-30]]].

JSON Schema
: The JSON Schema defines the syntactical restrictions of this extension: <https://purl.imsglobal.org/spec/ob-ace/v1p0/schema/ob_ace_v1p0_endorsementcredential_schema.json>.

JSON-LD Context
: The JSON-LD context defines mappings for the terms used in this specification to their canonical IRIs: <https://purl.imsglobal.org/spec/ob-ace/v1p0/context/context-1.0.0.json>.

Errata
: The errata details any erratum registered for this version of this specification since its publication [[OB-ACE-10-ERRATA]].

### Extendable Badge Objects

`EndorsementSubject`, with the new type `ACEEndorsementSubject`

#### ACEEndorsementSubject

The `ACEEndorsementSubject` class is used to represent credit recommendations and learning evaluations from the ACE.

##### ACE ID

Each organization that receives an ACE endorsement is assigned a unique ACE ID. Since there's already an `identifier` property the Open Badges specification, which allows endorsers to include aditional identifiers of the recipient of a credential, the ACE ID can be expressed using that property. Therefore, ACE ID are expressed in the `ACEEndorsementSubject` as an identifier with its identityType with the value `ext:ACEId`.

##### CTID

Each organization registered in ACE is assigned a CTID from the Credential Registry. Since there's already an `identifier` property the Open Badges specification, which allows endorsers to include aditional identifiers of the recipient of a credential, the CTID can be expressed using that property. Therefore, CTID are expressed in the `ACEEndorsementSubject` as an identifier with its identityType with the value `ext:CTId`.

##### Minimum Passing Score

ACE capture and publish a minimum percentage passing score that is required for a learner to earn the credential. This helps institutions align the credit recommendations with their policies for transfer courses, which might require "a C or better" or similar language in order to accept a credential for credit. The Open Badges specification already has a `ResultDescription` entity, which allows issuers to define results of an achievement. Therefore, the minimum passing score can be expressed using that entity.

##### Credit Recommendation notes

An ACE Learning Evaluation contains an optional credit recommendation note to capture any nuance needed to accurately use the recommendations. Since the `EndorsementSubject` already has the property `endorsementComment`, which allows endorsers to make a simple claim in writing about the entity, this property can be used to convey the credit recommendation note.

##### Link to National Guide

The link to the National Guide Client is expressed in the `ACEEndorsementSubject` as an `Alignment` object with its `targetType` with the value `ext:ACENationalGuide`.

##### Competencies

A Learning Evaluation can also validate workplace competencies at the request of the National Guide Client. These competences are expressed in the `ACEEndorsementSubject` as `Alignment` objects, with an appropriate `targetType`.

## Data Model

At the top level is a very simple ACEEndorsementSubject object that contains the learning evaluation and credit recommendations.

```mps data-model
modelId: org.1edtech.ob-ace.v1p0.model
package: MainClasses
title: Data Models
```

```mps data-model
modelId: org.1edtech.ob-ace.v1p0.model
package: Enumerations
title: Enumerations
```

```mps data-model
modelId: org.1edtech.ob-ace.v1p0.model
stereotype: DerivedType
title: Derived Types
```

The derived types in this section are shared by all 1EdTech specifications.

```mps data-model
modelId: org.1edtech.ob-ace.v1p0.model
stereotype: PrimitiveType
title: Primitive Types
```

The primitive types in this section are shared by all 1EdTech specifications.

## Examples

### Sample EndorsementCredential with ACE extension

```obv3p0 org.1edtech.ob.v3p0.endorsementcredential.class
{
        "@context": [
            "https://www.w3.org/ns/credentials/v2",
            "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json",
            "https://purl.imsglobal.org/spec/ob/v3p0/extensions.json",
            "https://purl.imsglobal.org/spec/ob-ace/v1p0/context/context-1.0.0.json"
        ],
        "id": "http://example.com/credentials/3527",
        "type": [
            "VerifiableCredential",
            "EndorsementCredential"
        ],
        "name": "SDE endorsement",
        "issuer": {
            "id": "https://state.gov/issuers/565049",
            "type": ["Profile"],
            "name": "State Department of Education"
        },
        "validFrom": "2010-01-01T00:00:00Z",
        "validUntil": "2030-01-01T00:00:00Z",
        "credentialSubject": {
            "id": "https://1edtech.edu/issuers/565049",
            "type": ["EndorsementSubject", "ACEEndorsementSubject"],
            "endorsementComment": "Some notes about the credit recommendations.",
            "identifier": [{
                "type": ["IdentityObject"],
                "hashed": false,
                "identityType": "ext:ACEId",
                "identityHash": "ACE-123456"
            }],
            "minimumPassingScore": {
                "type": ["ResultDescription"],
                "name": "Passing Score",
                "resultType": "Percent",
                "requiredValue": "80"
            },
            "version": 1,
            "creditRecommendations": [
                {
                    "type": ["ACECreditRecommendation"],
                    "creditRecommendationId": "b7e8c2a1-4f3d-4e2b-9d6f-8a1c2e3f4b5a",
                    "semesterHours": 12.0,
                    "level": "LowerDivisionBaccalaureate",
                    "subject": "Computer networking"
                },
                {
                    "type": ["ACECreditRecommendation"],
                    "creditRecommendationId": "a3f9d7c4-2b1e-4a6f-9e8d-7c6b5a4e3f2d",
                    "semesterHours": 24.0,
                    "level": "VocationalCertificate",
                    "subject": "Computer networking"
                }
            ],
            "alignment": [{
				"type": ["Alignment"],
				"targetDescription": "Robot software is a set of commands and procedures robots use to respond to input and perform autonomous tasks.",
				"targetName": "Robot Programming",
				"targetFramework": "Example Robotics Framework",
				"targetType": "CFItem",
				"targetUrl": "https://robotics-competencies.example.com/competencies/robot-programming"
			}, {
                "type": ["Alignment"],
                "targetName": "National Guide Link",
                "targetType": "ext:ACENationalGuideLink",
                "targetUrl": "https://example.com"
            }]
        },
        "credentialSchema": [
            {
            "id": "https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_endorsementcredential_schema.json",
            "type": "1EdTechJsonSchemaValidator2019"
            },
            {
            "id": "https://purl.imsglobal.org/spec/ob-ace/v1p0/schema/ob_ace_v1p0_endorsementcredential_schema.json",
            "type": "1EdTechJsonSchemaValidator2019"
            }
        ]
    }
```

## Schema

### Context

```json
{
  "@context": {
    "@protected": true,
    "id": "@id",
    "type": "@type",
    "ACEEndorsementSubject": {
      "@id": "https://purl.imsglobal.org/spec/vc/ob-ace/vocab.html#ACEEndorsementSubject",
      "@context": {
        "@protected": true,
        "id": "@id",
        "type": "@type",
        "identifier": {
          "@id": "https://purl.imsglobal.org/spec/vc/ob/vocab.html#identifier",
          "@container": "@set"
        },
        "version": {
          "@id": "https://purl.imsglobal.org/spec/vc/ob/vocab.html#version"
        },
        "minimumPassingScore": {
          "@id": "https://purl.imsglobal.org/spec/vc/ob-ace/vocab.html#minimumPassingScore",
          "@container": "@set"
        },
        "creditRecommendations": {
          "@id": "https://purl.imsglobal.org/spec/vc/ob-ace/vocab.html#creditRecommendations",
          "@container": "@set"
        }
      }
    },
    "ACECreditRecommendation": {
      "@id": "https://purl.imsglobal.org/spec/vc/ob-ace/vocab.html#CreditRecommendation",
      "@context": {
        "@protected": true,
        "id": "@id",
        "type": "@type",
        "creditRecommendationId": {
          "@id": "https://purl.imsglobal.org/spec/vc/ob-ace/vocab.html#creditRecommendationId"
        },
        "semesterHours": {
          "@id": "https://purl.imsglobal.org/spec/vc/ob-ace/vocab.html#semesterHours",
          "@type": "https://www.w3.org/2001/XMLSchema#float"
        },
        "level": {
          "@id": "https://purl.imsglobal.org/spec/vc/ob-ace/vocab.html#level"
        },
        "subject": {
          "@id": "https://purl.imsglobal.org/spec/vc/ob-ace/vocab.html#subject",
          "@type": "https://www.w3.org/2001/XMLSchema#string"
        }
      }
    }
  }
}
```

```mps json-schema
modelId: org.1edtech.ob-ace.v1p0.model
package: OBClasses
format: json
title: JSON Schema
```
