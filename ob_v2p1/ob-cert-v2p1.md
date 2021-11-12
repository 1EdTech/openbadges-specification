var md = `

## Open Badges Conformance

The goal of IMS certification for Open Badges [[OB-21]] is to ensure interoperable implementations of badging systems that generate and issue digital badges as well as those that host and display badges.

IMS certification for Open Badges demands features and capabilities beyond those that are strictly required by the specification. These additional features are defined in this document. The specification is intentionally left very flexible to allow it to be used for many purposes. Gaining this certification is expected to be more difficult than simply meeting the minimum requirements for producing a valid Open Badge.

Certification may be achieved for one or more of the following 4 features:

Consumer<br />(Initiates Requests) | Provider<br />(Responds to Requests)
:--------------------------------: | :----------------------------------:
[Service Consumer (Read)](#service-consumer-read) | [Service Provider (Read)](#service-provider-read)
[Service Consumer (Write)](#service-consumer-write) | [Service Provider (Write)](#service-provider-write)

The features and associated certification tests are defined below.

### The Conformance Process

The process for conformance testing role implementations of Open Badges includes the following:

* First, go to the IMS Conformance Test Suite for Open Badges 2.1 and follow the onscreen instructions to run the tests.
* Once the tests have been successfully run, submit your test results. A copy of your test results will be sent to your email address.

To pass certification, you must take the following steps:

* You must be an IMS Digital Credentials and Badges Alliance Member, an IMS Affiliate Member, or IMS Contributing Member.
* You must be certified for Open Badges 2.0.
* You must pass all the tests associated with the features you are applying for using the certification suite hosted on the IMS website.
* The tests must be completed by a designated representative of the IMS member organization, and you must agree that there is no misrepresentation or manipulation of results in the submitted information.

After IMS reviews your submitted information and notifies you that your application is approved, you can claim certification to Open Badges 2.1 and display the IMS certified logo on your website and in your software. The IMS Global Certified Products Directory will list your conformance details.

## Service Consumer (Read) Conformance {#service-consumer-read}

A product that conforms to Service Consumer (Read) requirements can request badges from a product that conforms to Service Provider (Read) requirements. One example of such a product is a Host which requests your badges from another Host.

### Required Service Consumer (Read) Endpoint Support

The service endpoints that MUST be supported for Service Consumer (Read) are listed in the table below:

Service Call | Endpoint | HTTP Verb | Mode | Authorization<br />Required
------------ | -------- | --------- | ---- | ---------------------------
getManifest | as configured | GET | Initiate | No
OAuth 2.0 Registration | from manifest | GET | Initiate | No
OAuth 2.0 Authorize | from manifest | GET | Initiate | No
OAuth 2.0 Token | from manifest | POST | Initiate | No
getAssertions | \`/ims/ob/v2p1/assertions\` | GET | Initiate | Yes
getProfile | \`/ims/ob/v2p1/profile\` | GET | Initiate | Yes

### Service Consumer (Read) Compliance

The functional capabilities of such systems are:

* They MUST support the required service endpoints
* They MUST supply an access token with the appropriate scope to the service endpoints that require authorization
* They MUST supply or 'handle' all of the required data fields in payloads
* They MUST be capable of supplying or 'handling' all of the optional data fields in payloads
* They MUST NOT provide extension data fields in the payloads
* They MAY support the endpoint payload pagination query parameters. If supported, the corresponding response HTTP pagination headers MUST be supported

## Service Consumer (Write) Conformance {#service-consumer-write}

A product that conforms to Service Consumer (Write) requirements can send an Assertion or a Profile to a product that conforms to Service Provider (Write) requirements. One example of such a product is an Issuer that sends an Assertion to a Host.

### Required Service Consumer (Write) Endpoint Support

The service endpoints that MUST be supported for Service Consumer (Write) are listed in the table below:

Service Call | Endpoint | HTTP Verb | Mode | Authorization<br />Required
------------ | -------- | --------- | ---- | ---------------------------
getManifest | as configured | GET | Initiate | No
OAuth 2.0 Registration | from manifest | GET | Initiate | No
OAuth 2.0 Authorize | from manifest | GET | Initiate | No
OAuth 2.0 Token | from manifest | POST | Initiate | No
postAssertion | \`/ims/ob/v2p1/assertions\` | POST | Initiate | Yes

### Optional Service Consumer (Write) Endpoint Support

The service endpoints that MAY be supported for Service Consumer (Write) are listed in the table below:

Service Call | Endpoint | HTTP Verb | Mode | Authorization<br />Required
------------ | -------- | --------- | ---- | ---------------------------
postProfile | \`/ims/ob/v2p1/profile\` | POST | Initiate | Yes

### Service Consumer (Write) Compliance

The functional capabilities of such systems are:

* They MUST support the required endpoints
* They MAY support the optional endpoints
* They MUST supply an access token with the appropriate scope to the service endpoints that require authorization
* They MUST supply or 'handle' all of the required data fields in payloads
* They MUST be capable of supplying or 'handling' all of the optional data fields in payloads
* They MUST NOT provide extension data fields in the payloads

## Service Provider (Read) Conformance {#service-provider-read}

A product that conforms to Service Provider (Read) requirements can provide badges to a product that conforms to Service Consumer (Read) requirements. One example of such a product is a Host which provides your badges to another Host upon request.

### Required Service Provider (Read) Endpoint Support

The service endpoints that MUST be supported for Service Provider (Read) are listed in the table below:

Service Call | Endpoint | HTTP Verb | Mode | Authorization<br />Required
------------ | -------- | --------- | ---- | ---------------------------
getManifest | as configured | GET | Respond | No
OAuth 2.0 Registration | from manifest | Respond | Respond | No
OAuth 2.0 Authorize | from manifest | GET | Respond | No
OAuth 2.0 Token | from manifest | POST | Respond | No
getAssertions | \`/ims/ob/v2p1/assertions\` | GET | Respond | Yes
getProfile | \`/ims/ob/v2p1/profile\` | GET | Respond | Yes

### Service Provider (Read) Compliance

The functional capabilities of such systems are:

* They MUST support the required service endpoints
* They MUST require an access token with the appropriate scope for endpoints that require authorization
* They MUST supply or 'handle' all of the required data fields in payloads
* They MUST be capable of supplying or 'handling' all of the optional data fields in payloads
* They MUST NOT provide extension data fields in the payloads
* They MUST support the endpoint payload pagination query parameters. The corresponding response HTTP pagination headers MUST be supported.

## Service Provider (Write) Conformance {#service-provider-write}

A product that conforms to Service Provider (Write) requirements can accept an Assertion or a Profile from a product that conforms to Service Consumer (Write) requirements. One example of such a product is a Host that accepts Assertions from an Issuer.

### Required Service Provider (Write) Endpoint Support

The service endpoints that MUST be supported for Service Provider (Write) are listed in the table below:

Service Call | Endpoint | HTTP Verb | Mode | Authorization<br />Required
------------ | -------- | --------- | ---- | ---------------------------
getManifest | as configured | GET | Respond | No
OAuth 2.0 Registration | from manifest | GET | Respond | No
OAuth 2.0 Authorize | from manifest | GET | Respond | No
OAuth 2.0 Token | from manifest | POST | Respond | No
postAssertion | \`/ims/ob/v2p1/assertions\` | POST | Respond | Yes

### Optional Service Provider (Write) Endpoint Support

The service endpoints that MAY be supported for Service Provider (Write) are listed in the table below:

Service Call | Endpoint | HTTP Verb | Mode | Authorization<br />Required
------------ | -------- | --------- | ---- | ---------------------------
postProfile | \`/ims/ob/v2p1/profile\` | POST | Respond | Yes

### Service Provider (Write) Compliance

The functional capabilities of such systems are:

* They MUST support the required endpoints
* They MAY support the optional endpoints
* They MUST require an access token with the appropriate scope for the endpoints that require authorization
* They MUST supply or 'handle' all of the required data fields in payloads
* They MUST be capable of supplying or 'handling' all of the optional data fields in payloads
* They MUST NOT provide extension data fields in the payloads

`;
