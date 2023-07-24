## Linked Data Proof Test Vector

This chapter is an example of the signing process of a given credential with an Linked Data Proof producing a `DataIntegrityProof` of a public key expressed in `eddsa-2022` format.

### Key pair & Multikey

For this example we are using the following keypair:
* Public key (hex): `4bdeafde2ea8beefadd8c699b5c7e0704cf51154d52e17b20b71337ca04cc5a5`
* Private key (hex): `6241a409e6707bb640a0140a8a32bc3d193c33a661747284d6adfa4ed4180be44bdeafde2ea8beefadd8c699b5c7e0704cf51154d52e17b20b71337ca04cc5a5`

The `MultiKey` used in this example is as follows:
```json
 {
  id: 'https://example.com/issuers/876543#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi',
  controller: 'https://example.com/issuers/876543',
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
    "https://purl.imsglobal.org/spec/ob/v3p0/context/ob_v3p0.jsonld"
  ],
  "id": "http://example.com/credentials/3527",
  "type": [
    "VerifiableCredential",
    "OpenBadgeCredential"
  ],
  "issuer": {
    "id": "https://example.com/issuers/876543",
    "type": [
      "Profile"
    ],
    "url": "https://www.imsglobal.org",
    "name": "Example Corp"
  },
  "issuanceDate": "2010-01-01T00:00:00Z",
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

### Document with cryptosuite context
```json
{
  "@context": [
    "https://www.w3.org/2018/credentials/v1",
    "https://purl.imsglobal.org/spec/ob/v3p0/context/ob_v3p0.jsonld",
    "https://w3id.org/security/data-integrity/v1"
  ],
  "id": "http://example.com/credentials/3527",
  "type": [
    "VerifiableCredential",
    "OpenBadgeCredential"
  ],
  "issuer": {
    "id": "https://example.com/issuers/876543",
    "type": [
      "Profile"
    ],
    "url": "https://www.imsglobal.org",
    "name": "Example Corp"
  },
  "issuanceDate": "2010-01-01T00:00:00Z",
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

### Proof before signing
```json
{
  "type": "DataIntegrityProof",
  "created": "2010-01-01T19:23:24Z",
  "verificationMethod": "https://example.com/issuers/876543#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi",
  "cryptosuite": "eddsa-2022",
  "proofPurpose": "assertionMethod"
}
```

### Proof normalized
```
_:c14n0 <http://purl.org/dc/terms/created> "2010-01-01T19:23:24Z"^^<http://www.w3.org/2001/XMLSchema#dateTime> .
_:c14n0 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://w3id.org/security#DataIntegrityProof> .
_:c14n0 <https://w3id.org/security#cryptosuite> "eddsa-2022" .
_:c14n0 <https://w3id.org/security#proofPurpose> <https://w3id.org/security#assertionMethod> .
_:c14n0 <https://w3id.org/security#verificationMethod> <https://example.com/issuers/876543#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi> .
```

### Document normalized
```xml
<did:example:ebfeb1f712ebc6f1c276e12ec21> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#AchievementSubject> .
<did:example:ebfeb1f712ebc6f1c276e12ec21> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Achievement> <https://example.com/achievements/21st-century-skills/teamwork> .
<http://example.com/credentials/3527> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#OpenBadgeCredential> .
<http://example.com/credentials/3527> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://www.w3.org/2018/credentials#VerifiableCredential> .
<http://example.com/credentials/3527> <https://schema.org/name> "Teamwork Badge"^^<https://www.w3.org/2001/XMLSchema#string> .
<http://example.com/credentials/3527> <https://www.w3.org/2018/credentials#credentialSubject> <did:example:ebfeb1f712ebc6f1c276e12ec21> .
<http://example.com/credentials/3527> <https://www.w3.org/2018/credentials#issuanceDate> "2010-01-01T00:00:00Z"^^<http://www.w3.org/2001/XMLSchema#dateTime> .
<http://example.com/credentials/3527> <https://www.w3.org/2018/credentials#issuer> <https://example.com/issuers/876543> .
<https://example.com/achievements/21st-century-skills/teamwork> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Achievement> .
<https://example.com/achievements/21st-century-skills/teamwork> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Criteria> _:c14n0 .
<https://example.com/achievements/21st-century-skills/teamwork> <https://schema.org/description> "This badge recognizes the development of the capacity to collaborate within a group environment."^^<https://www.w3.org/2001/XMLSchema#string> .
<https://example.com/achievements/21st-century-skills/teamwork> <https://schema.org/name> "Teamwork"^^<https://www.w3.org/2001/XMLSchema#string> .
<https://example.com/issuers/876543> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://purl.imsglobal.org/spec/vc/ob/vocab.html#Profile> .
<https://example.com/issuers/876543> <https://schema.org/name> "Example Corp"^^<https://www.w3.org/2001/XMLSchema#string> .
<https://example.com/issuers/876543> <https://schema.org/url> "https://www.imsglobal.org"^^<https://www.w3.org/2001/XMLSchema#anyURI> .
_:c14n0 <https://purl.imsglobal.org/spec/vc/ob/vocab.html#narrative> "Team members are nominated for this badge by their peers and recognized upon review by Example Corp management."^^<https://www.w3.org/2001/XMLSchema#string> .
```

### Document hash (hex)
`e88d300cf52568268f708fb39c206402fba48960719a10d08f8beed6215b3855`

### Proof hash (hex)
`c72f35a6cac737fe019f08e23177b6a7caaffa9c4a04e0bd72f749223a16c171`

### Data to sign (hex)
`c72f35a6cac737fe019f08e23177b6a7caaffa9c4a04e0bd72f749223a16c171e88d300cf52568268f708fb39c206402fba48960719a10d08f8beed6215b3855`

### Signature (hex)
`bff230a95560ea8893e37433ed11dbd9f09651440ea68f94a587f700fd5b49ed4d5b66af2f6040ebe8747a2b2521270f27c4bc49ded1597e540f7724af865d05`

### Proof value (hex)
`z4qak22wvg7qwFSZtUdWbRUd7wCjU2VKKXU7NPuugBNYmeB6hHgdqUxChGxS33DUuUQmfgsjhdPkpfgg6zH9HzHdv`

### Proof

```json
{
    "type": "DataIntegrityProof",
    "created": "2010-01-01T19:23:24Z",
    "verificationMethod": "https://example.com/issuers/876543#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi",
    "cryptosuite": "eddsa-2022",
    "proofPurpose": "assertionMethod",
    "proofValue": "z4qak22wvg7qwFSZtUdWbRUd7wCjU2VKKXU7NPuugBNYmeB6hHgdqUxChGxS33DUuUQmfgsjhdPkpfgg6zH9HzHdv"
}
```

### Signed credential

```json
{
  "@context": [
    "https://www.w3.org/2018/credentials/v1",
    "https://purl.imsglobal.org/spec/ob/v3p0/context/ob_v3p0.jsonld",
    "https://w3id.org/security/data-integrity/v1"
  ],
  "id": "http://example.com/credentials/3527",
  "type": [
    "VerifiableCredential",
    "OpenBadgeCredential"
  ],
  "issuer": {
    "id": "https://example.com/issuers/876543",
    "type": [
      "Profile"
    ],
    "url": "https://www.imsglobal.org",
    "name": "Example Corp"
  },
  "issuanceDate": "2010-01-01T00:00:00Z",
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
    "verificationMethod": "https://example.com/issuers/876543#z6MkjZRZv3aez3r18pB1RBFJR1kwUVJ5jHt92JmQwXbd5hwi",
    "cryptosuite": "eddsa-2022",
    "proofPurpose": "assertionMethod",
    "proofValue": "z4qak22wvg7qwFSZtUdWbRUd7wCjU2VKKXU7NPuugBNYmeB6hHgdqUxChGxS33DUuUQmfgsjhdPkpfgg6zH9HzHdv"
  }
}

```
