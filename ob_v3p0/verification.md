var verification=`

## Verificaton and Validation

[=Verification=] is the process to determine whether a [=verifiable credential=] or [=verifiable presentation=] is an authentic and timely statement of the issuer or presenter respectively. This includes checking that: the credential (or presentation) conforms to the specification; the proof method is satisfied; and, if present, the status check succeeds. Verification of a credential does not imply evaluation of the truth of claims encoded in the credential.

[=Validation=] is the process of assuring the verifiable credential or verifiable presentation meets the needs of the verifier and other dependent stakeholders. Validating verifiable credentials or verifiable presentations is outside the scope of this specification.

<div class="note">
   The 1EdTech Validator performs [=verification=] as described here.
</div>

### Verification {#verification}

The verification process in this standard is very similar to the [SignedBadge Verification](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#SignedBadge) process in [[[OB-20]]].

1. Check that the credential conforms to the specification:
   1. If the credential has a \`credentialSchema\` property, and the \`type\` of the [CredentialSchema](#credentialschema) object is "1EdTechJsonSchemaValidator2019", check that the credential conforms to JSON Schema as shown in [[[VCCS-10]]]. If it does not, the credential or presentation does not conform to the specification.
   1. If the credential \`type\` includes "OpenBadgeCredential" or "AchievementCredential", check that the \`credentialSubject\` is identified by an \`id\` and/or an \`identifier\`. If neither is present, the credential does not conform to the specification.
1. Check that the proof method is satisfied:
   1. If the credential or presentation is signed using the [[[#jwt-proof]]] (VC-JWT), verify the signature as shown in [[[#jwt-verify]]]. If the credential or presentation is signed using an embedded proof, verify the signature as shown in [[[#lds-verify]]]. If the signature cannot be verified, the proof method is not satisfied.
   <div class="note">
      The credential or presentation may have a VC-JWT proof and one or more Linked Data proofs. In this case, the Linked Data proofs will be attached to the credential in the \`vc\` or presentation in the \`vp\` claim of the signed JWT Payload. You may accept any one proof for verification. You do not need to verify all the signatures.
   </div>
1. Refresh the credential:
   <div class="note">
      Refresh must be completed after checking the proof so that the verifier is not spoofed into receiving a refreshed credential from a bad actor.
   </div>
   1. If the \`refreshService\` property is present, and the \`type\` of the [RefreshService](#refreshservice) object is "1EdTechCredentialRefresh", refresh the credential as shown in [[[VCCR-10]]] and then repeat steps 1 and 2. If the refresh is not successful, continue the verification process of the original credential.
   <div class="note">
      Only perform credential refresh once. That is, do not complete credential refresh a second time even if the refreshed credential also has a \`refreshService\` defined.
   </div>
1. Check the status:
   1. If the \`credentialStatus\` property is present, and the \`type\` of the [CredentialStatus](#credentialstatus) object is "1EdTechRevocationList", determine if the credential has been revoked as shown in [[[VCRL-10]]].
   1. If the current date and time is before the \`issuanceDate\`, the credential is not yet valid.
   1. If the current date and time is after the \`expirationDate\`, the credential is expired.

If all the above steps pass, the credential or presentation may be treated as verified.

`;
