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

* Go to the [IMS Conformance Test Suite for Open Badges 2.0](https://www.imsglobal.org/open-badges-certification-suite) and follow the instructions to create and submit an application for conformance certification.

To pass certification, you must take the following steps:

* You must be an IMS Digital Credentials and Badges Alliance Member, an IMS Affiliate Member, or IMS Contributing Member. 
* You must pass all the tests associated with the role you are applying for using the certification suite hosted on the IMS website. The roles and associated tests are specified below. 
* The tests must be completed by a designated representative of the IMS member organization, and you must agree that there is no misrepresentation or manipulation of results in the submitted information.

After IMS reviews your submitted information and notifies you that your application is approved, you can claim certification to Open Badges and display the IMS certified logo on your website and in your software. The [IMS Global Certified Products Directory](https://site.imsglobal.org/certifications) will list your conformance details.

### Issuer Role Conformance

An Open Badges **Issuer** is an application that allows for the creation of <a data-cite="OB-20#BadgeClass">BadgeClasses</a> and the subsequent delivery of <a data-cite="OB-20#Assertion">Assertions</a> to recipients that conform to the [[[OB-20]]]. Beginning with Open Badges 2.0, the candidate platform must issue a valid baked badge per the [[[OB-BAKE-10]]] and demonstrate how the badge is retrieved by the recipient.

**Tests**

1. Create a valid baked badge and issue it to the recipient <code>conformance@imsglobal.org</code>.
2. Demonstrate through video the candidate platform's methodology for a recipient to retrieve their badge.

### Displayer Role Conformance

An Open Badges **Displayer** is an application that displays verified badges to viewers. Beginning with Open Badges 2.0, the candidate platform must display a minimum set of badge metadata and support viewer-initiated verification of a badge.

**Tests**

1. Demonstrate through separate videos that the platform allows viewers of badges to see the following data in three different badges. Note that IMS is not supplying these badges; you will have to supply them yourself.

	**Badge 1**

	1. <a data-cite="OB-20#BadgeClass">BadgeClass</a> <code>image</code>, <code>name</code>, <code>description</code>
		* <a data-cite="OB-20#Profile">Issuer</a> <code>name</code>
	3. <a data-cite="OB-20#Assertion">Assertion</a> <code>issuedOn</code> date
	4. **Neither expired nor revoked**

	**Badge 2**

	1. <a data-cite="OB-20#BadgeClass">BadgeClass</a> <code>image</code>, <code>name</code>, <code>description</code>
		* <a data-cite="OB-20#Profile">Issuer</a> <code>name</code>
	3. <a data-cite="OB-20#Assertion">Assertion</a> <code>issuedOn</code> date
	4. **Expired status** (display of expiration date optional)
	5. Not revoked

	**Badge 3**

	1. <a data-cite="OB-20#BadgeClass">BadgeClass</a> <code>image</code>, <code>name</code>, <code>description</code>
		* <a data-cite="OB-20#Profile">Issuer</a> <code>name</code>
	3. <a data-cite="OB-20#Assertion">Assertion</a> <code>issuedOn</code> date
	4. Not expired
	5. **Revoked status** (display of revocation reason optional)

2. Demonstrate through video that the platform allows viewers of badges to do one or both of the following:

	1. Trigger verification of the badge and retrieve results verifying that the badge assertion is not expired, and not revoked.
	2. Consume pre-existing verification information that includes the results and timestamp of latest verification.

### Host Role Conformance

An Open Badges **Host** is an application that can aggregate and publicly host <a data-cite="OB-20#Assertion">Assertions</a> for recipients. It also supports export of badges at user request. Beginning with Open Badges 2.0, the candidate platform must be able to import all formats of Open Badges as well as prove that badge metadata is not lost upon export of the badge.

**Tests**

1. Using the artifacts provided below, demonstrate through video the ability to import each of the provided artifacts (baked PNG badge, baked SVG badge, and Assertion URL). Note that the applicant may be required to create a fake account in the candidate platform.
2. Using one of the badge formats provided below, demonstrate through video the full process of importing the badge into your platform, exporting it out of your platform, and then submitting that badge to IMS for diff comparison with the original.

	*Note - the recipient identity in these badges is <code>conformance@imsglobal.org</code>*.

	| Required Badge Format | Use this resource for the demonstrations |
	| --------------------- | ---------------------------------------- |
	| Baked badge (PNG) format | https://openbadgesvalidator.imsglobal.org/SampleResources/OB20-assertion1-conformance.png |
	| Baked badge (SVG) format | https://openbadgesvalidator.imsglobal.org/SampleResources/OB20-assertion-conformance-servicelearning.svg |
	| Assertion URL | https://badges.imsglobal.org/public/assertions/1geQXkWnQnW0BkWcO3jSPA.json?v=2_0 |

<div></div>
`;