---
author: 1Edtech Consortium
category: Guide
title: Open Badges Implementation Guide
shortcode: OB-IMPL-30
status: Final
lastUpdated: Apr 7th, 2025
version: '3.0'
nature: informative
docType: guide
specTitle: Open Badges Specification
contributors:
  - name: Nate Otto
    affiliation: Skybridge Skills
    companyUrl: ''
    role: Invited Expert
  - name: Justin Pitcher
    affiliation: Anthology
    companyUrl: ''
    role: Co-chair, OB
  - name: Xavi Aracil
    affiliation: 1Edtech
    companyUrl: ''
    role: Editor
  - name: Rob Coyle
    affiliation: 1Edtech
    companyUrl: ''
    role: Editor
ipDisclosures:
  - organization: Concentric Sky
    date: October 24, 2019
    claim: false
    type: RF RAND (Required & Optional Elements)
  - organization: Arizona State University
    date: June 21, 2022
    claim: false
    type: RF RAND (Required & Optional Elements)
  - organization: Temple University
    date: June 10, 2022
    claim: false
    type: RF RAND (Required & Optional Elements)
  - organization: Credly
    date: October 3, 2019
    claim: false
    type: RF RAND (Required & Optional Elements)
  - organization: Workday, Inc.
    date: June 10, 2022
    claim: false
    type: RF RAND (Required & Optional Elements)
  - organization: RANDA Solutions
    date: June 9, 2022
    claim: false
    type: RF RAND (Required & Optional Elements)
  - organization: Anthology
    date: April 16, 2024
    claim: false
    type: RF RAND (Required & Optional Elements)
  - organization: Unicon
    date: April 22, 2024
    claim: false
    type: RF RAND (Required & Optional Elements)
  - organization: Bowdoin College
    date: June 11, 2022
    claim: false
    type: RF RAND (Required & Optional Elements)
  - organization: American Association of Collegiate Registrars and Admissions Officers (AACARO)
    date: April 15, 2024
    claim: false
    type: RF RAND (Required & Optional Elements)
  - organization: Desire to Learn (D2L)
    date: April 16, 2024
    claim: false
    type: RF RAND (Required & Optional Elements)
  - organization: Digital Knowledge EdTech Lab Inc.
    date: April 24, 2024
    claim: false
    type: RF RAND (Required & Optional Elements)
  - organization: IQC Italian Quality Company
    date: April 19, 2024
    claim: false
    type: RF RAND (Required & Optional Elements)
  - organization: Skybridge Skills
    date: April 16, 2024
    claim: false
    type: RF RAND (Required & Optional Elements)
  - organization: Navigatr
    date: April 25, 2024
    claim: false
    type: RF RAND (Required & Optional Elements)
  - organization: T3 Innovation Network, US Chamber of Commerce Foundation
    date: April 25, 2024
    claim: false
    type: RF RAND (Required & Optional Elements)
  - organization: Territorium
    date: April 23, 2024
    claim: false
    type: RF RAND (Required & Optional Elements)
  - organization: 'Western Governors University (WGU) '
    date: June 11, 2022
    claim: false
    type: RF RAND (Required & Optional Elements)
releases:
  - version: Version 3.0 IMS Candidate Final
    docVersion: 1.0
    date: November 10, 2022
    comments: Covers Issuer, Displayer, and Host conformance and certification.
  - version: Version 3.0 IMS Candidate Final
    docVersion: 1.1
    date: June 20, 2023
    comments: Updated Linked Data Proof to the new EdDSA Cryptosuite v2022 [[VC-DI-EDDSA]].
  - version: Version 3.0 IMS Candidate Final
    docVersion: 1.2
    date: July 14, 2023
    comments: New version of the context.json (`context-3.0.2.json`) file. See [[OB-ERRATA-30]] for detailed changes
  - version: Version 3.0 IMS Candidate Final
    docVersion: 1.3
    date: September 8, 2023
    comments: Reorganized some sections of the document to highlight Issuer, Displayer and Host roles.\nAdded recommended practice for including additional info of the recipient of a credential.\nAdded recommended practice for supporting old cryptosuites.\nAdded test vector data for signing Open Badges and Comprehensive Learner Record.
  - version: Version 3.0 IMS Candidate Final
    docVersion: 1.4
    date: September 22, 2023
    comments: Added a section about including older Open Badges in CLR 2.0.
  - version: Version 3.0 IMS Candidate Final
    docVersion: 1.5
    date: November 9, 2023
    comments: Added a section about issuer's key provenance.
  - version: Version 3.0 IMS Candidate Final
    docVersion: 1.6
    date: December 13, 2023
    comments: New version of the context.json (`context-3.0.3.json`) file. See [[OB-ERRATA-30]] for detailed changes
  - version: Version 3.0 IMS Candidate Final
    docVersion: 1.7
    date: December 15, 2023
    comments: Added sections about alignment of achievements with non-1EdTech vocabularies, such Credential Engine.
  - version: Version 3.0 IMS Candidate Final
    docVersion: 1.8
    date: January 26, 2023
    comments: Language of related achievement now uses the new attribute `inLanguage` instead of `@language`.
  - version: Version 3.0 IMS Candidate Final
    docVersion: 1.9
    date: April 2, 2024
    comments: Upgraded to [[VC-DATA-MODEL-2.0]]
  - version: Version 3.0 IMS Candidate Final
    docVersion: 1.10
    date: October 1, 2024
    comments: Added section about extensions.\nAdded section about privacy.
  - version: Final Release
    docVersion: 1.0
    date: December 23, 2024
    comments: Clarified proof mechanism and algorithm selection.
  - version: Final Release
    docVersion: 1.1
    date: February 12, 2025
    comments: Reorganization.\nClarified some paragraphs.
  - version: Final Release
    docVersion: 2.0
    date: April 7, 2025
    comments: Fixed some typos.
