var displayer = `

## Open Badges 3.0 Displayer Service Conformance {#displayer-conformance}

An Open Badges Displayer is an application that displays and verifies badges for viewers. The candidate platform must support viewer-initiated verification of a badge.

### Verification and status

The tests within this section refer to possible values of the status of a badge. The meaning of these values and how to determine them from a credential is defined in sections 9.1 and 9.2 of [[OB-30]]. As a quick summary:

   - A Credential is revoked if the \`credentialStatus\` property is present, and the \`type\` of the CredentialStatus object is "1EdTechRevocationList".
   - A Credential is expired if the current date and time is after the \`expirationDate\`.

### Tests {#display-tests}

1. The conformance test system will display the URL of three badges. One of them is neither expired nor revoked, other is expired but not revoked and the last one is not expired but revoked. The candidate platform must verify these  badges and submit the status in the conformance test system. Demonstrate through separate videos that the platform allows viewers of badges to see the following data in all provided badges:

   - image (if the badge provided is a baked badge)
   - name
   - description
   - issuer name
   - issuedOn Date
   - status (expired and/or revoked)

1. Demonstrate through video that the platform allows viewers of badges to do the following:
   - Trigger verification of the badge and retrieve results verifying that the badge credential is not expired, and not revoked
`;
