---
title: Open Badges Technical Specification
subtitle: A vocabulary for Portable digital credentials developed by IMS Global
show_sidebar: true
---
{::options parse_block_html="true" /}

# {{ page.title }}
This specification describes a method for packaging information about accomplishments, embedding it into portable image files as digital badges, and establishing resources for its validation. 

This specification includes term definitions for representations of data in Open Badges. These term definitions appear in the current [JSON-LD context (_v1.1_)](https://w3id.org/openbadges/v1)  for the Open Badges Standard.

#### Status of this Document
<div class="note good-news">
This document represents a draft in progress for a future version of the Open Badges Specification. The current version of the specification is v1.1 and is available at [openbadgespec.org](https://openbadgespec.org).
</div>

> **Current version of the Open Badges specification: 2.0-draft**
- Published: 31 December 2016.

#### License
[Copyright](http://www.w3.org/Consortium/Legal/ipr-notice#Copyright) © 2014-16 the Contributors to the Open Badges 2.0 Specification, published by the [Badge Alliance](http://badgealliance.org) under the [W3C Community Contributor License Agreement (CLA)](https://www.w3.org/community/about/agreements/cla/). A human-readable [summary](http://www.w3.org/community/about/agreements/cla-deed/) of this license is available. Though the Badge Alliance collaborates with the [W3C Credentials Community Group](http://www.w3.org/community/credentials/) and [W3C Verifiable Claims Task Force](http://w3c.github.io/vctf/), the Open Badges specification is not endorsed as a web standard by the W3C. This specification is free for anyone to use or implement.

**Edited by the [Badge Alliance Standard Working Group](http://www.badgealliance.org/open-badges-standard/)**  
(Contact: [Nate Otto](mailto:nate@badgealliance.org))

As of January 2017, the Open Badges has become an [IMS Global Learning Consortium](https://www.imsglobal.org) web standard. Future versions will be published to this page by IMS Global.

## Contents
 * [Introduction](#intro-example)
   - [Linked Data](#LinkedData) 
 * [Open Badges Vocabulary](#Vocabulary)
 * [Classes](#VocabularyClasses)
   - [Assertion](#Assertion)
   - [BadgeClass](#BadgeClass)
   - [Profile](#Profile) (Issuer)
   - [IdentityObject](#IdentityObject)
   - [VerificationObject](#VerificationObject)
   - [Evidence](#Evidence)
   - [Image](#Image)
   - [Criteria](#Criteria)
   - [AlignmentObject](#Alignment)
   - [RevocationList](#RevocationList)
 * [Profile Identifier Properties](#ProfileIdentifierProperties)
 * [Extensions](#Extensions)
 * [Implementation](#Implementation)
   - [Badge Baking](#Baking)
   - [Hosted Verification](#HostedBadge)
   - [Signed Verification](#SignedBadge)
 * [Other Resources](#OtherResources)
   - [Verification Software](#Validator)
   - [History/Changelog](#History)

## <a id="intro-example"></a> A Simple Example
Open Badges contain detailed metadata about achievements. Who earned a badge, who issued it, and what does it mean? The data is all inside.

{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.com/assertions/123",
  "type": "Assertion",
  "recipient": {
    "type": "email",
    "identity": "alice@example.com"
  },
  "created": "2016-12-31T23:59:59+00:00",
  "verification": {
    "type": "hosted"
  },
  "badge": {
    "type": "BadgeClass",
    "id": "https://example.com/badges/5",
    "name": "3-D Printmaster",
    "description": "This badge is awarded for passing the 3-D printing knowledge and safety test.",
    "image": "https://example.com/badges/5/image",
    "criteria": { "...": "TODO..." },
    "issuer": {
      "id": "https://example.com/issuer",
      "type": "Profile",
      "name": "Example Maker Society",
      "url": "https://example.com",
      "email": "contact@example.com",
      "verification": {
         "TODOhostedScope": "https://"
      }
    }
  }

}
{% endhighlight %}

### Open Badges in Linked Data
[Linked Data](https://en.wikipedia.org/wiki/Linked_data) is a method of publishing data so that it can be understood in a variety of contexts. Open Badges are expressed in [JSON-LD](http://json-ld.org/) so that they can include and be included in documents outside the purposes considered in this specification. Open Badges take advantage of JSON-LD's features for localization, identifying objects by unique IRIs, and extensibility.

Open Badges are expressed as linked data so that badge resources can be connected. The issuer's Profile in the above example is identified by the "id" `https://example.com/issuer`, which is a URL at which the profile can be discovered. Badge Objects, the instances of the data classes in the Open Badges Vocabulary, can link to one another's hosted URLs or can embed representations of their connected resources for increased portability. See [Linked Data examples](./examples/#LinkedData).

## <a id="BadgeObjects"></a> Open Badges Vocabulary
The Open Badges Vocabulary defines several data classes used to express achievements that is understandable in software and services that implement Open Badges. There are three core data classes: **[Assertions](#Assertion)**, **[BadgeClasses](#BadgeClass)**, and **[Profiles](#Profile)**. A set of one expression of each of these may be constructed into a valid Open Badge. Each data class is a collection of properties and values, and each defines which are mandatory and optional as well as the restrictions on the values those properties may take. They are published as [JSON-LD](http://www.w3.org/TR/json-ld/)] for interoperability. If properties are included in JSON that cannot be mapped to JSON-LD terms defined in the object's `@context`, they are not considered part of the badge object's meaning.

**Extensions**:
_since: 1.1_ 
Each Badge Object may have [additional properties](#additional-properties) beyond those defined here. Some of these additional properties may take the form of an Open Badges Extension, a structure that follows a standard format for collaboratively extending Badge Objects so that any issuer, earner, or consumer can understand the information added to badges. ([More...](#Extensions))

### Assertion <a id="Assertion"></a> ([example](./examples/#Assertion))
Assertions are representations of an awarded badge, used to share information about a badge belonging to one earner. Assertions are packaged for transmission as JSON objects with a set of mandatory and optional properties. Fields marked **in bold letters** are mandatory.

<div class="table-wrapper">

| Property | Expected Type | Description |
| -------- | ------------- | ----------- |
| **id** | IRI | Unique IRI for the Assertion. If using hosted verification, this should be the URI where the assertion is accessible. For signed Assertions, it is recommended to use a UUID in the `urn:uuid` namespace.
| **type** | JSON-LD type | valid JSON-LD representation of the Assertion type. In most cases, this will simply be the string `Assertion`. An array including `Assertion` and other string elements that are either URLs or compact IRIs within the current context are allowed.
| <a id="recipient"></a>**recipient** | [IdentityObject](#IdentityObject) | The recipient of the achievement. |
| **badge** | @id: [BadgeClass](#BadgeClass) | IRI or document that describes the type of badge being awarded. If an HTTP/HTTPS IRI The endpoint should be a [BadgeClass](#badgeclass) |
| **verification** | [VerificationObject](#VerificationObject) | Instructions for third parties to verify this assertion. |
| <a id="issueDate"></a>**issuedOn** | [DateTime](#dateTime) | Timestamp of when the achievement was awarded. |
| image | @id: [Image](#Image) | IRI or document representing an image representing this user's achievement. This must be a PNG or SVG image, and should be prepared via the [Baking specification](./baking). An 'unbaked' image for the badge is defined in the [BadgeClass](#BadgeClass) and should not be duplicated here. |
| <a id="evidence"></a>evidence | @id: [Evidence](#Evidence) | IRI or document describing the work that the recipient did to earn the achievement. This can be a page that links out to other pages if linking directly to the work is infeasible. May be an array of multiple values. |
| <a id="narrative"></a>narrative | Text or [Markdown Text](#MarkdownText) | A narrative that connects multiple pieces of evidence. Likely only present at this location if `evidence` is a multi-value array.
| <a id="expirationDate"></a>expires | [DateTime](#dateTime) | If the achievement has some notion of expiry, this indicates a timestamp when a badge should no longer be considered valid. |

</div>

Deprecated properties still in use by some implementations: 

* <a id="uid"></a>uid -- String -- Unique Identifier for the badge. This is expected to be *locally* unique on a per-issuer basis and for hosted badges on a per-origin basis. It may not be necessarily globally unique. `uid` has been replaced by the IRI-based `id` property. It should not be used in v2.0+ Assertions.


### <a id="BadgeClass"></a>BadgeClass ([example](./examples/#BadgeClass))
A collection of information about the accomplishment recognized by the Open Badge. Many assertions may be created corresponding to one BadgeClass

<div class="table-wrapper">

Property | Expected Type | Description
---------|---------------|-----------
**id** | IRI | Unique IRI for the BadgeClass. Most platforms to date can only handle HTTP-based IRIs. Issuers using signed assertions are encouraged to publish BadgeClasses using HTTP IRIs but may instead use ephemeral BadgeClasses that use an `id` in another scheme such as `urn:uuid`.
**type** | JSON-LD type | valid JSON-LD representation of the BadgeClass type. In most cases, this will simply be the string `BadgeClass`. An array including `BadgeClass` and other string elements that are either URLs or compact IRIs within the current context are allowed.
**name** | Text | The name of the achievement.
**description** | Text | A short description of the achievement.
**image** | @id: [Image](#Image) | IRI of an image representing the achievement. May be a [Data URI](http://en.wikipedia.org/wiki/Data_URI_scheme), or URI where the image may be found
<a id="criteria"></a>**criteria** | @id: [Criteria](#Criteria) | URI or embedded criteria document describing how to earn the achievement.
**issuer** | @id: [Profile](#Profile) | IRI or document describing the individual, entity, or organization that issued the badge.
alignment | Array of [AlignmentObject](#Alignment)s | List of objects describing which objectives or educational standards this badge aligns to, if any.
<a id="tags"></a>tags | Array of Text | List of tags that describe the type of achievement.

</div>


### <a id="Profile"></a><a id="Issuer"></a> Profile ([example](./examples/#Issuer))
A Profile is a collection of information that describes the entity or organization using Open Badges. Issuers must be represented as Profiles, and recipients, endorsers, or other entities may also be represented using this vocabulary. Each Profile theat represents an Issuer may be referenced in many BadgeClasses that it has defined. Anyone can create and host an Issuer file to start issuing Open Badges. Issuers may also serve as recipients of Open Badges, often identified within an Assertion by specific properties, like their url or contact email address. An Issuer Profile is a subclass of the general Profile with some additional requirements.

<div class="table-wrapper">

Property | Expected Type | Description
---------|---------------|------------
**id** | IRI | Unique IRI for the Issuer/Profile file. Most platforms to date can only handle HTTP-based IRIs.
**type** | JSON-LD type | Valid JSON-LD representation of the Issuer or Profile type. In most cases, this will simply be the string `Issuer` or the more general `Profile`. An array including `Issuer` and other string elements that are either URLs or compact IRIs within the current context are allowed.
name | Text | The name of the entity or organization.
url | IRI | The homepage or social media profile of the entity, whether individual or institutional. Should be a URL/URI Accessible via HTTP. ([examples](./examples/SocialMediaUrl)).
telephone | Text | A phone number for the entity. For maximum compatibility, the value should be expressed as a `+` and country code followed by the number with no spaces or other punctuation, like `+16175551212` ([E.164 format](http://en.wikipedia.org/wiki/E.164)).
description | Text | A short description of the issuer entity or organization
image | [Data URI](http://en.wikipedia.org/wiki/Data_URI_scheme) or URL | An image representing the issuer
email | Text | Contact address for the individual or organization.
publicKey | PublicKey | TODO Describe Public Key
<a id="revocationList"></a>revocationList | IRI: [RevocationList](#RevocationList) | HTTP URI of the Badge Revocation List used for marking revocation of signed badges.

**A note on required properties**:
When used to represent a recipient of badges, only `id` and `type` are required to enable pseudononymous usage. When used as a badge issuer, the following properties are required:

* `id`
* `type`
* `name`
* `url`
* `email`


### <a id="IdentityObject"></a>IdentityObject
A collection of information about the recipient of a badge.

<div class="table-wrapper">

Property | Expected Type | Description
--------|------------|-----------
**identity** | [identityHash](#identityHash) or Text | Either the hash of the identity or the plaintext value. If it's possible that the plaintext transmission and storage of the identity value would leak personally identifiable information where there is an expectation of privacy, it is strongly recommended that an IdentityHash be used.
<a id="identityType"></a>**type** | property IRI | The property by which the recipient of a badge is identified. This value should be an IRI mapped in the present context. For example, `email` maps to `http://schema.org/email` and indicates that the `identity` of the `IdentityObject` will represent a value of a [Profile's](#Profile) `email` property. Currently the only supported value for many platforms that implement Open Badges is `email`, but other properties are available. See [Profile Identifier Properties](#ProfileIdentifierProperties). 
<a id="hashed"></a>**hashed** | Boolean | Whether or not the `identity` value is hashed.
<a id="salt"></a>salt | Text | If the recipient is hashed, this should contain the string used to salt the hash. If this value is not provided, it should be assumed that the hash was not salted.

</div>


### <a id="VerificationObject"></a>VerificationObject
A collection of information allowing a consumer to authenticate the Assertion.

<div class="table-wrapper">

Property | Expected Type | Description
---------|---------------|-----------
**type** | VerificationType | The type of verification method.
**url**  | URL | If the type is "hosted", this should be a URL pointing to the assertion on the issuer's server. If the type is "signed", this should be a link to the issuer's public key.

</div>


### <a id="Evidence"></a>Evidence
Placeholder for Criteria data class.

<div class="table-wrapper">

Property | Expected Type | Description
---------|---------------|-----------
type     | JSON-LD Type  | Defaults to [Criteria](#Criteria)
id       | IRI           | The URI of a webpage presenting evidence of achievement. 
narrative | Text or Markdown Text | A narrative that describes the evidence of achievement that led to an Assertion.
name     | Text          | A descriptive title of the evidence
description | Text       | A longer description of the evidence.
genre    | Text          | A string that describes the type of evidence. For example, `Poetry`, `Prose`, `Film`
audience | Text          | A description of the intended audience for a piece of evidence.

</div>


### <a id="Image"></a>Image
Metadata about images that represent Assertions, BadgeClasses or Profiles. These properties can typically be represented as just the `id` string of the image, but using a fleshed-out document allows for including captions and other applicable metadata.

<div class="table-wrapper">

Property | Expected Type | Description
---------|---------------|-----------
type     | JSON-LD Type: [ImageObject](http://schema.org/ImageObject) | Defaults to schema:ImageObject
**id**   | IRI           | The URI or Data URI of the image.
caption  | Text          | The caption for the image.
author   | @id: Profile  | The author of the image, if desired.

</div>


### <a id="Criteria"></a>Criteria
Placeholder for Criteria data class.

<div class="table-wrapper">

Property | Expected Type | Description
---------|---------------|-----------
type     | JSON-LD Type  | Defaults to [Criteria](#Criteria)
id       | IRI           | The URI of a webpage that describes in a human-readable format the criteria for the BadgeClass.
narrative | Text or [Markdown Text](#MarkdownText) | A narrative of what is needed to earn the badge. 

</div>

For evidence that is ephemeral or completely described within an Assertion via use of the Evidence class, if it is necessary to identify this evidence piece uniquely in an overall narrative, an `id` of type `urn:uuid` or otherwise outside the HTTP scheme may be used, but displayers may have less success displaying this usage meaningfully. 


### <a id="Alignment"></a>AlignmentObject
The AlignmentObject is based on Schema.org's [AlignmentObject](http://schema.org/AlignmentObject) and uses IRIs from that vocabulary.

<div class="table-wrapper">

Property | Expected Type | Description
--------|------------|-----------
**targetName** | Text | Name of the alignment
**targetUrl** | URL | URL linking to the official description of the alignment target, for example an individual standard within an educational framework
targetDescription | Text | Short description of the alignment target.
targetFramework | Text | Name of the framework the alignment target
<a name="targertCode"></a>targetCode | Text | If applicable, a locally unique string identifier that identifies the alignemnt target within its framework and/or `targetUrl`. 

In order to render displays of alignment within badge services, `targetName` is required. In order to accurately identify targets, `targetUrl` is required. In the event that `targetUrl` cannot be specific enough to identify the item, `targetCode` may be used to indicate specifically which item within the targetUrl is the alignment target.

**Note:** Open badges v1.x used `schema:name`, `schema:description, and `schema:url`. v2.0 updates the AlignmentObject to use the proper linked data IRIs from the Schema.org vocabulary. 
</div>

### <a id="RevocationList"></a>Revocation List
The Revocation List is a document that describes badges an Issuer has revoked that used the `signed` verification method. If you find the badge in the `revoked` list, it has been revoked. An assertion reference may look like `{"id": "https://example.com/1", "revocationReason": "Violation of policy"}`. A UID-based reference may look like `{"uid": "abc123", "revocationReason": "Awarded in error"}`

<div class="table-wrapper">

Property | Expected Type | Description
---------|---------------|-----------
**type** | JSON-LD Type  | `RevocationList`
id       | IRI           | The `id` of the RevocationList
issuer   | IRI: Profile  | The `id` of the Issuer
**revoked** | Array of Assertion references | An array of string `id` or UID-based identifications of badge objects that have been revoked.

</div>

## <a id="ProfileIdentifierProperties"></a>Profile Identifier Properties
When profiles are referenced elsewhere in the Open Badges Specification, they may be identified precisely by dereferencable id, such as when a BadgeClass links to an issuer Profile by its `id` URL. Other times, such as when identifying the [recipient](#recipient) of an [Assertion](#Assertion), Profiles may be identified by the value of a specific property unique to the individual or organization represented in a Profile. All properties that serve as profile identifiers must have values with a string datatype.

**Properties considered servicable identifiers include:**

* `email`
* `url`
* `telephone`

Many platforms that allow badge issuers and recipients to establish their identities as Profiles support only `email` (`https://schema.org/email`) as an identifier property.

</div>


## <a id="Extensions"></a><a id="Extension"></a>Extensions
_since 1.1_

The 1.1 version of the Open Badges Specification introduces Extensions as a means for issuers to add additional metadata to Badge Objects beyond what the standard specifies itself. Additional properties are allowed without using Extensions, but Extensions allow issuers to declare how they are adding information so that it can be understood by others and other issuers can add the same sort of information in a compatible way.

See the [Extensions](./extensions/) page for specific examples and extensions ready to use in Badge Objects.

Extension authors define and host a new [JSON-LD](http://json-ld.org) context file describing all the terms the extension covers. These context files may further define any [JSON-schema](http://json-schema.org/) that implementations of the extension should pass. If used, each schema is linked from the context and hosted as a separate JSON-schema files. Extensions are implemented in Open Badges as JSON objects inside an Assertion, BadgeClass or Issuer with their own link to the extension context and declaration of type.

<div class="table-wrapper">

Property | Expected Type | Description
--------|------------|-----------
**@context** | URL | JSON-LD context file shared among all implementations of the extension.
**type** | array of IRIs | IRIs or compact IRIs within the OBI or extension context that describe the type of data contained in the extension. These are used to map optional JSON-schema validation to the extension. Must include 'extension' as one element.
\*anyProperties | Any | Any property names defined in the extension context may be used with any valid JSON value. 

</div>

An extension value should be included as a JSON object containing the `@context` and `@type` properties and any new properties whose names are mapped in the context file referenced by `@context`. 

The property name for the extension should map to an IRI within the `@context` defined at the root of the extended Badge Object. It is possible to use a fully qualified IRI (e.g. `http://example.org/newBadgeExtension`) or a compact IRI within the extension namespace defined in the [OBI context](./1.1/context.json), like `extension:newBadgeExtension`. In either case, the IRI should correspond to where a human-readable definition of the extension resides. For extensions using the `extension` namespace, this definition may be contributed to the community [extensions repository](./extensions/) on this site.

See [example extensions](./extensions/).

### Extension Validation <a id="validation"></a>
_since 1.1_
Open Badges v1.1 implements an optional JSON-schema based mechanism of ensuring badge objects conform to syntactic requirements of the specification. JSON-schema can ensure that required properties exist and that expected data types are used. From the [context](./v1/context.json)s for badge objects and extensions, a `validation` array may contain links to various JSON-schema against which badge objects may be tested. There are two proposed methods of specifying which component of a badge object should be matched against the JSON-schema validator: TypeValidation and FrameValidation. As of 1.1, only TypeValidation is implemented.

For example, this portion of the current Open Badges context links to a validator for Assertions. It indicates through TypeValidation that it should be run against JSON objects with the JSON-LD type of `Assertion` ([https://w3id.org/openbadges#Assertion]).
{% highlight json %}
{
  ...
  "validation": [
    {
      "type": "TypeValidation",
      "validatesType": "Assertion",
      "validationSchema": "https://openbadgespec.org/v1/schema/assertion.json"
    },
    ...
  ]
}
{% endhighlight %}

#### <a id="TypeValidation"></a>Type Validation 
_since 1.1_
Validators using the TypeValidation method match the schema indicated by the validator's `validationSchema` property against a JSON badge object document or portion of such a document that matches the validator's `validatesType` JSON-LD `type`.

<div class="table-wrapper">

Property | Expected Type | Description/expected value
--------|------------|-----------
**type** | string/compact IRI | `TypeValidation`
**validatesType** | string/compact IRI | Valid JSON-LD type for a badge component, such as `Assertion`, `extensions:ApplyLink`, or `https://w3id.org/openbadges/extensions#ApplyLink`. Compact forms preferred.
**validationSchema** | URL | Location of a hosted JSON-schema

</div>

#### <a id="FrameValidation"></a> Frame Validation
_status: proposed_
Validators that someday use the proposed FrameValidation method pass JSON-LD objects through the JSON-LD Frame indicated by the `validationFrame` property and test the result against the JSON-schema indicated by the validator's `validationSchema` property.


## <a id="additional-properties"></a>Additional Properties

Badges consist of sets of claims, properties with values that apply to Profiles, all earners of a badge, or individual badge recipients. Outside of extensions, additional properties may be added to these claim sets so long as they are mapped to an IRI as JSON-LD. For example, publishers of Badge Objects may:

1. Add individual mappings to the Badge Object's context: `"@context":["https://w3id.org/openbadges/v1", {"foo": "http://example.org/foo"}]`
2. Link to additional context files in the Badge Object's context: `"@context":["https://w3id.org/openbadges/v1", "http://example.org/context"]`
3. Add new properties using full IRIs as keys (or with compact IRIs in the existing context): `"http://example.org/foo":"bar"` or `"schema:comment":"baz"` where the IRI leads to the vocabulary definition for the term.

Processors should preserve properties that are valid data when rehosting or retransmitting, but it is permissible to perform valid JSON-LD transformations. Such transformations include "expanding", "compacting" and modifying the context. Transformations are assumed to be equivalent if the expanded or normalized RDF value of the new version is equivalent to the expanded value of the original.

If a property would be useful beyond a publisher's internal use, an [Extension](#Extensions) is a recommended way to establish common practice for adding certain sets of information to badge objects.


### Primitive datatypes

* Boolean
* Text
* Array
* <a id="dateTime"></a>DateTime - Open Badges must express timestamps as strings compatible with [ISO 8601](http://en.wikipedia.org/wiki/ISO_8601) guidelines, including the time and a time zone indicator. It is recommended to publish all timestamps in UTC. Previous versions of Open Badges allowed Unix timestamps as integers. Open Badges v2.0 requires string ISO 8601 values.
* URL - Fully qualified URL, including protocol, host, port if applicable, and path. Interpreters are only expected to interpret URLs in either the `http` or `https` schemes.
* IRI - In JSON-LD and Linked Data, IRIs (Internationalized Resource Identifiers) may look like fully qualified URLs or be namespaced within the JSON-LD context to be expanded to a full IRI. The only known supported IRI schemes are `http` and `https`.
* <a id="identityHash"></a>IdentityHash - A hash string preceded by a dollar sign ("$") and the algorithm used to generate the hash. For example: `sha256$28d50415252ab6c689a54413da15b083034b66e5` represents the result of calculating a SHA256 hash on the string "mayze". For more information, see [how to hash & salt in various languages](https://github.com/mozilla/openbadges/wiki/How-to-hash-&-salt-in-various-languages.).
* <a name="MarkdownText"></a> Markdown Text - Text that may contain formatting according to [Markdown syntax](https://daringfireball.net/projects/markdown/syntax)

# <a id="Implementation"></a> Implementation


### <a id="Baking"></a>Badge Baking
_since: 0.5_
Badge assertions may be "baked" into image files as portable credentials. Baking is currently supported for PNG and SVG formats. (See [Baking Specification](baking) for implementation)


### <a id="HostedBadge"></a>Hosted Verification
_since: 0.5_
A hosted Assertion is a file containing a well-formatted badge Assertion in JSON-LD served with the content-type `application/ld+json` and/or `application/json`. This should be available to anyone who the recipient would like to be able to verify it at a stable URL on your server (for example, `https://example.org/assertions/robotics-badge/123.json`). This URL is the source of truth for the badge, and any verification attempt will request it to make sure the badge exists and was issued by you. Redirects are permissible as long as appropriate assertion content is  Make sure that you are properly [setting the content-type](./examples/#setting-content-type) to `application/ld+json` by default and when verifiers request that type. It is permissible to respond with `text/html` or other formats if they are requested, as long as a JSON/JSON-LD representation is available.

TODO: Permitted scope for hosted verification declared in Issuer Profile. The Assertion URL must exist in the declared scope for the Assertion to be considered valid.

#### Revoking Hosted Assertions
To mark a hosted assertion as revoked, respond with an HTTP Status of
`410 Gone` and a body of `{"revoked": true}`.


### <a id="SignedBadge"></a>Signed Badges ([example](./examples/#SignedBadge)) 
_since: 1.0_
A signed badge is in the form of a [JSON Web Signature](http://self-issued.info/docs/draft-ietf-jose-json-web-signature.html). Signed badges use the Backpack javascript [issuer API](https://github.com/mozilla/openbadges/wiki/Issuer-API) to pass a signature rather than a URL. The JSON representation of the badge assertion should be used as the JWS payload. 

A JWS has three components separated by dots (`.`):
{% highlight html %}
`JWS header`.`JWS payload`.`JWS signature`
{% endhighlight %}

The JSON-LD representation of the badge assertion should be used as the JWS
payload. For compatibility purposes, using an RSA-SHA256 is highly
recommended.

The public key corresponding to the private key used to the sign the
badge should be publicly accessible via HTTP and specified in the `verify.url`
TODO: Key should be in issuer Profile
property of the badge assertion. (TODO: The key should be specified in the issuer public key declaration...)

#### Revoking a Signed Badge

To mark a badge as revoked, add an entry to the resource pointed at by
the Issuer Profile `revocationList` URL with the **uid** of the
badge and a reason why the badge is being revoked. See an [example](examples/#RevocationList).


## Badge Verification
TODO: Expand on Verification (Ensuring badge was issued by whom and to whom you expect - in terms of recipient properties and issuer profiles at least), contrast with Validation (structural integrity, data class implementation correct). Mention platform Certification?
An assertion will either be raw JSON (hosted assertion) or a JWS object
(signed assertion)

The use of the term "eventual 200 OK" is meant to mean that 3xx
redirects are allowed, as long as the request eventually terminates on a
resource that returns a 200 OK.

### Signed Assertion

1. Unpack the JWS payload. This will be a JSON string representation of
the badge assertion.
2. Parse the JWS body into a JSON object. If the parsing operation
fails, assertion MUST be treated as invalid.
3. Assert structural validity.
4. Extract the `verify.url` property from the JSON object. If their is no
`verify.url` property, or the `verify.url` property does not contain a valid
URL, assertion MUST be treated as invalid. TODO: Replace with instructions for obtaining the public key from the provided issuer profile
5. Perform an HTTP GET request on `verify.url` and store public key. If the
HTTP status is not 200 OK (either directly or through 3xx redirects),
the assertion MUST be treated as invalid.
6. With the public key, perform a JWS verification on the JWS object. If
the verification fails, assertion MUST be treated as invalid.
7. Retrieve the revocation list from the Issuer Profile object if present and
ensure the `id` of the badge does not appear in the list. TODO: deprecated property uid changed to `id`.
8. If the above steps pass, assertion MAY BE treated as valid.

### Hosted Assertion
Verification of hosted assertions may be performed starting with the verification URL or with a full Assertion instance in hand. If starting with a full assertion verfied through a hosted method, the input data should only be trusted to identify the URL of the hosted verification file, and upon loading the hosted verification file, that data should be used as the Assertion value.

1. Perform an HTTP GET request on the `verify.url`. If the HTTP Status
is not eventually 200 OK, assertion MUST BE treated as invalid.
2. Assert structural validity
3. TODO: Describe how to determine that all the hosted URLs in question are within scope declared in the Issuer Profile


## Other Resources <a id="OtherResources"></a>

### Assertion Validator <a id="Validator"></a>
[http://validator.openbadges.org/](http://validator.openbadges.org/)

### Bakery Service <a id="BakeryService"></a>


## History <a id="History"></a>
 * [From 1.0 to 1.1](history/1.1.html) 
 * [From 0.5 to 1.0](https://github.com/mozilla/openbadges/wiki/Assertion-Specification-Changes)
 * [Early history of the specification](https://github.com/mozilla/openbadges-backpack/wiki/Assertions/_history)
