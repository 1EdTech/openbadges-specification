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
Use cases are outlined in each the Open Badges and Comprehensive Learner Record specifications. Use cases outline how each specification is intended to provide value to end users through interoperability between products.

[Open Badges use cases](https://1edtech.github.io/openbadges-specification/ob_v3p0.html#use-cases) include:

* Assertion Issuance to Wallet
* Assertion Issuance Without a Wallet
* Recipient Presentation of Assertion
* License Issuance
* Single Skill Assertion
* Mapping Skills
* Verifying Continuing Education
* Self-assertion
* Endorsement
* Re-issue a <= 3.0 Badge to a 3.0 Badge
* Authorization to Issue Given by Creator to Issuer
* Revocation of an Issued Credential
* Badge Class Status

[Comprehensive Learner Record use cases (not yet published)](https://github.com/1EdTech/ComprehensiveLearnerRecord/blob/develop/clr_v2p0/usecases.md) include:

* Recent graduate wants to hold a copy of their own official transcript
* Job applicant provides proof of degree and transcript to potential employer
* Job applicant provides proof of degree and specific courses/engagements from the CLR
* Higher Ed Competency-Based Education
* Issuer Asserting All Student Achievements Comprehensively as a CLR
* Issuer Asserting Partial Transcript at Intermediate Points in Learning Journey
* Issuer Asserting Student Up to Date Partial Transcript of Achievements as CLR on Request
* Internal Organizational Staff Development and Promotion
* Upskilling with Higher Ed Professional/Continuing Education
* Teacher Placement with a District
* Professional Licensure Test Taker results
* Students in Tutoring Program

### OB/CLR in the 1EdTech Ecosystem
