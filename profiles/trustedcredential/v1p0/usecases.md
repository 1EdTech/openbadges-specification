var usecases = `

### Use Cases

The use cases below drive the design of Open Badges 3.0 TrustEd Credential Profile specification.

#### Use Case 1: Issuing a TrustEd Knowledge Credential

An issuing organization awards a TrustEd Credential to a learner upon successful completion of an assessment that validates foundational knowledge.

The issuing system creates an Open Badges 3.0 credential conforming to the TrustEd Profile, including required metadata such as criteria, result, evidence, and alignment to skills or frameworks. Assessment details may also be included to clarify how the learner’s knowledge was evaluated.
The credential is delivered to the learner and can be stored in a wallet or profile system. Any conformant receiving system can interpret the credential, understand the level of achievement, and verify its validity.

⸻

#### Use Case 2: Issuing a TrustEd Application Credential

An issuing organization awards a TrustEd Credential to a learner who demonstrates the ability to apply knowledge through a project, lab, or performance-based assessment.

The issuing system generates a credential that includes the required metadata for the TrustEd Profile, such as criteria, result, evidence, and alignment to skills or frameworks. Assessment details, such as rubric-based or performance-based evaluation information, may also be included to clarify how the learner demonstrated applied competence.

A receiving system, such as an employer platform, consumes the credential and can evaluate both the outcome and supporting evidence, enabling more informed decision-making.

⸻

#### Use Case 3: Verifying and Interpreting a TrustEd Credential

A receiving organization, such as an employer or another institution, receives a TrustEd Credential issued under the OB3 profile.

The receiving system validates the credential using OB3 verification mechanisms and interprets the TrustEd metadata fields. It evaluates the included achievementType, criteria, evidence, results, endorsements, and any available assessment details to understand the nature and rigor of the credential.

The organization uses this information to assess the learner’s level of competency without needing additional clarification from the issuer.

⸻

#### Use Case 4: Cross-Platform Credential Portability

A learner earns a TrustEd Credential from one platform and shares it with another platform or system.

The credential, structured according to the OB3 TrustEd Profile, is transferred without loss of meaning or required metadata. The receiving platform correctly parses and displays key fields such as skills, criteria, evidence, and results.

This enables seamless portability and supports learner mobility across systems, institutions, and employment contexts.
`;