---

@v3p0/impl/introduction.md

@v3p0/impl/getting-started.md

@v3p0/impl/recommended-practices.md

@v3p0/impl/reference-impls.md

@v3p0/impl/conformance.md

@v3p0/impl/migrating.md

@v3p0/impl/extensions.md

@v3p0/impl/help.md

## Linked Data Proof Test Vector for Open Badges 3.0

This chapter is an example of the signing process of a given credential with
an Linked Data Proof producing a <code>DataIntegrityProof</code> of a public
key expressed in <code>eddsa-rdf-2022</code> format.

### Key pair & Multikey

For this example we are using the following keypair:

* Public key (hex): `4bdeafde2ea8beefadd8c699b5c7e0704cf51154d52e17b20b71337ca04cc5a5`
* Private key (hex): `6241a409e6707bb640a0140a8a32bc3d193c33a661747284d6adfa4ed4180be44bdeafde2ea8beefadd8c699b5c7e0704cf51154d52e17b20b71337ca04cc5a5`

```js
{
      id: 'https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi',
      controller: 'https://example.edu/issuers/565049',
      publicKey: Uint8Array(32) [
         75, 222, 175, 222,  46, 168, 190,
        239, 173, 216, 198, 153, 181, 199,
        224, 112,  76, 245,  17,  84, 213,
         46,  23, 178,  11, 113,  51, 124,
        160,  76, 197, 165
      ],
      secretKey: Uint8Array(64) [
         98,  65, 164,   9, 230, 112, 123, 182,  64, 160,  20,
         10, 138,  50, 188,  61,  25,  60,  51, 166,  97, 116,
        114, 132, 214, 173, 250,  78, 212,  24,  11, 228,  75,
        222, 175, 222,  46, 168, 190, 239, 173, 216, 198, 153,
        181, 199, 224, 112,  76, 245,  17,  84, 213,  46,  23,
        178,  11, 113,  51, 124, 160,  76, 197, 165
      ],
      publicKeyMultibase: 'z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi',
      secretKeyMultibase: 'zrv2bqTbNwCTsRrHFcJCPjVAduh4Ezcnoq1A3ZxH1GWTNkxipLVuaAoMFmze2gFN9oNXfJjufxSHWVZzsJiUsMHFMcx',
      revoked: undefined,
      export: [AsyncFunction: export],
      signer: [Function: signer],
      verifier: [Function: verifier]
    }
```

### Test data

The credential used in the example is:

```json
{
            "@context": [
                "https://www.w3.org/ns/credentials/v2",
                "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
            ],
            "id": "http://example.com/credentials/3527",
            "type": [
                "VerifiableCredential",
                "OpenBadgeCredential"
            ],
            "issuer": {
                "id": "https://example.edu/issuers/565049",
                "type": [
                "Profile"
                ],
                "url": "https://www.imsglobal.org",
                "name": "Example Corp"
            },
            "validFrom": "2010-01-01T00:00:00Z",
            "name": "Teamwork Badge",
            "credentialSubject": {
                "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
                "type": [
                "AchievementSubject"
                ],
                "achievement": {
                "id": "https://example.com/achievements/21st-century-skills/teamwork",
                "type": [
                    "Achievement"
                ],
                "criteria": {
                    "narrative": "Team members are nominated for this badge by their peers and recognized upon review by Example Corp management."
                },
                "description": "This badge recognizes the development of the capacity to collaborate within a group environment.",
                "name": "Teamwork"
                }
            }
        }
```

### Document before signing

