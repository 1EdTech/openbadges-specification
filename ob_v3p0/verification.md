var verification=`

## Verificaton and Validation

[=Verification=] is the process to determine whether a [=verifiable credential=] or [=verifiable presentation=] is an authentic and timely statement of the issuer or presenter respectively. This includes checking that: the credential (or presentation) conforms to the specification; the proof method is satisfied; and, if present, the status check succeeds. Verification of a credential does not imply evaluation of the truth of claims encoded in the credential.

[=Validation=] is the process of assuring the verifiable credential or verifiable presentation meets the needs of the verifier and other dependent stakeholders. Validating verifiable credentials or verifiable presentations is outside the scope of this specification.

<div class="note">
   The 1EdTech Validator performs [=verification=] as described here.
</div>

### OpenBadgeCredential Verification {#verification}

This section applies to Verifiable Credentials with a \`type\` of "OpenBadgeCredential" or "AchievementCredential".

1. Check that the OpenBadgeCredential conforms to the specification:
   1. If the OpenBadgeCredential has a \`credentialSchema\` property, and the \`type\` of the [CredentialSchema](#credentialschema) object is "1EdTechJsonSchemaValidator2019", check that the credential conforms to JSON Schema as shown in [[[VCCS-10]]]. If it does not, the credential does not conform to the specification.
   1. Check that the \`credentialSubject\` is identified by an \`id\` and/or an \`identifier\`. If neither is present, the credential does not conform to the specification.
1. Check that the proof method is satisfied:
   1. If the OpenBadgeCredential is signed using the [[[#jwt-proof]]] (VC-JWT), verify the signature as shown in [[[#jwt-verify]]]. If the OpenBadgeCredential is signed using an embedded proof, verify the signature as shown in [[[#lds-verify]]]. If the signature cannot be verified, the proof method is not satisfied.
   <div class="note">
      The OpenBadgeCredential may have a VC-JWT proof and one or more Linked Data proofs. In this case, the Linked Data proofs will be attached to the OpenBadgeCredential in the \`vc\` claim of the signed JWT Payload. You may accept any one proof for verification. You do not need to verify all the signatures.
   </div>
1. Refresh the OpenBadgeCredential:
   1. If the \`refreshService\` property is present, and the \`type\` of the [RefreshService](#refreshservice) object is "1EdTechCredentialRefresh", refresh the OpenBadgeCredential as shown in [[[VCCR-10]]] and then repeat steps 1 and 2. If the refresh is not successful, continue the verification process using the original OpenBadgeCredential.
   <div class="note">
      Refresh must be completed after checking the proof so that the verifier is not spoofed into receiving a refreshed OpenBadgeCredential from a bad actor.
   </div>
   <div class="note">
      Only perform Refresh once. That is, do not complete Refresh a second time even if the refreshed OpenBadgeCredential also has a \`refreshService\` defined.
   </div>
1. Check the status:
   1. If the \`credentialStatus\` property is present, and the \`type\` of the [CredentialStatus](#credentialstatus) object is "1EdTechRevocationList", determine if the OpenBadgeCredential has been revoked as shown in [[[VCRL-10]]].
   1. If the current date and time is before the \`issuanceDate\`, the OpenBadgeCredential is not yet valid.
   1. If the current date and time is after the \`expirationDate\`, the OpenBadgeCredential is expired.
1. Verify EndorsementCredentials:
   1. If the OpenBadgeCredential contains any EndorsementCredentials, verify the EndorsementCredentials as shown in [[[#endorsement-verification]]].

If all the above steps pass, the OpenBadgeCredential may be treated as verified.

### EndorsementCredential Verification {#endorsement-verification}

This section applies to Verifiable Credentials with a \`type\` of "EndorsementCredential".

1. Check that the EndorsementCredential conforms to the specification:
   1. If the credential has a \`credentialSchema\` property, and the \`type\` of the [CredentialSchema](#credentialschema) object is "1EdTechJsonSchemaValidator2019", check that the credential conforms to JSON Schema as shown in [[[VCCS-10]]]. If it does not, the credential does not conform to the specification.
1. Check that the proof method is satisfied:
   1. If the EndorsementCredential is signed using the [[[#jwt-proof]]] (VC-JWT), verify the signature as shown in [[[#jwt-verify]]]. If the EndorsementCredential is signed using an embedded proof, verify the signature as shown in [[[#lds-verify]]]. If the signature cannot be verified, the proof method is not satisfied.
   <div class="note">
      The EndorsementCredential may have a VC-JWT proof and one or more Linked Data proofs. In this case, the Linked Data proofs will be attached to the EndorsementCredential in the \`vc\` claim of the signed JWT Payload. You may accept any one proof for verification. You do not need to verify all the signatures.
   </div>
1. Refresh the EndorsementCredential:
   1. If the \`refreshService\` property is present, and the \`type\` of the [RefreshService](#refreshservice) object is "1EdTechCredentialRefresh", refresh the EndorsementCredential as shown in [[[VCCR-10]]] and then repeat steps 1 and 2. If the refresh is not successful, continue the verification process using the original EndorsementCredential.
   <div class="note">
      Refresh must be completed after checking the proof so that the verifier is not spoofed into receiving a refreshed EndorsementCredential from a bad actor.
   </div>
   <div class="note">
      Only perform Refresh once. That is, do not complete Refresh a second time even if the refreshed EndorsementCredential also has a \`refreshService\` defined.
   </div>
1. Check the status:
   1. If the \`credentialStatus\` property is present, and the \`type\` of the [CredentialStatus](#credentialstatus) object is "1EdTechRevocationList", determine if the EndorsementCredential has been revoked as shown in [[[VCRL-10]]].
   1. If the current date and time is before the \`issuanceDate\`, the EndorsementCredential is not yet valid.
   1. If the current date and time is after the \`expirationDate\`, the EndorsementCredential is expired.

If all the above steps pass, the EndorsementCredential may be treated as verified.

`;
