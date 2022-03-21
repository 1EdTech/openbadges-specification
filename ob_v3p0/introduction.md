var introduction = `

## Introduction

### Audiences

The target readers for this document are:

- Business Leaders - the people who are responsible for identifying the business case for using verifiable digital credentials and badges
- Solution Architects - the people who are responsible for the definition and design of systems, applications, and tools that are to be used to issue, exchange, and verify digital credentials and badges
- Product Developers - the people who are adding functionality to issue, exchange, and verify digital credentials

### Document Set {#document-set}

The Open Badges Specification has several related documents and artifacts shown below. Together they make up the specification.

- [[[OB-30]]] - The main Open Badges Specification document.
- [[[OB-CERT-30]]] - Specifies the conformance tests and certification requirements for this specification.

#### OpenAPI 3.0 Files for the Badge Connect API {#docs-openapi}

> The Open API Specification (OAS) defines a standard, programming language-agnostic interface description for HTTP APIs, which allows both humans and computers to discover and understand the capabilities of a service without requiring access to source code, additional documentation, or inspection of network traffic. When properly defined via OpenAPI, a consumer can understand and interact with the remote service with a minimal amount of implementation logic. Similar to what interface descriptions have done for lower-level programming, the OpenAPI Specification removes guesswork in calling a service.
>
> -- [[[OPENAPIS]]]

This standard has OpenAPI 3.0 files for the Badge Connect API in both JSON and YAML format:

- [JSON OpenAPI File](https://purl.imsglobal.org/spec/ob/v2p1/schema/openapi/imsob_v3p0.json)
- [YAML OpenAPI File](https://purl.imsglobal.org/spec/ob/v2p1/schema/openapi/imsob_v3p0.yaml)
  
#### JSON-LD Context File

> When two people communicate with one another, the conversation takes place in a shared environment, typically called "the context of the conversation". This shared context allows the individuals to use shortcut terms, like the first name of a mutual friend, to communicate more quickly but without losing accuracy. A context in JSON-LD works in the same way. It allows two applications to use shortcut terms to communicate with one another more efficiently, but without losing accuracy.
>
> Simply speaking, a context is used to map terms to IRIs. Terms are case sensitive and any valid string that is not a reserved JSON-LD keyword can be used as a term.
>
> -- [[[json-ld11]]]

This specification includes this JSON-LD Context file:

- [https://imsglobal.github.io/openbadges-specification/context.json](https://imsglobal.github.io/openbadges-specification/context.json)

#### JSON Schema

This specification includes JSON Schema files for every class in the data model and every payload in the API.

- [[[OB-JSON-30]]] - Links to the JSON Schema files for all data model classes and API payloads.

### Conformance Statements {#conformance}

### Terminology

- <dfn>Achievement Type</dfn>: A vocabulary which describes the type of achievement.

- <dfn>Alignment</dfn>: An alignment is a reference to an achievement definition, whether referenced in a resource outside the package or contained within the package.

- <dfn>Achievement</dfn>: This is the content description of a credential that an assertion references. It contains metadata such as the name of the achievement, description, alignment of skills, etc. An [=Assertion=] asserts a single achievement. A [=CLR=] asserts a collection of assertions, each of which asserts a single achievement.

- <dfn>Assertion</dfn>: The core of both Open Badges and CLR is the assertion about achievement(s). Assertion properties are specific to one learner's achievement and specify metadata such as issuer, date of achievement, expiration data, as well as results and evidence that support the assertion. A [=Verifiable Credential=] more broadly asserts a claim about a Credential Subject which can be applied to education and occupational achievements.

- <dfn>Claim</dfn>: A statement about the Credential Subject. A claim may include associated evidence, results, or other metadata regarding a specific achievement, skill or assertion.

- <dfn data-lt="Consumer">client</dfn>: In a [=REST API=], the client is the actor that initiates the DELETE, GET, or POST request. Also called a Consumer in the [[[SEC-11]]].

- <dfn data-lt="CLR">Comprehensive Learner Record</dfn> (CLR): Set of assertions that can be packaged as a verifiable credential.

- <dfn>Credential Subject</dfn>: Describes the claims being made by the Verifiable Credential. In the context of Open Badges and CLR is typically  an individual but in the case of Open Badges, may be another entity type such as a course, book, or organization. Learners, Organizations and other entities can be explicit subclasses of Credential Subjects for purposes of business rules. [[vc-data-model]]

- <dfn>Decentralized Identifiers</dfn>: A type of identifier for people, organizations and any other entity, where each identifier is controlled independently of centralized registries. [[did-core]] [[did-use-cases]]

- <dfn>Evidence</dfn>: Information supporting a claim such as a URL to an artifact produced by the Learner.

- <dfn>Issuer</dfn>: The organization or entity that has made an assertion about a Credential Subject. The issuer of a DC Assertion is the authoritative source for that specific assertion.

- <dfn>Learner</dfn>: The person who is the subject of the CLR and assertions contained in a CLR.

- <dfn data-lt="open badge">Badge</dfn>: A single assertion of an achievement that is packaged as a verifiable credential.

- <dfn>Organization</dfn>: An organized group of one or more people with a particular purpose. [[CEDS]]

- <dfn>Person</dfn>: A human being, alive or deceased, as recognized by each jurisdiction’s legal definitions. [[CEDS]]

- <dfn>Publisher</dfn>: The organization or entity issuing the CLR (typically the educational institution or a 3rd-party agent). The publisher is either the issuer or has a trusted relationship with the issuer of all the assertions in the CLR.

- <dfn>Relying Third-Party</dfn>: Also referred to as the "verifier" of a VC. This entity requests, verifies, and may consume data being presented.

- <dfn data-lt="RESTful API">REST API</dfn>: A style of web API (Application Programming Interface) loosely based on HTTP methods (DELETE, GET, POST, and PUT) to access resources (e.g. CLRs) via a URL.

- <dfn>Result</dfn>: Describes a possible achievement result. A result may contain the rubric level that was achieved.

- <dfn>Result Description</dfn>: Describes a possible achievement result. A result description may contain a rubric.

- <dfn data-lt="RSD">Rich Skill Descriptor</dfn> (RSD): A machine readable reference to a description of a skill located at a unique URL. [[RSD]]

- <dfn>Role</dfn>: People have roles in organizations for specific periods of time. Roles are a time aware association between a person and an organization. [[CEDS]]

- <dfn>Rubric</dfn>: Defines levels associated with the achievement definition (e.g. "approaches", "meets", and "exceeds").

- <dfn data-lt="Platform">server</dfn>: In a [=REST API=], the server is the actor that responds to a DELETE, GET, or POST request. Also called a Platform in the [[[SEC-11]]].

- <dfn>Skill Assertion</dfn>: An assertion that contains a "skill result."

- <dfn data-lt="VC">Verifiable Credential</dfn> (VC): A tamper-evident credential whose issuer can be cryptographically verified. See [[vc-data-model]].

- <dfn data-lt="VP">Verifiable Presentation</dfn> (VP): A tamper-evident presentation of one or more Verifiable Credentials of which cryptographic verification can be used to determine the trustworthiness of the authorship of the data. [[vc-data-model]]

- <dfn data-lt="Verifiable">Verification</dfn>: The evaluation of whether a [=verifiable credential=] or [=verifiable presentation=] is an authentic and timely statement of the issuer or presenter, respectively. This includes checking that: the credential (or presentation) conforms to the specification; the proof method is satisfied; and, if present, the status check succeeds.

- <dfn>Verifier</dfn>: The entity that receives a [=verifiable credential=] or [=verifiable presentation=] and verifies the credential or presentation has not been tampered with.

### Conceptual Model

This conceptual model describes Open Badges concepts and the relationship between those concepts. The data model in appendix [[[#org-1edtech-ob-v3p0-model-0]]] below is the normative reference for the classes and properties that are used to implement the concepts.

The conceptual model is targeted for all [[[#audiences]]], while the data model is targeted for Solution Architects and Product Developers.

In the diagram below, the concepts are shown in gray boxes (e.g. Assertion). Please see [[[#terminology]]] for definitions of the concepts.

Starting with this version of the Open Badges Specification, an Assertion is also a Verifiable Credential (VC) as defined by the [[[vc-data-model]]] specification. The diagram includes labels that show the relationships between VC terminology and Open Badges terminology (e.g. Issuer is identified by the VC "issuer").

<figure>
  <img src="images/ob30-concept.png" alt="Diagram show the major conceptual components of an Open Badge Verifiable Credential">
  <figcaption>Diagram show the major conceptual components of an Open Badge Verifiable Credential</figcaption>
</figure>

- I, issuer assert a claim about this Credential Subject that may describe an achievement, experience, membership, etc.,
  - The assertion provides the identity of the issuer, issuance date, and instructions on how to cryptographically prove the issuer identity and that the assertion and claim contents have not been tampered with since issuance.
    - The claim must contain a single Credential Subject which identifies the recipient of the Open Badge.
    - The claim may also contain: evidence of the achievement, and other properties supporting the achievement description.
    - The Achievement description is described using properties that may be shared with the CLR including, name, description, criteria, etc.

`;