```json
{
            '@context': [
                'https://www.w3.org/ns/credentials/v2',
                'https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json'
            ],
            id: 'http://example.com/credentials/3527',
            type: [ 'VerifiableCredential', 'OpenBadgeCredential' ],
            issuer: {
                id: 'https://example.edu/issuers/565049',
                type: [ 'Profile' ],
                url: 'https://www.imsglobal.org',
                name: 'Example Corp'
            },
            validFrom: '2010-01-01T00:00:00Z',
            name: 'Teamwork Badge',
            credentialSubject: {
                id: 'did:example:ebfeb1f712ebc6f1c276e12ec21',
                type: [ 'AchievementSubject' ],
                achievement: {
                id: 'https://example.com/achievements/21st-century-skills/teamwork',
                type: [
                    "Achievement"
                ],
                criteria: {
                    "narrative": "Team members are nominated for this badge by their peers and recognized upon review by Example Corp management."
                },
                description: 'This badge recognizes the development of the capacity to collaborate within a group environment.',
                name: 'Teamwork'
                }
            }
        }
```

### Proof before signing

```json
{
            type: 'DataIntegrityProof',
            created: '2010-01-01T19:23:24Z',
            verificationMethod: 'https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi',
            cryptosuite: 'eddsa-rdfc-2022',
            proofPurpose: 'assertionMethod'
        }
```

### Proof normalized

```text
_:c14n0 <http://purl.org/dc/terms/created> "2010-01-01T19:23:24Z"^^<http://www.w3.org/2001/XMLSchema#dateTime> .
_:c14n0 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://w3id.org/security#DataIntegrityProof> .
_:c14n0 <https://w3id.org/security#cryptosuite> "eddsa-rdfc-2022"^^<https://w3id.org/security#cryptosuiteString> .
_:c14n0 <https://w3id.org/security#proofPurpose> <https://w3id.org/security#assertionMethod> .
_:c14n0 <https://w3id.org/security#verificationMethod> <https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi> .
```

### Document normalized

```text
<did:example:ebfeb1f712ebc6f1c276e12ec21> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#AchievementSubject> .
<did:example:ebfeb1f712ebc6f1c276e12ec21> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#achievement> <https://example.com/achievements/21st-century-skills/teamwork> .
<http://example.com/credentials/3527> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#OpenBadgeCredential> .
<http://example.com/credentials/3527> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://www.w3.org/2018/credentials#VerifiableCredential> .
<http://example.com/credentials/3527> <https://schema.org/name> "Teamwork Badge" .
<http://example.com/credentials/3527> <https://www.w3.org/2018/credentials#credentialSubject> <did:example:ebfeb1f712ebc6f1c276e12ec21> .
<http://example.com/credentials/3527> <https://www.w3.org/2018/credentials#issuer> <https://example.edu/issuers/565049> .
<http://example.com/credentials/3527> <https://www.w3.org/2018/credentials#validFrom> "2010-01-01T00:00:00Z"^^<http://www.w3.org/2001/XMLSchema#dateTime> .
<https://example.com/achievements/21st-century-skills/teamwork> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Achievement> .
<https://example.com/achievements/21st-century-skills/teamwork> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Criteria> _:c14n0 .
<https://example.com/achievements/21st-century-skills/teamwork> <https://schema.org/description> "This badge recognizes the development of the capacity to collaborate within a group environment." .
<https://example.com/achievements/21st-century-skills/teamwork> <https://schema.org/name> "Teamwork" .
<https://example.edu/issuers/565049> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Profile> .
<https://example.edu/issuers/565049> <https://schema.org/name> "Example Corp" .
<https://example.edu/issuers/565049> <https://schema.org/url> "https://www.imsglobal.org"^^<https://www.w3.org/2001/XMLSchema#anyURI> .
_:c14n0 <https://purl.imsglobal.org/spec/vc/ob/vocab.html#narrative> "Team members are nominated for this badge by their peers and recognized upon review by Example Corp management." .
```

### Document hash (hex)

```text
87f65a76d40146205e3b3e06cb0fbd153f97f9ce70372390f52566bb7f9e0773
```

### Proof hash (hex)

```text
d34009cea0dbc1ca941e09dc01c8c9d3e3ce3c5b853f67ee44698dcea10f5d19
```

### Data to sign (hex)

```text
d34009cea0dbc1ca941e09dc01c8c9d3e3ce3c5b853f67ee44698dcea10f5d1987f65a76d40146205e3b3e06cb0fbd153f97f9ce70372390f52566bb7f9e0773
```

### Signature (hex)

```text
f7a017acf7d27983267ec362657c0fb08e955549f49dac5bf36a03c4f2c3a4f1e3738a6c5ecd7ffba7135cb9cd754e6196f4b73082ea8df8e703c8ecd4333503
```

### Proof value (hex)

```text
z5x9aCBYovW3CQCbKdNyhEm7ffYSw1YpEdPywQJoNbzDD2gkzQDKJ1sYKJaWvqZtkMtSbz35HcbgXVEDYHxCzgkCr
```

### Proof

```json
{
            "type": "DataIntegrityProof",
            "created": "2010-01-01T19:23:24Z",
            "verificationMethod": "https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi",
            "cryptosuite": "eddsa-rdfc-2022",
            "proofPurpose": "assertionMethod",
            "proofValue": "z5x9aCBYovW3CQCbKdNyhEm7ffYSw1YpEdPywQJoNbzDD2gkzQDKJ1sYKJaWvqZtkMtSbz35HcbgXVEDYHxCzgkCr"
        }
```

