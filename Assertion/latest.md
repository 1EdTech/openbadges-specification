# Open Badges Assertion Specification

## Status of This Document

<!--depends on track for ietf ie standards/ experimental etc http://tools.ietf.org/html/rfc2223#section-5
alternative w3c example http://www.w3.org/TR/json-ld/ - overview of document history, participants etc-->

## Abstract

The Open Badge Infrastructure (OBI) is a set of software tools and specifications for implementing Open Badge applications. The OBI provides a framework for creating, issuing and displaying Open Badges. The Open Badges Assertion Specification defines the structure of an awarded Open Badge. An Open Badges Assertion uses JSON-structured data to describe a specific badge issued to a specific earner. The Assertion content facilitates communicating and verifying the achievement that the badge represents.

## Table of Contents

* [Introduction](#introduction)
* [Conventions Used in this Document](#conventions-used-in-this-document)
* [Intended Audience](#intended-audience)
* [Terminology](#terminology)
* [Concepts](#concepts)
* [Data Model](#data-model)
	* [Badge Assertion](#badge-assertion)
	* [Badge Class](#badge-class)
	* [Issuer Organization](#issuer-organization)
	* [Summary Tables](#summary-tables)
	* [Examples](#examples)
* [Assertion Types](#assertion-types)
	* [Signed Open Badge Structure](#signed-open-badge-structure)
* [Additional Properties](#additional-properties)
* [Issuer Implementations](#issuer-implementations)
	* [Badge Revocation](#badge-revocation)
* [Displayer Implementations](#displayer-implementations)
* [Validation](#validation)
* [History](#history)
* [References](#references)

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

An Open Badge is a digital representation of a skill or achievement, communicated via an image plus JSON data structures. In terms of implementation, there are two types of badge: generic badges which are "earnable" and badges which have actually been awarded to earners. The generic badge is defined using a __Badge Class__, while an awarded badge is defined using a __Badge Assertion__. In this sense, a generic badge can be conceptualized as the template for awarded badges. This connection is implementated by including a link to a __Badge Class__ in each __Badge Assertion__.

People who are awarded Open Badges are referred to as __Earners__. __Earners__ may be awarded badges directly, or through assessment processes involving submission of evidence - the nature of the issuing process is determined by the Issuer.

The people and organizations who award Open Badges are referred to as __Issuers__. Issuing is the technical act of awarding a badge, the implementation of which is creating a __Badge Assertion__.

__Displayers__ of Open Badges are implementers of systems in which awarded badges are presented in digital contexts. __Displayers__ therefore deal with the data in __Badge Assertions__, which is created by __Issuers__. Prior to display, Open Badges can be collected using software tools - some of these referred to as __Backpacks__. __Displayers__ may retrieve the data describing an __Earner's__ badges from a __Backpack__. The __Earner__ should have full control over which badges are publicly visible.

For Open Badges to comprise valuable representations of achievement, they must facilitate verification processes. __Issuers__ should include the information necessary for this verification, while __Displayers__ should use it to check that a badge was awarded by an __Issuer__, to an __Earner__. 

## Data Model

Open Badges define their structures in JSON. Three JSON files make up an awarded badge: 

* [Badge Assertion](#badge-assertion)
* [Badge Class](#badge-class)
* [Issuer Organization](#issuer-organization)

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

A Badge Assertion __must__ include:
* [`uid`](#assertion-uid)
* [`recipient`](#assertion-recipient)
* [`badge`](#assertion-badge)
* [`verify`](#assertion-verify)
* [`issuedOn`](#assertion-issued-on)

A Badge Assertion __may__ include:

* [`image`](#assertion-image)
* [`evidence`](#assertion-evidence)
* [`expires`](#assertion-expires)

The data types and purpose of these properties are as follows.

<a name="assertion-uid"></a>
* `uid : <text>` __required__<br/>
Unique Identifier for the badge assertion. This should be locally unique on a per-origin basis, not globally unique. Badge Issuers should use a unique `uid` value for each Badge Assertion they create (each badge award).

<a name="assertion-recipient"></a>
* `recipient : `[`IdentityObject`](#identity-object) __required__<br/>
Definition of Earner identity.

<a name="assertion-badge"></a>
* `badge : <url>` __required__<br/>
URL of the [Badge Class](#badge-class) describing the badge awarded.

<a name="assertion-verify"></a>
* `verify : `[`VerificationObject`](#verification-object) __required__<br/>
Data to aid badge verification.

<a name="assertion-issued-on"></a>
* `issuedOn : <DateTime>` __required__<br/>
Either an ISO 8601 date or a standard 10-digit Unix timestamp indicating the date of the badge award.

<a name="assertion-image"></a>
* `image : <url>` _optional_<br/>
URL or DataURL for the badge image. This must be a PNG or SVG image, and should have the assertion data baked into it.<br/>
_The Badge Assertion image is distinct from the Badge Class image, which is the same for all awards of a badge - the Badge Assertion image may be baked in which case it is unique to the Badge Assertion._

<a name="assertion-evidence"></a>
* `evidence : <url>` _optional_<br/>
URL of any evidence that the Earner met the requirements for the badge.<br/>
_May be a page linking out to other pages if linking directly to the evidence is infeasible._

<a name="assertion-expires"></a>
* `expires : <DateTime>` _optional_<br/>
A date from which the achievement represented by the badge should be considered invalid.

##### Identity Object

Defines the identity of the Earner awarded this badge.

IdentityObject __must__ contain:

* [`identity`](#identity-object-identity)
* [`type`](#identity-object-type)
* [`hashed`](#identity-object-hashed)

IdentityObject __may__ contain:

* [`salt`](#identity-object-salt)

The purpose and data type for each of these properties follow.

<a name="identity-object-identity"></a>
* `identity : <text>` __required__<br/>
Plain text or hash of identity value. If it's possible that the plain text transmission and storage of the identity value would leak personally identifiable information, a hash should be used. The hash string should be preceded by the algorithm used to generate the hash (e.g. `sha256`) and a dollar sign (`$`).

<a name="identity-object-type"></a>
* `type : <text>` __required__<br/>
The type of identity value - _currently_ __must__ _be "email"_.

<a name="identity-object-hashed"></a>
* `hashed : <boolean>` __required__<br/>
Boolean indicator of whether or not the [`identity`](#identity-object-identity) value is hashed.

<a name="identity-object-salt"></a>
* `salt : <text>` _optional_<br/>
Hashed [`identity`](#identity-object-identity) values may be salted. If the recipient is [hashed](#identity-object-hashed), `salt` should contain the string used to salt the hash. If this value is not provided, it should be assumed that the hash was not salted.

##### Verification Object

Defines the data required to carry out verification on this badge award.

VerificationObject __must__ include:

* [`type`](#verification-object-type)
* [`url`](#verification-object-url)

The purpose and data type for each of these properties follow.

<a name="verification-object-type"></a>
* `type : <text>` __required__<br/>
The type of verification - __must__ _be either "hosted" or "signed"_.

<a name="verification-object-url"></a>
* `url : <url>` __required__<br/>
For "hosted" [type](#verification-object-type) - the URL of the [Badge Assertion](#badge-assertion) JSON.<br/>
For "signed" [type](#verification-object-type) - the URL of the Issuer's public key (corresponding to the private key used to sign the assertion data).

<a name="badge-class"></a>
### Badge Class

A Badge Class is a JSON file describing an Open Badge representing a skill, learning experience or achievement.

#### Properties

A Badge Class __must__ include:
* [`name`](#badge-class-name)
* [`description`](#badge-class-description)
* [`image`](#badge-class-image)
* [`criteria`](#badge-class-criteria)
* [`issuer`](#badge-class-issuer)

A Badge Class __may__ include:

* [`alignment`](#badge-class-alignment)
* [`tags`](#badge-class-tags)

The purpose and data type for each of these properties follow.

<a name="badge-class-name"></a>
* `name : <text>` __required__<br/>
Name of the badge.

<a name="badge-class-description"></a>
* `description : <text>` __required__<br/>
Short description of the badge achievement.

<a name="badge-class-image"></a>
* `image : <url>` __required__<br/>
URL or DataURL of the image for the badge.<br/>
_The Badge Class `image` is the generic image used to represent all awards of the badge as opposed to a baked badge image with a particular Badge Assertion embedded into it - this may be included in a Badge Assertion [`image`](#assertion-image) field._

<a name="badge-class-criteria"></a>
* `criteria : <url>` __required__<br/>
URL of the criteria for earning the badge.<br/>
_If the badge represents an educational achievement, issuers should consider marking up this up with LRMI._

<a name="badge-class-issuer"></a>
* `issuer : <url>` __required__<br/>
URL of the [Issuer Organization](#issuer-organization) for the badge.

<a name="badge-class-alignment"></a>
* `alignment : <[`[`AlignmentObject`](#alignment-object)`]>` _optional_<br/>
Array of objects describing any educational standards the badge aligns to.

<a name="badge-class-tags"></a>
* `tags : <[text]>` _optional_<br/>
Array of text tags describing the type of skill, activity or achievement the badge represents.

##### Alignment Object

Describes an education standard that the badge aligns to.

Badge Class does not require AlignmentObjects - where present, AlignmentObject __must__ include:

* [`name`](#alignment-object-name)
* [`url`](#alignment-object-url)

AlignmentObject __may__ include:

* [`description`](#alignment-object-description)

The purpose and data type for each of these properties follow.

<a name="alignment-object-name"></a>
* `name : <text>` __required__<br/>
Name of the standard aligned to.

<a name="alignment-object-url"></a>
* `url : <url>` __required__<br/>
URL for the official description of the standard aligned to.

<a name="alignment-object-description"></a>
* `description : <text>` _optional_<br/>
Short description of the standard the badge aligns to.

<a name="issuer-organization"></a>
### Issuer Organization

An Issuer Organization is a JSON file describing an Issuer of Open Badges.

#### Properties

An Issuer Organization __must__ include:
* [`name`](#issuer-organization-name)
* [`url`](#issuer-organization-url)

An Issuer Organization __may__ include:

* [`description`](#issuer-organization-description)
* [`image`](#issuer-organization-image)
* [`email`](#issuer-organization-email)
* [`revocationList`](#issuer-organization-revocationlist)

The purpose and data type for each of these properties follow.

<a name="issuer-organization-name"></a>
* `name : <text>` __required__<br/>
The name of the issuing organization.

<a name="issuer-organization-url"></a>
* `url : <url>` __required__<br/>
URL of the issuing organization.

<a name="issuer-organization-description"></a>
* `description : <text>` _optional_<br/>
Short description of the issuing organization.

<a name="issuer-organization-image"></a>
* `image : <url>` _optional_<br/>
URL or DataURL for an image representing the issuing organization.

<a name="issuer-organization-email"></a>
* `email : <text>` _optional_<br/>
Contact email address for somone at the organization.

<a name="issuer-organization-revocationlist"></a>
* `revocationList : <url>` _optional_<br/>
URL for list of revoked badges - _only for signed badges_.<br/>
_The revocationList endpoint should be a JSON representation of an object where the keys are the uids for revoked badge assertions and the values are the reason for revocation._

### Summary Tables

<!--see http://tools.ietf.org/html/rfc2360#section-3.2 for status codes etc-->

<a name="summary-badge-assertion"></a>
__Badge Assertion__

> M - Mandatory<br/>
> O - Optional

| Property | Status | Type |
|:---------|:----------|:----------|
| [`uid`](#assertion-uid) | M | text |
| [`recipient`](#assertion-recipient) | M | [IdentityObject](#summary-identity-object) |
| [`badge`](#assertion-badge) | M | url |
| [`verify`](#assertion-verify) | M | [VerificationObject](#summary-verification-object) |
| [`issuedOn`](#assertion-issuedon) | M | DateTime |
| [`image`](#assertion-image) | O | url |
| [`evidence`](#assertion-evidence) | O | url |
| [`expires`](#assertion-expires) | O | DateTime |

<a name="summary-identity-object"></a>
__IdentityObject__

> M - Mandatory<br/>
> O - Optional

| Property | Status | Type |
|:---------|:----------|:----------|
| [`identity`](#identity-object-identity) | M | text |
| [`type`](#identity-object-type) | M | text |
| [`hashed`](#identity-object-hashed) | M | boolean |
| [`salt`](#identity-object-salt) | O | text |

<a name="summary-verification-object"></a>
__VerificationObject__

> M - Mandatory<br/>
> O - Optional

| Property | Status | Type |
|:---------|:----------|:----------|
| [`type`](#verification-object-type) | M | text |
| [`url`](#verification-object-url) | M | url |

<a name="summary-badge-class"></a>
__Badge Class__

> M - Mandatory<br/>
> O - Optional

| Property | Status | Type |
|:---------|:----------|:----------|
| [`name`](#badge-class-name) | M | text |
| [`description`](#badge-class-description) | M | text |
| [`image`](#badge-class-image) | M | url |
| [`criteria`](#badge-class-criteria) | M | url |
| [`issuer`](#badge-class-issuer) | M | url |
| [`alignment`](#badge-class-alignment) | O | `[`[AlignmentObject](#summary-alignment-object)`]` array |
| [`tags`](#badge-class-tags) | O | `[`text`]` array |

<a name="summary-alignment-object"></a>
__AlignmentObject__

> M - Mandatory<br/>
> O - Optional

| Property | Status | Type |
|:---------|:----------|:----------|
| [`name`](#alignment-object-name) | M | text |
| [`url`](#alignment-object-url) | M | url |
| [`description`](#alignment-object-description) | O | text |

<a name="summary-issuer-organization"></a>
__Issuer Organization__

> M - Mandatory<br/>
> O - Optional

| Property | Status | Type |
|:---------|:----------|:----------|
| [`name`](#issuer-organization-name) | M | text |
| [`url`](#issuer-organization-url) | M | url |
| [`description`](#issuer-organization-description) | O | text |
| [`image`](#issuer-organization-image) | O | url |
| [`email`](#issuer-organization-email) | O | text |
| [`revocationList`](#issuer-organization-revocationlist) | O | url |

### Examples

The three main elements of a badge are: Badge Assertion; Badge Class; Issuer Organization.

The [Badge Assertion](#badge-assertion) may be represented within a hosted JSON file or a JSON Web Signature (JWS). A Badge Assertion describes a badge awarded to an earner:

```json
{
	"uid": "a1b2c3d4e5f6g7",
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

The Badge Assertion links to a [Badge Class](#badge-class) in its `badge` field. This should be a hosted JSON file describing the badge awarded:

```json
{
	"name": "Awesome Robotics Badge",
	"description": "For doing awesome things with robots that people think is pretty great.",
	"image": "https://example.org/robotics-badge.png",
	"criteria": "https://example.org/robotics-badge.html",
	"tags": ["robots", "awesome"],
	"issuer": "https://example.org/organization.json",
	"alignment": [
	{ 
		"name": "CCSS.ELA-Literacy.RST.11-12.3",
		"url": "http://www.corestandards.org/ELA-Literacy/RST/11-12/3",
		"description": "Follow precisely a complex multistep procedure when carrying out experiments, taking measurements, or performing technical tasks; analyze the specific results based on explanations in the text."
	},
	{ 
		"name": "CCSS.ELA-Literacy.RST.11-12.9",
		"url": "http://www.corestandards.org/ELA-Literacy/RST/11-12/9",
		"description": " Synthesize information from a range of sources (e.g., texts, experiments, simulations) into a coherent understanding of a process, phenomenon, or concept, resolving conflicting information when possible."
	}
	]
}
```

The Badge Class includes a link to the [Issuer Organization](#issuer-organization), which describes the issuer of the badge:

```json
{
	"name": "amazing Badge Issuer",
	"image": "https://example.org/logo.png",
	"url": "https://example.org",
	"email": "admin@example.org",
	"revocationList": "https://example.org/revoked.json"
}
```

Issuers using signed badges __may__ define a revocation list JSON file in which previously awarded badges can be revoked (included in the `revocationList` field in the Issuer Organization):

```json
{
 "qp8g1s": "Issued in error",
 "2i9016k": "Issued in error",
 "1av09le": "Honor code violation"
}
```

## Assertion Types

There are two types of Open Badge: Hosted and Signed. In both cases, the assertion involves three sets of JSON: the Badge Assertion; the Badge Class; the Issuer Organization. The difference between hosted and signed badges relates specifically to the Badge Assertion.

In a hosted badge, the Badge Assertion, Badge Class and Issuer Organization are all stored in hosted files, with the three files linked as follows:

* Badge Assertion `badge` field includes the URL of the Badge Class
* Badge Class `issuer` field includes the URL of the Issuer Organization

In a signed badge, these links remain the same, but the Badge Assertion is not stored in a hosted JSON file - it is packaged in a JSON Web Signature (JWS). This may be prepared programmatically within the Issuer system whenever a badge is awarded to an Earner.

The Badge Assertion `verify` `type` field should indicate whether a badge is signed or hosted.

### Signed Open Badge Structure

The structure of the JWS comprising a signed Open Badge is as follows:

```
<encoded JWS header>.<encoded JWS payload>.<encoded JWS signature>
```

The JSON representation of the badge assertion should be used as the JWS payload. An RSA-SHA256 algorithm should be used for signing.

Example (line breaks for display purposes):

```
eyJhbGciOiJSUzI1NiJ9
.
eyJ1aWQiOiJhYmMtMTIzNCIsInJlY2lwaWVudCI6eyJ0eXBlIjoiZW1haWwiLCJoYXNoZWQiOnRydWUsInNhbHQiOiJkZWFkc2VhIiwiaWQiOiJzaGEyNTYkYzdlZjg2NDA1YmE3MWI4NWFjZDhlMmU5NTE2NmM0YjExMTQ0ODA4OWYyZTE1OTlmNDJmZTFiYmE0NmU4NjVjNSJ9LCJpbWFnZSI6Imh0dHBzOi8vZXhhbXBsZS5vcmcvYmV0aHMtcm9ib3QtYmFkZ2UucG5nIiwiZXZpZGVuY2UiOiJodHRwczovL2V4YW1wbGUub3JnL2JldGhzLXJvYm90LXdvcmsuaHRtbCIsImlzc3VlZE9uIjoxMzU5MjE3OTEwLCJiYWRnZSI6Imh0dHBzOi8vZXhhbXBsZS5vcmcvcm9ib3RpY3MtYmFkZ2UuanNvbiIsInZlcmlmeSI6eyJ0eXBlIjoic2lnbmVkIiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLm9yZy9wdWJsaWNLZXkucGVtIn19
.
Liv4CLviFH20_6RciUWf-jrUvMAecxT4KZ_gLHAeT_chrsCvBEE1uwgtwiarIs9acFfMi0FJzrGye6mhdHf3Kjv_6P7BsG3RPkYgK6-5i9uZv4QAIlvfNclWAoWUt4j0_Kip2ftzzWwc5old01nJRtudZHxo5eGosSPlztGRE9G_g_cTj32tz3fG92E2azPmbt7026G91rq80Mi-9c4bZm2EgrcwNBjO0p1mbKYXLIAAkOMuJZ_8S4Go8S0Sg3xC6ZCn03zWuXCP6bdY_jJx2BpmvqC3H55xWIU8p5c9RxI8YifPMmJq8ZQhjld0pl-L8kHolJx7KGfTjQSegANUPg
```

The URL of the public key corresponding to the private key used for signing should be included in the Badge Assertion `verify` `url` field. This allows badge Displayers to verify that a signed badge is legitimate.

## Additional Properties

Additional properties may be included in Open Badges providing they don't clash with the specified properties. **Processors should preserve all properties when rehosting or retransmitting**.

Any additional properties __should__ be namespaced to avoid clashing with future properties. For example, if the issuer at **example.org** wants to add a `foo` property to the assertion, the property name should be `example.org:foo`. This will help prevent unforseen errors should an `foo` property be defined in a later version of the specification.

Discussions regarding extensions to the Open Badge structures can be found here: https://github.com/mozilla/openbadges-discussion/issues/20

## Issuer Implementations

Typically a badge Issuer is responsible for creating the three parts of an Open Badge, as well as deciding who to award badges to. The Issuer __may__ use a single Issuer Organization file for all of the badges they issue. Each Issuer Organization may be included in the `issuer` field for multiple Badge Classes. In turn, each Badge Class may be included in the `badge` field for multiple Badge Assertions.

The Issuer __must__ host JSON resources at publicly accessible stable locations, with the content-type set to `application/json`. Any resources linked from the Open Badge JSON files should also be at stable URLs.

Where signed badges are used, the Issuer must also host the public key corresponding to the private key they use for signing at a stable URL. 

### Badge Revocation

To revoke hosted badges, Issuers __should__ respond to requests on the revoked Badge Assertions with an HTTP Status of `410 Gone` and a body of `{ "revoked":true }`.

To revoke signed badges, the Issuer __should__ host a revocation list JSON file indicating the badges they have revoked, with the Badge Assertion `uid`s as keys adn the reason for revocation as values. The revocation list JSON URL should be included in the Issuer Organization `revocatonList` field.

<!--setting content type examples move to sep doc?-->

## Displayer Implementations

Open Badge Displayers __should__ carry out verification steps prior to presenting awarded badges for output in digital contexts.

To verify a hosted badge, Displayers should:

1. Perform an HTTP GET request on the `verify.url` from the Badge Assertion. If the HTTP Status is not eventually 200 OK, assertion MUST BE treated as invalid.

2. [Assert structural validity](#assert-structural-validity).

To verify a signed badge, Displayers should:

1. Unpack the JWS payload. This will be a JSON string representation of the Badge Assertion.

2. Parse the JSON string into a JSON object. If the parsing operation fails, assertion __must__ be treated as invalid.

3. [Assert structural validity](#assert-structural-validity).

4. Extract the `verify.url` property from the Badge Assertion JSON object. If there is no `verify.url` property, or the `verify.url` property does not contain a valid URL, the badge __must__ be treated as invalid.

5. Perform an HTTP GET request on `verify.url` and store public key. If the HTTP status is not 200 OK (either directly or through 3xx redirects), the badge __must__ be treated as invalid.

6. With the public key, perform a JWS verification on the JWS object. If the verification fails, the badge MUST be treated as invalid.

7. Retrieve the revocation list from the Issuer Organization URL and ensure the `uid` of the badge does not appear in the list.

8. If the above steps pass, assertion __may__ be treated as valid.

<a name="assert-structural-validity"></a>
To assert structural validity, Displayers should ensure the following badge properties:

* `badge`: __must__ be a valid **URL**. An HTTP GET request __must__ be performed on the URL to ensure eventual 200 OK status.
* `recipient`: __must__ be an object
	* `type`: __must__ be a valid type (currently only "email" is supported)
	* `identity`: __must__ be ***text***
	* `hashed` (_optional_): __must__ be ***boolean***
	* `salt` (_optional_): __must__ be ***text***
	* `image` (_optional_): __must__ be a valid ***URL*** or ***Data URL***
* `evidence` (_optional_): __must__ be a valid ***URL***
* `issuedOn` (_optional_): __must__ be a valid ***DateTime***
* `expires` (_optional_): __must__ be a valid ***DateTime***
* `verify`: __must__ be an object
	* `type`: __must__ be either "hosted" or "signed"
	* `url`: must be a ***URL***

## Validation

While verification relates primarily to ensuring that a badge was awarded to an Earner by an Issuer, validation involves checking that the structures and linked resources within a badge are valid.

Assertions can be checked for validity using the validator, via the Web interface:

http://validator.openbadges.org/

..or programmatically:

https://github.com/mozilla/openbadges-validator/

## History

<!--explain working groups etc, in particular explain contentious decisions, "why" as well as "how"-->

## References
