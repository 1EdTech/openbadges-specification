## Linked Data Proof Test Vector for Comprehensive Learner Record 2.0

<div class="note">
The signing process for CLR 2.0 is the same as for OB 3.0. Therefore, the only
difference between this chapter and the previous one is the use of a
`ClrCredential` instead of an `AchievementCredential` as the input data

</div>

This chapter is an example of the signing process of a given credential with
 an Linked Data Proof producing a `DataIntegrityProof` of a public key
 expressed in `eddsa-rdf-2022` format.

### Key pair & Multikey

For this example we are using the following keypair:
* Public key (hex): `4bdeafde2ea8beefadd8c699b5c7e0704cf51154d52e17b20b71337ca04cc5a5`
* Private key (hex): `6241a409e6707bb640a0140a8a32bc3d193c33a661747284d6adfa4ed4180be44bdeafde2ea8beefadd8c699b5c7e0704cf51154d52e17b20b71337ca04cc5a5`

The `MultiKey` used in this example is as follows:
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
    "https://www.w3.org/2018/credentials/v1",
    "https://purl.imsglobal.org/spec/clr/v2p0/context.json",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.2.json",
    "https://purl.imsglobal.org/spec/ob/v3p0/extensions.json",
    "https://w3id.org/security/data-integrity/v1"
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
  "issuanceDate": "2010-01-01T00:00:00Z",
  "name": "Sample Transcript",
  "credentialSubject": {
    "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
    "type": "ClrSubject",
    "verifiableCredential": [
      {
        "@context": [
          "https://www.w3.org/2018/credentials/v1",
          "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.2.json",
          "https://purl.imsglobal.org/spec/ob/v3p0/extensions.json",
          "https://w3id.org/security/data-integrity/v1"
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
        "issuanceDate": "2010-01-01T00:00:00Z",
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
        "proof": {
          "type": "DataIntegrityProof",
          "created": "2010-01-01T19:23:24Z",
          "verificationMethod": "https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi",
          "cryptosuite": "eddsa-rdfc-2022",
          "proofPurpose": "assertionMethod",
          "proofValue": "z2CGNmCgEmN68CWch6Kgg4vnjRDE896jnUqfQtJoG11qxC8ntxUPCQaGckoHG7BXW7KWZyUiSs5EkKX3gEiGYKrz"
        }
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

### Document with cryptosuite context
```json
{
  "@context": [
    "https://www.w3.org/2018/credentials/v1",
    "https://purl.imsglobal.org/spec/clr/v2p0/context.json",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.2.json",
    "https://purl.imsglobal.org/spec/ob/v3p0/extensions.json",
    "https://w3id.org/security/data-integrity/v1"
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
  "issuanceDate": "2010-01-01T00:00:00Z",
  "name": "Sample Transcript",
  "credentialSubject": {
    "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
    "type": "ClrSubject",
    "verifiableCredential": [
      {
        "@context": [
          "https://www.w3.org/2018/credentials/v1",
          "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.2.json",
          "https://purl.imsglobal.org/spec/ob/v3p0/extensions.json",
          "https://w3id.org/security/data-integrity/v1"
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
        "issuanceDate": "2010-01-01T00:00:00Z",
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
        "proof": {
          "type": "DataIntegrityProof",
          "created": "2010-01-01T19:23:24Z",
          "verificationMethod": "https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi",
          "cryptosuite": "eddsa-rdfc-2022",
          "proofPurpose": "assertionMethod",
          "proofValue": "z2CGNmCgEmN68CWch6Kgg4vnjRDE896jnUqfQtJoG11qxC8ntxUPCQaGckoHG7BXW7KWZyUiSs5EkKX3gEiGYKrz"
        }
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
  "type": "DataIntegrityProof",
  "created": "2010-01-01T19:23:24Z",
  "verificationMethod": "https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi",
  "cryptosuite": "eddsa-rdfc-2022",
  "proofPurpose": "assertionMethod"
}
```

### Proof normalized
```
_:c14n0 <http://purl.org/dc/terms/created> "2010-01-01T19:23:24Z"^^<http://www.w3.org/2001/XMLSchema#dateTime> .
_:c14n0 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://w3id.org/security#DataIntegrityProof> .
_:c14n0 <https://w3id.org/security#cryptosuite> "eddsa-rdfc-2022" .
_:c14n0 <https://w3id.org/security#proofPurpose> <https://w3id.org/security#assertionMethod> .
_:c14n0 <https://w3id.org/security#verificationMethod> <https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi> .
```

### Document normalized
```xml
<did:example:ebfeb1f712ebc6f1c276e12ec21> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/clr/vocab.html#ClrSubject> .
<did:example:ebfeb1f712ebc6f1c276e12ec21> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#AchievementSubject> .
<did:example:ebfeb1f712ebc6f1c276e12ec21> <https://purl.imsglobal.org/spec/vc/clr/vocab.html#achievement> <urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002> .
<did:example:ebfeb1f712ebc6f1c276e12ec21> <https://purl.imsglobal.org/spec/vc/clr/vocab.html#achievement> <urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002> .
<did:example:ebfeb1f712ebc6f1c276e12ec21> <https://purl.imsglobal.org/spec/vc/clr/vocab.html#association> _:c14n2 .
<did:example:ebfeb1f712ebc6f1c276e12ec21> <https://purl.imsglobal.org/spec/vc/clr/vocab.html#verifiableCredential> <urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002> .
<did:example:ebfeb1f712ebc6f1c276e12ec21> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#achievement-0> <urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002> .
<http://example.edu/credentials/3732> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/clr/vocab.html#ClrCredential> .
<http://example.edu/credentials/3732> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://www.w3.org/2018/credentials#VerifiableCredential> .
<http://example.edu/credentials/3732> <https://schema.org/name> "Sample Transcript" .
<http://example.edu/credentials/3732> <https://www.w3.org/2018/credentials#credentialSchema> <https://purl.imsglobal.org/spec/clr/v2p0/schema/json/clr_v2p0_clrcredential_schema.json> .
<http://example.edu/credentials/3732> <https://www.w3.org/2018/credentials#credentialSubject> <did:example:ebfeb1f712ebc6f1c276e12ec21> .
<http://example.edu/credentials/3732> <https://www.w3.org/2018/credentials#issuanceDate> "2010-01-01T00:00:00Z"^^<http://www.w3.org/2001/XMLSchema#dateTime> .
<http://example.edu/credentials/3732> <https://www.w3.org/2018/credentials#issuer> <https://example.edu/issuers/565049> .
<https://example.edu/achievements/sample.png> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Image> .
<https://example.edu/issuers/565049> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Profile> .
<https://example.edu/issuers/565049> <https://schema.org/name> "Example University" .
<https://purl.imsglobal.org/spec/clr/v2p0/schema/json/clr_v2p0_clrcredential_schema.json> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vccs/v1p0/context.json#1EdTechJsonSchemaValidator2019> .
<https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_achievementcredential_schema.json> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vccs/v1p0/context.json#1EdTechJsonSchemaValidator2019> .
<urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#OpenBadgeCredential> .
<urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://www.w3.org/2018/credentials#VerifiableCredential> .
<urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002> <https://schema.org/name> "Example University Degree" .
<urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002> <https://w3id.org/security#proof> _:c14n0 .
<urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002> <https://www.w3.org/2018/credentials#credentialSchema> <https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_achievementcredential_schema.json> .
<urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002> <https://www.w3.org/2018/credentials#credentialSubject> <did:example:ebfeb1f712ebc6f1c276e12ec21> .
<urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002> <https://www.w3.org/2018/credentials#issuanceDate> "2010-01-01T00:00:00Z"^^<http://www.w3.org/2001/XMLSchema#dateTime> .
<urn:uuid:91537dba-56cb-11ec-bf63-0242ac130002> <https://www.w3.org/2018/credentials#issuer> <https://example.edu/issuers/565049> .
<urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Achievement> .
<urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Criteria> <https://example.edu/achievements/a7467ef6-56cb-11ec-bf63-0242ac130002/criteria> .
<urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Image> <https://example.edu/achievements/sample.png> .
<urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#creator> <https://example.edu/issuers/565049> .
<urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002> <https://schema.org/description> "Achievement 1" .
<urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002> <https://schema.org/name> "Achievement 1" .
<urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Achievement> .
<urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Criteria> <https://example.edu/achievements/dd887f0a-56cb-11ec-bf63-0242ac130002/criteria> .
<urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Image> <https://example.edu/achievements/sample.png> .
<urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#creator> <https://example.edu/issuers/565049> .
<urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002> <https://schema.org/description> "Achievement 2" .
<urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002> <https://schema.org/name> "Achievement 2" .
_:c14n1 <http://purl.org/dc/terms/created> "2010-01-01T19:23:24Z"^^<http://www.w3.org/2001/XMLSchema#dateTime> _:c14n0 .
_:c14n1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://w3id.org/security#DataIntegrityProof> _:c14n0 .
_:c14n1 <https://w3id.org/security#cryptosuite> "eddsa-rdfc-2022" _:c14n0 .
_:c14n1 <https://w3id.org/security#proofPurpose> <https://w3id.org/security#assertionMethod> _:c14n0 .
_:c14n1 <https://w3id.org/security#proofValue> "z2CGNmCgEmN68CWch6Kgg4vnjRDE896jnUqfQtJoG11qxC8ntxUPCQaGckoHG7BXW7KWZyUiSs5EkKX3gEiGYKrz"^^<https://w3id.org/security#multibase> _:c14n0 .
_:c14n1 <https://w3id.org/security#verificationMethod> <https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi> _:c14n0 .
_:c14n2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/clr/vocab.html#Association> .
_:c14n2 <https://purl.imsglobal.org/spec/vc/clr/vocab.html#AssociationType> "isParentOf" .
_:c14n2 <https://purl.imsglobal.org/spec/vc/clr/vocab.html#sourceId> "urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002"^^<xsd:anyURI> .
_:c14n2 <https://purl.imsglobal.org/spec/vc/clr/vocab.html#targetId> "urn:uuid:dd887f0a-56cb-11ec-bf63-0242ac130002"^^<xsd:anyURI> .
```

### Document hash (hex)
`fd987e45f5ee69ee7bc36a4111d9012c727fb80d79f867b344bf3fa67e8c4e83`

### Proof hash (hex)
`3cf3c265b6c8ebb29b4d5ea310b87d2f31c79b633eff8af561d2e8c97a85c8cb`

### Data to sign (hex)
`3cf3c265b6c8ebb29b4d5ea310b87d2f31c79b633eff8af561d2e8c97a85c8cbfd987e45f5ee69ee7bc36a4111d9012c727fb80d79f867b344bf3fa67e8c4e83`

### Signature (hex)
`50857f041f543633b12e02ff1173f8271f0edfd7d92fcfe07b0b25d11b3d240e37070c15667a5c9346625afbf671abf065b5a37b1cfa3ba5ad22b77c9a9eec05`

### Proof value (hex)
`z2cNeK7UjuvWoNUHa8D7bbZuhryrgG3LjXmJSnY3R69mVJTAdX5yP1RCo9SH1aZwmyA76snohTwACQRFyrwGihsfr`

### Proof

```json
{
    "type": "DataIntegrityProof",
    "created": "2010-01-01T19:23:24Z",
    "verificationMethod": "https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi",
    "cryptosuite": "eddsa-rdfc-2022",
    "proofPurpose": "assertionMethod",
    "proofValue": "z2cNeK7UjuvWoNUHa8D7bbZuhryrgG3LjXmJSnY3R69mVJTAdX5yP1RCo9SH1aZwmyA76snohTwACQRFyrwGihsfr"
}
```

### Signed credential

```json
{
  "@context": [
    "https://www.w3.org/2018/credentials/v1",
    "https://purl.imsglobal.org/spec/clr/v2p0/context.json",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.2.json",
    "https://purl.imsglobal.org/spec/ob/v3p0/extensions.json",
    "https://w3id.org/security/data-integrity/v1"
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
  "issuanceDate": "2010-01-01T00:00:00Z",
  "name": "Sample Transcript",
  "credentialSubject": {
    "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
    "type": "ClrSubject",
    "verifiableCredential": [
      {
        "@context": [
          "https://www.w3.org/2018/credentials/v1",
          "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.2.json",
          "https://purl.imsglobal.org/spec/ob/v3p0/extensions.json",
          "https://w3id.org/security/data-integrity/v1"
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
        "issuanceDate": "2010-01-01T00:00:00Z",
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
        "proof": {
          "type": "DataIntegrityProof",
          "created": "2010-01-01T19:23:24Z",
          "verificationMethod": "https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi",
          "cryptosuite": "eddsa-rdfc-2022",
          "proofPurpose": "assertionMethod",
          "proofValue": "z2CGNmCgEmN68CWch6Kgg4vnjRDE896jnUqfQtJoG11qxC8ntxUPCQaGckoHG7BXW7KWZyUiSs5EkKX3gEiGYKrz"
        }
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
  "proof": {
    "type": "DataIntegrityProof",
    "created": "2010-01-01T19:23:24Z",
    "verificationMethod": "https://example.edu/issuers/565049#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi",
    "cryptosuite": "eddsa-rdfc-2022",
    "proofPurpose": "assertionMethod",
    "proofValue": "z2cNeK7UjuvWoNUHa8D7bbZuhryrgG3LjXmJSnY3R69mVJTAdX5yP1RCo9SH1aZwmyA76snohTwACQRFyrwGihsfr"
  }
}
```