### Signed credential

```json
{
        "@context": [
            "https://www.w3.org/ns/credentials/v2",
            "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
        ],
        "id": "http://example.com/credentials/3527",
        "type": [
            "VerifiableCredential",
            "OpenBadgeCredential"
        ],
        "issuer": {
            "id": "https://example.edu/issuers/565049",
            "type": [
            "Profile"
            ],
            "url": "https://www.imsglobal.org",
            "name": "Example Corp"
        },
        "validFrom": "2010-01-01T00:00:00Z",
        "name": "Teamwork Badge",
        "credentialSubject": {
            "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
            "type": [
            "AchievementSubject"
            ],
            "achievement": {
            "id": "https://example.com/achievements/21st-century-skills/teamwork",
            "type": [
                "Achievement"
            ],
            "criteria": {
                "narrative": "Team members are nominated for this badge by their peers and recognized upon review by Example Corp management."
            },
            "description": "This badge recognizes the development of the capacity to collaborate within a group environment.",
            "name": "Teamwork"
            }
        },
        "proof": {
            "type": "DataIntegrityProof",
            "created": "2010-01-01T19:23:24Z",
            "verificationMethod": "https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi",
            "cryptosuite": "eddsa-rdfc-2022",
            "proofPurpose": "assertionMethod",
            "proofValue": "z5x9aCBYovW3CQCbKdNyhEm7ffYSw1YpEdPywQJoNbzDD2gkzQDKJ1sYKJaWvqZtkMtSbz35HcbgXVEDYHxCzgkCr"
        }
    }
```



## Linked Data Proof Test Vector for Comprehensive Learner Record 2.0

> **Note**: The signing process for CLR 2.0 is the same as for OB 3.0. Therefore, the only
> difference between this chapter and the previous one is the use of a
> <code>ClrCredential</code> instead of an <code>AchievementCredential</code> as the input data

This chapter is an example of the signing process of a given credential with
 an Linked Data Proof producing a <code>DataIntegrityProof</code> of a public key
 expressed in <code>eddsa-rdf-2022</code> format.


### Key pair & Multikey

* Public key (hex): `4bdeafde2ea8beefadd8c699b5c7e0704cf51154d52e17b20b71337ca04cc5a5`
* Private key (hex): `6241a409e6707bb640a0140a8a32bc3d193c33a661747284d6adfa4ed4180be44bdeafde2ea8beefadd8c699b5c7e0704cf51154d52e17b20b71337ca04cc5a5`

```text
{
        id: 'https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi',
        controller: 'https://example.edu/issuers/565049',
        publicKey: Uint8Array(32) [
            75, 222, 175, 222,  46, 168, 190,
            239, 173, 216, 198, 153, 181, 199,
            224, 112,  76, 245,  17,  84, 213,
            46,  23, 178,  11, 113,  51, 124,
            160,  76, 197, 165
        ],
        secretKey: Uint8Array(64) [
            98,  65, 164,   9, 230, 112, 123, 182,  64, 160,  20,
            10, 138,  50, 188,  61,  25,  60,  51, 166,  97, 116,
            114, 132, 214, 173, 250,  78, 212,  24,  11, 228,  75,
            222, 175, 222,  46, 168, 190, 239, 173, 216, 198, 153,
            181, 199, 224, 112,  76, 245,  17,  84, 213,  46,  23,
            178,  11, 113,  51, 124, 160,  76, 197, 165
        ],
        publicKeyMultibase: 'z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi',
        secretKeyMultibase: 'zrv2bqTbNwCTsRrHFcJCPjVAduh4Ezcnoq1A3ZxH1GWTNkxipLVuaAoMFmze2gFN9oNXfJjufxSHWVZzsJiUsMHFMcx',
        revoked: undefined,
        export: [AsyncFunction: export],
        signer: [Function: signer],
        verifier: [Function: verifier]
    }
```

### Test data

The credential used in the example is:

