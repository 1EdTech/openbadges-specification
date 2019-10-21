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

<aside class="issue">What is the URL for the Open Badges 2.1 certification suite?</aside>

* Go to the [IMS Conformance Test Suite for Open Badges 2.0](https://www.imsglobal.org/open-badges-certification-suite) and follow the instructions to create and submit an application for conformance certification.

To pass certification, you must take the following steps:

* You must be an IMS Digital Credentials and Badges Alliance Member, an IMS Affiliate Member, or IMS Contributing Member. 
* You must pass all the tests associated with the role you are applying for using the certification suite hosted on the IMS website. The roles and associated tests are specified below. 
* The tests must be completed by a designated representative of the IMS member organization, and you must agree that there is no misrepresentation or manipulation of results in the submitted information.

After IMS reviews your submitted information and notifies you that your application is approved, you can claim certification to Open Badges and display the IMS certified logo on your website and in your software. The [IMS Global Certified Products Directory](https://site.imsglobal.org/certifications) will list your conformance details.

### Issuer Role Conformance

An Open Badges **Issuer** is an application that allows for the creation of <a data-cite="OB-SPEC-21#BadgeClass">BadgeClasses</a> and the subsequent delivery of <a data-cite="OB-SPEC-21#Assertion">Assertions</a> to recipients that conform to the [[[OB-SPEC-21]]]. Beginning with Open Badges 2.0, the candidate platform must issue a valid baked badge per the [[[OB-BAKE-10]]] and demonstrate how the badge is retrieved by the recipient. Beginning with Open Badges 2.1, the candidate platform must support the transimission of a badge using the Badge Connect API.

**Manual Tests**

1. Create a valid baked badge and issue it to the recipient <code>conformance@imsglobal.org</code>.
2. Demonstrate through video the candidate platform's methodology for a recipient to retrieve their badge.

**Automated Tests**

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

An Open Badges **Displayer** is an application that displays verified badges to viewers. Beginning with Open Badges 2.0, the candidate platform must display a minimum set of badge metadata and support viewer-initiated verification of a badge. Beginning with Open Badges 2.1, the candidate platform must be able to retrieve badges using the Badge Connect API.

**Manual Tests**

1. Demonstrate through separate videos that the platform allows viewers of badges to see the following data in three different badges. Note that IMS is not supplying these badges; you will have to supply them yourself.

	**Badge 1**

	1. <a data-cite="OB-SPEC-21#BadgeClass">BadgeClass</a> <code>image</code>, <code>name</code>, <code>description</code>
		* <a data-cite="OB-SPEC-21#Profile">Issuer</a> <code>name</code>
	3. <a data-cite="OB-SPEC-21#Assertion">Assertion</a> <code>issuedOn</code> date
	4. **Neither expired nor revoked**

	**Badge 2**

	1. <a data-cite="OB-SPEC-21#BadgeClass">BadgeClass</a> <code>image</code>, <code>name</code>, <code>description</code>
		* <a data-cite="OB-SPEC-21#Profile">Issuer</a> <code>name</code>
	3. <a data-cite="OB-SPEC-21#Assertion">Assertion</a> <code>issuedOn</code> date
	4. **Expired status** (display of expiration date optional)
	5. Not revoked

	**Badge 3**

	1. <a data-cite="OB-SPEC-21#BadgeClass">BadgeClass</a> <code>image</code>, <code>name</code>, <code>description</code>
		* <a data-cite="OB-SPEC-21#Profile">Issuer</a> <code>name</code>
	3. <a data-cite="OB-SPEC-21#Assertion">Assertion</a> <code>issuedOn</code> date
	4. Not expired
	5. **Revoked status** (display of revocation reason optional)

2. Demonstrate through video that the platform allows viewers of badges to do one or both of the following:

	1. Trigger verification of the badge and retrieve results verifying that the badge assertion is not expired, and not revoked.
	2. Consume pre-existing verification information that includes the results and timestamp of latest verification.

**Automated Tests**

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

An Open Badges **Host** is an application that can aggregate and publicly host <a data-cite="OB-SPEC-21#Assertion">Assertions</a> for recipients. It also supports export of badges at user request. Beginning with Open Badges 2.0, the candidate platform must be able to import all formats of Open Badges as well as prove that badge metadata is not lost upon export of the badge. Beginning with Open Badges 2.1, the candidate platform must be able to send and receive assertions and profiles using the Badge Connect API.

**Manual Tests**

1. Using the artifacts provided below, demonstrate through video the ability to import each of the provided artifacts (baked PNG badge, baked SVG badge, and Assertion URL). Note that the applicant may be required to create a fake account in the candidate platform.
2. Using one of the badge formats provided below, demonstrate through video the full process of importing the badge into your platform, exporting it out of your platform, and then submitting that badge to IMS for diff comparison with the original.

	*Note - the recipient identity in these badges is <code>conformance@imsglobal.org</code>*.

	| Required Badge Format | Use this resource for the demonstrations |
	| --------------------- | ---------------------------------------- |
	| Baked badge (PNG) format | https://openbadgesvalidator.imsglobal.org/SampleResources/OB20-assertion1-conformance.png |
	| Baked badge (SVG) format | https://openbadgesvalidator.imsglobal.org/SampleResources/OB20-assertion-conformance-servicelearning.svg |
	| Assertion URL | https://badges.imsglobal.org/public/assertions/1geQXkWnQnW0BkWcO3jSPA.json?v=2_0 |

**Automated Tests**

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