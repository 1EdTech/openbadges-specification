# Open Badges Assertion Specification

## Status of This Document

<!--depends on track for ietf ie standards/ experimental etc http://tools.ietf.org/html/rfc2223#section-5
alternative w3c example http://www.w3.org/TR/json-ld/ - overview of document history, participants etc-->

## Abstract

The Open Badge Infrastructure (OBI) is a set of software tools and specifications for implementing Open Badge applications. The OBI provides a framework for creating, issuing and displaying Open Badges. The Open Badges Assertion Specification defines the structure of an awarded Open Badge. An Open Badges Assertion uses JSON-structured data to describe a specific badge issued to a specific earner. The Assertion content facilitates communicating and verifying the achievement that the badge represents.

## Table of Contents

## Introduction

The Open Badge Infrastructure Assertion specification aims to describe each awarded badge in a way that is open, meaningful and verifiable. An Open Badge Assertion should include all of the information required to understand the award. Each assertion should define these core aspects of a badge award:

* who earned the badge
* what the badge represents
* who issued the badge

This typically includes descriptive information about the achievement, an image and the date of issue. Additionally, an assertion should include the following information to aid client implementations:

* criteria for earning the badge
* verification details for the earner identity and badge award

The Assertion specification defines a series of required and optional properties to fulfill the above aims. Assertions may also include optional information such as evidence, educational standards alignment details and an expiry date.

The purpose of the Assertion specification is to provide a reference for all implementers of Open Badge systems. This primarily means badge issuers and displayers.

___Proposals are currently under discussion regarding extending the Assertion structure and representing objects inline - see these threads:___

* https://github.com/mozilla/openbadges-discussion/issues/20
* https://github.com/mozilla/openbadges-specification/issues/5

<!--explain motivation, applicability - this specification is intended to provide... to be used by... explain what obi spec is http://tools.ietf.org/html/rfc2223#section-7
purpose, intended function, how it fits into context-->

## Conventions Used in This Document

> The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED",  "MAY", and "OPTIONAL" in this document are to be interpreted as described in RFC 2119.

## Intended Audience

This document is intended for the following audiences:

* implementers of badge issuing applications
* implementers of badge displaying applications
* individuals and organizations involved in the Open Badge ecosystem

The primary audience is expected to be software developers, however the specification may also be relevant to designers, administrators and managers associated with Open Badge systems.

