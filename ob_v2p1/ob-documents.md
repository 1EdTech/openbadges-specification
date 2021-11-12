var documents = `

### Specification Documents

The full set of documents is comprised of the following documents:

* [[[OB-21]]]
* [[[OB-CERT-21]]]
* OpenAPI 3.0 Files for the Badge Connect API

  From the OpenAPI Specification [[OPENAPIS]],
  > The Open API Specification (OAS) defines a standard, programming language-agnostic interface description for HTTP APIs, which allows both humans and computers to discover and understand the capabilities of a service without requiring access to source code, additional documentation, or inspection of network traffic. When properly defined via OpenAPI, a consumer can understand and interact with the remote service with a minimal amount of implementation logic. Similar to what interface descriptions have done for lower-level programming, the OpenAPI Specification removes guesswork in calling a service.
  
  This standard has OpenAPI 3.0 files for the Badge Connect API in both JSON and YAML format:
  * [JSON OpenAPI File](https://purl.imsglobal.org/spec/ob/v2p1/schema/openapi/imsob_v2p1.json)
  * [YAML OpenAPI File](https://purl.imsglobal.org/spec/ob/v2p1/schema/openapi/imsob_v2p1.yaml)
  
* [[[OB-JSON-21]]]
* Badge Connect API JSON-LD Context File

  From the JSON-LD 1.1 Specification [[json-ld11]], 
  > When two people communicate with one another, the conversation takes place in a shared environment, typically called "the context of the conversation". This shared context allows the individuals to use shortcut terms, like the first name of a mutual friend, to communicate more quickly but without losing accuracy. A context in JSON-LD works in the same way. It allows two applications to use shortcut terms to communicate with one another more efficiently, but without losing accuracy.

  > Simply speaking, a context is used to map terms to IRIs. Terms are case sensitive and any valid string that is not a reserved JSON-LD keyword can be used as a term.

  This specification includes this JSON-LD Context file:

  * https://purl.imsglobal.org/spec/ob/v2p1/context/ob_v2p1.jsonld
`;
