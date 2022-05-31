var verification=`

## Verification {#verification}

[=Verification=] is the process to determine whether a [=verifiable credential=] or [=verifiable presentation=] is an authentic and timely statement of the issuer or presenter respectively. This includes checking that: the credential (or presentation) conforms to the specification; the proof method is satisfied; and, if present, the status check succeeds. Verification of a credential does not imply evaluation of the truth of claims encoded in the credential.

The verification process in this standard is very similar to the [SignedBadge Verification](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#SignedBadge) process in [[[OB-20]]].

1. If the credential or presentation is signed using the [[[#jwt-proof]]] (VC-JWT), verify the signature as shown in [[[#jwt-verify]]]. If the credential or presentation is signed using an embedded proof, verify the signature as shown in [[[#lds-verify]]].
   <div class="note">
    The credential or presentation may have a VC-JWT proof and one or more Linked Data proofs. In this case, the Linked Data proofs will be attached to the credential in the \`vc\` or presentation in the \`vp\` claim of the signed JWT Payload. You may accept any one proof for verification. You do not need to verify all the signatures.
   </div>
1. If the \`refreshService\` property is present, and the \`type\` of the [RefreshService](#refreshservice) object is "1EdTechCredentialRefresh", refresh the credential as shown in [[[VCCR-10]]] and then repeat step 1.
1. If the \`credentialStatus\` property is present, and the \`type\` of the [CredentialStatus](#credentialstatus) object is "1EdTechRevocationList", determine if the credential has been revoked as shown in [[[VCRL-10]]].
1. If the \`credentialSchema\` property is present, and the \`type\` of the [CredentialSchema](#credentialschema) object is "1EdTechJsonSchemaValidator2019", perform data validation as shown in [[[VCCS-10]]].
1. If all the above steps pass, the credential or presentation may be treated as valid.

`;