```json
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/clr/v2p0/context-2.0.1.json",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json",
    "https://purl.imsglobal.org/spec/ob/v3p0/extensions.json"
  ],
  "id": "http://example.edu/credentials/3732",
  "type": [
    "VerifiableCredential",
    "ClrCredential"
  ],
  "issuer": {
    "id": "https://example.edu/issuers/565049",
    "type": "Profile",
    "name": "Example University"
  },
  "validFrom": "2010-01-01T00:00:00Z",
  "name": "Sample Transcript",
  "credentialSubject": {
    "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
    "type": "ClrSubject",
    "verifiableCredential": [
      {
        "@context": [
          "https://www.w3.org/ns/credentials/v2",
          "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json",
          "https://purl.imsglobal.org/spec/ob/v3p0/extensions.json"
        ],
        "id": "urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002",
        "type": [
          "VerifiableCredential",
          "AchievementCredential"
        ],
        "issuer": {
          "id": "https://example.edu/issuers/565049",
          "type": "Profile",
          "name": "Example University"
        },
        "validFrom": "2010-01-01T00:00:00Z",
        "name": "Example University Degree",
        "credentialSubject": {
          "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
          "type": "AchievementSubject",
          "achievement": {
            "id": "urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002",
            "type": "Achievement",
            "creator": {
              "id": "https://example.edu/issuers/565049",
              "type": "Profile"
            },
            "name": "Achievement 1",
            "criteria": {
              "id": "https://example.edu/achievements/a7467ef6-56cb-11ec-bf63-0242ac130002/criteria"
            },
            "description": "Achievement 1",
            "image": {
              "id": "https://example.edu/achievements/sample.png",
              "type": "Image"
            }
          }
        },
        "credentialSchema": [
          {
            "id": "https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_achievementcredential_schema.json",
            "type": "1EdTechJsonSchemaValidator2019"
          }
        ],
        "proof": [
          {
            "type": "DataIntegrityProof",
            "created": "2010-01-01T19:23:24Z",
            "verificationMethod": "https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi",
            "cryptosuite": "eddsa-rdfc-2022",
            "proofPurpose": "assertionMethod",
            "proofValue": "z45QnLySMt2mWuW787G6cf3SLkP97ZkMZxLeXH5yaaTQPCtTup4GCV95tU8HEnQJSyGCokSj3AvUhmJtvveTmN4Vu"
          }
        ]
      }
    ],
    "achievement": [
      {
        "id": "urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002",
        "type": "Achievement",
        "creator": {
          "id": "https://example.edu/issuers/565049",
          "type": "Profile"
        },
        "name": "Achievement 1",
        "criteria": {
          "id": "https://example.edu/achievements/a7467ef6-56cb-11ec-bf63-0242ac130002/criteria"
        },
        "description": "Achievement 1",
        "image": {
          "id": "https://example.edu/achievements/sample.png",
          "type": "Image"
        }
      },
      {
        "id": "urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002",
        "type": "Achievement",
        "creator": {
          "id": "https://example.edu/issuers/565049",
          "type": "Profile"
        },
        "name": "Achievement 2",
        "criteria": {
          "id": "https://example.edu/achievements/dd887f0a-56cb-11ec-bf63-0242ac130002/criteria"
        },
        "description": "Achievement 2",
        "image": {
          "id": "https://example.edu/achievements/sample.png",
          "type": "Image"
        }
      }
    ],
    "association": [
      {
        "type": "Association",
        "associationType": "isParentOf",
        "sourceId": "urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002",
        "targetId": "urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002"
      }
    ]
  },
  "credentialSchema": [
    {
      "id": "https://purl.imsglobal.org/spec/clr/v2p0/schema/json/clr_v2p0_clrcredential_schema.json",
      "type": "1EdTechJsonSchemaValidator2019"
    }
  ]
}
```

### Document before signing

```json
{
        "@context": [
            "https://www.w3.org/ns/credentials/v2",
            "https://purl.imsglobal.org/spec/clr/v2p0/context-2.0.1.json",
            "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json",
            "https://purl.imsglobal.org/spec/ob/v3p0/extensions.json"
        ],
        "id": "http://example.edu/credentials/3732",
        "type": [
            "VerifiableCredential",
            "ClrCredential"
        ],
        "issuer": {
            "id": "https://example.edu/issuers/565049",
            "type": "Profile",
            "name": "Example University"
        },
        "validFrom": "2010-01-01T00:00:00Z",
        "name": "Sample Transcript",
        "credentialSubject": {
            "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
            "type": "ClrSubject",
            "verifiableCredential": [
            {
                "@context": [
                "https://www.w3.org/ns/credentials/v2",
                "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json",
                "https://purl.imsglobal.org/spec/ob/v3p0/extensions.json"
                ],
                "id": "urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002",
                "type": [
                "VerifiableCredential",
                "AchievementCredential"
                ],
                "issuer": {
                "id": "https://example.edu/issuers/565049",
                "type": "Profile",
                "name": "Example University"
                },
                "validFrom": "2010-01-01T00:00:00Z",
                "name": "Example University Degree",
                "credentialSubject": {
                "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
                "type": "AchievementSubject",
                "achievement": {
                    "id": "urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002",
                    "type": "Achievement",
                    "creator": {
                    "id": "https://example.edu/issuers/565049",
                    "type": "Profile"
                    },
                    "name": "Achievement 1",
                    "criteria": {
                    "id": "https://example.edu/achievements/a7467ef6-56cb-11ec-bf63-0242ac130002/criteria"
                    },
                    "description": "Achievement 1",
                    "image": {
                    "id": "https://example.edu/achievements/sample.png",
                    "type": "Image"
                    }
                }
                },
                "credentialSchema": [
                {
                    "id": "https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_achievementcredential_schema.json",
                    "type": "1EdTechJsonSchemaValidator2019"
                }
                ],
                "proof": [
                {
                    "type": "DataIntegrityProof",
                    "created": "2010-01-01T19:23:24Z",
                    "verificationMethod": "https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi",
                    "cryptosuite": "eddsa-rdfc-2022",
                    "proofPurpose": "assertionMethod",
                    "proofValue": "z45QnLySMt2mWuW787G6cf3SLkP97ZkMZxLeXH5yaaTQPCtTup4GCV95tU8HEnQJSyGCokSj3AvUhmJtvveTmN4Vu"
                }
                ]
            }
            ],
            "achievement": [
            {
                "id": "urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002",
                "type": "Achievement",
                "creator": {
                "id": "https://example.edu/issuers/565049",
                "type": "Profile"
                },
                "name": "Achievement 1",
                "criteria": {
                "id": "https://example.edu/achievements/a7467ef6-56cb-11ec-bf63-0242ac130002/criteria"
                },
                "description": "Achievement 1",
                "image": {
                "id": "https://example.edu/achievements/sample.png",
                "type": "Image"
                }
            },
            {
                "id": "urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002",
                "type": "Achievement",
                "creator": {
                "id": "https://example.edu/issuers/565049",
                "type": "Profile"
                },
                "name": "Achievement 2",
                "criteria": {
                "id": "https://example.edu/achievements/dd887f0a-56cb-11ec-bf63-0242ac130002/criteria"
                },
                "description": "Achievement 2",
                "image": {
                "id": "https://example.edu/achievements/sample.png",
                "type": "Image"
                }
            }
            ],
            "association": [
            {
                "type": "Association",
                "associationType": "isParentOf",
                "sourceId": "urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002",
                "targetId": "urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002"
            }
            ]
        },
        "credentialSchema": [
            {
            "id": "https://purl.imsglobal.org/spec/clr/v2p0/schema/json/clr_v2p0_clrcredential_schema.json",
            "type": "1EdTechJsonSchemaValidator2019"
            }
        ]
    }
```

