var usecases = `

### Use Cases

The use cases below drive the design of Open Badges 3.0 specification.

#### Assertion Issuance to Wallet

Maya has completed an online course for an "Introduction to Web QA" at her local community college. The community college issues a course completion assertion. When Maya is ready to accept the assertion, she presents her wallet's location to the community college, which generates a request that Maya approves to receive the credential. Maya stores the assertion in her Verifiable Credentials enabled digital wallet with her other credentials.

**Goal of the Primary Actor**: Issue a verifiable credential to a student that she can use to take the next steps in her education journey.

**Actors**: Community college, Maya (student)

**Preconditions for this Use Case**:

- Community college creates badge for course completion
- Maya completes the course
- Maya downloads and installs a VC enabled digital wallet
- Maya has an identifier she uses for educational badges
- Maya is able to connect her wallet to the community college's issuing platform (assuming community college is using a platform) through authentication with the platform
- The community college has established an issuer profile, relevant cryptographic keys, and has published an Achievement corresponding to completion of the "Introduction to Web QA" course.
- Maya has provided an identifier to the college that it has accepted (or controls an identifier that the college has assigned to her)

**Flow of Events**:

1. Maya completes course requirements, receives a grade and is marked as complete for the "Introduction to Web QA" course.
1. Maya provides or selects an identifier to use as her identifier for badges while enrolled at the community college, and proves the identifier represents her to the college if necessary, and through mechanisms appropriate to the identifier type.
1. The community college issues an assertion of the previously defined achievement to Maya's identifier and cryptographically signs it
1. Maya accepts the credential into her wallet.

**Alternative Flows**:

- The badge is issued to a parent or guardian of the recipient
  1. The school has Maya's parent or guardian identifier on record
  1. Maya completes the course
  1. The school issues an assertion to the parent or guardian identifier
  1. The parent or guardian accepts the credential into their wallet

#### Assertion Issuance Without a Wallet

A professional development/training vendor Training, Inc. recognizes Dawson's mastery of a competency by issuing an assertion to Dawson's email address.

**Goal of the Primary Actor**: Training, Inc. wishes to provide a verifiable record that Dawson may use to present proof of competency-based professional development.

**Actors**: Training, Inc (professional development/training vendor), Dawson (student)

**Preconditions for this Use Case**:

- Dawson is authenticated, associated with a particular email address to the vendor's platform.
- The vendor has established an issuer profile, defined an Achievement and has the capability to create and deliver assertions to Dawson via Badge Connect

**Flow of Events**:

1. Dawson authenticates to the vendor platform, proving control of a chosen email address.
1. Dawson connects a Badge Connect backpack to the vendor platform, resulting in the platform holding an auth token on his behalf scoped to allow pushing assertions to his backpack.
1. Dawson engages with a learning opportunity, gains new knowledge, skills, and abilities, and successfully completes an assessment demonstrating mastery of a specific competency.
1. Training, Inc. creates an assertion of the achievement that recognizes the competency.
1. Training, Inc. transmits the assertion to Dawson's backpack via Badge Connect API.

**Alternative Flows**:

- Training, Inc. bakes the assertion into a PNG or SVG image file and transmits the image to Dawson who imports the baked badge into his backpack
- Training, Inc. encodes the assertion into a QR code transmits the QR code to Dawson who uses the backpack to scan the QR code and import the assertion

#### Recipient Presentation of Assertion

Maya registers for an advanced course and she is asked to provide proof that she completed a prerequisite course. From her wallet, Maya presents the course assertion as a verifiable presentation to the MOOC, which cryptographically verifies the issuer of the assertion, that Maya is the recipient, and that the assertion data has not been altered since it was issued. Upon verification, she is registered for the MOOC.

<div class="ednote">
   <em>New to v3.0</em>: Verifiable Credentials (VC) is a W3C specification that describes how to issue tamper-evident credentials that can be cryptographically verified. Maya's digital wallet has the capabilities to create a DID, read the VC data, and store it. From the wallet, Maya can present her credentials and prove that she is the recipient because it was issued to a DID that she created and has the digital keys that demonstrates her control of the  Verifiable Credential (VC). This functionality is not specific to the Open Badges standard but using this verification functionality and using a decentralized identifier (DID) to identify the badge recipient instead of an email address is part of the v3.0 update. Maya's badge recognizes a course completion and being able to specify that in the badge is a new aspect of v3.0. As with the CLR, v3.0 will be able to specify the type of achievement that a badge is representing.
</div>

**Goal of the Primary Actor**: Register for advanced "Web QA" course

**Actors**: Maya, MOOC

**Preconditions for this Use Case**:

- Maya completed prerequisite course
- Issuer issued a verifiable assertion (i.e. completion of prerequisite course) to Maya
- Maya has a VC-compatible wallet
- Maya has received the VC representing her competion of the prerequisite course
- The MOOC is capable of receiving the verifiable presentation of the badge

**Flow of Events**:

1. Maya authenticates to the MOOC platform
1. The MOOC platform requests a credential matching a certain criteria (completion of a prerequisite course option)
1. Maya prepares and transmits a presentation of her assertion to the MOOC platform
1. The MOOC platform verifies the assertion is valid and fitting its needs
1. The MOOC platform grants the authenticated user Maya access to the advanced course

**Points of Failure**:

- Maya's wallet and the MOOC platform must be capable of establishing a transmission channel for the assertion.
- The MOOC platform must be capable of expressing a request for a credential that matches the assertion that Maya holds.
- There must be a mutual capability between the wallet and the MOOC platform to prove Maya's is represented by recipient identifier

#### License Issuance

After Jeremy takes his electrician licensure exam, he accesses the online system for his state's licensure department to see his results and download his license. After he proves his identity by presenting his government issued ID from his digital wallet, he is informed that he passed the exam. The electrician license badge is issued to the DID Jeremy provided and is stored in his digital wallet with his other digital credentials.

<div class="ednote">
   <em>New to v3.0</em>: Similar to Maya's course completion badge, Jeremy's electrician license badge is also issued to a DID that Jeremy provides from his wallet and can also be cryptographically verified following the Verifiable Credentials model. The government issued ID in this use case is not an Open Badge but because it is a Verifiable Credential it can be stored in the same wallet as the electrician's license badge demonstrating interoperability of the verification models.
</div>

#### Single Skill Assertion

From her school's LMS, Dr. Cara chooses which skills and competencies will be taught in her class. These skills and competencies are aligned with the rubric in the syllabus that is presented to her students. Once the students have successfully completed the course, Dr. Cara assesses each student's assignments and participation and selects which skills and competencies were met and at what level. The selection of skills and competencies triggers an issuing of a skill assertion for each one and includes the assessment results in the evidence and results. The skill assertions are associated with the student's IDs, the students are notified and informed how they can use these skill assessments to inform their choice of classes in the future.

<div class="ednote">
   <em>New to v3.0</em>: Single skill assertions are new to 3.0.
</div>

#### Mapping Skills

Syd is shifting careers after many years working in construction. In their digital wallet they had several skill badges describing their mastery of skills in construction but also in teamwork, communication, and organizational skills. Syd also had badges from some courses they'd taken in science and math over the last few years. After they uploaded the skill and course badges from their wallet to a career planning site, they were offered several opportunities to apply for work in software sales and cybersecurity.

#### Verifying Continuing Education

Denise was offered a new job at a hospital as a physician's assistant. Before starting, her continuing education training and license to practice needed to be verified. The last time she switched hospitals, the verification process took three weeks. This time, she was able to provide her badges to prove her training and license. Within minutes her credentials were verified and she was issued a new digital staff credential.

<div class="ednote">
   <em>New to v3.0</em>: As with the other use case, this use case emphasizes that Open Badges v3.0 can recognize many different achievement types and be cryptographically verified following the Verifiable Credentials model.
</div>

#### Self-assertion

Stacy has created a mobile app that demonstrates her abilities as a coder, designer, and product manager. She creates an account on a badging platform and designs the badge to include alignments to the skills that the badge recognizes. With her digital wallet app, she connects to the badging platform and issues this badge to herself which includes screenshots and a link to the mobile app as evidence. Stacy uses this badge and others like it as verifiable portfolio items.

<div class="ednote">
   <em>New to v3.0</em>: In previous versions of Open Badges, it was possible to make self-assertion badges and issue badges to peers, however the issuer profile properties were organization specific. With 3.0, the issue properties can be modified to reference either an organization or an individual. It could be considered that both the issuer and recipient profile have similar optional properties so that there is flexibility in describing both profiles. This way, an organization could also be described as the recipient.
</div>

#### Endorsement

Ralph has been issued a verifiable credential badge for his most recent position at the hospital where he works by the hospital. The badge contains alignments to the skills related to his role. He requests that his peers endorse the skills he has acquired. A platform is able to communicate this request to peers,  facilitate review of the skills, and process the issuance of endorsement VC badges that reference the original badge, colleagues as endorsers, and Ralph as the recipient.

<div class="ednote">
   <em>New to v3.0</em>: In 2.0, an endorsement is its own type of assertion. In 3.0, an endorsement is its own type of credential. In the example above, the platform verifies the badge data and then acts as an issuer of endorsements on behalf of its users. It could also be that the platform uses AI to process the badge and sends an endorsement back to Ralph as a proof of acceptance and an evaluation of his badge.
</div>

#### Re-issue a <= 3.0 Badge to a 3.0 Badge

Leo earned several badges while in highschool and graduates soon. The email address used as the recipient identity for these badges was an email address provided by his high school and he will no longer have access to it. Leo downloads a digital wallet and requests that the school reissue the badges to the identifier he created in the wallet.

#### Authorization to Issue Given by Creator to Issuer

The data model attributes the issuer of a VC and the creator of the badge class separately.

Standards Organization X (SOX) has created a number of badges related to competencies they certify. SOX wants to authorize an accredited, certified training organization (CTO) to issue their credentials. An Open Badge Platform manages the granting of issuing rights to CTO by SOX and can issue verifiable credentials where CTO is the issuer and SOX is the creator inside the badge class.

Employer receives a credential from a graduate. Employer, in addition to verifying the VC in general, can review and verify that SOX did in fact authorize CTO to issue this badge.

#### Revocation of an Issued Credential

Gigantic State University is a badge issuer. It has awarded a badge to a student in the form of a verifiable credential. Some time after issuing the credential, GSU discovers academic misconduct on the part of the student and needs to revoke the credential's status. GSU updates a list of revoked credential IDs, noting the reason why it was revoked. Future verifications of the issued badge by consumers detect that the credential is now revoked and do not erroneously accept it.

**Goal of the Primary Actor**: Revoke a credential they have already awarded.

**Actors**: Credential issuer, Credential Subject, Consumer/Verifier

**Preconditions for this Use Case**:

- Issuer creates a badge class
- Issuer issues a credential to a subject
- Credential references a revocation list
  - Uses the credentialStatus property
  - OB 3.0 standard comes to consensus on what to use
- Issuer has access to a revocation list to update
- Verification process of badge credentials checks associated list

#### Badge Class Status

An institution has issued hundreds of badges in the form of VCs. A situation has arisen that requires the badge class to be effectively deleted or purged from the ecosystem. It is impractical (and arguably inaccurate) to revoke each assertion with individual records in perpetuity. The institution would like to set a status such that the badge class itself is treated as invalid.

`;
