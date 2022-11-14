var conformance = `

## Conformance and Certification

<div class="ednote">
   @@ TBD @@
</div>

The goal of 1EdTech certification for Open Badges [[OB-30]] is to ensure interoperable implementations of badging systems that generate and issue digital badges as well as those that host and display badges.

1EdTech certification for Open Badges demands features and capabilities beyond those that are strictly required by the specification. These additional features are defined in this document. The specification is intentionally left very flexible to allow it to be used for many purposes. Gaining this certification is expected to be more difficult than simply meeting the minimum requirements for producing a valid Open Badge.

Certification may be achieved in one or more of the following services:

* Open Badges Issuer
* Open Badges Displayer
* Open Badges Host

The service types and associated certification tests are defined below.

### API classification

This specification defines a [=RESTful API=] protocol to be implemented by applications serving in the roles of [=Client=] and [=Resource Server=]. The API uses OAuth 2.0 for authentication and granular resource-based permission scopes.

All the endpoints defined in the [Open Badges 3.0 API](https://imsglobal.org/spec/ob/v3p0#api) are grouped in four services for certification purposes. This grouping
is based on the role of the [=candidate platform=] in the API architecture and the purpose of the operation. Thus, the resulting grouping is as follows:

Consumer<br />(Initiates Requests) | Provider<br />(Responds to Requests)
:--------------------------------: | :----------------------------------:
[Service Consumer (Read)](#service-consumer-read) | [Service Provider (Read)](#service-provider-read)
[Service Consumer (Write)](#service-consumer-write) | [Service Provider (Write)](#service-provider-write)

These services contain a set of required endpoints a [=candidate platform=] must support for its further certification. Some services may contain a set of optional endpoints that, if supported by the [=candidate platform=], it must support as well.

### The Conformance Process

The process for conformance testing role implementations of Open Badges includes the following:

* First, launch the [1EdTech Conformance Test Suite](https://certification.imsglobal.org/certification/badgeconnect/launch.html) for Open Badges 3.0 and follow the onscreen instructions to run the tests.
* Once the tests have been successfully run, submit your test results. A copy of your test results will be sent to your email address.

To pass certification, you must take the following steps:

* You must be an 1EdTech Digital Credentials and Badges Alliance Member, an 1EdTech Affiliate Member, or 1EdTech Contributing Member.
* You must pass all the tests associated with the features you are applying for using the certification suite hosted on the 1EdTech website.
* The tests must be completed by a designated representative of the 1EdTech member organization, and you must agree that there is no misrepresentation or manipulation of results in the submitted information.

After 1EdTech reviews your submitted information and notifies you that your application is approved, you can claim certification to Open Badges 3.0 and display the 1EdTech certified logo on your website and in your software. The 1EdTech Global Certified Products Directory will list your conformance details.

### Open Badges 3.0 Issuer Service Conformance {#issuer-conformance}

A Open Badges **Issuer** is an application that allows for the creation of OpenBadgeCredentials and the subsequent delivery of OpenBadgeCredentials to recipients that conform to the Open Badges Specification. The candidate platform must issue a valid baked badge and demonstrate how the badge is retrieved by the recipient. The candidate platform must also meet Service Consumer (Write) requirements and can send an AchievementCredential or a Profile to a product that conforms to Service Provider (Write) requirements.

#### Tests {#issuer-tests}

1. Create a valid baked 3.0 badge and issue it to the recipient \`conformance@imsglobal.org\` and submit the issued badge to the conformance test system.
1. Complete (at least) required tests of [[[#service-consumer-write]]].

### Open Badges 3.0 Displayer Service Conformance {#displayer-conformance}

An Open Badges Displayer is an application that displays and verifies badges for viewers. The candidate platform must support viewer-initiated verification of a badge.

#### Tests {#display-tests}

1. Verify the three badges listed below and submit the status in the conformance test system.
   1. [https://someurl/OB30-conformance-verify-1.json](https://someurl/OB30-conformance-verify-1.json)
   1. [https://someurl/OB30-conformance-verify-2.json](https://someurl/OB30-conformance-verify-2.json)
   1. [https://someurl/OB30-conformance-verify-3.json](https://someurl/OB30-conformance-verify-3.json)


### Open Badges 3.0 Host Service Conformance {#host-conformance}

An Open Badges **Host** is an application that can aggregate and publicly host OpenBadgeCredential for recipients. It also supports export of badges at user request. The candidate platform must be able to import all formats of Open Badges as well as prove that badge metadata is not lost upon export of the badge. The candidate platform must also meet [[[#service-provider-write]]] requirements and accept an AchievementCredential or a Profile from an Issuer application. And meet [[[#service-consumer-read]]] and [[[#service-provider-read]]] requirements for exchanging AchievementCredentials with other Host applications.

#### Tests {#tests-host}

1. Import each of the provided artifacts (see table below), verify the badge, and submit the status to the conformance test system.

   | Required OpenBadgeCredential Format | Use this resource for certification |
   | --- | --- |
   | Baked OpenBadgeCredential (PNG) format | [https://someurl/OB30-conformance.png](https://someurl/OB30-conformance.png) |
   | Baked OpenBadgeCredential (SVG) format | [https://someurl/OB30-conformance.svg](https://someurl/OB30-conformance.svg) |
   | OpenBadgeCredential JSON Resource URL | [https://someurl/OB30-conformance.jws](https://someurl/OB30-conformance.jws) |

1. Export the imported badge in the previous test and submit the exported badge to the conformance test system. The conformance test system will ensure that the exported badge is a valid badge and that no information is lost in the import/export operation.
1. Complete tests of [[[#service-consumer-read]]].
1. Complete (at least) required tests of [[[#service-provider-read]]].
1. Complete (at least) required tests of [[[#service-provider-write]]].


## Service Consumer (Read) Conformance {#service-consumer-read}

A product that conforms to Service Consumer (Read) requirements can request credentials and profiles from a product that conforms to Service Provider (Read) requirements.

<div class="note">
  In the scope of the conformance test system, the test system acts as the Service Provider, so a [[= Candidate Platform =]] MUST request credentials and profiles from the given conformance test system.
</div>

### Required Service Consumer (Read) Endpoint Support

The service endpoints that MUST be supported for Service Consumer (Read) are listed in the table below:

Service Call | Endpoint | HTTP Verb | Mode | Authorization<br />Required
------------ | -------- | --------- | ---- | ---------------------------
getServiceDescription | \`/ims/ob/v3p0/discovery\` | GET | Initiate | No
OAuth 2.0 Registration | from Service Discovery Document (SDD) | GET | Initiate | No
OAuth 2.0 Authorize | from SDD | GET | Initiate | No
OAuth 2.0 Token | from SDD | POST | Initiate | No
getCredentials | \`/ims/ob/v3p0/credentials\` | GET | Initiate | Yes
getProfile | \`/ims/ob/v3p0/profile\` | GET | Initiate | Yes

### Tests {#tests-service-consumer-read}

1. Obtain an access token from the conformance test system using provided \`getServiceDescription\` endpoint and the following OAuth 2.0 authentication flow with the provided login credentials. Ensure that the right scopes are sent.
1. Call the conformance test endpoint \`getCredentials\`. Submit the result of the call to the conformance test system and demonstrate through separate video that the platform displays the returned credentials.
1. (Optional) Call the conformance test endpoint \`getCredentials\` with query and pagination parameters. Submit the result of the call to the conformance test system and demonstrate through separate video that the platform displays the returned credentials.
1. Call the conformance test endpoint \`getProfile\`. Submit the result of the call to the conformance test system and demonstrate through separate video that the platform displays the returned profile.

## Service Consumer (Write) Conformance {#service-consumer-write}

A product that conforms to Service Consumer (Write) requirements can send an OpenBadgeCredential or a Profile to a product that conforms to Service Provider (Write) requirements.

<div class="note">
  In the scope of the conformance test system, the test system acts as the Service Provider, so a [[= Candidate Platform =]] MUST send credentials and profiles from the given conformance test system.
</div>

### Required Service Consumer (Write) Endpoint Support

The service endpoints that MUST be supported for Service Consumer (Write) are listed in the table below:

Service Call | Endpoint | HTTP Verb | Mode | Authorization<br />Required
------------ | -------- | --------- | ---- | ---------------------------
getServiceDescription | \`/ims/ob/v3p0/discovery\` | GET | Initiate | No
OAuth 2.0 Registration | from Service Discovery Document (SDD) | GET | Initiate | No
OAuth 2.0 Authorize | from SDD | GET | Initiate | No
OAuth 2.0 Token | from SDD | POST | Initiate | No
upsertCredential | \`/ims/ob/v3p0/credentials\` | POST | Initiate | Yes

### Optional Service Consumer (Write) Endpoint Support

The service endpoints that MAY be supported for Service Consumer (Write) are listed in the table below:

Service Call | Endpoint | HTTP Verb | Mode | Authorization<br />Required
------------ | -------- | --------- | ---- | ---------------------------
postProfile | \`/ims/ob/v3p0/profile\` | POST | Initiate | Yes

### Tests {#tests-service-consumer-write}

<div class="ednote">
   @@ TBD @@
   <p>Something like:</p>
   <ol>
      <li>Call conformance test required endpoints with test data.</li>
      <li>(Optional) Call conformance test optional endpoints with test data.</li>
   </ol>
</div>

### Service Consumer (Write) Compliance

The functional capabilities of such systems are:

* They MUST support the required endpoints
* They MAY support the optional endpoints
* They MUST supply an access token with the appropriate scope to the service endpoints that require authorization
* They MUST supply or 'handle' all of the required data fields in payloads
* They MUST be capable of supplying or 'handling' all of the optional data fields in payloads
* They MUST NOT provide extension data fields in the payloads

## Service Provider (Read) Conformance {#service-provider-read}

A product that conforms to Service Provider (Read) requirements can provide badges to a product that conforms to Service Consumer (Read) requirements.

<div class="note">
  In the scope of the conformance test system, the test system acts as the Service Consumer, so a [[= Candidate Platform =]] MUST receive credentials and profiles requests from the given conformance test system.
</div>

### Required Service Provider (Read) Endpoint Support

The service endpoints that MUST be supported for Service Provider (Read) are listed in the table below:

Service Call | Endpoint | HTTP Verb | Mode | Authorization<br />Required
------------ | -------- | --------- | ---- | ---------------------------
getServiceDescription | \`/ims/ob/v3p0/discovery\` | GET | Respond | No
OAuth 2.0 Registration | from Service Discovery Document (SDD) | GET | Respond | No
OAuth 2.0 Authorize | from SDD | GET | Respond | No
OAuth 2.0 Token | from SDD | POST | Respond | No
getCredentials | \`/ims/ob/v3p0/credentials\` | GET | Respond | Yes
getProfile | \`/ims/ob/v3p0/profile\` | GET | Respond | Yes

### Service Provider (Read) Compliance

The functional capabilities of such systems are:

* They MUST support the required service endpoints
* They MUST require an access token with the appropriate scope for endpoints that require authorization
* They MUST supply or 'handle' all of the required data fields in payloads
* They MUST be capable of supplying or 'handling' all of the optional data fields in payloads
* They MUST NOT provide extension data fields in the payloads
* They MUST support the endpoint payload pagination query parameters, and the corresponding response HTTP pagination headers MUST be supported

### Tests {#tests-service-provider-read}

<div class="ednote">
   @@ TBD @@
   <p>Something like:</p>
   <ol>
      <li>Authorize conformance test system</li>
      <li>Receive calls form conformance test system for endpoints.</li>
      <li>Conformance test system will verify received data</li>
   </ol>
</div>

## Service Provider (Write) Conformance {#service-provider-write}

A product that conforms to Service Provider (Write) requirements can accept an OpenBadgeCredential or a Profile from a product that conforms to Service Consumer (Write) requirements.

<div class="note">
  In the scope of the conformance test system, the test systems acts as the Service Consumer, so a [[= Candidate Platform =]] MUST receive credentials and profiles calls from the given conformance test system.
</div>

### Required Service Provider (Write) Endpoint Support

The service endpoints that MUST be supported for Service Provider (Write) are listed in the table below:

Service Call | Endpoint | HTTP Verb | Mode | Authorization<br />Required
------------ | -------- | --------- | ---- | ---------------------------
getServiceDescription | \`/ims/ob/v3p0/discovery\` | GET | Respond | No
OAuth 2.0 Registration | from Service Discovery Document (SDD) | GET | Respond | No
OAuth 2.0 Authorize | from SDD | GET | Respond | No
OAuth 2.0 Token | from SDD | POST | Respond | No
upsertCredential | \`/ims/ob/v3p0/credentials\` | POST | Respond | Yes

### Optional Service Provider (Write) Endpoint Support

The service endpoints that MAY be supported for Service Provider (Write) are listed in the table below:

Service Call | Endpoint | HTTP Verb | Mode | Authorization<br />Required
------------ | -------- | --------- | ---- | ---------------------------
postProfile | \`/ims/ob/v3p0/profile\` | POST | Respond | Yes

### Service Provider (Write) Compliance

The functional capabilities of such systems are:

* They MUST support the required endpoints
* They MAY support the optional endpoints
* They MUST require an access token with the appropriate scope for the endpoints that require authorization
* They MUST supply or 'handle' all of the required data fields in payloads
* They MUST be capable of supplying or 'handling' all of the optional data fields in payloads
* They MUST NOT provide extension data fields in the payloads

### Tests {#tests-service-provider-write}

<div class="ednote">
   @@ TBD @@
   <p>Something like:</p>
   <ol>
      <li>Authorize conformance test system</li>
      <li>Receive calls form conformance test system for required endpoints.</li>
      <li>Receive calls form conformance test system for optional endpoints.</li>
      <li>Conformance test system will verify received data</li>
   </ol>
</div>

`;