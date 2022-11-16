var host = `

## Open Badges 3.0 Host Service Conformance {#host-conformance}

An Open Badges **Host** is an application that can aggregate and publicly host OpenBadgeCredential for recipients. It also supports export of badges at user request. The candidate platform must be able to import all formats of Open Badges as well as prove that badge metadata is not lost upon export of the badge. The candidate platform must also meet [[[#service-provider-write]]] requirements and accept an AchievementCredential or a Profile from an Issuer application. And meet [[[#service-consumer-read]]] and [[[#service-provider-read]]] requirements for exchanging AchievementCredentials with other Host applications.

### Tests {#tests-host}

1. Import each of the provided artifacts (see table below), verify the badge, and submit the status to the conformance test system.

   | Required OpenBadgeCredential Format | Use this resource for certification |
   | --- | --- |
   | Baked OpenBadgeCredential (PNG) format | [https://someurl/OB30-conformance.png](https://someurl/OB30-conformance.png) |
   | Baked OpenBadgeCredential (SVG) format | [https://someurl/OB30-conformance.svg](https://someurl/OB30-conformance.svg) |
   | OpenBadgeCredential JSON Resource URL | [https://someurl/OB30-conformance.jws](https://someurl/OB30-conformance.jws) |

1. Export the imported badge in the previous test and submit the exported badge to the conformance test system. The conformance test system will ensure that the exported badge is a valid badge and that no information is lost in the import/export operation.
1. Complete tests of [[[#service-consumer-read]]].
1. Complete tests of [[[#service-provider-read]]].
1. Complete tests of, at least, required endpoints of [[[#service-provider-write]]].


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
* They MUST return a valid entity in each endpoint. In \`getCredentials\`, each of the elements in the returned list MUST be verifiable.
* They MUST support the endpoint payload pagination query parameters, and the corresponding response HTTP pagination headers MUST be supported

### Tests {#tests-service-provider-read}

1. Authorize the conformance test system with the provided login credentials. Ensure that the right scopes are sent back to the conformance test system.
1. Return valid AchivementCredentials when the API operation \`getCredentials\` is called.
1. Return valid AchivementCredentials when the API operation \`getCredentials\` is called with query and pagination parameters.
1. Return a Profile for the authorized user (with id \`"https://1edtech.org/issuers/cert"\`) when the API operation \`getProfile\` is called.

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
* They MUST preserve sent data. A subsequent call to \`getCredentials\` after a \`upsertCredentials\` with a given credential must return that same credential as result of the Credential equality and comparison algorithm defined in [[OB-30]].

### Tests {#tests-service-provider-write}

1. Authorize the conformance test system with the provided login credentials. Ensure that the right scopes are sent back to the conformance test system.
1. Return valid AchivementCredentials when the API operation \`upsertCredentials\` is called.
1. (Optional) Return the Profile for the authorized user when the API operation \`updateProfile\` is called.

`;