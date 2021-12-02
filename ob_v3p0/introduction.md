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

* [[[!OB-30]]] - Intended to be the first, and possibly only document you need to understand the specification and even implement a simple
prototype. Many examples are included which you can copy to issue, display, or verify your
first open badge.
* [[[!OB-BAKE-30]]] - Specifies how to embed Open Badge JSON inside a PNG or SVG image file.
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

`;
