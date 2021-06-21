var specification=`

## Specification

### What is the problem this solves for?

VC wallets do not recognize the OB 2.0 data model as a valid VC.

### Changes to the data model

- The top level object MUST be a W3C VC
- The OB Assertion MUST be a <code>ob</code> claim within the W3C VC <code>credentialSubject</code> object.

### Changes to the API

- None

### Considerations

- Some data is duplicated (in the example below, the issuer is duplicated)
- VC proof and the OB verification are redundant or conflicting (in the example below they are redundant)
- Both OB verification methods require the verifier to connect to an issuer resource (either the badge if hosted or the public key if signed)
  - This nullifies VC proofs that avoid connection with the issuer

### Example

<figure class="example">
  <pre>
{
  "@context": [
    "https://www.w3.org/2018/credentials/v1",
    "https://w3id.org/openbadges/v2",
    {
      "ob": "obi:Assertion"
    }
  ],
  "id": "https://example.org/assertions/123",
  "type": [
    "VerifiableCredential"
  ],
  "issuer": "https://example.org/issuer",
  "issuanceDate": "2016-12-31T23:59:59+00:00",
  "credentialSubject": {
    "ob": {
      "id": "https://example.org/assertions/123",
      "type": "Assertion",
      "recipient": {
        "type": "email",
        "identity": "alice@example.org"
      },
      "issuedOn": "2016-12-31T23:59:59+00:00",
      "verification": {
        "type": "hosted"
      },
      "badge": {
        "type": "BadgeClass",
        "id": "https://example.org/badges/5",
        "name": "3-D Printmaster",
        "description": "This badge is awarded for passing the 3-D printing knowledge and safety test.",
        "image": "https://example.org/badges/5/image",
        "criteria": {
          "narrative": "Students are tested on knowledge and safety, both through a paper test and a supervised performance evaluation on live equipment"
        },
        "issuer": {
          "id": "https://example.org/issuer",
          "type": "Profile",
          "name": "Example Maker Society",
          "url": "https://example.org",
          "email": "contact@example.org",
          "verification": {
            "allowedOrigins": "example.org"
          }
        }
      }
    },
    "proof": {
      "type": "RsaSignature2018",
      "created": "2018-06-18T21:19:10Z",
      "proofPurpose": "assertionMethod",
      "verificationMethod": "https://example.com/jdoe/keys/1",
      "jws": "eyJhbGciOiJQUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il19
      ..DJBMvvFAIC00nSGB6Tn0XKbbF9XrsaJZREWvR2aONYTQQxnyXirtXnlewJMB
      Bn2h9hfcGZrvnC1b6PgWmukzFJ1IiH1dWgnDIS81BH-IxXnPkbuYDeySorc4
      QU9MJxdVkY5EL4HYbcIfwKj6X4LBQ2_ZHZIu1jdqLcRZqHcsDF5KKylKc1TH
      n5VRWy5WhYg_gBnyWny8E6Qkrze53MR7OuAmmNJ1m1nN8SxDrG6a08L78J0-
      Fbas5OjAQz3c17GY8mVuDPOBIOVjMEghBlgl3nOi1ysxbRGhHLEK4s0KKbeR
      ogZdgt1DkQxDFxxn41QWDw_mmMCjs9qxg0zcZzqEJw"
    }
  }
  </pre>
  <figcaption><span>Example of the a revoked Assertion.</span></figcaption>
</figure>

`;
