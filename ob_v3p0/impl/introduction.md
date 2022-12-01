## Introduction
The 1EdTech digital credentials specifications, Open Badges and Comprehensive Learner Record (CLR) enable the recognition of learning achievements in many contexts that are cryptographically verifiable as the learners present them to unlock new opportunities across a lifetime of learning and employment. Key use cases include the recognition of skills and competencies, degrees, certificates and professional certifications, participation, and community engagement.

This implementation guide aims to inform product developers who are investigating or planning implementation of the Open Badges 3.0 and/or CLR 2.0 specifications about the available implementation options and how to situate a product within the ecosystem compatible with these specifications.

### Overview
Each Open Badges `AchievementCredential` is digitally signed by its issuing organization as Verifiable Credentials compatible with the [[vc-data-model]]. Issuers may bundle together multiple related achievement credentials into transcripts and other longitudinal records for an individual learner in a CLR as a `ClrCredential`, which is also signed using the same technique as the individual credentials. Additionally, credentials can be augmented with an `EndorsementCredential` from a third party to lend the support of another individual or organization to the quality or relevance of an issuer or credential data.

A RESTful API, with dynamic client registration, is available to transport data in `AchievementCredential` and `ClrCredential` format, under the control of the learner, between systems where they are issued, hosted on behalf of the learner, or verified by third parties in order to qualify the learner for job placement or other opportunities. Implementing systems can participate in a variety of roles

#### Audiences
This implementation guide is intended for product developers across various implementation roles necessary for the operation of an ecosystem where digital credentials efficiently recognize achievements that matter and flow to the contexts where these achievements each need to be understood. Products may be situated to perform one or more roles within the ecosystem, such as issuing credentials, hosting credentials on behalf of learners, and verifying credentials.

### OB Overview
An Open Badge (`AchievementCredential`) is a individual achievement recognized about an individual learner. An Issuer makes a claim that a learner has met the criteria of a particular defined `Achievement`.

### CLR Overview
A Compehensive Learner Record allows many Open Badge achievement credentials to be bundled together, with some additional associations between them defined. This is like another onion layer wrapping the inner set of credentials that is also signed. Individual component credentials are verifiable, and the wrapping CLR is also verifiable. CLRs can contain achievements from multiple different issuers to show a learner's progression with multiple organizations or subdivisions of a large educational institution.

### Use Cases

### OB/CLR in the 1EdTech Ecosystem
