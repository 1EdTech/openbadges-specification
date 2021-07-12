var introduction = `

## Introduction

### Design Goals and Rationale

This proposal for a 3.0 version of Open Badges describes how to align Open Badges with the next generation of general-purpose digital credentials, the [W3C Verifiable Credentials Data Model](https://w3c.github.io/vc-data-model/), within which Open Badges can take its place as the leading schema for educational achievement claims within a growing world of widely interoperable digital credentials.

This proposal also makes important steps to integrate innovations from the Comprehensive Learner Record (CLR) 1.0 specification by including recent additions made to the CLR parallel to the Open Badges Assertion and BadgeClass data classes. This enables concepts like achievement types (beyond just "Badge") and result descriptions to be expressed in a BadgeClass.

Introducing a new major capability to Open Badges is also on the table: skill assertions are a proposed method for issuers to make claims about the achievement of skills more directly without requiring the creation of a BadgeClass in order to recognize skills that are important to a particular industry or discipline.

### Use Cases

Below are use cases illustrating the power of Open Badges as Verifiable Credentials.

* _Online Course Completion_: Maya completed an online course for an "Introduction to Web QA" at her local community college. The community college issued her a course completion badge which she stored in her digital wallet with her other credentials. This course was a prerequisite for a more advanced course being offered online by a MOOC. When Maya registers for the advanced course, she is asked to provide the proof that she completed the prerequisite course. From her wallet, Maya provides the course badge and upon verification, she is registered for the MOOC.

* _License Issuance_: After Jeremy takes his electrician licensure exam, he accesses the online system for his states licensure department to see his results and download his license. After he proves his identity by sharing his government issued ID from his digital wallet, he is informed that he passed the exam and is issued his electricians license badge which he stores in his digital wallet with his other digital credentials.

* _Mapping Skills_: Sid is shifting careers after many years working in construction. In his digital wallet he had several skill badges describing his mastery of several skills in construction but also in teamwork, communication, and organizational skills. Sid also had badges from some courses he'd taken in science and math over the last few years. After he uploaded the skill and course badges from his wallet to a career planning site, he was offered several opportunities to apply for work in software sales and cybersecurity.

* _Verifying Continuing Ed_: Denise was offered a new job at a hospital as a physician assistant. Before starting, her continuing education training and license to practice needed to be verified. The last time she switched hospitals, the verification process took three weeks. This time, she was able to provide her badges to prove her training and license. Within minutes her credentials were verified and she was issued a new digital staff credential.

### Terms

* _achievementType_: A CLR property being proposed as an addition to Open Badges 3.0 which describes the type of achievement. See ["dtExtensibleAchievementType" Class](https://purl.imsglobal.org/spec/clr/v1p0/context/clr_v1p0.html#dtExtensibleAchievementType).

* _credentialSubject_: Describes the claims being made by the Verifiable Credential. See [Credential Subject](https://www.w3.org/TR/vc-data-model/#credential-subject).

* _Decentralized Identifiers_: A type of identifier for people, organizations and any other entity, where each identifier is controlled independently of centralized registries. See [DID Use Cases Intro](https://www.w3.org/TR/did-use-cases/#intro).

* _Relying Third-Party_: Also referred to as the "verifier" of a VC. This entity requests, verifies, and may consume data being presented.

* _Rich Skill Descriptors (RSD)_: A machine readable reference to a description of a skill located at a unique URL. See [Rich Skill Descriptor (RSD)](https://rsd.osmt.dev).

* _resultDescription_: A CLR property being proposed as an addition to Open Badges 3.0 which describes a possible achievement result. See ["dtResultDescription" Class](https://purl.imsglobal.org/spec/clr/v1p0/context/clr_v1p0.html#dtResultDescription).

* _Skill Assertion_: an Open Badges assertion that contains a "skill result."

* _Verifiable Credential (VC)_: W3C data model that describes how claims can be cryptographically verified. See [W3C Verifiable Credentials Data Model 1.0](https://www.w3.org/TR/vc-data-model/).

* _Verifiable Presentation_: A [Verifiable Presentation](https://www.w3.org/TR/vc-imp-guide/#presentations) is a tamper-evident presentation of one or more Verifiable Credentials of which cryptographic verification can be used to determine the trustworthiness of the authorship of the data.

* _Native VC_: Term used to describe the alignment of the existing Open Badges [VerificationObject] (https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#VerificationObject) properties with Verifiable Credential data model properties.


`;
