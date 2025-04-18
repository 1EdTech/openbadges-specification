var introduction = `

## Introduction

### Audiences

The target readers for this document are:

-   Business Leaders - the people who are responsible for identifying the business case for using verifiable digital credentials and badges
-   Solution Architects - the people who are responsible for the definition and design of systems, applications, and tools that are to be used to issue, exchange, and verify digital credentials and badges
-   Product Developers - the people who are adding functionality to issue, exchange, and verify digital credentials

### Document Set {#document-set}

The Open Badges Specification has several related documents and artifacts shown below. Together they make up the specification.

- [[[OB-30]]] ([[OB-30]]) - The main Open Badges Specification document.
- [[[OB-IMPL-30]]] ([[OB-IMPL-30]]) - Provides information to lead you to successful implementation and certification of the Open Badges 3.0 specification.
- [[[OB-CERT-30]]] ([[OB-CERT-30]]) - Specifies the conformance tests and certification requirements for this specification.

#### OpenAPI 3.0 Files {#docs-openapi}

> The Open API Specification (OAS) defines a standard, programming language-agnostic interface description for HTTP APIs, which allows both humans and computers to discover and understand the capabilities of a service without requiring access to source code, additional documentation, or inspection of network traffic. When properly defined via OpenAPI, a consumer can understand and interact with the remote service with a minimal amount of implementation logic. Similar to what interface descriptions have done for lower-level programming, the OpenAPI Specification removes guesswork in calling a service.
>
> -- [[[OPENAPIS]]]

-   [JSON OpenAPI File](https://purl.imsglobal.org/spec/ob/v3p0/schema/openapi/ob_v3p0_oas.json)
-   [YAML OpenAPI File](https://purl.imsglobal.org/spec/ob/v3p0/schema/openapi/ob_v3p0_oas.yaml)

#### JSON-LD Context File

> When two people communicate with one another, the conversation takes place in a shared environment, typically called "the context of the conversation". This shared context allows the individuals to use shortcut terms, like the first name of a mutual friend, to communicate more quickly but without losing accuracy. A context in JSON-LD works in the same way. It allows two applications to use shortcut terms to communicate with one another more efficiently, but without losing accuracy.
>
> Simply speaking, a context is used to map terms to IRIs. Terms are case sensitive and any valid string that is not a reserved JSON-LD keyword can be used as a term.
>
> -- [[[json-ld11]]]

-   [https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json](https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json)

#### JSON Schema

All JSON Schema can be found in [[[#json-schema]]]. JSON Schema files for credential and API schema verification are available online:

<ul>
  <li><a href='https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_achievementcredential_schema.json'>AchievementCredential JSON schema</a></li>
  <li><a href='https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_endorsementcredential_schema.json'>EndorsementCredential JSON schema</a></li>
  <li><a href='https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_getopenbadgecredentialsresponse_schema.json'>GetOpenBadgeCredentialsResponse JSON schema</a></li>
  <li><a href='https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_profile_schema.json'>Profile JSON schema</a></li>
  <li><a href='https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_imsx_statusinfo_schema.json'>Imsx_StatusInfo JSON schema</a></li>
</ul>

<div class="note">
    The above schemas are based on the [[[VC-DATA-MODEL-2.0]]]. An issuer may also issue credentials
    following the previous version [[[VC-DATA-MODEL]]]. JSON schema matching that version are:
    <ul>
        <li>
        <a href='https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_anyachievementcredential_schema.json'>AchievementCredential JSON schema (Verifiable Credential Data Model v1.1 compatible)</a></li>
        <li><a href='https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_anyendorsementcredential_schema.json'>EndorsementCredential JSON schema (Verifiable Credential Data Model v1.1 compatible)</a></li>
    </ul>
    Verifiers may accept credentials following either schema using
    <a href="#org-1edtech-ob-v3p0-model-6">Schemas for verification support</a>.
</div>

### Conformance Statements {#conformance}

### Terminology

-   <dfn>Achievement Type</dfn>: A vocabulary which describes the type of achievement.

-   <dfn>Alignment</dfn>: An alignment is a reference to an achievement definition, whether referenced in a resource outside the package or contained within the package.

-   <dfn>Achievement</dfn>: This is the content description of a credential that an assertion references. It contains metadata such as the name of the achievement, description, alignment of skills, etc. An [=Assertion=] asserts a single achievement. A [=CLR=] asserts a collection of assertions, each of which asserts a single achievement.

-   <dfn>Assertion</dfn>: The core of both Open Badges and CLR is the assertion about achievement(s). Assertion properties are specific to one learner's achievement and specify metadata such as issuer, date of achievement, expiration data, as well as results and evidence that support the assertion. A [=Verifiable Credential=] more broadly asserts a claim about a Credential Subject which can be applied to education and occupational achievements.

-   <dfn>Claim</dfn>: A statement about the Credential Subject. A claim may include associated evidence, results, or other metadata regarding a specific achievement, skill or assertion.

-   <dfn data-lt="Consumer">client</dfn>: In a [=REST API=], the client is the actor that initiates the DELETE, GET, or POST request. Also called a Consumer in the [[[SEC-11]]].

-   <dfn data-lt="CLR">Comprehensive Learner Record</dfn> (CLR): Set of assertions that can be packaged as a verifiable credential.

-   <dfn>Credential</dfn>: A set of one or more [=claims=] made by an [=issuer=]. A [=verifiable credential=] is a tamper-evident credential that has authorship that can be cryptographically verified. Verifiable credentials can be used to build [=verifiable presentations=], which can also be cryptographically verified.

-   <dfn>Credential Subject</dfn>: Describes the claims being made by the Verifiable Credential. In the context of Open Badges and CLR is typically  an individual but in the case of Open Badges, may be another entity type such as a course, book, or organization. Learners, Organizations and other entities can be explicit subclasses of Credential Subjects for purposes of business rules. [[vc-data-model-2.0]]

-   <dfn>Decentralized Identifiers</dfn>: A type of identifier for people, organizations and any other entity, where each identifier is controlled independently of centralized registries. [[did-core]] [[did-use-cases]]

-   <dfn>Defined Achievement Claim</dfn>: An [=assertion=] that the learner achieved a specific [=achievement=].

-   <dfn>DID URL</dfn>: A DID plus any additional syntactic component that conforms to the definition in Section 3.2 DID URL Syntax of [[DID-CORE]]. This includes an optional DID path (with its leading / character), optional DID query (with its leading ? character), and optional DID fragment (with its leading # character).

-   <dfn>Evidence</dfn>: Information supporting a claim such as a URL to an artifact produced by the Learner.

-   <dfn>Issuer</dfn>: The organization or entity that has made an assertion about a Credential Subject. The issuer of a DC Assertion is the authoritative source for that specific assertion.

-   <dfn>Learner</dfn>: The person who is the subject of the CLR and assertions contained in a CLR.

-   <dfn>Linked Data Proof</dfn>: A type of embedded signature proof.

-   <dfn data-lt="open badge">Badge</dfn>: A single assertion of an achievement that is packaged as a verifiable credential.

-   <dfn>Organization</dfn>: An organized group of one or more people with a particular purpose. [[CEDS]]

-   <dfn>Person</dfn>: A human being, alive or deceased, as recognized by each jurisdiction’s legal definitions. [[CEDS]]

-   <dfn>Presentation</dfn>: Data derived from one or more [=verifiable credentials=], issued by one or more [=issuers=], that is shared with a specific [=verifier=]. A [=verifiable presentation=] is a tamper-evident presentation encoded in such a way that authorship of the data can be trusted after a process of cryptographic verification.

-   <dfn>Publisher</dfn>: The organization or entity issuing the CLR (typically the educational institution or a 3rd-party agent). The publisher is either the issuer or has a trusted relationship with the issuer of all the assertions in the CLR.

-   <dfn>Relying Third-Party</dfn>: Also referred to as the "verifier" of a VC. This entity requests, verifies, and may consume data being presented.

-   <dfn data-lt="RESTful API">REST API</dfn>: A style of web API (Application Programming Interface) loosely based on HTTP methods (DELETE, GET, POST, and PUT) to access resources (e.g. CLRs) via a URL.

-   <dfn>Result</dfn>: Describes a possible achievement result. A result may contain the rubric level that was achieved.

-   <dfn>Result Description</dfn>: Describes a possible achievement result. A result description may contain a rubric.

-   <dfn data-lt="RSD">Rich Skill Descriptor</dfn> (RSD): A machine readable reference to a description of a skill located at a unique URL. [[RSD]]

-   <dfn>Role</dfn>: People have roles in organizations for specific periods of time. Roles are a time aware association between a person and an organization. [[CEDS]]

-   <dfn>Rubric</dfn>: Defines levels associated with the achievement definition (e.g. "approaches", "meets", and "exceeds").

-   <dfn data-lt="Platform">server</dfn>: In a [=REST API=], the server is the actor that responds to a DELETE, GET, or POST request. Also called a Platform in the [[[SEC-11]]].

-   <dfn>Skill</dfn>: Measurable or observable knowledge, skill, or ability necessary to successful performance of a person.

-   <dfn>Skill Assertion</dfn>: An [=assertion=] that contains a "skill result."

-   <dfn>Skill Claim</dfn>: An [=assertion=] that the learner has the specified [=skill=].

-   <dfn>Subject</dfn>: A person about which [=claims=] are made.

-   <dfn>Validation</dfn>: The process of assuring the verifiable credential or verifiable presentation meets the needs of the verifier and other dependent stakeholders. Validating verifiable credentials or verifiable presentations is outside the scope of this specification.

-   <dfn data-lt="VC">Verifiable Credential</dfn> (VC): A tamper-evident credential whose issuer can be cryptographically verified. See [[vc-data-model-2.0]].

-   <dfn data-lt="VP">Verifiable Presentation</dfn> (VP): A tamper-evident presentation of one or more Verifiable Credentials of which cryptographic verification can be used to determine the trustworthiness of the authorship of the data. [[vc-data-model-2.0]]

-   <dfn data-lt="Verifiable">Verification</dfn>: The evaluation of whether a [=verifiable credential=] or [=verifiable presentation=] is an authentic and timely statement of the issuer or presenter, respectively. This includes checking that: the credential (or presentation) conforms to the specification; the proof method is satisfied; and, if present, the status check succeeds.

-   <dfn>Verifier</dfn>: The entity that receives a [=verifiable credential=] or [=verifiable presentation=] and verifies the credential or presentation has not been tampered with.


### Conceptual Model

This conceptual model describes Open Badges concepts and the relationship between those concepts. The data model in appendix [[[#org-1edtech-ob-v3p0-model-0]]] below is the normative reference for the classes and properties that are used to implement the concepts.

The conceptual model is targeted for all [[[#audiences]]], while the data model is targeted for Solution Architects and Product Developers.

In the diagram below, the concepts are shown in gray boxes (e.g. Assertion). Please see [[[#terminology]]] for definitions of the concepts.

Starting with this version of the Open Badges Specification, an Assertion is also a Verifiable Credential (VC) as defined by the [[[vc-data-model-2.0]]] specification. The diagram includes labels that show the relationships between VC terminology and Open Badges terminology (e.g. Issuer is identified by the VC "issuer").

<figure>
  <img src="images/ob30-concept.png" alt="Diagram show the major conceptual components of an Open Badge Verifiable Credential">
  <figcaption>Diagram shows the major conceptual components of an Open Badge Verifiable Credential</figcaption>
</figure>

-   I, issuer assert a claim about this Credential Subject that may describe an achievement, experience, membership, etc.,
    -   The assertion provides the identity of the issuer, issuance date, and instructions on how to cryptographically prove the issuer identity and that the assertion and claim contents have not been tampered with since issuance.
        -   The claim must contain a single Credential Subject which identifies the recipient of the Open Badge.
        -   The claim may also contain: evidence of the achievement, and other properties supporting the achievement description.
        -   The Achievement description is described using properties that may be shared with the CLR including, name, description, criteria, etc.

`;
