var integrity = `

## Proofs (Signatures) {#data-integrity}

This section describes mechanisms for ensuring the authenticity and integrity of OpenBadgeCredentials. At least one proof mechanism, and the details necessary to evaluate that proof, MUST be expressed for a [=credential=] to be a [=verifiable credential=]; that is, to be [=verifiable=].

### Proof Formats

The proof formats included in this specification fall into two categories:

- JSON Web Token Proof - Somtimes called VC-JWT, this format has a single implementation: the credential is encoded into a [=JWT=] which is then signed and encoded as a [=JWS=]. The JSON Web Token proof is called an external proof because the proof wraps the [=credential=] object.
- Linked Data Proofs - The credential is signed and the signature is used to form a [Proof](#proof) object which is appended to the credential. This format supports many different proof types. These are called embedded proofs because the proof is embedded in the data.

<div class="note">
    The [=issuer=] MAY use multiple proofs. If multiple proofs are provided, the [=verifier=] MAY use any one proof to verify the credential.
</div>

A third category of proof format called Non-Signature Proof is not covered by this specification. This category includes proofs such as proof of work.

### JSON Web Token Proof Format {#jwt-proof}

This proof format relies on the well established JWT (JSON Web Token) [[RFC7519]] and JWS (JSON Web Signature) [[RFC7515]] specifications. A JSON Web Token Proof is a JWT signed and encoded as a [=Compact JWS=] string. The proof format is described in detail in Section 6.3.1 "JSON Web Token" of [[[VC-DATA-MODEL]]]. That description allows several options which may inhibit interoperability. This specification limits the options while maintaining compatibility with [[VC-DATA-MODEL]] to help ensure interoperability.

#### Terminology {#jwt-terminology}

Some of the terms used in this section include:

- <dfn>JWT</dfn> - "JSON Web Token (JWT) is a compact, URL-safe means of representing claims to be transferred between two parties.  The claims in a JWT are encoded as a JSON object that is used as the payload of a JSON Web Signature (JWS) structure or as the plaintext of a JSON Web Encryption (JWE) structure, enabling the claims to be digitally   signed or integrity protected with a Message Authentication Code (MAC) and/or encrypted." [[RFC7519]]
- <dfn>JWS</dfn> - "JSON Web Signature (JWS) represents content secured with digital signatures or Message Authentication Codes (MACs) using JSON-based data structures.  Cryptographic algorithms and identifiers for use with this specification are described in the separate JSON Web Algorithms (JWA) specification and an IANA registry defined by that specification." [[RFC7515]]
- <dfn>JWK</dfn> - "A JSON Web Key (JWK) is a JavaScript Object Notation (JSON) data structure that represents a cryptographic key." [[RFC7517]]
- <dfn>Compact JWS</dfn> - "A compact representation of a JWS." [[RFC7515]]

#### Overview {#jwt-overview}

A [=JWS=] is a signed [=JWT=] with three parts separated by period (".") characters. Each part contains a base64url-encoded value.

- <dfn>JOSE Header</dfn> - Describes the cryptographic operations applied to the JWT and optionally, additional properties of the JWT. [[RFC7515]]
- <dfn>JWT Payload</dfn> - The JSON object that will be signed. In this specification, the JWT Payload includes the OpenBadgeCredential.
- <dfn>JWS Signature</dfn> - The computed signature of the JWT Payload.

The JOSE Header, JWT Payload, and JWS Signature are combined to form a Compact JWS. To transform a [=credential=] into a [=Compact JWS=] takes 4 steps:

1. Create the [=JOSE Header=], specifying the signing algorithm to use
2. Create the [=JWT Payload=] from the [=credential=] to be signed
3. Compute the signature of the [=JWT Payload=]
4. Encode the resulting [=JWS=] as a [=Compact JWS=]

The resulting [=JWS=] proves that the [=issuer=] signed the [=JWT Payload=] turning the [=credential=] into a [=verifiable credential=].

When using the JSON Web Token Proof Format, the \`proof\` property MAY be ommitted from the [OpenBadgeCredential](#achievementcredential). If a Linked Data Proof is also provided, it MUST be created before the JSON Web Token Proof Format is created.

#### Create the JOSE Header {#joseheader}

The [=JOSE Header=] is a JSON object with the following properties (also called JOSE Headers). Additional JOSE Headers are NOT allowed.

| Property / JOSE Header | Type | Description | Required? |
| ---------------------- | ---- | ----------- | --------- |
| \`alg\` | [String](#string) | The signing algorithm MUST be "RS256" as a minimum as defined in [[RFC7518]]. Support for other algorithms is permitted but their use limits interoperability. Later versions of this specification MAY add OPTIONAL support for other algorithms. See Section 6.1 RSA Key of the [[[SEC-11]]]. | Required |
| \`kid\` | [URI](#uri) | A URI that can be [dereferenced](#dereference) to an object of type [JWK](#jwk) representing the public key used to verify the signature. If you do not include a \`kid\` property in the header, you MUST include the public key in the \`jwk\` property. <div class="advisement">Be careful not to accidentally expose the JWK representation of a private key. See [RFC7517](https://tools.ietf.org/html/rfc7517#appendix-A.2) for examples of private key representations. The \`JWK\` MUST never contain \`"d"\`.</div> | Optional |
| \`jwk\` | [JWK](#jwk) | A JWK representing the public key used to verify the signature. If you do not include a \`jwk\` property in the header, you MUST include the \`kid\` property. <div class="advisement">Be careful not to accidentally expose the JWK representation of a private key. See [RFC7517](https://tools.ietf.org/html/rfc7517#appendix-A.2) for examples of private key representations. The \`JWK\` MUST never contain \`"d"\`.</div> | Optional |
| \`typ\` | [String](#string) | If present, MUST be set to "JWT". | Optional |

<pre class="example json" title="Sample JOSE Header with reference to a public key in a JWKS">
  {
    "alg": "RS256",
    "kid": "https://example.edu/keys#key-1",
    "typ": "JWT"
  }
</pre>

#### Create the JWT Payload

If you are going to use both external and embedded proof formats, add the embedded proofs prior to creating the JWT Payload.

##### JWT Payload Format

The JWT Payload is a JSON object with the following properties (JWT Claims). Additional standard JWT Claims Names are allowed, but their relationship to the credential is not defined.

| Property / Claim Name | Type | Description | Required? |
| ---------------------- | ---- | ----------- | --------- |
| \`exp\` | [NumericDate](#numericdate) | The \`expirationDate\` property of the OpenBadgeCredential. Required if the OpenBadgeCredential has an \`expirationDate\`. | Optional |
| \`iss\` | [URI](#uri) | The \`issuer.id\` property of the OpenBadgeCredential. | Required |
| \`jti\` | [URI](#uri) | The \`id\` property of the OpenBadgeCredential. | Required |
| \`nbf\` | [NumericDate](#numericdate) | The \`issuanceDate\` property of the OpenBadgeCredential. | Required |
| \`sub\` | [URI](#uri) | The \`credentialSubject.id\` property of the OpenBadgeCredential. | Required |
| \`vc\` | [OpenBadgeCredential](#achievementcredential) | The OpenBadgeCredential being signed.| Required |

#### Create the Proof {#jwt-signing}

<div class="note" title="Sign and Encode the JWS">
  <p>1EdTech strongly recommends using an existing, stable library for this step.</p>
</div>

This section uses the follow notations:

- \`JOSE Header\` - denotes the JSON string representation of the JOSE Header.
- \`JWT Payload\` - denotes the JSON string representation of the JWT Payload.
- \`BASE64URL(OCTETS)\` - denotes the base64url encoding of OCTETS per [[RFC7515]].
- \`UTF8(STRING)\` - denotes the octets of the UTF-8 [[RFC3629]] representation of STRING, where STRING is a sequence of Unicode [[UNICODE]] characters.
- The concatenation of two values A and B is denoted as \`A || B\`.

The steps to sign and encode the credential as a Compact JWS are shown below:

<ol>
  <li type="A">Encode the JOSE Header as \`BASE64URL(UTF8(JOSE Header))\`.</li>
  <li type="A">Encode the JWT Payload as \`BASE64URL(JWT Payload)\`.</li>
  <li type="A">Concatenate the encoded JOSE Header and the encoded JSW Payload as \`A | "." | B\`.</li>
  <li type="A">Calculate the \`JWS Signature\` for \`C\` as described in [[RFC7515]].</li>
  <li type="A">Encode the signature as \`BASE64URL(JWS Signature)\`.</li>
  <li type="A">Concatenate \`C\` and \`E\` as \`C | "." | E\`.</li>
</ol>

The resulting string is the Compact JWS representation of the credential. The Compact JWS includes the credential AND acts as the proof for the credential.

#### Verify a Credential {#jwt-verify}

Verifiers that receive a OpenBadgeCredential in Compact JWS format MUST perform the following steps to verify the embedded credential.

1. Base64url-decode the JOSE Header.
1. If the header includes a \`kid\` property, [Dereference](#dereference) the \`kid\` value to retrieve the public key [JWK](#jwk).
1. If the header includes a \`jwk\` property, convert the \`jwk\` value into the public key [JWK](#jwk).
1. Use the public key JWK to verify the signature as described in "Section 5.2 Message Signature or MAC Validation" of [[RFC7515]]. If the signature is not valid, the credential proof is not valid.
   <div class="note" title="Verifying the JWS Signature">
     <p>1EdTech strongly recommends using an existing, stable library for this step.</p>
   </div>
1. Base64url-decode the JWT Payload segment of the Compact JWS and parse it into a JSON object.
1. Convert the value of \`vc\` claim to an [OpenBadgeCredential](#achievementcredential) and continue with [[[#jwt-verify-credential]]].

##### Verify a Credential VC-JWT Signature {#jwt-verify-credential}

- The JSON object MUST have the \`iss\` claim, and the value MUST match the \`issuer.id\` of the [OpenBadgeCredential](#achievementcredential) object. If they do not match, the credential is not valid.
- The JSON object MUST have the \`sub\` claim, and the value MUST match the \`credentialSubject.id\` of the [OpenBadgeCredential](#achievementcredential) object. If they do not match, the credential is not valid.
- The JSON object MUST have the \`nbf\` claim, and the [NumericDate](#numericdate) value MUST be converted to a [DateTime](#datetime), and MUST equal the \`issuanceDate\` of the [OpenBadgeCredential](#achievementcredential) object. If they do not match or if the \`issuanceDate\` has not yet occurred, the credential is not valid.
- The JSON object MUST have the \`jti\` claim, and the value MUST match the \`id\` of the [OpenBadgeCredential](#achievementcredential) object. If they do not match, the credential is not valid.
- If the JSON object has the \`exp\` claim, the [NumericDate](#numericdate) MUST be converted to a [DateTime](#datetime), and MUST be used to set the value of the \`expirationDate\` of the [OpenBadgeCredential](#achievementcredential) object. If the credential has expired, the credential is not valid.

### Linked Data Proof Format {#lds-proof}

This standard supports the Linked Data Proof format. In order to opt for this format you MUST use the [[[VC-DI-EDDSA]]] suite.

<div class="note">
  Whenever possible, you should use a library or service to create and verify a Linked Data Proof. For example, Digital Bazaar, Inc. has a GitHub project that implements the [[[VC-DI-EDDSA]]] eddsa-2022 suite at <a href="https://github.com/digitalbazaar/eddsa-2022-cryptosuite">https://github.com/digitalbazaar/eddsa-2022-cryptosuite</a>.
</div>

#### Create the Proof

Perform these steps to attach a Linked Data Proof to the credential:

1. Create an instance of [Multikey](#multikey) as shown in [Section 2.1.1 DataIntegrityProof](https://www.w3.org/TR/vc-di-eddsa/#multikey) of [[VC-DI-EDDSA]].
1. Using the key material, sign the credential object as shown in [Section 7.1 Proof Algothim](https://w3c-ccg.github.io/data-integrity-spec/#proof-algorithm) of [[DATA-INTEGRITY-SPEC]] to produce a [Proof](#proof) as shown in [Section 2.2.1 DataIntegrityProof](https://www.w3.org/TR/vc-di-eddsa/#dataintegrityproof) of [[VC-DI-EDDSA]] with a \`proofPurpose\` of "assertionMethod".
1. Add the resulting proof object to the credential \`proof\` property.

#### Verify an OpenBadgeCredential Linked Data Signature {#lds-verify}

Verify the Linked Data Proof signature as shown in [Section 7.2 Proof Verification Algorthim](https://w3c-ccg.github.io/data-integrity-spec/#proof-verification-algorithm) of [[DATA-INTEGRITY-SPEC]].

### Key Management

[=Issuers=] will need to manage asymmetric keys. The mechanisms by which keys are minted and distributed is outside the scope of this specification. See Section 6. Key Management of the [[[SEC-11]]].

### Dereferencing the Public Key {#dereference}

All the proof formats in this specification, and all Digital Integrity proofs in general, require the [=verifier=] to "dereference" the public key from a URI. Dereferencing means using the URI to get the public key in [JWK](#jwk) format. This specification allows the use of an HTTP URL (e.g. \`https://1edtech.org/keys/1\`) or a DID URL (e.g. \`did:key:123\`), but only requires HTTP URL support.

`;
