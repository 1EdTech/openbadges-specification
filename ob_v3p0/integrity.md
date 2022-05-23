var integrity = `

## Proofs (Signatures) {#data-integrity}

This section describes mechanisms for ensuring the authenticity and integrity of Open Badges documents and payloads. At least one proof mechanism, and the details necessary to evaluate that proof, MUST be expressed for a [=credential=] or [=presentation=] to be a [=verifiable credential=] or [=verifiable presentation=]; that is, to be [=verifiable=].

### Proof Formats

The proof formats included in this specification fall into two categories:

- JSON Web Token Proof - Somtimes called VC-JWT, this format has a single implementation: the credential or presentation is encoded into a [=JWT=] which is then signed and encoded as a [=JWS=]. The JSON Web Token proof is called an external proof because the proof wraps the [=credential=] or [=presentation=] object.
- Linked Data Proofs - The credential or presentation is signed and the signature is used to form a [Proof](#proof) object which is appended to the credential or presentation. This format supports many different proof types. These are called embedded proofs because the proof is embedded in the data.

<div class="note">
    The [=issuer=] or [=holder=] MAY use multiple proofs. If multiple proofs are provided, the [=verifier=] MAY use any one proof to verify the credential.
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
- <dfn>JWT Payload</dfn> - The JSON object that will be signed. In this specification, the JWT Payload includes either the CLR Credential or CLR Presentation.
- <dfn>JWS Signature</dfn> - The computed signature of the JWT Payload.

The JOSE Header, JWT Payload, and JWS Signature are combined to form a Compact JWS. To transform a [=credential=] or [=presentation=] into a [=Compact JWS=] takes 4 steps:

1. Create the [=JOSE Header=], specifying the signing algorithm to use
2. Create the [=JWT Payload=] from the [=credential=] or [=presentation=] to be signed
3. Compute the signature of the [=JWT Payload=]
4. Encode the resulting [=JWS=] as a [=Compact JWS=]

The resulting [=JWS=] proves that the [=issuer=] or [=holder=] signed the [=JWT Payload=] turning the [=credential=] or [=presentation=] into a [=verifiable credential=] or [=verifiable presentation=].

When using the JSON Web Token Proof Format, the \`proof\` property MAY be ommitted from the [OpenBadgeCredential](#achievementcredential) or [VerifiablePresentation](#verifiablepresentation). If a Linked Data Proof is also provided, it MUST be created before the JSON Web Token Proof Format is created.

#### Create the JOSE Header {#joseheader}

The [=JOSE Header=] is a JSON object with the following properties (also called JOSE Headers). Additional JOSE Headers are NOT allowed.

| Property / JOSE Header | Type | Description | Required? |
| ---------------------- | ---- | ----------- | --------- |
| \`alg\` | [String](#string) | The signing algorithm MUST be "RS256" as a minimum as defined in [[RFC7518]]. Support for other algorithms is permitted but their use limits interoperability. Later versions of this specification MAY add OPTIONAL support for other algorithms. See Section 6.1 RSA Key of the [[[SEC-11]]]. | Required |
| \`kid\` | [URI](#uri) | A URI that can be [dereferenced](#dereference) to an object of type [JWK](#jwk). <div class="advisement">Be careful not to accidentally publish the JWK representation of a private key. See [RFC7517](https://tools.ietf.org/html/rfc7517#appendix-A.2) for examples of private key representations. The \`JWK\` MUST never contain \`"d"\`.</div> | Required |
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

##### Sign Nested Credentials

A [VerifiablePresentation](#verifiablepresentation) has nested [=verifiable credentials=]. The [[[VC-DATA-MODEL]]] specification does not specify how to encode a JWT Payload when the credential has nested credentials (it does have an [example](https://www.w3.org/TR/vc-data-model/#example-verifiable-presentation-using-jwt-compact-serialization-non-normative) of an encoded presentation with a nested credential). To help ensure interoperability, this specification does define how to encode the JWT Payload with nested credentials.

The JSON Web Token Proof for each nested credential MUST be created prior to creating the JWT Payload for the parent presentation. Because the JSON Web Token Proof for each nested credential is a Compact JWS string rather than a JSON object, the data model for a signed [VerifiablePresentation](#verifiablepresentation) is [PresentationJwsPayload](#presentationjwspayload).

1. Create a JSON object using the [PresentationJwsPayload](#presentationjwspayload) data model.
2. Copy all of the claims from the parent presentation to the new JSON object except for the nested credentials.
3. Process each nested credential:
   - If the nested credential is already signed with a JSON Web Token Proof, simply add the Compact JWS string to the new JSON object.
   - If the nested credential is not signed with a JSON Web Token Proof, sign it with a JSON Web Token Proof and add the resulting Compact JWS string to the new JSON object.
4. Use the new JSON object to form the JWT Payload.

<pre class="example json" title="Sample presentation prior to signing the nested credentials">
  {
    ...
    "verifiableCredential": [
      {
        "id": "assertion1",
        ...
      },
      {
        "id": "assertion2",
        ...
      }
    ]
  }
</pre>
<pre class="example json" title="Sample presentation after signing the nested credentials">
  {
    ...
    "verifiableCredential": [
      "header.payload.signature",
      "header.payload.signature"
    ]
  }
</pre>

##### JWT Payload Format

The JWT Payload is a JSON object with the following properties (JWT Claims). In addition to the standard JWT Claims [[RFC7519]], the [[[VC-DATA-MODEL]]] specification registered two new JWT Claim Names:

- \`vc\`: A JSON object which contains the [=verifiable credential=] to be signed. In this specification, that credential MUST be an [OpenBadgeCredential](#achievementcredential) object.
- \`vp\`: A JSON object which contains the [=verifiable presentation=] to be signed. In this specification, that presentation MUST be a [PresentationJwsPayload](#presentationjwspayload) object.

Additional standard JWT Claims Names are allowed, but their relationship to the credential or presentation is not defined.

| Property / Claim Name | Type | Description | Required? |
| ---------------------- | ---- | ----------- | --------- |
| \`iss\` | [URI](#uri) | The \`issuer\` \`id\` property of the OpenBadgeCredential or the \`holder\`'s \`id\` property of the VerifiablePresentation. | Required |
| \`nbf\` | [NumericDate](#numericdate) | The \`issuanceDate\` property of the OpenBadgeCredential. Omit if the payload is a VerifiablePresentation. | Required if the payload is a OpenBadgeCredential |
| \`jti\` | [URI](#uri) | The \`id\` property of the OpenBadgeCredential or VerifiablePresentation. | Required |
| \`sub\` | [URI](#uri) | The \`id\` property of the OpenBadgeCredential subject. Omit if the payload is a VerifiablePresentation. | Required if the payload is a OpenBadgeCredential |
| \`aud\` | [URI](#uri) | The \`id\` of the intended [=verifier=]. Omit if the payload is a OpenBadgeCredential. | Required if the payload is a VerifiablePresentation. |
| \`vc\` | [OpenBadgeCredential](#achievementcredential) | The OpenBadgeCredential being signed. Omit if the payload is a VerifiablePresentation. | Required if the payload is a OpenBadgeCredential |
| \`vp\` | [PresentationJwsPayload](#presentationjwspayload) | The VerifiablePesentation being signed. Omit if the payload is a OpenBadgeCredential. | Required if the payload is a VerifiablePresentation |

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

The steps to sign and encode the credential or presentation as a Compact JWS are shown below:

<ol>
  <li type="A">Encode the JOSE Header as \`BASE64URL(UTF8(JOSE Header))\`.</li>
  <li type="A">Encode the JWT Payload as \`BASE64URL(JWT Payload)\`.</li>
  <li type="A">Concatenate the encoded JOSE Header and the encoded JSW Payload as \`A | "." | B\`.</li>
  <li type="A">Calculate the \`JWS Signature\` for \`C\` as described in [[RFC7515]].</li>
  <li type="A">Encode the signature as \`BASE64URL(JWS Signature)\`.</li>
  <li type="A">Concatenate \`C\` and \`E\` as \`C | "." | E\`.</li>
</ol>

The resulting string is the Compact JWS representation of the credential or presentation. The Compact JWS includes the credential or presentation AND acts as the proof for the credential or presentation.

#### Verify a Credential or Presentation {#jwt-verify}

Verifiers that receive an VerifiableCredential or VerifiablePresentation in Compact JWS format MUST perform the following steps to verify the embedded credential or presentation.

1. Base64url-decode the JOSE Header and extract the \`kid\` property.
1. [Dereference](#dereference) the \`kid\` value to retrieve the public key [JWK](#jwk).
1. Use the public key JWK to verify the signature as described in "Section 5.2 Message Signature or MAC Validation" of [[RFC7515]]. If the signature is not valid, the credential or presentation is not valid.
   <div class="note" title="Verifying the JWS Signature">
     <p>1EdTech strongly recommends using an existing, stable library for this step.</p>
   </div>
1. Base64url-decode the JWT Payload segment of the Compact JWS and parse it into a JSON object.
1. If the JSON object has a \`vc\` claim, convert the value of \`vc\` to an [OpenBadgeCredential](#achievementcredential) and continue with [[[#jwt-verify-credential]]].
1. If the JSON object has a \`vp\` claim, convert the value of \`vp\` to a [PresentationJwsPayload](#presentationjwspayload) and continue with [[[#jwt-verify-presentation]]].

##### Verify a Credential VC-JWT Signature {#jwt-verify-credential}

- The JSON object MUST have the \`iss\` claim, and the value MUST match the \`id\` of the \`issuer\` of the [OpenBadgeCredential](#achievementcredential) object. If they do not match, the credential is not valid.
- The JSON object MUST have the \`sub\` claim, and the value MUST match the \`id\` of the \`credentialSubject\` of the [OpenBadgeCredential](#achievementcredential) object. If they do not match, the credential is not valid.
- The JSON object MUST have the \`nbf\` claim, and the [NumericDate](#numericdate) value MUST be converted to a [DateTime](#datetime), and MUST equal the \`issuanceDate\` of the [OpenBadgeCredential](#achievementcredential) object. If they do not match or if the \`issuanceDate\` has not yet occurred, the credential is not valid.
- The JSON object MUST have the \`jti\` claim, and the value MUST match the \`id\` of the [OpenBadgeCredential](#achievementcredential) object. If they do not match, the credential is not valid.
- If the JSON object has the \`exp\` claim, the [NumericDate](#numericdate) MUST be converted to a [DateTime](#datetime), and MUST be used to set the value of the \`expirationDate\` of the [OpenBadgeCredential](#achievementcredential) object. If the credential has expired, the credential is not valid.
- <div class="issue" title="Verify the schema"></div>
- <div class="issue" title="Use credentialStatus to determine if the credential has been revoked"></div>
- <div class="issue" title="Should nested assertions be verified?"></div>

##### Verify a Presentation VC-JWT Signature {#jwt-verify-presentation}

- The JSON object MUST have the \`iss\` claim, and the value MUST match the \`id\` of the \`holder\` of the [PresentationJwsPayload](#presentationjwspayload) object. If they do not match, the presentation is not valid.
- The JSON object MUST have the \`nbf\` claim, and the [NumericDate](#numericdate) value MUST be converted to a [DateTime](#datetime), and MUST equal the \`issuanceDate\` of the [PresentationJwsPayload](#presentationjwspayload) object. If they do not match or if the \`issuanceDate\` has not yet occurred, the presentation is not valid.
- The JSON object MUST have the \`jti\` claim, and the value MUST match the \`id\` of the [PresentationJwsPayload](#presentationjwspayload) object. If they do not match, the presentation is not valid.
- If the JSON object has the \`exp\` claim, the [NumericDate](#numericdate) MUST be converted to a [DateTime](#datetime), and MUST be used to set the value of the \`expirationDate\` of the [PresentationJwsPayload](#presentationjwspayload) object. If the presentation has expired, the presentation is not valid.

### Linked Data Proof Format {#lds-proof}

This standard supports the Linked Data Proof format using the [[[LDS-ED25519-2020]]] suite.

<div class="note">
  Whenever possible, you should use a library or service to create and verify a Linked Data Proof. For example, Digital Bazaar, Inc. has a GitHub project that implements the [[[LDS-ED25519-2020]]] suite at [https://github.com/digitalbazaar/ed25519-signature-2020](https://github.com/digitalbazaar/ed25519-signature-2020).
</div>

#### Create the Proof

Perform these steps to attach a Linked Data Proof to the credential or presentation:

1. Create an instance of [Ed25519VerificationKey2020](#ed25519verificationkey2020) as shown in [Section 3.1.1 Ed25519VerificationKey2020](https://w3c-ccg.github.io/lds-ed25519-2020/#ed25519verificationkey2020) of [[LDS-ED25519-2020]].
1. Using the key material, sign the credential or presentation object as shown in [Section 7.1 Proof Algothim](https://w3c-ccg.github.io/data-integrity-spec/#proof-algorithm) of [[DATA-INTEGRITY-SPEC]] to produce a [Proof](#proof) as shown in [Section 3.2.1 Ed25519 Signature 2020](https://w3c-ccg.github.io/lds-ed25519-2020/#ed25519-signature-2020) with a \`proofPurpose\` of "assertionMethod".
1. Add the resulting proof object to the credential's or presentation's \`proof\` property.

#### Verify a CLR Credential or Presentation Linked Data Signature {#lds-verify}

Verify the Linked Data Proof signature as shown in [Section 7.2 Proof Verification Algorthim](https://w3c-ccg.github.io/data-integrity-spec/#proof-verification-algorithm) of [[DATA-INTEGRITY-SPEC]].

### Key Management

[=Issuers=] and [=holders=] will need to manage asymmetric keys. The mechanisms by which keys are minted and distributed is outside the scope of this specification. See Section 6. Key Management of the [[[SEC-11]]].

### Dereferencing the Public Key {#dereference}

All the proof format in this specification, and all Digital Integrity proofs in general, require the [=verifier=] to "dereference" the public key from a URI. Dereferencing means using the URI to get the public key. There are two ways to derefence the key in this specification:

- If the URI is a URL for a [=JWT=], the [=verifier=] uses HTTP GET to get the [=JWT=]
- If the URI is a URL for a [=JWT=] within a JSON Web Key Set (JKWS), the [=verifier=] uses HTTP GET to get the JWKS, then extracts the [JWK](#jwk) with the matching \`kid\`

`;
