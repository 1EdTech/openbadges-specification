var extending=`

## Extending and Profiling the Standard {#extending}

This standard can be extended in three ways:

- Extend the [Data Model](#datamodels) with new classes and new properties to existing extensible classes
- Extend the Extensible Enumerated Vocabularies in the [Data Model](#datamodels)
- Extend the API with new endpoints and new responses to existing endpoints

Extensions SHOULD be presented to the Comprehensive Learner Record project group for review and socialization.

Extensions MUST NOT be required.

Extensions WILL NOT be tested during conformance testing.

This standard can also be profiled. In general, profiling is used to:

- Refine which endpoints are used and which operations are supported for each endpoint
- Refine the data models by increasing the constraints on the base definitions

### Extending the Data Model

A data model extension may add new classes to the [Data Model](#datamodels) and/or new properties to existing extensible classes. Extensible classes are identified by the phrase, "This class can be extended with additional properties" shown at the bottom of the table of properties. For example, the [Alignment](#alignment) class is extensible.

The extension SHOULD be documented with the following artifacts:

- A description of the extension and the problem it solves. Ideally the description would include a use case formatted like the use cases in this specification.
- Definitions of the new classes being introduced. Each definition MUST include the class name, description, and properties; and indicate whether the class can be extended.
- Definitions of the new properties being introduced. The each definition MUST include the property name, type, and description; and indicate whether the property is required.
- A JSON Schema file that defines the new classes and/or properties. The JSON Schema file MUST be hosted on a publicly accessible server with no CORS restrictions.
- A JSON-LD Context file that defines the new classes and/or properties. The context file MUST be hosted on a publically accessible server with no CORS restrictions.
- Ideally a modified version of the CLR Standard OpenAPI file that includes the new classes and/or properties.

To use the extension implementers MUST do the following:

- Include the JSON-LD Context file URL in the <code>@context</code> property. See [Serialization](#serialization).
- Include the JSON Schema file URL in the <code>credentialSchema</code> property.

### Extending Enumerated Vocabularies

All extensible enumerated vocabularies may be extended with custom terms. Extensible vocabularies are identified by the phrase, "This enumeration can be extended with new, proprietary terms" shown at the bottom of the table of terms. For example, the [AchivementType](#achievementtype-enumeration) enumeration is extensible.

Extended terms MUST start with the prefix "ext:". For example, "ext:MyTerm".

The extended terms SHOULD be documented with the following artifacts:

- A description of the extension and the problem it solves. Ideally the description would include a use case formatted like the use cases in this specification.
- Definitions of each extended term. Each definition MUST include the extended term (e.g. "ext:MyTerm") and description.
- A JSON Schema file is not required. The existing JSON Schema for extensible vocabularies allows extended terms that follow the naming rule above.
- You MAY include a JSON-LD Context file that defines the new extended terms. If one is supplied, it MUST be hosted on a publically accessible server with no CORS restrictions.

To use the extended vocabulary implementers MAY do the following:

- Include the JSON-LD Context file URL in the <code>@context</code> property. See [Serialization](#serialization).

### Extending the API

An API extension may add new endpoints (with or without new scopes) to the [CLR Standard API](#api) and/or new responses to the existing endpoints.

The extension SHOULD be documented with the following artifacts:

- A description of the extension and the problem it solves. Ideally the description would include a use case formatted like the use cases in this specification.
- Definitions of the new endpoints being introduced. Each definition MUST include the endpoint name, description, HTTP Method, URL format, required request query parameters (if any), required request headers, required request payload (if any), required responses, and required response headers.
  - The URL format MUST following IMS naming conventions. Specifically, the path "/ims/clr/v2p0/" must precede the final URL segment. For example, "/ims/clr/v2p0/myendpoint".
  - The definition must indicate if the endpoint requires authorization. If it does, the definition must define the scope that is required. New endpoints that require authorization MUST follow the requirements shown in [CLR Standard API Security](#api-security).
  - Each required query parameter definition MUST include the parameter type and description.
  - Each required request header definition MUST include the header and a description.
  - A required request payload definition MUST include the payload type.
  - Each required request response definition MUST include the HTTP Status Code, payload type (if any), and description. Non-successful responses (i.e. HTTP Status Code >= 400) SHOULD use the [Imsx_StatusInfo](#org.1edtech.clr.v2p0.imsx_statusinfo.class) payload.
  - Each requied response header defintion MUST include the header and a description.
- Definitions of the new responses to existing endpoints. The each definition MUST include the HTTP Status Code, payload type (if any), and description. Non-successful responses (i.e. HTTP Status Code >= 400) SHOULD use the [Imsx_StatusInfo](#org.1edtech.clr.v2p0.imsx_statusinfo.class) payload.
- Ideally an OpenAPI file that describes the new endpoints and/or responses to existing endpoints.

### Profiles

Profiling is the process by which an IMS specification is tailored to meet the requirements of a specific community: the community could be a reflection of a market sector, a geographic location, etc. An example of such a community is the Norwegian K-12/Schools for whom a profile of the IMS OneRoster 1.2 specification has been created. The process of profiling starts with the corresponding base specification and defines a set of new constraints to make the subsequent modified specification better fit the requirements of the target community. Once the profile has been defined, the next step is to create the corresponding Conformance Test Systems and Certification process for that profile: these will be modified versions of the equivalents created for the base specification. It is recommended that profiling is undertaken within IMS so that the IMS model driven specification tools can be used.

A profile is the product produced by the process of specification Profiling. A Profile of an IMS specification consists of a set of new constraints. In general an IMS specification enables a wide range education and learning workflows, processes and practices. A profile is designed to establish and impose best practices for the target community. A profile MUST only increase constraints i.e. it MUST NOT relax constraints in the base specification. For example the multiplicity of a property in the data model MAY be changed from [1..*] (required and permitting many) to [1..1] (required and only one) but MUST NOT become [0..*] (optional and permitting many). The most common profiling changes include more strict data typing, changes to enumerations, vocabulary changes, prohibition of endpoints and creation of new endpoints. A profile could make use of the extension capabilties to extend the specification to support new features. The key objective of a rofile is to remove, wherever possible, interoperability uncertainty e.g. by removing optionality.

It is strongly recommended that a profile of this standard is undertaken either by, or with the close support, of IMS Global. However, no matter who is responsible for creating the profile artefacts (documents, schemas, etc.), it is strongly recommended that IMS specification tools are used. This will ensure that the artefacts are consistent with the base specifications and that useful support documentation is automatically produced e.g. creation of a document that summarises the differences between the base specification and the profile.

`;
