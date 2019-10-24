var md = `

## Open Badges Conformance

The goal of IMS certification for Open Badges is to ensure interoperable implementations of badging systems that generate and issue digital badges as well as those that host and display badges.

IMS certification for Open Badges demands features and capabilities beyond those that are strictly required by the specification. These additional features are defined in this document. The specification is intentionally left very flexible to allow it to be used for many purposes. Gaining this certification is expected to be more difficult than simply meeting the minimum requirements for producing a valid Open Badge.

Certification may be achieved in one or more of the following roles:

* Issuer
* Displayer
* Host

The roles and associated certification tests are defined below.

### The Conformance Process

The process for conformance testing role implementations of Open Badges includes the following:

* First, go to the [IMS Conformance Test Suite for Open Badges 2.0](https://www.imsglobal.org/open-badges-certification-suite) and follow the instructions to create and submit an application for Open Badges 2.0 conformance certification.
* Second, go to the [IMS Conformance Test Suite for Open Badges 2.1] and follow the instructions to create and submit an application for Open Badges 2.1 conformance certification described here.
<aside class="issue">What is the URL for the Open Badges 2.1 certification suite?</aside>

To pass certification, you must take the following steps:

* You must be an IMS Digital Credentials and Badges Alliance Member, an IMS Affiliate Member, or IMS Contributing Member. 
* You must pass all the tests associated with the role you are applying for using the certification suite hosted on the IMS website. The roles and associated tests are specified below. 
* The tests must be completed by a designated representative of the IMS member organization, and you must agree that there is no misrepresentation or manipulation of results in the submitted information.

After IMS reviews your submitted information and notifies you that your application is approved, you can claim certification to Open Badges and display the IMS certified logo on your website and in your software. The [IMS Global Certified Products Directory](https://site.imsglobal.org/certifications) will list your conformance details.

### Issuer Role Conformance

An Open Badges **Issuer** is an application that allows for the creation of <a data-cite="OB-SPEC-21#BadgeClass">BadgeClasses</a> and the subsequent delivery of <a data-cite="OB-SPEC-21#Assertion">Assertions</a> to recipients that conform to the [[[OB-SPEC-21]]]. Beginning with Open Badges 2.1, the candidate platform must support the transimission of a badge using the Badge Connect API.

**Tests**

| Test | API | Requester | Responder | Endpoint | Required |
| ---- | --- | --------- | --------- | -------- | -------- |
| 1 | GET Manifest | Candidate | IMS | <code>.well-known/badgeconnect.json</code> | Yes |
| 2 | OAuth2 Register | Candidate | IMS | <code>RegistrationUrl</code> | Yes |
| 3 | OAuth2 Authorize | Candidate | IMS | <code>AuthorizationUrl</code> | Yes |
| 4 | OAuth2 Token | Candidate | IMS | <code>TokenUrl</code> | Yes |
| 5 | POST Assertion | Candidate | IMS | <code>/assertions</code> | Yes |
| 6 | POST Profile | Candidate | IMS | <code>/profile</code> | No |

1. GET the <a data-cite="OB-SPEC-21#api-Manifest">Manifest</a> from the IMS conformance testing platform.
2. Request the IMS conformance testing platform dynamically register the candidate platform.
3. Authorize the IMS conformance testing platform to create assertions and update profiles, and optionally offline access on behalf of the test user.
4. Request an access token and optionally a refresh token from the IMS conformance testing platform in exchange for the authorization code provided in #3.
5. POST a signed or unsigned <a data-cite="OB-SPEC-21#Assertion">Assertion</a> to the <code>/assertions</code> endpoint on the IMS conformance testing platform.
6. (Optional) POST a <a data-cite="OB-SPEC-21#Profile">Profile</a> to the <code>/profile</code> endpoint on the IMS conformance testing platform.

### Displayer Role Conformance

An Open Badges **Displayer** is an application that displays verified badges to viewers. Beginning with Open Badges 2.1, the candidate platform must be able to retrieve badges using the Badge Connect API.

**Tests**

| Test | API | Requester | Responder | Endpoint | Required |
| ---- | --- | --------- | --------- | -------- | -------- |
| 1 | GET Manifest | Candidate | IMS | <code>.well-known/badgeconnect.json</code> | Yes |
| 2 | OAuth2 Register | Candidate | IMS | <code>RegistrationUrl</code> | Yes |
| 3 | OAuth2 Authorize | Candidate | IMS | <code>AuthorizationUrl</code> | Yes |
| 4 | OAuth2 Token | Candidate | IMS | <code>TokenUrl</code> | Yes |
| 5 | GET Assertions | Candidate | IMS | <code>/assertions</code> | Yes |
| 6 | GET Profile | Candidate | IMS | <code>/profile</code> | Yes |

1. GET the <a data-cite="OB-SPEC-21#api-Manifest">Manifest</a> from the IMS conformance testing platform.
2. Request the IMS conformance testing platform dynamically register the candidate platform.
3. Authorize the IMS conformance testing platform to retrieve assertions and profiles, and optionally offline access on behalf of the test user.
4. Request an access token and optionally a refresh token from the IMS conformance testing platform in exchange for the authorization code provided in #3.
5. GET signed and unsigned <a data-cite="OB-SPEC-21#Assertion">Assertions</a> from the <code>/assertions</code> endpoint on the IMS conformance testing platform.
	<aside class="issue">Test paging?</aside>
6. GET a <a data-cite="OB-SPEC-21#Profile">Profile</a> from the <code>/profile</code> endpoint on the IMS conformance testing platform.

### Host Role Conformance

An Open Badges **Host** is an application that can aggregate and publicly host <a data-cite="OB-SPEC-21#Assertion">Assertions</a> for recipients. It also supports export of badges at user request. Beginning with Open Badges 2.1, the candidate platform must be able to send and receive assertions and profiles using the Badge Connect API.

**Tests**

| Test | API | Requester | Responder | Endpoint | Required |
| ---- | --- | --------- | --------- | -------- | -------- |
| 1 | GET Manifest | Candidate | IMS | <code>.well-known/badgeconnect.json</code> | Yes |
| 2 | GET Manifest | IMS | Candidate | <code>.well-known/badgeconnect.json</code> | Yes |
| 3 | OAuth2 Register | Candidate | IMS | <code>RegistrationUrl</code> | Yes |
| 4 | OAuth2 Register | IMS | Candidate | <code>RegistrationUrl</code> | Yes |
| 5 | OAuth2 Authorize | Candidate | IMS | <code>AuthorizationUrl</code> | Yes |
| 6 | OAuth2 Authorize | IMS | Candidate | <code>AuthorizationUrl</code> | Yes |
| 7 | OAuth2 Token | Candidate | IMS | <code>TokenUrl</code> | Yes |
| 8 | OAuth2 Token | IMS | Candidate | <code>TokenUrl</code> | Yes |
| 9 | GET Assertions | Candidate | IMS | <code>/assertions</code> | Yes |
| 10 | GET Assertions | IMS | Candidate | <code>/assertions</code> | Yes |
| 11 | POST Assertion | Candidate | IMS | <code>/assertions</code> | Yes |
| 12 | POST Assertion | IMS | Candidate | <code>/assertions</code> | Yes |
| 13 | GET Profile | Candidate | IMS | <code>/profile</code> | Yes |
| 14 | GET Profile | IMS | Candidate | <code>/profile</code> | Yes |
| 15 | POST Profile | Candidate | IMS | <code>/profile</code> | No |
| 16 | POST Profile | IMS | Candidate | <code>/profile</code> | No |

1. GET the <a data-cite="OB-SPEC-21#api-Manifest">Manifest</a> from the IMS conformance testing platform.
2. Provide the candidate platform <a data-cite="OB-SPEC-21#api-Manifest">Manifest</a> to the IMS conformance testing platform when requested.
3. Request the IMS conformance testing platform dynamically register the candidate platform.
4. Dynamically register the IMS conformance testing platform when requested.
5. Request authorization for the IMS conformance testing platform to retrieve assertions and profiles, and optionally offline access on behalf of the test user.
6. Provide authorization to the IMS conformance testing platform for the candidate platform to create assertions and update profiles, and optionally offline access on behalf of the test user.
7. Request an access token and optionally a refresh token from the IMS conformance testing platform in exchange for the authorization code provided in #5.
8. Provide an access token and optionally a refresh token to the IMS conformance testing platform in exchange for the authorization code provided in #6.
9. GET signed and unsigned <a data-cite="OB-SPEC-21#Assertion">Assertions</a> from the <code>/assertions</code> endpoint on the IMS conformance testing platform.
	<aside class="issue">Test paging?</aside>
10. Provide signed and unsigned <a data-cite="OB-SPEC-21#Assertion">Assertions</a> from the <code>/assertions</code> endpoint to the IMS conformance testing platform.
	<aside class="issue">Test paging?</aside>
11. POST a signed or unsigned <a data-cite="OB-SPEC-21#Assertion">Assertion</a> to the <code>/assertions</code> endpoint on the IMS conformance testing platform.
12. Receive a signed or unsigned <a data-cite="OB-SPEC-21#Assertion">Assertion</a> posted to the <code>/assertions</code> endpoint by the IMS conformance testing platform.
13. GET a profile <a data-cite="OB-SPEC-21#Profile"> from the <code>/profile</code> endpoint on the IMS conformance testing platform.
14. Provide a profile <a data-cite="OB-SPEC-21#Profile"> from the <code>/profile</code> endpoint to the IMS conformance testing platform.
15. (Optional) POST a <a data-cite="OB-SPEC-21#Profile"> to the <code>/profile</code> endpoint on the IMS conformance testing platform.
16. (Optional) Receive a <a data-cite="OB-SPEC-21#Profile"> posted to the <code>/profile</code> endpoint by the IMS conformance testing platform.

<div></div>
`;