### Proof before signing

```json
{
        type: 'DataIntegrityProof',
        created: '2010-01-01T19:23:24Z',
        verificationMethod: 'https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi',
        cryptosuite: 'eddsa-rdfc-2022',
        proofPurpose: 'assertionMethod'
    }
```

### Proof normalized

```text
_:c14n0 <http://purl.org/dc/terms/created> "2010-01-01T19:23:24Z"^^<http://www.w3.org/2001/XMLSchema#dateTime> .
_:c14n0 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://w3id.org/security#DataIntegrityProof> .
_:c14n0 <https://w3id.org/security#cryptosuite> "eddsa-rdfc-2022"^^<https://w3id.org/security#cryptosuiteString> .
_:c14n0 <https://w3id.org/security#proofPurpose> <https://w3id.org/security#assertionMethod> .
_:c14n0 <https://w3id.org/security#verificationMethod> <https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi> .
```

### Document normalized

```text
<did:example:ebfeb1f712ebc6f1c276e12ec21> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/clr/vocab.html#ClrSubject> .
<did:example:ebfeb1f712ebc6f1c276e12ec21> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#AchievementSubject> .
<did:example:ebfeb1f712ebc6f1c276e12ec21> <https://purl.imsglobal.org/spec/vc/clr/vocab.html#achievement> <urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002> .
<did:example:ebfeb1f712ebc6f1c276e12ec21> <https://purl.imsglobal.org/spec/vc/clr/vocab.html#achievement> <urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002> .
<did:example:ebfeb1f712ebc6f1c276e12ec21> <https://purl.imsglobal.org/spec/vc/clr/vocab.html#association> _:c14n2 .
<did:example:ebfeb1f712ebc6f1c276e12ec21> <https://purl.imsglobal.org/spec/vc/clr/vocab.html#verifiableCredential> <urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002> .
<did:example:ebfeb1f712ebc6f1c276e12ec21> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#achievement> <urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002> .
<http://example.edu/credentials/3732> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/clr/vocab.html#ClrCredential> .
<http://example.edu/credentials/3732> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://www.w3.org/2018/credentials#VerifiableCredential> .
<http://example.edu/credentials/3732> <https://schema.org/name> "Sample Transcript" .
<http://example.edu/credentials/3732> <https://www.w3.org/2018/credentials#credentialSchema> <https://purl.imsglobal.org/spec/clr/v2p0/schema/json/clr_v2p0_clrcredential_schema.json> .
<http://example.edu/credentials/3732> <https://www.w3.org/2018/credentials#credentialSubject> <did:example:ebfeb1f712ebc6f1c276e12ec21> .
<http://example.edu/credentials/3732> <https://www.w3.org/2018/credentials#issuer> <https://example.edu/issuers/565049> .
<http://example.edu/credentials/3732> <https://www.w3.org/2018/credentials#validFrom> "2010-01-01T00:00:00Z"^^<http://www.w3.org/2001/XMLSchema#dateTime> .
<https://example.edu/achievements/sample.png> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Image> .
<https://example.edu/issuers/565049> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Profile> .
<https://example.edu/issuers/565049> <https://schema.org/name> "Example University" .
<https://purl.imsglobal.org/spec/clr/v2p0/schema/json/clr_v2p0_clrcredential_schema.json> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vccs/v1p0/context.json#1EdTechJsonSchemaValidator2019> .
<https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_achievementcredential_schema.json> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vccs/v1p0/context.json#1EdTechJsonSchemaValidator2019> .
<urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#OpenBadgeCredential> .
<urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://www.w3.org/2018/credentials#VerifiableCredential> .
<urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002> <https://schema.org/name> "Example University Degree" .
<urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002> <https://w3id.org/security#proof> _:c14n1 .
<urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002> <https://www.w3.org/2018/credentials#credentialSchema> <https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_achievementcredential_schema.json> .
<urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002> <https://www.w3.org/2018/credentials#credentialSubject> <did:example:ebfeb1f712ebc6f1c276e12ec21> .
<urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002> <https://www.w3.org/2018/credentials#issuer> <https://example.edu/issuers/565049> .
<urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002> <https://www.w3.org/2018/credentials#validFrom> "2010-01-01T00:00:00Z"^^<http://www.w3.org/2001/XMLSchema#dateTime> .
<urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Achievement> .
<urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Criteria> <https://example.edu/achievements/a7467ef6-56cb-11ec-bf63-0242ac130002/criteria> .
<urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#creator> <https://example.edu/issuers/565049> .
<urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#image> <https://example.edu/achievements/sample.png> .
<urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002> <https://schema.org/description> "Achievement 1" .
<urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002> <https://schema.org/name> "Achievement 1" .
<urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Achievement> .
<urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Criteria> <https://example.edu/achievements/dd887f0a-56cb-11ec-bf63-0242ac130002/criteria> .
<urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#creator> <https://example.edu/issuers/565049> .
<urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#image> <https://example.edu/achievements/sample.png> .
<urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002> <https://schema.org/description> "Achievement 2" .
<urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002> <https://schema.org/name> "Achievement 2" .
_:c14n0 <http://purl.org/dc/terms/created> "2010-01-01T19:23:24Z"^^<http://www.w3.org/2001/XMLSchema#dateTime> _:c14n1 .
_:c14n0 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://w3id.org/security#DataIntegrityProof> _:c14n1 .
_:c14n0 <https://w3id.org/security#cryptosuite> "eddsa-rdfc-2022"^^<https://w3id.org/security#cryptosuiteString> _:c14n1 .
_:c14n0 <https://w3id.org/security#proofPurpose> <https://w3id.org/security#assertionMethod> _:c14n1 .
_:c14n0 <https://w3id.org/security#proofValue> "z45QnLySMt2mWuW787G6cf3SLkP97ZkMZxLeXH5yaaTQPCtTup4GCV95tU8HEnQJSyGCokSj3AvUhmJtvveTmN4Vu"^^<https://w3id.org/security#multibase> _:c14n1 .
_:c14n0 <https://w3id.org/security#verificationMethod> <https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi> _:c14n1 .
_:c14n2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/clr/vocab.html#Association> .
_:c14n2 <https://purl.imsglobal.org/spec/vc/clr/vocab.html#AssociationType> "isParentOf" .
_:c14n2 <https://purl.imsglobal.org/spec/vc/clr/vocab.html#sourceId> "urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002"^^<xsd:anyURI> .
_:c14n2 <https://purl.imsglobal.org/spec/vc/clr/vocab.html#targetId> "urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002"^^<xsd:anyURI> .
```

