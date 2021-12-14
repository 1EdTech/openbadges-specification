# Open Badges 3.0

This version aligns IMS Open Badges Specification to the conventions of the [W3C Verifiable Credentials Data Model](https://w3c.github.io/vc-data-model/) for the use cases of Defined Achievement Claim and a Skill Claim.

This consists of several specific proposed changes to Open Badges to:

1. use the W3C Verifiable Credentials data model for assertion format, using a `schema:hasCredential` claim to link the credential subject to the defined achievement that they have earned.
2. introduce conventions for using Decentralized Identifiers (DIDs) for issuer and/or recipient identification.
3. add properties to allow for the issuer of an Assertion/Credential issuer to be a separate entity from the BadgeClass creator, where the creator may define eligibility for issuers.
4. add properties that align with CLR such as [AchievementType](https://purl.imsglobal.org/spec/clr/v1p0/context/clr_v1p0.html#dtExtensibleAchievementType) and [ResultDescription](https://purl.imsglobal.org/spec/clr/v1p0/context/clr_v1p0.html#dtResultDescription).
5. introduce the complementary use case of a skill assertion.

The credentials that would be produced under this proposal could easily be bundled into Comprehensive Learner Records and Verifiable Presentations. Portability and learner data privacy may be improved by expanding the usage of cryptographic proofs/signatures, because this format will be compatible with a growing array of proof schemas that are developed for the Verifiable Credentials Data Model.

## Files

- [Main OB 3.0 Specification Respec File](ob_v3p0.html) which pulls in (transcludes) the following section files:
  - [Abstract](abstract.md)
  - [Introduction](introduction.md)
  - [Overview](overview.md)
  - [Syntaxes](syntaxes.md)
  - [Conformance Testing](certification.md)

### Current Status

[IMS Base Document](http://imsglobal.github.io/openbadges-specification/ob_v3p0.html) - The specification is being developed by the project group and this document is frequently updated
