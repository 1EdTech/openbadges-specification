var introduction = `

## Introduction

### Specification Documents {#document-set}

The full set of documents is comprised of the following:

* [[[OB-30]]]
* [[[OB-CERT-30]]] - Specifies the conformance tests and certification requirements for this specification.
* [[[OB-BAKE-30]]] - Specifies how to embed Open Badge JSON inside a PNG or SVG image file.
* OpenAPI 3.0 Files for the Badge Connect API

  From the OpenAPI Specification [[OPENAPIS]],
  > The Open API Specification (OAS) defines a standard, programming language-agnostic interface description for HTTP APIs, which allows both humans and computers to discover and understand the capabilities of a service without requiring access to source code, additional documentation, or inspection of network traffic. When properly defined via OpenAPI, a consumer can understand and interact with the remote service with a minimal amount of implementation logic. Similar to what interface descriptions have done for lower-level programming, the OpenAPI Specification removes guesswork in calling a service.
  
  This standard has OpenAPI 3.0 files for the Badge Connect API in both JSON and YAML format:
  * [JSON OpenAPI File](https://purl.imsglobal.org/spec/ob/v2p1/schema/openapi/imsob_v3p0.json)
  * [YAML OpenAPI File](https://purl.imsglobal.org/spec/ob/v2p1/schema/openapi/imsob_v3p0.yaml)
  
* JSON-LD Context File

  From the JSON-LD 1.1 Specification [[json-ld11]],
  > When two people communicate with one another, the conversation takes place in a shared environment, typically called "the context of the conversation". This shared context allows the individuals to use shortcut terms, like the first name of a mutual friend, to communicate more quickly but without losing accuracy. A context in JSON-LD works in the same way. It allows two applications to use shortcut terms to communicate with one another more efficiently, but without losing accuracy.
  >
  > Simply speaking, a context is used to map terms to IRIs. Terms are case sensitive and any valid string that is not a reserved JSON-LD keyword can be used as a term.

  This specification includes this JSON-LD Context file:

  * [https://imsglobal.github.io/openbadges-specification/context.json](https://imsglobal.github.io/openbadges-specification/context.json)

* [[[OB-JSON-30]]]

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

### Conceptual Model

![Open Badges Assertion (VC)](images/ob30-concept.png)

* I, issuer assert a claim about this Credential Subject that may describe an achievement, experience, membership, etc.,
  * The assertion provides the identity of the issuer, issuance date, and instructions on how to cryptographically prove the issuer identity and that the assertion and claim contents have not been tampered with since issuance. 
    * The claim must contain a single Credential Subject which identifies the recipient of the Open Badge. 
    * The claim may also contain: evidence of the achievement, and other properties supporting the achievement description.
    * The Achievement description is described using properties that may be shared with the CLR including, name, description, criteria, etc.

`;