The Open Badges Assertion specification relies on JSON syntax, some knowledge of which is required - see [RFC 4627](http://www.ietf.org/rfc/rfc4627.txt) and [JSON.org](http://www.json.org/).

## Terminology

The Open Badges Assertion specification uses the following terms as defined:

<a name="term-badge-assertion"><a>
__Badge Assertion__

A JSON-structured representation of a badge awarded to an earner. An Assertion describes the badge [earner](#term-earner), what the badge represents and the [issuer](#term-issuer). The data items within an Assertion include: a unique ID; the earner (recipient) identity; details of the [badge class](#term-badge-class) (what the award represents); verification data; the date the badge was issued. Assertions can additionally include a range of optional data items and can be [hosted](#term-hosted-badge) or [signed](#term-signed-badge).

<a name="term-assessment"></a>
__Assessment__

In some badging systems, earner [evidence](#term-evidence) is assessed as part of the awarding decision. In such cases, details of the evidence can be included in the Assertion.

<a name="term-award"></a>
__Award__

In the Open Badges ecosystem, the terms "issue" and "award" are synonymous. To award a badge is to [issue](#term-issue) it - this involves the badge [issuer](#term-issuer) creating an Assertion to describe the award.

<a name="term-backpack"></a>
__Backpack__

A Backpack is a software tool through which [earners](#term-earner) can collect Open Badges they have been awarded. Typically a Backpack allows the earner to control visibility of their badges. [Displayers](#term-displayer) may connect to Backpacks to retrieve the data about badges associated with an earner.

<a name="term-badge"></a>
__Badge__

In the context of the OBI, a badge is loosely described as a digital representation of a skill, learning achievement or experience. A badge is represented in digital contexts as an image and some metadata. For the badge to exist within the OBI, this metadata must conform to the Assertion specification.

<a name="term-badge-class"></a>
__Badge Class__

The badge class forms part of an Open Badge Assertion. The badge class describes the badge name, what it represents, the criteria for earning it, the image used to display it, the issuing organization and optionally educational standards it aligns to. A badge class should typically be hosted in a JSON file at a stable URL, with a link to this file included in the badge Assertion for each award of the badge. The badge class file should include a link to the [issuer organization](#term-issuer-organization).

<a name="term-bake"></a>
__Bake, Baking, Baked Badge__

A baked badge is a badge image file with the data for an Assertion embedded into it. The image may be a PNG or SVG file. Baking badges makes them more portable, allowing earners to communicate and display them wherever they choose. Software can extract the Assertion from a baked badge to provide access to the metadata describing the award.

<a name="term-criteria"></a>
__Criteria__

A definition of the requirements for earning a badge. The criteria for a badge are included in the [badge class](#term-badge-class) as a URL.

<a name="term-displayer"></a>
__Displayer__

A badge displayer presents information about public badge awards in a digital context. Badge earners can add their awarded badges to public collections, which displayer implementations can query, typically presenting the information about the badge award alongside its image. Badge displayers need an understanding of the Assertion structure in order to extract and display the relevant data. Badge displayers should [verify](#term-verify) Assertions prior to displaying them to ensure that a particular badge was in fact awarded to the earner claiming it.

<a name="term-earner"></a>
__Earner__

An earner is someone who has been awarded one or more Open Badges. Depending on the badging system, the earner may apply for a badge, supplying supporting evidence. When an issuer awards a badge, they build information about the earner identity into a new badge Assertion.

<a name="term-evidence"></a>
__Evidence__

A badge Assertion may include a URL representing evidence for the badge award. Depending on the badging system, the earner may have submitted this evidence as part of an application process. Typically, the issuer would compared the evidence to the badge [criteria](#term-criteria) in order to make an awarding decision.

<a name="term-hosted-badge"></a>
__Hosted Badge__

A hosted badge is one whose Assertion data is represented using the badge image and three JSON files hosted at stable locations. The component parts of a hosted badge are: the [assertion](#term-badge-assertion); the [badge class](#term-badge-class); the [issuer organization](#term-issuer-organization). The badge Assertion includes a [verification](#term-verify) field in which either a hosted or [signed](#term-signed-badge) type is specified.

<a name="term-issue"></a>
__Issue__

Issuing is the act of awarding a badge to an earner. Typically badge [issuers](#term-issuer) create badges and decide who to award them to. In order to issue a badge within the OBI, an issuer must create a [Badge Assertion](#term-badge-assertion), which may be [hosted](#term-hosted-badge) or [signed](#term-signed-badge).

<a name="term-issuer"></a>
__Issuer__

An issuer is a person or organization (or department within an organization) who/ which awards Open Badges to earners. Typically the issuer is responsible for designing and creating the badge as well as awarding it. The issuer may choose to implement various optional processes in a badging system, such as [assessment](#term-assessment).

<a name="term-issuer-organization"></a>
__Issuer Organization__

The issuer organization is the part of an Open Badge Assertion in which the badge issuer is described. The issuer organization must be included in the [badge class](#term-badge-class) by URL. The URL must return a JSON representation of the issuer, in which fields specify the issuer name and URL, as well as other optional descriptive properties. Typically the issuer organization data will be used to [verify](#term-verify) awarded badges.

<a name="term-metadata"></a>
__Metadata__

In the OBI, metadata is information about badges, badge awards and badge issuers. OBI metadata is defined in JSON as part of the Assertion specification.

<a name="term-obi"></a>
__Open Badge Infrastructure (OBI)__

The OBI is a set of software tools and specifications to support Open Badge systems. These tools provide a framework for issuing, displaying and earning Open Badges within an open ecosystem.

<a name="term-revoke"></a>
__Revoke__

Badge issuers can revoke badges they awarded to earners. In such cases, the [issuer organization](#term-issuer-organization) should include a list of signed badges that have been revoked, and/or provide a revocation response to requests at the original badge assertion URL. Badge displayers should not display revoked badges and should check revocation status during [verification](#term-verify).

<a name="term-signed-badge"></a>
__Signed Badge__

A signed badge has its Assertion data included in a JSON Web Signature (JWS). Typically a signed badge still uses hosted JSON files for the [badge class](#term-badge-class) and [issuer organization](#term-issuer-organization), but the [badge assertion](#term-badge-assertion) JSON is itself packaged as a signature. The badge Assertion includes a [verification](#term-verify) field in which either a hosted or [signed](#term-signed-badge) type is specified.

<a name="term-validate"></a>
__Validate, Validation, Validator__

Validation is the act of checking a badge assertion for structural validity. This includes verifying well-formedness and correctness of data types, as well as ensuring that any resources linked within the assertion are available.

<a name="term-verify"></a>
__Verify, Verification__

Verification is the act of checking that a badge was awarded by the issuer to the earner. Badge displayers should carry out verification on badges before displaying them. Badge issuers should include the information necessary for this verification to be implemented. Verification must be tailored to whether a badge assertion is [signed](#term-signed-badge) or [hosted](#term-hosted-badge).

<!-- 
* _internet terms http://tools.ietf.org/html/rfc1983_
* _concise sections and more detailed sections http://tools.ietf.org/html/rfc2360#section-2.4_
* _concise sections could be badge assertion, badge class etc (brief but with some description), summary tables (v concise), then more detail in implementation sections - primitive types?_
-->

## Concepts

Adopting the OBI involves understanding a range of concepts which refer to existing and well-known real-world objects and activities, but which have specific meanings within the Open Badges ecosystem.

An Open Badge is a digital representation of a skill or achievement, communicated via an image plus JSON data structures. In terms of implementation, there are two types of badge: generic badges which are "earnable" and badges which have actually been awarded to earners. The generic badge is defined using a Badge Class, while an awarded badge is defined using a Badge Assertion. In this sense, a generic badge can be conceptualized as the template for awarded badges. This connection is implementated by including a link to a Badge Class in each Badge Assertion.

People who are awarded Open Badges are referred to as Earners. Earners may be awarded badges directly, or through assessment processes involving submission of evidence - the nature of the issuing process is determined by the Issuer.

The people and organizations who award Open Badges are referred to as Issuers. Issuing is the technical act of awarding a badge, the implementation of which is creating a Badge Assertion.

Displayers of Open Badges are implementers of systems in which awarded badges are presented in digital contexts. Displayers therefore deal with the data in Badge Assertions, which is created by Issuers. Prior to display, Open Badges can be collected using software tools - some of these referred to as Backpacks. Displayers may retrieve the data describing an Earner's badges from a Backpack. The Earner should have full control over which badges are publicly visible.

For Open Badges to comprise valuable representations of achievement, they must facilitate verification processes. Issuers should include the information necessary for this verification, while Displayers should use it to check that a badge was awarded by an Issuer, to an Earner. 

## Data Model

Open Badges define their structures in JSON. Three JSON files make up an awarded badge: 

* Badge Assertion
* Badge Class
* Issuer Organization

These three include JSON objects, arrays and values. The Badge Assertion includes a field for the URL of the Badge Class, while the Badge Class includes a link to the Issuer Organization.

* A Badge Assertion can be associated with one Badge Class.
* A Badge Class can be associated with one or more Badge Assertions.
* A Badge Class can be associated with one Issuer Organization
* An Issuer Organization can be associated with one or more Badge Classes.

As is outlined in the below sections, the values in the Open Badges JSON files include primitive types such as text string, boolean, DateTime and URL, as well as objects and arrays including nested values.

_Proposals to extend the JSON structures are currently under discussion: https://github.com/mozilla/openbadges-discussion/issues/20_

<a name="badge-assertion"></a>
### Badge Assertion

A Badge Assertion is a JSON file or JSON Web Signature (JWS) describing an Open Badge awarded to an Earner.

#### Properties

A Badge Assertion may include the following required and optional properties:

<a name="uid"></a>
* `uid : "<text>"` __required__

Unique Identifier for the badge assertion. This should be locally unique on a per-origin basis, not globally unique. Badge Issuers should use a unique `uid` value for each Badge Assertion they create (each badge award).

<a name="recipient"></a>
* `recipient : `[`IdentityObject`](#identity-object) __required__

Definition of Earner identity.

<a name="assertion-badge"></a>
* `badge : "<url>"` __required__

URL of the [Badge Class](#badge-class) describing the badge awarded.

##### `IdentityObject`

Defines the identity of the Earner awarded this badge using the following properties:

<a name="identity"></a>
* `identity : "<text>"` __required__

Plain text or hash of identity value. If it's possible that the plain text transmission and storage of the identity value would leak personally identifiable information, an hash should be used. Hash string should be preceded by a dollar sign (`$`) and the algorithm used to generate the hash.

<a name="identity-type"></a>
* `type : "<text>"` __required__

The type of identity value - __currently only "email" is supported__.

<a name="hashed"></a>
* `hashed : "<boolean>"` __required__

Boolean indicator of whether or not the `identity` value is hashed.

<a name="salt"></a>
* `salt : "<text>"` _optional_

Hashed `identity` values may be salted. If the recipient is hashed, `salt` should contain the string used to salt the hash. If this value is not provided, it should be assumed that the hash was not salted.

<a name="badge-class"></a>
### Badge Class

<a name="issuer-organization"></a>
### Issuer Organization

#### Summary Tables

<!--see http://tools.ietf.org/html/rfc2360#section-3.2 for status codes etc-->

#### Examples

## Assertion Types

<!--hosted and signed-->

## Additional Properties

## Issuer Implementations

<!--considerations, includes revocation, setting content type-->

## Displayer Implementations

<!--considerations, includes verification-->

## Validation

## History

<!--explain working groups etc, in particular explain contentious decisions, "why" as well as "how"-->

## References

---

An assertion is a representation of an awarded badge. Assertions are used to share information about earned badges, for example via backpacks. An assertion includes information about:

* who earned the badge
* what the badge represents
* who issued the badge

There are two types of assertion: [hosted](#hosted) and [signed](#signed).

## Hosted

A hosted assertion is a file containing a well-formed badge assertion in JSON, served with the content-type `application/json`. This should live at a stable URL on the issuer server (for example, [https://example.org/beths-robotics-badge.json](https://example.org/beths-robotics-badge.json)) - it is the source of truth for the badge and any future verification attempt will hit that URL to make sure the badge exists and was awarded by the issuer.

## Signed

A signed assertion is in the form of a [JSON Web Signature](http://self-issued.info/docs/draft-ietf-jose-json-web-signature.html). The JSON representation of the badge assertion should be used as the JWS payload.

Both hosted and signed assertions can be passed to the Backpack [Issuer API](https://github.com/mozilla/openbadges/blob/development/docs/apis/issuer_api.md) to push badges to the earner's Mozilla Backpack. _Signed badges can be pushed by passing a signature rather than a URL._

## Assertion Specification

Each assertion includes information about the badge award, the badge itself and the issuer who awarded it. This is implemented via the _badge assertion_, _badge class_ and _issuer organization_. See below for a more detailed overview of the structures involved.

### Structures

Fields marked **in bold letters** are mandatory.

### Assertion Data 

_The assertion describes a particular badge awarded to a particular earner._

#### BadgeAssertion

| Property | Status | Expected Type | Description |
| -------- | -------- | ------------- | ----------- |
| **uid** | **required** | Text | Unique Identifier for the badge. This is expected to be **locally** unique on a per-origin basis, not globally unique. |
| **recipient** | **required** | [IdentityObject](#identityobject) | The recipient of the achievement. |
| **badge** | **required** | URL | URL that describes the type of badge being awarded. The endpoint should be a [BadgeClass](#badgeclass) |
| **verify** | **required** | [VerificationObject](#verificationobject) | Data to help a third party verify this assertion. |
| **issuedOn** | **required** | [DateTime](#primitives) | Date that the achievement was awarded. |
| image | _optional_ | [Data URL](http://en.wikipedia.org/wiki/Data_URI_scheme) or URL | URL of an image representing this achievement. This must be a PNG image, and if possible, the image should be prepared via the [Baking specification](https://github.com/mozilla/openbadges-specification/blob/master/Badge-Baking/latest.md). |
| evidence | _optional_ | URL | URL of the work that the recipient did to earn the achievement. This can be a page that links out to other pages if linking directly to the work is infeasible. |
| expires | _optional_ | [DateTime](#primitives) | If the achievment has some notion of expiry, this indicates when a badge should no longer be considered valid. |


#### <a id="identity-object"></a>IdentityObject

| Property | Status | Expected Type | Description |
|--------|--------|------------|-----------|
|**identity** | **required** | [IdentityHash](#primitives) or Text | Either the hash of the identity or the plaintext value. If it's possible that the plaintext transmission and storage of the identity value would leak personally identifiable information, it is strongly recommended that an IdentityHash be used.|
|**type** | **required** | [IdentityType](#primitives) | The type of identity.|
|**hashed** | **required** | Boolean | Whether or not the `id` value is hashed.|
|salt | _optional_ | Text | If the recipient is hashed, this should contain the string used to salt the hash. If this value is not provided, it should be assumed that the hash was not salted.|


#### <a id="verification-object"></a>VerificationObject

| Property | Status | Expected Type | Description |
|--------|--------|------------|-----------|
|**type** | **required** | VerificationType | The type of verification method.|
|**url** | **required** | URL | If the type is "hosted", this should be a URL pointing to the assertion on the issuer's server. If the type is "signed", this should be a link to the issuer's public key.|

### Badge Class Data

_The badge class describes what the badge represents._

#### <a id="badge-class"></a>BadgeClass

| Property | Status | Expected Type | Description |
|--------|--------|------------|-----------|
|**name** | **required** | Text | The name of the achievement.|
|**description** | **required** | Text | A short description of the achievement.|
|**image** | **required** | [Data URL](http://en.wikipedia.org/wiki/Data_URI_scheme) or URL | URL of an image representing the achievement.|
|**criteria** | **required** | URL | URL of the criteria for earning the achievement. If the badge represents an educational achievement, consider marking up this up with [LRMI](http://www.lrmi.net/)|
|**issuer** | **required** | URL | URL of the organization that issued the badge. Endpoint should be an [IssuerOrganization](#issuerorganization)|
|alignment | _optional_ | Array of [AlignmentObjects](#alignmentobject) | List of objects describing which educational standards this badge aligns to, if any.|
|tags | _optional_ | Array of Text | List of tags that describe the type of achievement.|


#### <a id="alignment-object"></a>AlignmentObject 

_AlignmentObject is optional - fields below are required **if** it is included in the BadgeClass._

| Property | Status | Expected Type | Description|
|--------|--------|------------|-----------|
|**name** | **required** | Text | Name of the alignment.|
|**url** | **required** | URL | URL linking to the official description of the standard.|
|description | _optional_ | Text | Short description of the standard.|

### Issuer Data

_The Issuer Organization describes who issued the badge._

#### <a id="issuer-organization"></a>IssuerOrganization

| Property | Status | Expected Type | Description |
|--------|--------|------------|-----------|
|**name** | **required** | Text | The name of the issuing organization.|
|**url** | **required** | URL | URL of the institution.|
|description | _optional_ | Text | A short description of the institution.|
|image | _optional_ | [Data URL](http://en.wikipedia.org/wiki/Data_URI_scheme) or URL | An image representing the institution.|
|email | _optional_ | Text | Contact address for someone at the organization.|
|revocationList | _optional_ | URL |  URL of the Badge Revocation List. The endpoint should be a JSON representation of an object where the keys are the **uid** a revoked badge assertion, and the values are the reason for revocation. This is only necessary for signed badges.|


### <a id="additional-properties"></a>Additional Properties

Additional properties are allowed so long as they don't clash with specified
properties. **Processors should preserve all properties when rehosting or
retransmitting**.

Any additional properties SHOULD be namespaced to avoid clashing with
future properties. For example, if the issuer at **example.org** wants
to add a `foo` property to the assertion, the property name should be
`example.org:foo`. This will help prevent unforseen errors should an
`foo` property be defined in a later version of the specification.

If a property would be useful beyond internal use, proposals for
standardizing can be sent to
[the openbadges-dev mailing list](https://groups.google.com/forum/?fromgroups#!forum/openbadges-dev).

### Primitives

* Boolean
* Text
* Array
* <a id="date-time"></a>DateTime - Either an [ISO 8601](http://en.wikipedia.org/wiki/ISO_8601) date or a standard 10-digit Unix timestamp.
* URL - Fully qualified URL, including protocol, host, port if applicable, and path.
* <a id="identity-type"></a>IdentityType - Type of identity being represented. Currently the only supported value is "email"
* <a id="identity-hash"></a>IdentityHash - A hash string preceded by a dollar sign ("$") and the algorithm used to generate the hash. For example: `sha256$28d50415252ab6c689a54413da15b083034b66e5` represents the result of calculating a SHA256 on the string "mayze". For more information, see [how to hash & salt in various languages](https://github.com/mozilla/openbadges/wiki/How-to-hash-&-salt-in-various-languages.).
* <a id="verification-type"></a>VerificationType - Type of verification. Can be either "hosted" or "signed".

## JSON Examples

Three JSON files are necessary to create a valid assertion:

* _Badge Assertion:_ contains information regarding a specific badge that was awarded to a user, e.g. `https://example.org/beths-robotics-badge.json`:
```json
{
  "uid": "f2c20",
  "recipient": {
    "type": "email",
    "hashed": true,
    "salt": "deadsea",
    "identity": "sha256$c7ef86405ba71b85acd8e2e95166c4b111448089f2e1599f42fe1bba46e865c5"
  },
  "image": "https://example.org/beths-robot-badge.png",
  "evidence": "https://example.org/beths-robot-work.html",
  "issuedOn": 1359217910,
  "badge": "https://example.org/robotics-badge.json",
  "verify": {
    "type": "hosted",
    "url": "https://example.org/beths-robotics-badge.json"
  }
}
```

* _Badge Class:_ contains information about a badge and what it represents, e.g. `https://example.org/robotics-badge.json`:
```json
{
  "name": "Awesome Robotics Badge",
  "description": "For doing awesome things with robots that people think is pretty great.",
  "image": "https://example.org/robotics-badge.png",
  "criteria": "https://example.org/robotics-badge.html",
  "tags": ["robots", "awesome"],
  "issuer": "https://example.org/organization.json",
  "alignment": [
    { "name": "CCSS.ELA-Literacy.RST.11-12.3",
      "url": "http://www.corestandards.org/ELA-Literacy/RST/11-12/3",
      "description": "Follow precisely a complex multistep procedure when carrying out experiments, taking measurements, or performing technical tasks; analyze the specific results based on explanations in the text."
    },
    { "name": "CCSS.ELA-Literacy.RST.11-12.9",
      "url": "http://www.corestandards.org/ELA-Literacy/RST/11-12/9",
      "description": " Synthesize information from a range of sources (e.g., texts, experiments, simulations) into a coherent understanding of a process, phenomenon, or concept, resolving conflicting information when possible."
    }
  ]
}
```

* _Issuer Organization:_ contains information about who issued a badge, e.g. `https://example.org/organization.json`:
```json
{
  "name": "An Example Badge Issuer",
  "image": "https://example.org/logo.png",
  "url": "https://example.org",
  "email": "steved@example.org",
  "revocationList": "https://example.org/revoked.json"
}
```

Signed badges can optionally be accompanied by a __Revocation list__ (also represented in JSON), which defines badges that have been revoked, e.g. `https://example.org/revoked.json`:

```json
{
  "qp8g1s": "Issued in error",
  "2i9016k": "Issued in error",
  "1av09le": "Honor code violation"
}
```

The `uid` for each revoked badge is listed together with the reason for revocation. Displayers are expected to check the revocation list before displaying a badge.

## <a id="implementation"></a> Implementation

### Implementing Hosted Badges

The badge assertion should live at a publicly accessible URL (for
example, `https://example.org/beths-robotics-badge.json`). As an issuer, you should make sure you are properly [setting the content-type](#setting-content-type) to `application/json`.

#### Revoking Hosted Badges

To mark a hosted assertion as revoked, issuers should respond with an HTTP Status of
`410 Gone` and a body of `{"revoked": true}`.

### Implementing Signed Badges

A signed badge assertion should be represented as a
[JSON Web Signature](http://self-issued.info/docs/draft-ietf-jose-json-web-signature.html):

```
<encoded JWS header>.<encoded JWS payload>.<encoded JWS signature>
```

The JSON representation of the badge assertion should be used as the JWS
payload. For compatibility purposes, using an RSA-SHA256 is highly
recommended.

An example, with linebreaks for display purposes:

```
eyJhbGciOiJSUzI1NiJ9
.
eyJ1aWQiOiJhYmMtMTIzNCIsInJlY2lwaWVudCI6eyJ0eXBlIjoiZW1haWwiLCJoYXNoZWQiOnRydWUsInNhbHQiOiJkZWFkc2VhIiwiaWQiOiJzaGEyNTYkYzdlZjg2NDA1YmE3MWI4NWFjZDhlMmU5NTE2NmM0YjExMTQ0ODA4OWYyZTE1OTlmNDJmZTFiYmE0NmU4NjVjNSJ9LCJpbWFnZSI6Imh0dHBzOi8vZXhhbXBsZS5vcmcvYmV0aHMtcm9ib3QtYmFkZ2UucG5nIiwiZXZpZGVuY2UiOiJodHRwczovL2V4YW1wbGUub3JnL2JldGhzLXJvYm90LXdvcmsuaHRtbCIsImlzc3VlZE9uIjoxMzU5MjE3OTEwLCJiYWRnZSI6Imh0dHBzOi8vZXhhbXBsZS5vcmcvcm9ib3RpY3MtYmFkZ2UuanNvbiIsInZlcmlmeSI6eyJ0eXBlIjoic2lnbmVkIiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLm9yZy9wdWJsaWNLZXkucGVtIn19
.
Liv4CLviFH20_6RciUWf-jrUvMAecxT4KZ_gLHAeT_chrsCvBEE1uwgtwiarIs9acFfMi0FJzrGye6mhdHf3Kjv_6P7BsG3RPkYgK6-5i9uZv4QAIlvfNclWAoWUt4j0_Kip2ftzzWwc5old01nJRtudZHxo5eGosSPlztGRE9G_g_cTj32tz3fG92E2azPmbt7026G91rq80Mi-9c4bZm2EgrcwNBjO0p1mbKYXLIAAkOMuJZ_8S4Go8S0Sg3xC6ZCn03zWuXCP6bdY_jJx2BpmvqC3H55xWIU8p5c9RxI8YifPMmJq8ZQhjld0pl-L8kHolJx7KGfTjQSegANUPg
```

The public key corresponding to the private key used to sign the
badge should be publicly accessible and specified in the `verify.url`
property of the badge assertion.

#### Revoking Signed Badges

To mark a badge as revoked, add an entry to the resource pointed at by
the IssuerOrganization `revocationList` URL with the **uid** of the
badge and a reason why the badge is being revoked.

For example, to mark a badge with the uid "abc-1234" as revoked, the
`revocationList` URL would respond with

```json
{"abc-1234" : "Issued in error"}
```

## Badge Verification

An assertion will either be raw JSON (hosted assertion) or a JWS object
(signed assertion)

It is STRONGLY RECOMMENDED that a display implementation
show the `verify.url`, with the origin (protocol, hostname, port if
non-default) highlighted.

The use of the term "eventual 200 OK" is meant to mean that 3xx
redirects are allowed, as long as the request eventually terminates on a
resource that returns a 200 OK.

### Structural Validity

The following overview indicates the requirements for a badge assertion to be considered structurally valid:

* `badge`: must be a valid **URL**. An HTTP GET request MUST BE
  performed on the URL to ensure eventual 200 OK status.
* `recipient`: must be an object
  * `type`: must be a valid type (currently, only "email" is supported)
  * `identity`: must be a **text**
  * `hashed` (optional): must be **boolean**
  * `salt` (optional): must be **text**
* `image` (optional): must be a valid **URL** or **Data URL**.
* `evidence` (optional): must be a valid **URL**
* `issuedOn` (optional): must be a valid [**DateTime**](#primitives)
* `expires` (optional): must be a valid [**DateTime**](#primitives)
* `verify`: must be an object
  * `type`: must be either "hosted" or "signed"
  * `url`: must be a **URL**

#### Signed Assertion

To verify a signed badge assertion:

1. Unpack the JWS payload. This will be a JSON string representation of
the badge assertion.

2. Parse the JSON string into a JSON object. If the parsing operation
fails, assertion MUST be treated as invalid.

3. Assert structural validity.

4. Extract the `verify.url` property from the JSON object. If there is no
`verify.url` property, or the `verify.url` property does not contain a valid
URL, assertion MUST be treated as invalid.

5. Perform an HTTP GET request on `verify.url` and store public key. If the
HTTP status is not 200 OK (either directly or through 3xx redirects),
the assertion MUST be treated as invalid.

6. With the public key, perform a JWS verification on the JWS object. If
the verification fails, assertion MUST be treated as invalid.

7. Retrieve the revocation list from the IssuerOrganization object and
ensure the `uid` of the badge does not appear in the list.

8. If the above steps pass, assertion MAY BE treated as valid.

#### Hosted Assertion

To verify a hosted badge assertion:

1. Perform an HTTP GET request on the `verify.url`. If the HTTP Status
is not eventually 200 OK, assertion MUST BE treated as invalid.

2. Assert structural validity.


## <a id="setting-content-type"></a>Setting Content-Type

In the examples below `badge_assertion` is a native dictionary, hash
or associative array. `badge_assertion_json` is a prepared JSON string.

### PHP
```javascript
// Do this before doing anything that starts a response
header('Content-Type: application/json');
```

### Drupal 6
```javascript
// do not use drupal_json -- it sets the wrong header
drupal_add_http_header('Content-Type', 'application/json');
echo drupal_to_js(badge_assertion);
```
### Drupal 7
```javascript
drupal_json_output(badge_assertion);
```

### Django
```python
HttpResponse(badge_assertion_json, mimetype='application/json')
```

### Rails
```ruby
render :json => badge_assertion
```

### Apache
```apache
# Save your assertions as .json files and add this to your httpd.conf
AddType application/json        json
```

### Nginx
```nginx
# In your server context, add the following:
types {
  applications/json     json;
}
```

## Assertion Validator

Assertions can be checked for validity using the validator, via the Web interface:

[http://validator.openbadges.org/](http://validator.openbadges.org/)

..or programmatically:

[https://github.com/mozilla/openbadges-validator/](https://github.com/mozilla/openbadges-validator/)