### Document hash (hex)

```text
768d7015ae69e0210e1c2a45194d9c1d15d7a6022e52b946574a2a27f6fa85fe
```

### Proof hash (hex)

```text
d34009cea0dbc1ca941e09dc01c8c9d3e3ce3c5b853f67ee44698dcea10f5d19
```

### Data to sign (hex)

```text
d34009cea0dbc1ca941e09dc01c8c9d3e3ce3c5b853f67ee44698dcea10f5d19768d7015ae69e0210e1c2a45194d9c1d15d7a6022e52b946574a2a27f6fa85fe
```

### Signature (hex)

```text
0c220dadbcfcaa64ab8a8c5002dbe258e6c7746ca71c25e2ea3b7fbffd66568413f53b1d34f5655f3057864bd372bbf0d1e74ea2f8c72e2f4b5790f21a22b70a
```

### Proof value (hex)

```text
zF52sU1nfPAjcwCqtgxPNSor6SJnAzRBwZW5VNQXPt8xXCHkd39sgqj32DnMjhFCzbyHsLkhQ8HpBqQTkMgXy329
```

### Proof

```json
{
        "type": "DataIntegrityProof",
        "created": "2010-01-01T19:23:24Z",
        "verificationMethod": "https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi",
        "cryptosuite": "eddsa-rdfc-2022",
        "proofPurpose": "assertionMethod",
        "proofValue": "zF52sU1nfPAjcwCqtgxPNSor6SJnAzRBwZW5VNQXPt8xXCHkd39sgqj32DnMjhFCzbyHsLkhQ8HpBqQTkMgXy329"
    }
```

