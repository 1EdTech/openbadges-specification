var issuer = `

## Open Badges 3.0 Issuer Service Conformance {#issuer-conformance}

A Open Badges **Issuer** is an application that allows for the creation of OpenBadgeCredentials and the subsequent delivery of OpenBadgeCredentials to recipients that conform to the Open Badges Specification. The candidate platform must issue a valid baked badge and demonstrate how the badge is retrieved by the recipient. The candidate platform may also meet Service Consumer (Write) requirements and can send an AchievementCredential or a Profile to a product that conforms to Service Provider (Write) requirements.

<div class="note">
Open Badges Issuers that only create OpenBadgeCredentials and not meet Service Consumer (Write) requirements are also known for conform to the <b>Issuer Only</b> service conformance.
</div>

### Tests {#issuer-tests}

1. Create a valid 3.0 badge and issue it to the recipient \`conformance@imsglobal.org\` and submit the issued badge to the conformance test system.
1. Demonstrate through video the candidate platform's methodology for a recipient to retrieve their badge.

1. (Optional) Complete tests of, at least, required endpoints of [[[#service-consumer-write]]].

### Service Consumer (Write) Conformance {#service-consumer-write}

A product that conforms to Service Consumer (Write) requirements can send an OpenBadgeCredential or a Profile to a product that conforms to Service Provider (Write) requirements.

<div class="note">
  In the scope of the conformance test system, the test system acts as the Service Provider, so a [[= Candidate Platform =]] MUST send credentials and profiles from the given conformance test system.
</div>

#### Required Service Consumer (Write) Endpoint Support

The service endpoints that MUST be supported for Service Consumer (Write) are listed in the table below:

Service Call | Endpoint | HTTP Verb | Mode | Authorization<br />Required
------------ | -------- | --------- | ---- | ---------------------------
getServiceDescription | \`/ims/ob/v3p0/discovery\` | GET | Initiate | No
OAuth 2.0 Registration | from Service Discovery Document (SDD) | GET | Initiate | No
OAuth 2.0 Authorize | from SDD | GET | Initiate | No
OAuth 2.0 Token | from SDD | POST | Initiate | No
upsertCredential | \`/ims/ob/v3p0/credentials\` | POST | Initiate | Yes

#### Optional Service Consumer (Write) Endpoint Support

The service endpoints that MAY be supported for Service Consumer (Write) are listed in the table below:

Service Call | Endpoint | HTTP Verb | Mode | Authorization<br />Required
------------ | -------- | --------- | ---- | ---------------------------
putProfile | \`/ims/ob/v3p0/profile\` | PUT | Initiate | Yes

#### Tests {#tests-service-consumer-write}

1. Obtain an access token from the conformance test system using provided \`getServiceDescription\` endpoint and the following OAuth 2.0 authentication flow with the provided login credentials. Ensure that the right scopes are sent.
1. Create a valid AchivementCredential and issue it to the recipient \`conformance@imsglobal.org\`. Call the conformance test endpoint \`upsertCredentials\`, with the AchivementCredential. Submit the result of the call to the conformance test system.
1. (Optional) Create a new Profile for the id \`"https://1edtech.org/issuers/cert"\` and call the conformance test endpoint \`putProfile\` with the Profile. Submit the result of the call to the conformance test system.

`;
