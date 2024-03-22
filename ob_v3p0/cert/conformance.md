var conformance = `

## Conformance and Certification

The goal of 1EdTech certification for Open Badges [[OB-30]] is to ensure interoperable implementations of badging systems that generate and issue digital badges as well as those that host and display badges.

1EdTech certification for Open Badges demands features and capabilities beyond those that are strictly required by the specification. These additional features are defined in this document. The specification is intentionally left very flexible to allow it to be used for many purposes. Gaining this certification is expected to be more difficult than simply meeting the minimum requirements for producing a valid Open Badge.

Certification may be achieved in one or more of the following services:

* Open Badges Issuer
* Open Badges Displayer
* Open Badges Host

The service types and associated certification tests are defined below.

### API categorization

This specification defines a [=RESTful API=] protocol to be implemented by applications serving in the roles of [=Service Consumer=] and [=Service Provider=]. The API uses OAuth 2.0 for authentication and granular resource-based permission scopes.

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





`;