### Signed credential

```json
{
        "@context": [
            "https://www.w3.org/ns/credentials/v2",
            "https://purl.imsglobal.org/spec/clr/v2p0/context-2.0.1.json",
            "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json",
            "https://purl.imsglobal.org/spec/ob/v3p0/extensions.json"
        ],
        "id": "http://example.edu/credentials/3732",
        "type": [
            "VerifiableCredential",
            "ClrCredential"
        ],
        "issuer": {
            "id": "https://example.edu/issuers/565049",
            "type": "Profile",
            "name": "Example University"
        },
        "validFrom": "2010-01-01T00:00:00Z",
        "name": "Sample Transcript",
        "credentialSubject": {
            "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
            "type": "ClrSubject",
            "verifiableCredential": [
            {
                "@context": [
                "https://www.w3.org/ns/credentials/v2",
                "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json",
                "https://purl.imsglobal.org/spec/ob/v3p0/extensions.json"
                ],
                "id": "urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002",
                "type": [
                "VerifiableCredential",
                "AchievementCredential"
                ],
                "issuer": {
                "id": "https://example.edu/issuers/565049",
                "type": "Profile",
                "name": "Example University"
                },
                "validFrom": "2010-01-01T00:00:00Z",
                "name": "Example University Degree",
                "credentialSubject": {
                "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
                "type": "AchievementSubject",
                "achievement": {
                    "id": "urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002",
                    "type": "Achievement",
                    "creator": {
                    "id": "https://example.edu/issuers/565049",
                    "type": "Profile"
                    },
                    "name": "Achievement 1",
                    "criteria": {
                    "id": "https://example.edu/achievements/a7467ef6-56cb-11ec-bf63-0242ac130002/criteria"
                    },
                    "description": "Achievement 1",
                    "image": {
                    "id": "https://example.edu/achievements/sample.png",
                    "type": "Image"
                    }
                }
                },
                "credentialSchema": [
                {
                    "id": "https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_achievementcredential_schema.json",
                    "type": "1EdTechJsonSchemaValidator2019"
                }
                ],
                "proof": [
                {
                    "type": "DataIntegrityProof",
                    "created": "2010-01-01T19:23:24Z",
                    "verificationMethod": "https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi",
                    "cryptosuite": "eddsa-rdfc-2022",
                    "proofPurpose": "assertionMethod",
                    "proofValue": "z45QnLySMt2mWuW787G6cf3SLkP97ZkMZxLeXH5yaaTQPCtTup4GCV95tU8HEnQJSyGCokSj3AvUhmJtvveTmN4Vu"
                }
                ]
            }
            ],
            "achievement": [
            {
                "id": "urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002",
                "type": "Achievement",
                "creator": {
                "id": "https://example.edu/issuers/565049",
                "type": "Profile"
                },
                "name": "Achievement 1",
                "criteria": {
                "id": "https://example.edu/achievements/a7467ef6-56cb-11ec-bf63-0242ac130002/criteria"
                },
                "description": "Achievement 1",
                "image": {
                "id": "https://example.edu/achievements/sample.png",
                "type": "Image"
                }
            },
            {
                "id": "urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002",
                "type": "Achievement",
                "creator": {
                "id": "https://example.edu/issuers/565049",
                "type": "Profile"
                },
                "name": "Achievement 2",
                "criteria": {
                "id": "https://example.edu/achievements/dd887f0a-56cb-11ec-bf63-0242ac130002/criteria"
                },
                "description": "Achievement 2",
                "image": {
                "id": "https://example.edu/achievements/sample.png",
                "type": "Image"
                }
            }
            ],
            "association": [
            {
                "type": "Association",
                "associationType": "isParentOf",
                "sourceId": "urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002",
                "targetId": "urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002"
            }
            ]
        },
        "credentialSchema": [
            {
            "id": "https://purl.imsglobal.org/spec/clr/v2p0/schema/json/clr_v2p0_clrcredential_schema.json",
            "type": "1EdTechJsonSchemaValidator2019"
            }
        ],
        "proof": [{
            "type": "DataIntegrityProof",
            "created": "2010-01-01T19:23:24Z",
            "verificationMethod": "https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi",
            "cryptosuite": "eddsa-rdfc-2022",
            "proofPurpose": "assertionMethod",
            "proofValue": "zF52sU1nfPAjcwCqtgxPNSor6SJnAzRBwZW5VNQXPt8xXCHkd39sgqj32DnMjhFCzbyHsLkhQ8HpBqQTkMgXy329"
        }]
    }
```
