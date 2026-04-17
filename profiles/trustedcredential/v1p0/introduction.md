var introduction = `

## Introduction

### Audiences

The target readers for this document are:

- Business Leaders - the people who are responsible for identifying the business case for using verifiable digital credentials and badges
- Solution Architects - the people who are responsible for the definition and design of systems, applications, and tools that are to be used to issue, exchange, and verify digital credentials and badges
- Product Developers - the people who are adding functionality to issue, exchange, and verify digital credentials

### Document Set {#document-set}

The Open Badges Specification has several related documents and artifacts shown below. Together they make up the specification.

<ul>
<li></li>
</ul>

#### JSON-LD Context File

> When two people communicate with one another, the conversation takes place in a shared environment, typically called "the context of the conversation". This shared context allows the individuals to use shortcut terms, like the first name of a mutual friend, to communicate more quickly but without losing accuracy. A context in JSON-LD works in the same way. It allows two applications to use shortcut terms to communicate with one another more efficiently, but without losing accuracy.
>
> Simply speaking, a context is used to map terms to IRIs. Terms are case sensitive and any valid string that is not a reserved JSON-LD keyword can be used as a term.
>
> -- [[[json-ld11]]]

- [https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json](https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json)

#### JSON Schema

All JSON Schema can be found in [[[#json-schema]]]. JSON Schema files for credential and API schema verification are available online:

-

### Terminology

- <dfn>Authorization Server</dfn>:
  This is a [=server=] that implements the OAuth 2.0 endpoints on behalf of
  the [=resource server=]. In many systems, the [=authorization server=] and
  the [=resource server=] are combined.
- <dfn data-lt="open badge">Badge</dfn>: A single assertion of an achievement that is packaged as a verifiable credential.
- <dfn data-lt="CLR">Comprehensive Learner Record</dfn> (CLR): Set of assertions that can be packaged as a verifiable credential.
- <dfn data-lt="Provider">Resource Server</dfn>:
  This is the [=server=] that has the protected resources ([=badges=]). Also
  called Provider in the [[[SEC-11]]].
- <dfn data-lt="RESTful API">REST API</dfn>: A style of web API (Application Programming Interface) loosely based on HTTP methods (DELETE, GET, POST, and PUT) to access resources (e.g. CLRs) via a URL.
- <dfn data-lt="Platform">server</dfn>: In a [=REST API=], the server is the actor that responds to a DELETE, GET, or POST request. Also called a Platform in the [[[SEC-11]]].

`;
