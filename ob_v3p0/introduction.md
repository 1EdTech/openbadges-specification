var introduction = `

## Introduction

### Document Set

The Open Badges Specification has several related documents and artifacts shown below. Together
they make up the specification.

#### Informative Documents

Informative documents do not specify requirements.

<div class="admonition ednote">None at this time</div>

#### Normative Documents

Normative documents specify requirements. Normative documents may include informative sections.

* [[[OB-30]]] - Intended to be the first, and possibly only document you need to understand the specification and even implement a simple
prototype. Many examples are included which you can copy to issue, display, or verify your
first open badge.
* [[[OB-BAKE-30]]] - Specifies how to embed Open Badge JSON inside a PNG or SVG image file.
* OpenAPI files you can use to generate template code that implements the consumer or server API. These links go directly to the corresponding OpenAPI file:
  * [JSON](https://www.imsglobal.org/spec/ob/v3p0/schema/openapi/openapi.json)
  * [YAML](https://www.imsglobal.org/spec/ob/v3p0/schema/openapi/openapi.yaml)
* JSON Schema files which define the JSON serialization of the classes and properties in the Open Badges Data Model. These links go directly to the corresponding JSON Schema file:
  * [Assertion](https://www.imsglobal.org/spec/ob/v3p0/schema/json/assertion.json)
  * [Achievement](https://www.imsglobal.org/spec/ob/v3p0/schema/json/achievement.json)
  * ... and so on ...
* JSON-LD Context file for this specification. This link goes directly to the context file:
  * [Context File](https://www.imsglobal.org/spec/ob/v3p0/context.json)
* [[[OB-CERT-30]]] - Specifies the conformance tests and certification requirements for this specification.
* [[[OB-REST-30]]] - Specifies the REST API used to exchange Open Badges between systems over the wire.
* [[[OB-INFO-30]]] - Specifies the abstract data model of this specification and its relationship to the IMS Common Data Model, the logical data model, and extension methods available to this specification. This is a reference document for all the other documents that make up this specification.

### Design Goals and Rationale

This proposal to charter the development of a 3.0 version of Open Badges describes how to align Open Badges with the next generation of general-purpose digital credentials, the [W3C Verifiable Credentials Data Model](https://w3c.github.io/vc-data-model/), within which Open Badges can take its place as the leading schema for educational achievement claims within a growing world of widely interoperable digital credentials.

This proposal also suggests important steps to align Open Badges and the Comprehensive Learner Record (CLR) specification by describing the scopes and compatibility that is possible when both models have been aligned with the W3C Verifiable Credentials Data Model. When both models share concepts of an Assertion and an Achievement, consistency can be reached whether single achievements or collections of achievements are being asserted as Verifiable Credentials.

Introducing a new major capability to Open Badges is also on the table: skill assertions are a proposed method for issuers to make claims about the achievement of skills more directly without requiring the creation of a BadgeClass in order to recognize skills that are important to a particular industry or discipline.

### Terms

* _Achievement_: This is the content description of a credential that an assertion references. It contaoins metadata such as the name of the achievement, description, alignment of skills, etc. An Open Badge asserts a single achievement. CLRs may have a collection of assertions containing a collection of achievements.

* _achievementType_: A CLR property being proposed as an addition to Open Badges 3.0 which describes the type of achievement. See ["dtExtensibleAchievementType" Class](https://purl.imsglobal.org/spec/clr/v1p0/context/clr_v1p0.html#dtExtensibleAchievementType).

* _Assertion_: The core of both Open Badges and CLR is the assertion about achievement(s). Assertion properties are specific to one learner's achievement and specify metadata such as issuer, date of achievement, expiration data, as well as results and evidence that support the assertion. A Verifiable Credential more broadly asserts a claim about a credentialSubject which can be applied to education and occupational achievements.

* _credentialSubject_: Describes the claims being made by the Verifiable Credential. See [Credential Subject](https://www.w3.org/TR/vc-data-model/#credential-subject).

* _Decentralized Identifiers_: A type of identifier for people, organizations and any other entity, where each identifier is controlled independently of centralized registries. See [DID Use Cases Intro](https://www.w3.org/TR/did-use-cases/#intro).

* _Relying Third-Party_: Also referred to as the "verifier" of a VC. This entity requests, verifies, and may consume data being presented.

* _Rich Skill Descriptors (RSD)_: A machine readable reference to a description of a skill located at a unique URL. See [Rich Skill Descriptor (RSD)](https://rsd.osmt.dev).

* _result_: A property which describes a possible achievement result. See ["dtResult" Class](https://purl.imsglobal.org/spec/clr/v1p0/context/clr_v1p0.html#dtResult).

* _resultDescription_: A CLR property being proposed as an addition to Open Badges 3.0 which describes a possible achievement result. See ["dtResultDescription" Class](https://purl.imsglobal.org/spec/clr/v1p0/context/clr_v1p0.html#dtResultDescription).

* _Skill Assertion_: an Open Badges assertion that contains a "skill result."

* _Verifiable Credential (VC)_: W3C data model that describes how claims can be cryptographically verified. See [[[vc-data-model]]].

* _Verifiable Presentation_: A [Verifiable Presentation](https://www.w3.org/TR/vc-imp-guide/#presentations) is a tamper-evident presentation of one or more Verifiable Credentials of which cryptographic verification can be used to determine the trustworthiness of the authorship of the data.

* _Native VC_: Term used to describe the alignment of the existing Open Badges [VerificationObject] (https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#VerificationObject) properties with Verifiable Credential data model properties.

### Use Cases

The use cases below drive the design of Open Badges 3.0 specification.

#### Revocation of an Issued Credential

Gigantic State University is a badge issuer. It has awarded a badge to a student in the form of a verifiable credential. Some time after issuing the credential, GSU discovers academic misconduct on the part of the student and needs to revoke the credential's status. GSU updates a list of revoked credential IDs, noting the reason why it was revoked. Future verifications of the issued badge by consumers detect that the credential is now revoked and do not erroneously accept it.

**Goal of the Primary Actor**: Revoke a credential they have already awarded.

**Actors**: Credential issuer, Credential Subject, Consumer/Verifier

**Preconditions for this Use Case**:

1. Issuer creates a badge class
1. Issuer issues a credential to a subject
1. Credential references a revocation list
   1. Uses the credentialStatus property
   1. OB 3.0 standard comes to consensus on what to use.
1. Issuer has access to a revocation list to update
1. Verification process of badge credentials checks associated list

**Flow of Events**:

**Post-Conditions/Success Criteria**:

**Points of Failure**:

#### Online Course Completion Assertion Issuance to Wallet

Maya has completed an online course for an "Introduction to Web QA" at her local community college. The community college issues a course completion assertion. When Maya is ready to accept the assertion, she presents her wallet's location to the community college, which generates a request that Maya approves to receive the credential. Maya stores the assertion in her Verifiable Credentials enabled digital wallet with her other credentials.

**Goal of the Primary Actor**: Issue a verifiable credential to a student that she can use to take the next steps in her education journey.

**Actors**: Community college, Maya (student)

**Preconditions for this Use Case**:

1. Community college creates badge for course completion
1. Maya completes the course
1. Maya downloads and installs a VC enabled digital wallet
1. Maya has an identifier she uses for educational badges
1. Maya is able to connect her wallet to the community college's issuing platform (assuming community college is using a platform) through authentication with the platform
1. The community college has established an issuer profile, relevant cryptographic keys, and has published an Achievement corresponding to completion of the "Introduction to Web QA" course.
1. Maya has provided an identifier to the college that it has accepted (or controls an identifier that the college has assigned to her)

**Flow of Events**:

1. Maya completes course requirements, receives a grade and is marked as complete for the "Introduction to Web QA" course.
1. Maya provides or selects an identifier to use as her identifier for badges while enrolled at the community college, and proves the  identifier represents her to the college if necessary, and through mechanisms appropriate to the identifier type.
1. The community college issues an assertion of the previously defined achievement to Maya's identifier and cryptographically signs it
1. Maya accepts the credential into her wallet.

**Post-Conditions/Success Criteria**:

**Points of Failure**:

#### Assertion Issuance without mobile VC Wallet (email)

A professional development/training vendor Training, Inc. recognizes Dawson's mastery of a competency by issuing an assertion to Dawson's email address.

**Goal of the Primary Actor**: Training, Inc. wishes to provide a verifiable record that Dawson may use to present proof of competency-based professional development.

**Actors**: Training, Inc (professional development/training vendor), Dawson (student)

**Preconditions for this Use Case**:

1. Dawson is authenticated, associated with a particular email address to the vendor's platform.
1. The vendor has established an issuer profile, defined an Achievement and has the capability to create and deliver assertions to Dawson via Badge Connect

**Flow of Events**:

1. Dawson authenticates to the vendor platform, proving control of a chosen email address.
1. Dawson connects a Badge Connect backpack to the vendor platform, resulting in the platform holding an auth token on his behalf scoped to allow pushing assertions to his backpack.
1. Dawson engages with a learning opportunity, gains new knowledge, skills, and abilities, and successfully completes an assessment demonstrating mastery of a specific competency.
1. Training, Inc. creates an assertion of the achievement that recognizes the competency.
1. Training, Inc. transmits the assertion to Dawson's backpack via Badge Connect API.

**Post-Conditions/Success Criteria**:

**Points of Failure**:

#### Assertion Issuance to Custodian/Guardian Wallet (custodian/guardian)

Kalamazoo Elementary School holds a schoolwide spelling bee and  recognizes the achievement of a minor student, Maddie, for winning third place in said spelling bee. Kalamazoo delivers the assertion to Maddie's guardian, Cole, to maintain the assertion until such a time that Maddie can take control of that assertion. 

**Goal of the Primary Actor**: Kalamazoo K-12 wishes to award an assertion that Maddie may eventually use, with the understanding that she may not be able to control a wallet on her own behalf today.

**Actors**: Kalamazoo K-12 district (issuer), Maddie (student), Cole (guardian)

**Preconditions for this Use Case**:

**Flow of Events**:

**Post-Conditions/Success Criteria**:

**Points of Failure**:

#### Assertion Issuance without Wallet (QR code)

Jade takes a Standard First Aid course offered by a Red Cross authorized training company, ABC Corp., and receives a printed certificate including their name and certificate number to show that they are certified for SFA + CPR valid for 3 years.  The certificate also includes a QR code that is a representation of an OB 3.0 assertion embedded with Jade's name, certificate number, and expiry date. Jade's employer then scans the QR code and verifies that Jade is now qualified to be a first aid attendant in the office (which gives Jade a $2/hr raise).

**Goal of the Primary Actor**: To be able to show that they hold current certification for SFA from the Red Cross which qualifies them to be a workplace first aid attendant and gives them a raise for the extra job role.

**Actors**: Organisation that does Red Cross training, course participant, participant's employer

**Preconditions for this Use Case**:

1. The Red Cross has defined an Achievement for the certification.
1. The vendor is authorized by the Red Cross to do training and issue certification certificates for the SFA and CPR courses.
1. The vendor has established an issuer profile and has the capability to create and print certificates.
1. The participant's employer has an application that can view and verify VCs that are printed as QR codes.

**Flow of Events**:

1. Jade shows a piece of government issued ID to the vendor while taking the course.
1. Jade completes and passes the SFA + CPR first aid course.
1. ABC Corp. prints out a wallet sized and wall sized certificate to say that Jade is certified.
1. The certificate is presented to Jade's employer and Jade gets an additional work role due to being qualified as a workplace first aid attendant.

**Post-Conditions/Success Criteria**:

**Points of Failure**:

#### Recipient Presentation of Assertion

Maya registers for an advanced course and she is asked to provide proof that she completed a prerequisite course. From her wallet, Maya presents the course assertion as a verifiable presentation to the MOOC, which cryptographically verifies the issuer of the assertion, that Maya is the recipient, and that the assertion data has not been altered since it was issued. Upon verification, she is registered for the MOOC.

<div class="admonition ednote">
<em>New to v3.0</em>: Verifiable Credentials (VC) is a W3C specification that describes how to issue tamper-evident credentials that can be cryptographically verified. Maya's digital wallet has the capabilities to create a DID, read the VC data, and store it. From the wallet, Maya can present her credentials and prove that she is the recipient because it was issued to a DID that she created and has the digital keys that demonstrates her control of the  Verifiable Credential (VC). This functionality is not specific to the Open Badges standard but using this verification functionality and using a decentralized identifier (DID) to identify the badge recipient instead of an email address is part of the v3.0 update. Maya's badge recognizes a course completion and being able to specify that in the badge is a new aspect of v3.0. As with the CLR, v3.0 will be able to specify the type of achievement that a badge is representing.
</div>

**Goal of the Primary Actor**: Register for advanced "Web QA" course

**Actors**: Maya, MOOC

**Preconditions for this Use Case**:

1. Maya completed prerequisite course
1. Issuer issued a verifiable assertion (i.e. completion of prerequisite course) to Maya
1. Maya has a VC-compatible wallet
1. Maya has received the VC representing her competion of the prerequisite course
1. The MOOC is capable of receiving the verifiable presentation of the badge

**Flow of Events**:

1. Maya authenticates to the MOOC platform
1. The MOOC platform requests a credential matching a certain criteria (completion of a prerequisite course option)
1. Maya prepares and transmits a presentation of her assertion to the MOOC platform
1. The MOOC platform verifies the assertion is valid and fitting its needs
1. The MOOC platform grants the authenticated user Maya access to the advanced course

**Post-Conditions/Success Criteria**:

**Points of Failure**:

1. Maya's wallet and the MOOC platform must be capable of establishing a transmission channel for the assertion.
1. The MOOC platform must be capable of expressing a request for a credential that matches the assertion that Maya holds.
1. There must be a mutual capability between the wallet and the MOOC platform to prove Maya's is represented by recipient identifier

#### License Issuance

After Jeremy takes his electrician licensure exam, he accesses the online system for his state's licensure department to see his results and download his license. After he proves his identity by presenting his government issued ID from his digital wallet, he is informed that he passed the exam. The electrician license badge is issued to the DID Jeremy provided and is stored in his digital wallet with his other digital credentials.

<div class="admonition ednote">
<em>New to v3.0</em>: Similar to Maya's course completion badge, Jeremy's electrician license badge is also issued to a DID that Jeremy provides from his wallet and can also be cryptographically verified following the Verifiable Credentials model. The government issued ID in this use case is not an Open Badge but because it is a Verifiable Credential it can be stored in the same wallet as the electrician's license badge demonstrating interoperability of the verification models.
</div>

**Goal of the Primary Actor**:

**Actors**:

**Preconditions for this Use Case**:

**Flow of Events**:

**Post-Conditions/Success Criteria**:

**Points of Failure**:

#### Mapping Skills

Syd is shifting careers after many years working in construction. In their digital wallet they had several skill badges describing their mastery of skills in construction but also in teamwork, communication, and organizational skills. Syd also had badges from some courses they'd taken in science and math over the last few years. After they uploaded the skill and course badges from their wallet to a career planning site, they were offered several opportunities to apply for work in software sales and cybersecurity.

<div class="admonition ednote">
<em>New to v3.0</em>: In addition to badges recognizing courses, this use case mentions skill badges. In v3.0, a badge can claim that the recipient has attained a single skill. The assertion references a Rich Skill Descriptor (RSD) instead of a badge class. Skill badges can also be cryptographically verified following the Verifiable Credentials model and stored in digital wallets.
</div>

**Goal of the Primary Actor**:

**Actors**:

**Preconditions for this Use Case**:

**Flow of Events**:

**Post-Conditions/Success Criteria**:

**Points of Failure**:

#### Verifying Continuing Education

Denise was offered a new job at a hospital as a physician's assistant. Before starting, her continuing education training and license to practice needed to be verified. The last time she switched hospitals, the verification process took three weeks. This time, she was able to provide her badges to prove her training and license. Within minutes her credentials were verified and she was issued a new digital staff credential.

<div class="admonition ednote">
<em>New to v3.0</em>: As with the other use case, this use case emphasizes that Open Badges v3.0 can recognize many different achievement types and be cryptographically verified following the Verifiable Credentials model.
</div>

**Goal of the Primary Actor**:

**Actors**:

**Preconditions for this Use Case**:

**Flow of Events**:

**Post-Conditions/Success Criteria**:

**Points of Failure**:

#### Self-assertion

Stacy has created a mobile app that demonstrates her abilities as a coder, designer, and product manager. She creates an account on a badging platform and designs the badge to include alignments to the skills that the badge recognizes. With her digital wallet app, she connects to the badging platform and issues this badge to herself which includes screenshots and a link to the mobile app as evidence. Stacy uses this badge and others like it as verifiable portfolio items.

<div class="admonition ednote">
<em>New to v3.0</em>: In previous versions of Open Badges, it was possible to make self-assertion badges and issue badges to peers, however the issuer profile properties were organization specific. With 3.0, the issue properties can be modified to reference either an organization or an individual. It could be considered that both the issuer and recipient profile have similar optional properties so that there is flexibility in describing both profiles. This way, an organization could also be described as the recipient.
</div>

**Goal of the Primary Actor**:

**Actors**:

**Preconditions for this Use Case**:

**Flow of Events**:

**Post-Conditions/Success Criteria**:

**Points of Failure**:

#### Endorsement

Ralph has been issued a verifiable credential badge for his most recent position at the hospital where he works by the hospital. The badge contains alignments to the skills related to his role. He requests that his peers endorse the skills he has acquired. A platform is able to communicate this request to peers,  facilitate review of the skills, and process the issuance of endorsement VC badges that reference the original badge, colleagues as endorsers, and Ralph as the recipient.

<div class="admonition ednote">
<em>New to v3.0</em>: In 2.0, an endorsement is its own type of badge. This could be the same in 3.0 but also, an endorsement could be a response from a verifier. In the example above, the platform verifies the badge the data and then acts as an issuer of endorsements on behalf of its users. This would be closer to how endorsements are used in 2.0 but applicable to 3.0. It could also be that the platform uses AI to process the badge and sends an endorsement back to Ralph as a proof of acceptance and an evaluation of his badge.
</div>

**Goal of the Primary Actor**:

**Actors**:

**Preconditions for this Use Case**:

**Flow of Events**:

**Post-Conditions/Success Criteria**:

**Points of Failure**:

#### Single Skill Assertion

From her school's LMS, Dr. Cara chooses which skills and competencies will be taught in her class. These skills and competencies are aligned with the rubric in the syllabus that is presented to her students. Once the students have successfully completed the course, Dr. Cara assesses each student's assignments and participation and selects which skills and competencies were met and at what level. The selection of skills and competencies triggers an issuing of a skill assertion for each one and includes the assessment results in the evidence and results. The skill assertions are associated with the student's IDs, the students are notified and informed how they can use these skill assessments to inform their choice of classes in the future.

<div class="admonition ednote">
<em>New to v3.0</em>: Single skill assertions are new to 3.0. They do not require a badge class, badge image, etc.
</div>

**Goal of the Primary Actor**:

**Actors**:

**Preconditions for this Use Case**:

**Flow of Events**:

**Post-Conditions/Success Criteria**:

**Points of Failure**:

#### Re-issue a <= 3.0 Badge to a 3.0 Badge

Leo earned several badges while in highschool and graduates soon. The email address used as the recipient identity for these badges was an email address provided by his high school and he will no longer have access to it. Leo downloads a digital wallet and requests that the school reissue the badges to the identifier he created in the wallet.

<div class="admonition ednote">
<em>New to v3.0</em>: The use of VC wallets, and decentralized identifiers are different in 3.0.
</div>

**Goal of the Primary Actor**:

**Actors**:

**Preconditions for this Use Case**:

**Flow of Events**:

**Post-Conditions/Success Criteria**:

**Points of Failure**:

#### Badge Class Status

An institution has issued hundreds of badges in the form of VCs. A situation has arisen that requires the badge class to be effectively deleted or purged from the ecosystem. It is impractical (and arguably inaccurate) to revoke each assertion with individual records in perpetuity. The institution would like to set a status such that the badge class itself is treated as invalid.

**Goal of the Primary Actor**:

**Actors**:

**Preconditions for this Use Case**:

**Flow of Events**:

**Post-Conditions/Success Criteria**:

**Points of Failure**:

#### Authorization to Issue Given by Creator to Issuer

The data model attributes the issuer of a VC and the creator of the badge class separately.

Standards Organization X (SOX) has created a number of badges related to competencies they certify. SOX wants to authorize an accredited, certified training organization (CTO) to issue their credentials. An Open Badge Platform manages the granting of issuing rights to CTO by SOX and can issue verifiable credentials where CTO is the issuer and SOX is the creator inside the badge class.

Employer receives a credential from a graduate. Employer, in addition to verifying the VC in general, can review and verify that SOX did in fact authorize CTO to issue this badge.

**Goal of the Primary Actor**:

**Actors**:

**Preconditions for this Use Case**:

**Flow of Events**:

**Post-Conditions/Success Criteria**:

**Points of Failure**:

`;
