---
title: Open Badges v2.0 
subtitle: A vocabulary for portable digital credentials developed by IMS Global
show_sidebar: false
---
{::options parse_block_html="true" /}

<div id="top">
<a href="http://www.imsglobal.org"><img src="images/imsglobal-logo.png" alt="IMS Global Logo" id="imslogo" /></a>
</div>

<p class="status">IMS Candidate Final / Public Draft</p>

<h1 class="infoModelTitle">{{page.title}} <br/> IMS Candidate Final / Public Draft</h1>

<br>

<table class="versionTable" title="Version/Release Details">
<tr>
<td>Date Issued:</td>
<td>08 March, 2017</td>
</tr>
<tr>
<td>Status</td>
<td>IMS Candidate Final / Public Draft</td>
</tr>
<tr>
<td>Latest version:</td>
<td><a href="http://www.imsglobal.org/@@@/">http://www.imsglobal.org/@@@/</a></td>
</tr>
</table>

<br>

<div class="iprDistribution">
	
**IPR and Distribution Notices**

Recipients of this document are requested to submit, with their comments, notification of any relevant patent claims or other intellectual property rights of which they may be aware that might be infringed by any implementation of the specification set forth in this document, and to provide supporting documentation.

IMS takes no position regarding the validity or scope of any intellectual property or other rights that might be claimed to pertain to the implementation or use of the technology described in this document or the extent to which any license under such rights might or might not be available; neither does it represent that it has made any effort to identify any such rights. Information on IMS's procedures with respect to rights in IMS specifications can be found at the IMS Intellectual Property Rights web page: [http://www.imsglobal.org/ipr/imsipr_policyFinal.pdf](http://www.imsglobal.org/ipr/imsipr_policyFinal.pdf).

Copyright © 2017 IMS Global Learning Consortium, published under the IMS Global [contributor license agreement](https://www.imsglobal.org/sites/default/files/IMS%20Individual%20Contributor%20License%20Agreement.pdf) and [specification license](https://www.imsglobal.org/speclicense.html). This specification is free for anyone to use or implement.

Permission is granted to all parties to use excerpts from this document as needed in producing requests for proposals.

The limited permissions granted above are perpetual and will not be revoked by IMS or its successors or assigns.

THIS SPECIFICATION IS BEING OFFERED WITHOUT ANY WARRANTY WHATSOEVER, AND IN PARTICULAR, ANY WARRANTY OF NONINFRINGEMENT IS EXPRESSLY DISCLAIMED. ANY USE OF THIS SPECIFICATION SHALL BE MADE ENTIRELY AT THE IMPLEMENTER'S OWN RISK, AND NEITHER THE CONSORTIUM, NOR ANY OF ITS MEMBERS OR SUBMITTERS, SHALL HAVE ANY LIABILITY WHATSOEVER TO ANY IMPLEMENTER OR THIRD PARTY FOR ANY DAMAGES OF ANY NATURE WHATSOEVER, DIRECTLY OR INDIRECTLY, ARISING FROM THE USE OF THIS SPECIFICATION.

Public contributions, comments and questions can be posted here: [https://www.imsglobal.org/forums/ims-glc-public-forums-and-resources/open-badges-community-forum](https://www.imsglobal.org/forums/ims-glc-public-forums-and-resources/open-badges-community-forum).

<p class="endWarranty">The IMS Logo is a trademark of the IMS Global Learning Consortium, Inc. in the United States and/or other countries.</p>

<p class="endWarranty">For more information: [https://www.imsglobal.org/trademarks](https://www.imsglobal.org/trademarks) </p>

_Documents Name: {{page.title}}_

_Revision: 08 March 2017_

</div>

<br/>

<hr/>

#### Status of this Document
<div class="note good-news">
This document is a Candidate Final / Public Draft of the Open Badges 2.0 specification, released on 08 March 2017 by IMS Global Learning Consortium. The specification will be considered final when approved by the IMS Technical Advisory Board and published as Final Release by IMS Global.
</div>

#### Editors  

* [Nate Otto](mailto:nate@ottonomy.net), [Concentric Sky](https://concentricsky.com/)
* [Markus Gylling](mailto:mgylling@imsglobal.org), [IMS Global](http://www.imsglobal.org)

<div id="toc">
	
##  Contents
 * [Introduction](#intro-example)
   - [Linked Data](#LinkedData)
   - [Internationalization and Multilingual Badges](#Internationalization) 
 * [Open Badges Vocabulary](#BadgeObjects)
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
   - [CryptographicKey](#CryptographicKey)
 * [Properties](#Properties)
 * [Profile Identifier Properties](#ProfileIdentifierProperties)
 * [Extensions](#Extensions)
 * [Endorsement](#Endorsement)
 * [Implementation](#implementation)
   - [Badge Baking](#Baking)
   - [Hosted Verification](#HostedBadge)
   - [Signed Verification](#SignedBadge)
 * [History/Changelog](#History)

</div>

## <a id="intro-example"></a> Introduction
This specification describes a method for packaging information about accomplishments, embedding it into portable image files as digital badges, and establishing resources for its validation. It includes term definitions for representations of data in Open Badges. These term definitions appear in the current [JSON-LD context (_v2.0_)](v2/context.json) for the Open Badges Specification.

In other words, Open Badges contain detailed metadata about achievements. Who earned a badge, who issued it, and what does it mean? The data is all inside. A simple example:

{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/assertions/123",
  "type": "Assertion",
  "recipient": {
    "type": "email",
    "identity": "alice@example.org"
  },
  "issuedOn": "2016-12-31T23:59:59+00:00",
  "verification": {
    "type": "hosted"
  },
  "badge": {
    "type": "BadgeClass",
    "id": "https://example.org/badges/5",
    "name": "3-D Printmaster",
    "description": "This badge is awarded for passing the 3-D printing knowledge and safety test.",
    "image": "https://example.org/badges/5/image",
    "criteria": {
      "narrative": "Students are tested on knowledge and safety, both through a paper test and a supervised performance evaluation on live equipment"
    },
    "issuer": {
      "id": "https://example.org/issuer",
      "type": "Profile",
      "name": "Example Maker Society",
      "url": "https://example.org",
      "email": "contact@example.org",
      "verification": {
         "allowedOrigins": "example.org"
      }
    }
  }
}
{% endhighlight %}


### <a id="LinkedData"></a> Open Badges in Linked Data
[Linked Data](https://en.wikipedia.org/wiki/Linked_data) is a method of publishing data so that it can be understood in a variety of contexts. Open Badges are expressed in [JSON-LD](http://json-ld.org/) so that they can include and be included in documents outside the purposes considered in this specification. Open Badges take advantage of JSON-LD's features for internationalization/localization, identifying objects by unique IRIs, and extensibility.

Open Badges are expressed as linked data so that badge resources can be connected. The issuer's Profile in the above example is identified by the "id" `https://example.org/issuer`, which is a URL at which the profile can be discovered. Badge Objects, the instances of the data classes in the Open Badges Vocabulary, can link to one another's hosted URLs or can embed representations of their connected resources for increased portability. See [Linked Data examples](./examples/index.html#LinkedData).


### <a id="Internationalization"></a> Internationalization and Multilingual Badges
Open Badges are used by thousands of issuers around the world, and users of those badges speak many languages. Because Open Badges is a Linked Data vocabulary expressed in JSON-LD, there are some excellent features available to issuers and platforms to use Open Badges in their preferred language. See [String internationalization in JSON-LD](http://json-ld.org/spec/latest/json-ld/#string-internationalization). Issuers can: 

* Declare which language a Badge Object is expressed in using language tags compliant with [BCP47](https://tools.ietf.org/html/bcp47).
* List multiple versions of Badge Objects to make available multiple equivalent versions of the same entity.

Additionally, developers who wish to write code in a language other than English can build a JSON-LD context file in their preferred language and then encounter badge property names familiar to them and their teams.

See [Internationalization Examples](./examples/index.html#Internationalization).


## <a id="BadgeObjects"></a> Open Badges Vocabulary
The Open Badges Vocabulary defines several data classes used to express achievements that is understandable in software and services that implement Open Badges. There are three core data classes: **[Assertions](#Assertion)**, **[BadgeClasses](#BadgeClass)**, and **[Profiles](#Profile)**. A set of one expression of each of these may be constructed into a valid Open Badge. Each data class is a collection of properties and values, and each defines which are mandatory and optional as well as the restrictions on the values those properties may take. They are published as [JSON-LD](http://www.w3.org/TR/json-ld/)] for interoperability. If properties are included in JSON that cannot be mapped to JSON-LD terms defined in the object's `@context`, they are not considered part of the badge object's meaning.

**Extensions**:
 
Each Badge Object may have [additional properties](#additional-properties) beyond those defined here. Some of these additional properties may take the form of an Open Badges Extension, a structure that follows a standard format for collaboratively extending Badge Objects so that any issuer, earner, or consumer can understand the information added to badges. ([More...](#Extensions))

### Assertion <a id="Assertion"></a> ([example](./examples/index.html#Assertion))
Assertions are representations of an awarded badge, used to share information about a badge belonging to one earner. Assertions are packaged for transmission as JSON objects with a set of mandatory and optional properties. Fields marked **in bold letters** are mandatory.

<div class="table-wrapper">

| Property | Expected Type | Description
| -------- | ------------- | -----------
| **id** | IRI | Unique IRI for the Assertion. If using hosted verification, this should be the URI where the assertion is accessible. For signed Assertions, it is recommended to use a UUID in the `urn:uuid` namespace.
| **type** | JSON-LD type | valid JSON-LD representation of the Assertion type. In most cases, this will simply be the string `Assertion`. An array including `Assertion` and other string elements that are either URLs or compact IRIs within the current context are allowed.
| <a id="recipient"></a>**recipient** | [IdentityObject](#IdentityObject) | The recipient of the achievement.
| **badge** | @id: [BadgeClass](#BadgeClass) | IRI or document that describes the type of badge being awarded. If an HTTP/HTTPS IRI The endpoint should be a [BadgeClass](#BadgeClass).
| <a id="verify"></a> **verification** | [VerificationObject](#VerificationObject) | Instructions for third parties to verify this assertion. (Alias "verify" may be used in [context](v2/context.json).)
| <a id="issueDate"></a>**issuedOn** | [DateTime](#dateTime) | Timestamp of when the achievement was awarded.
| image | @id: [Image](#Image) | IRI or document representing an image representing this user's achievement. This must be a PNG or SVG image, and should be prepared via the [Baking specification](./baking/index.html). An 'unbaked' image for the badge is defined in the [BadgeClass](#BadgeClass) and should not be duplicated here.
| <a id="evidence"></a>evidence | @id: [Evidence](#Evidence) | IRI or document describing the work that the recipient did to earn the achievement. This can be a page that links out to other pages if linking directly to the work is infeasible. May be an array of multiple values.
| <a id="narrative"></a>narrative | Text or [Markdown Text](#MarkdownText) | A narrative that connects multiple pieces of evidence. Likely only present at this location if `evidence` is a multi-value array. 
| <a id="expirationDate"></a>expires | [DateTime](#dateTime) | If the achievement has some notion of expiry, this indicates a timestamp when a badge should no longer be considered valid. After this time, the badge should be considered expired.
| revoked  | Boolean       | Defaults to `false` if Assertion is not referenced from a [`revokedAssertions`](#revokedAssertions) list and may be omitted. See [RevocationList](#RevocationList). If `revoked` is true, only `revoked` and `id` are required properties, and many issuers strip a hosted Assertion down to only those properties when revoked.
| revocationReason | Text  | Optional published reason for revocation, if revoked. 

</div>

**Deprecated properties still in use by some implementations**: 

* <a id="uid"></a>uid -- String -- Unique Identifier for the badge. This is expected to be *locally* unique on a per-issuer basis and for hosted badges on a per-origin basis. It may not be necessarily globally unique. `uid` has been replaced by the IRI-based `id` property. It should not be used in v2.0+ Assertions.


### <a id="BadgeClass"></a>BadgeClass ([example](./examples/index.html#BadgeClass))
A collection of information about the accomplishment recognized by the Open Badge. Many assertions may be created corresponding to one BadgeClass

<div class="table-wrapper">

Property | Expected Type | Description
---------|---------------|-----------
**id** | IRI | Unique IRI for the BadgeClass. Most platforms to date can only handle HTTP-based IRIs. Issuers using signed assertions are encouraged to publish BadgeClasses using HTTP IRIs but may instead use ephemeral BadgeClasses that use an `id` in another scheme such as `urn:uuid`.
**type** | JSON-LD type | valid JSON-LD representation of the BadgeClass type. In most cases, this will simply be the string `BadgeClass`. An array including `BadgeClass` and other string elements that are either URLs or compact IRIs within the current context are allowed.
**name** | Text | The name of the achievement.
**description** | Text | A short description of the achievement.
**image** | @id: [Image](#Image) | IRI of an image representing the achievement. May be a [Data URI](http://en.wikipedia.org/wiki/Data_URI_scheme), or URI where the image may be found.
<a id="criteria"></a>**criteria** | @id: [Criteria](#Criteria) | URI or embedded criteria document describing how to earn the achievement.
**issuer** | @id: [Profile](#Profile) | IRI or document describing the individual, entity, or organization that issued the badge.
alignment | Array of [AlignmentObject](#Alignment)s | List of objects describing which objectives or educational standards this badge aligns to, if any.
<a id="tags"></a>tags | Array of Text | List of tags that describe the type of achievement.

</div>


### <a id="Profile"></a><a id="Issuer"></a> Profile ([example](./examples/index.html#Issuer))
A Profile is a collection of information that describes the entity or organization using Open Badges. Issuers must be represented as Profiles, and recipients, endorsers, or other entities may also be represented using this vocabulary. Each Profile that represents an Issuer may be referenced in many BadgeClasses that it has defined. Anyone can create and host an Issuer file to start issuing Open Badges. Issuers may also serve as recipients of Open Badges, often identified within an Assertion by specific properties, like their url or contact email address. An Issuer Profile is a subclass of the general Profile with some additional requirements.

<div class="table-wrapper">

Property | Expected Type | Description
---------|---------------|------------
**id** | IRI | Unique IRI for the Issuer/Profile file. Most platforms to date can only handle HTTP-based IRIs.
**type** | JSON-LD type | Valid JSON-LD representation of the Issuer or Profile type. In most cases, this will simply be the string `Issuer` or the more general `Profile`. An array including `Issuer` and other string elements that are either URLs or compact IRIs within the current context are allowed.
name | Text | The name of the entity or organization.
url | IRI | The homepage or social media profile of the entity, whether individual or institutional. Should be a URL/URI Accessible via HTTP. ([examples](./examples/index.html#SocialMediaUrls)).
telephone | Text | A phone number for the entity. For maximum compatibility, the value should be expressed as a `+` and country code followed by the number with no spaces or other punctuation, like `+16175551212` ([E.164 format](http://en.wikipedia.org/wiki/E.164)).
description | Text | A short description of the issuer entity or organization.
image | [Data URI](http://en.wikipedia.org/wiki/Data_URI_scheme) or URL | An image representing the issuer.
email | Text | Contact address for the individual or organization.
publicKey | @id: [CryptographicKey](#CryptographicKey) | The key(s) an issuer uses to sign Assertions.
verification | [VerificationObject](#VerificationObject) | Instructions for how to verify Assertions published by this Profile.
<a id="revocationList"></a>revocationList | IRI: [RevocationList](#RevocationList) | HTTP URI of the Badge Revocation List used for marking revocation of signed badges.

**A note on required properties**:
When used to represent a recipient of badges, only `id` and `type` are required to enable pseudonymous usage. When used as a badge issuer, the following properties are required:

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
A collection of information allowing an inspector to verify an Assertion. This is used as part of verification instructions in each Assertion but also as an instruction set in an issuer's Profile to describe verification instructions for Assertions the issuer awards.

<div class="table-wrapper">

Property | Expected Type | Description
---------|---------------|-----------
**type** | JSON-LD type  | The type of verification method. Supported values for single assertion verification are `HostedBadge` and `SignedBadge` (aliases in [context](v2/context.json) are available: `hosted` and `signed`). For instances used in Profiles, the type `VerificationObject` should be used.
verificationProperty | @id | The @id of the property to be used for verification that an Assertion is within the allowed scope. Only `id` is supported. Verifiers will consider `id` the default value if `verificationProperty` is omitted or if an issuer Profile has no explicit verification instructions, so it may be safely omitted.
startsWith | URI fragment string | The URI fragment that the verification property must start with. Valid Assertions must have an `id` within this scope. Multiple values allowed, and Assertions will be considered valid if their `id` starts with one of these values.
<a id="allowedOrigins"></a>allowedOrigins | URI origin string | the hostname component of allowed origins. Any `id` URI within one of the allowedOrigins will be considered valid.

`HostedVerification` and `SignedVerification` are subclasses of `VerificationObject`. Future subclasses may be developed to indicate instructions for verifying Assertions using different methods, such as blockchain-based procedures.

#### HostedBadge
Hosted badge Assertions that have an HTTP(s) `id` simply need to declare a verification type of `HostedBadge`, and verification will use the Assertion's `id` property.

#### SignedBadge
Cryptographically signed Assertions need to declare a verification type of `SignedBadge` within the JSON-LD. These badges are typically delivered as JSON Web Signatures (JWSs), so the signature value is outside the Assertion content, wrapping it. However, it may help to identify which publicKey is associated with the signature within the badge, so the `creator` field is available to be used in SignedBadges.

Property | Expected Type | Description
---------|---------------|-----------
**type** | JSON-LD type  | The type of verification method: `SignedBadge` (or legacy alias `signed`).
creator  | @id: [CryptographicKey](#CryptographicKey) | The (HTTP) id of the key used to sign the Assertion. If not present, verifiers will check public key(s) declared in the referenced issuer Profile. If a key is declared here, it must be authorized in the issuer Profile as well. `creator` is expected to be the dereferencable URI of a document that describes a [CryptographicKey](#CryptographicKey).

</div>


### <a id="Evidence"></a>Evidence ([example](./examples/index.html#Evidence))
Descriptive metadata about evidence related to the issuance of an Assertion. Each instance of the Evidence class present in an Assertion corresponds to one entity, though a single entry can describe a set of items collectively. There may be multiple `evidence` entries referenced from an Assertion. The `narrative` property is also in scope of the Assertion class to provide an overall description of the achievement related to the badge in rich text. It is used here to provide a narrative of achievement of the specific entity described.

If both the `description` and `narrative` properties are present, displayers can assume the `narrative` value goes into more detail and is not simply a recapitulation of `description`.

<div class="table-wrapper">

Property | Expected Type | Description
---------|---------------|-----------
type     | JSON-LD Type  | Defaults to [Evidence](#Evidence).
id       | IRI           | The URI of a webpage presenting evidence of achievement. 
narrative | Text or Markdown Text | A narrative that describes the evidence and process of achievement that led to an Assertion.
name     | Text          | A descriptive title of the evidence.
description | Text       | A longer description of the evidence.
genre    | Text          | A string that describes the type of evidence. For example, `Poetry`, `Prose`, `Film`.
audience | Text          | A description of the intended audience for a piece of evidence.

</div>

For evidence that is ephemeral or completely described within an Assertion via use of the Evidence class, if it is necessary to identify this evidence piece uniquely in an overall narrative, an `id` of type `urn:uuid` or otherwise outside the HTTP scheme may be used, but displayers may have less success displaying this usage meaningfully. 


### <a id="Image"></a>Image ([example](./examples/index.html#Image))
Metadata about images that represent Assertions, BadgeClasses or Profiles. These properties can typically be represented as just the `id` string of the image, but using a fleshed-out document allows for including captions and other applicable metadata.

<div class="table-wrapper">

Property | Expected Type | Description
---------|---------------|-----------
type     | JSON-LD Type: [ImageObject](http://schema.org/ImageObject) | Defaults to schema:ImageObject.
**id**   | IRI           | The URI or Data URI of the image.
caption  | Text          | The caption for the image.
author   | @id: Profile  | The author of the image, if desired.

</div>


### <a id="Criteria"></a>Criteria ([example](./examples/index.html#Criteria))
Descriptive metadata about the achievements necessary to be recognized with an `Assertion` of a particular `BadgeClass`. This data is added to the `BadgeClass` so that it may be rendered when that `BadgeClass` is displayed, instead of simply a link to human-readable criteria external to the badge. Embedding criteria allows either enhancement of an external criteria page or increased portability and ease of use by allowing issuers to skip hosting the formerly-required external criteria page altogether. 

Criteria is used to allow would-be recipients to learn what is required of them to be recognized with an `Assertion` of a particular `BadgeClass`. It is also used after the `Assertion` is awarded to a recipient to let those inspecting earned badges know the general requirements that the recipients met in order to earn it.

<div class="table-wrapper">

Property  | Expected Type | Description
----------|---------------|-----------
type      | JSON-LD Type  | Defaults to [Criteria](#Criteria).
id        | IRI           | The URI of a webpage that describes in a human-readable format the criteria for the BadgeClass.
narrative | Text or [Markdown Text](#MarkdownText) | A narrative of what is needed to earn the badge. 

</div>

On the surface `Criteria` is a very simple class, but it enables some powerful use cases, such as using a Markdown-formatted `narrative` to draw the connections between multiple elements in an `alignment` array. The open nature of the Open Badges vocabulary allows experimentation with [extensions](extensions/) in `Criteria` as well, to let the market establish patterns for machine-readable criteria and automatic-awarding badge contracts.


### <a id="Alignment"></a>AlignmentObject
The AlignmentObject is an alias for schema.org's [AlignmentObject](http://schema.org/AlignmentObject) and uses IRIs from that vocabulary. See an [example](./examples/index.html#BadgeClass) as it would appear in a BadgeClass document.

<div class="table-wrapper">

Property | Expected Type | Description
---------|---------------|-----------
**targetName** | Text | Name of the alignment.
**targetUrl** | URL | URL linking to the official description of the alignment target, for example an individual standard within an educational framework.
targetDescription | Text | Short description of the alignment target.
targetFramework | Text | Name of the framework the alignment target.
<a id="targertCode"></a>targetCode | Text | If applicable, a locally unique string identifier that identifies the alignment target within its framework and/or `targetUrl`. 

In order to render displays of alignment within badge services, `targetName` is required. In order to accurately identify targets, `targetUrl` is required. In the event that `targetUrl` cannot be specific enough to identify the item, `targetCode` may be used to indicate specifically which item within the targetUrl is the alignment target.

**Note:** Open badges v1.x used `schema:name`, `schema:description, and `schema:url`. v2.0 updates the AlignmentObject to use the proper linked data IRIs from the Schema.org vocabulary. 
</div>


### <a id="RevocationList"></a>Revocation List ([example](./examples/index.html#RevocationList))
The Revocation List is a document that describes badges an Issuer has revoked that used the `signed` verification method. If you find the badge in the `revokedAssertions` list, it has been revoked. 

An assertion reference may look like `{"id": "https://example.org/1", "revocationReason": "Violation of policy"}` or simply the string `"https://example.org/1"`. A UID-based reference may look like `{"uid": "abc123", "revocationReason": "Awarded in error"}`

<div class="table-wrapper">

Property | Expected Type | Description
---------|---------------|-----------
**type** | JSON-LD Type  | `RevocationList`.
id       | IRI           | The `id` of the RevocationList.
issuer   | IRI: Profile  | The `id` of the Issuer.
<a id="revokedAssertions"></a> **revokedAssertions** | Array of revoked Assertions | An array of string `id` or UID-based identifications of badge objects that have been revoked.

**Revoked Assertions referenced by revokedAssertions array:** Properties from [Assertion](#Assertion) in scope for those that have been revoked. Implementers generally only include these properties, clearing out the values that were in place before revocation. An identifying property must be used, either `id` or (legacy) `uid`. If the issuer does not wish to declare a revocation reason or additional metadata, the `id` of the `Assertion` may be included alone either as a single string entry to the list or in an object that defines an `id` property.

Property | Expected Type | Description
---------|---------------|-----------
type     | JSON-LD Type  | Defaults to `Assertion`. May be omitted.
id       | IRI           | The `id` of the revoked Assertion.
uid      | Text          | Legacy identifier for pre-1.1 badges that did not use an IRI-based `id`.
<a id="revoked"></a> revoked  | Boolean | `true` if the Assertion is revoked. Defaults to true if present in a `revokedAssertions` list and may be omitted.
<a id="revocationReason"></a> revocationReason | Text | The published reason for revocation if desired.

</div>


### <a id="CryptographicKey"></a>CryptographicKey ([example](./examples/index.html#CryptographicKey))
Alias for the [Key](https://web-payments.org/vocabs/security#Key) class from the [W3C Web Payments Community Group Security Vocabulary](https://web-payments.org/vocabs/security). A CryptographicKey document identifies and describes a Key used for signing Open Badges documents. 

For best compatibility with verification procedures, the `Profile` should be hosted at its HTTPS `id` and should identify a `publicKey` by the HTTPS `id` of a `CryptographicKey` document that identifies its issuer by the issuer's `id` using the `owner` property. This allows convenient and robust usage of these `id`s to identify both the issuer and the key used.

<div class="table-wrapper">

Property | Expected Type | Description
---------|---------------|-----------
type     | JSON-LD Type  | `CryptographicKey`.
id       | IRI           | The identifier for the key. Most platforms only support HTTP(s) identifiers.
owner    | IRI: [Profile](#Profile) | The identifier for the Profile that owns this key. There should be a two-way connection between this Profile and the CryptographicKey through the `owner` and `publicKey` properties.
publicKeyPem | Text      | The PEM key encoding is a widely-used method to express public keys, compatible with almost every Secure Sockets Layer library implementation.

</div>

## <a id="Properties"></a>Properties
Below are listed several properties  usable across several Classes. They are optional in all cases.

### related
The `related` property identifies another entity of the same type that should be considered the same for most purposes. It is primarily intended to identify alternate language editions or previous versions of BadgeClasses. See examples: [alternate language versions](./examples/index.html#Internationalization) and [BadgeClass version control](./examples/index.html#badgeclass-version-control)

### version
The `version` property allows issuers to specify a version string or number. It is primarily used to update a BadgeClass without changing the meaning of previously awarded Assertions by duplicating and linking to the previous version. See [example](./examples/index.html#badgeclass-version-control).

<div class="table-wrapper">

Property | Expected Type | Description
---------|---------------|-----------
related  | @id           | Identifies related versions of the entity.
version  | Text or Number | The version identifier for the present edition of the entity.
endorsement | @id: [Endorsement](#Endorsement) | Relevant endorsement(s) that make claims about this entity. Note: As endorsements must be published after the publication of the entity they endorse, it will not always be possible to establish a two-way linkage with this property.

</div>


## <a id="ProfileIdentifierProperties"></a>Profile Identifier Properties
When profiles are referenced elsewhere in the Open Badges Specification, they may be identified precisely by dereferencable id, such as when a BadgeClass links to an issuer Profile by its `id` URL. Other times, such as when identifying the [recipient](#recipient) of an [Assertion](#Assertion), Profiles may be identified by the value of a specific property unique to the individual or organization represented in a Profile. All properties that serve as profile identifiers must have values with a string datatype.

**Properties considered serviceable identifiers include:**

* `email`
* `url`
* `telephone`

Many platforms that allow badge issuers and recipients to establish their identities as Profiles support only `email` (`https://schema.org/email`) as an identifier property.

</div>


## <a id="Extensions"></a><a id="Extension"></a>Extensions

The 1.1 version of the Open Badges Specification introduces Extensions as a means for issuers to add additional metadata to Badge Objects beyond what the standard specifies itself. Additional properties are allowed without using Extensions, but Extensions allow issuers to declare how they are adding information so that it can be understood by others and other issuers can add the same sort of information in a compatible way.

See the [Extensions](./extensions/index.html) page for specific examples and extensions ready to use in Badge Objects.

Extension authors define and host a new [JSON-LD](http://json-ld.org) context file describing all the terms the extension covers. These context files may further define any [JSON-schema](http://json-schema.org/) that implementations of the extension should pass. If used, each schema is linked from the context and hosted as a separate JSON-schema files. Extensions are implemented in Open Badges as JSON objects inside an Assertion, BadgeClass or Issuer with their own link to the extension context and declaration of type.

<div class="table-wrapper">

Property | Expected Type | Description
--------|------------|-----------
**@context** | URL | JSON-LD context file shared among all implementations of the extension.
**type** | array of IRIs | IRIs or compact IRIs within the OBI or extension context that describe the type of data contained in the extension. These are used to map optional JSON-schema validation to the extension. Must include 'extension' as one element.
\*anyProperties | Any | Any property names defined in the extension context may be used with any valid JSON value. 

</div>

An extension value should be included as a JSON object containing the `@context` and `@type` properties and any new properties whose names are mapped in the context file referenced by `@context`. 

The property name for the extension should map to an IRI within the `@context` defined at the root of the extended Badge Object. It is possible to use a fully qualified IRI (e.g. `http://example.org/newBadgeExtension`) or a compact IRI within the extension namespace defined in the [OBI context](./v2/context.json), like `extension:newBadgeExtension`. In either case, the IRI should correspond to where a human-readable definition of the extension resides. For extensions using the `extension` namespace, this definition may be contributed to the community [extensions repository](./extensions/index.html) on this site.

See [example extensions](./extensions/index.html).

### Extension Validation <a id="validation"></a>

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

Validators using the TypeValidation method match the schema indicated by the validator's `validationSchema` property against a JSON badge object document or portion of such a document that matches the validator's `validatesType` JSON-LD `type`.

<div class="table-wrapper">

Property | Expected Type | Description/expected value
--------|------------|-----------
**type** | string/compact IRI | `TypeValidation`.
**validatesType** | string/compact IRI | Valid JSON-LD type for a badge component, such as `Assertion`, `extensions:ApplyLink`, or `https://w3id.org/openbadges/extensions#ApplyLink`. Compact forms preferred.
**validationSchema** | URL | Location of a hosted JSON-schema.

</div>

#### <a id="FrameValidation"></a> Frame Validation
_status: proposed_
Validators that someday use the proposed FrameValidation method pass JSON-LD objects through the JSON-LD Frame indicated by the `validationFrame` property and test the result against the JSON-schema indicated by the validator's `validationSchema` property.


## <a id="Endorsement"></a>Endorsement ([example](./examples/index.html#Endorsement))
Open Badges are trustworthy records of achievement. The vocabulary defined above, combined with the validation and verification procedures for badge Assertions, establish Open Badges as a reliable method for expressing and verifying achievements online. However, these procedures don't answer questions like, "Who trusts this BadgeClass to be a good certification of the competency it describes?" or, "Is this Profile's email address verified?" For these questions, there is Endorsement.

Endorsement leans on the Verifiable Claims work prototyped by members of the [Verifiable Claims Task Force](https://w3c.github.io/vctf/) at the [W3C](https://www.w3.org/) and the theoretical backing developed by the 2014 Endorsement Working Group. See [Endorsement Framework Paper](https://docs.google.com/document/d/1VVf19d72KmGMh1ywrLe7HCKEOqGSI0WjvwfGN_8Q2M4/edit#heading=h.xyxfmzqz2vqb).

The `Endorsement` Class is very similar to `Assertion`, except that there is no defined `badge` property. Instead, a `claim` property allows endorsers to make specific claims about other `Profiles`, `BadgeClasses`, or `Assertions`.

<div class="table-wrapper">

Property | Expected Type | Description/expected value
---------|---------------|-----------
**id**   | IRI           | Unique IRI for the Endorsement instance. If using hosted verification, this should be the URI where the assertion of endorsement is accessible. For signed Assertions, it is recommended to use a UUID in the urn:uuid namespace.
**type** | JSON-LD Type  | `Endorsement`, a subclass of VCTF's Credential.
**claim**    | @id           | An entity, identified by an `id` and additional properties that the endorser would like to claim about that entity.
**issuer** | @id: Profile | The profile of the Endorsement's issuer.
**issuedOn** | [DateTime](#dateTime) | Timestamp of when the endorsement was published.
**verification** | [VerificationObject](#VerificationObject) | Instructions for third parties to verify this assertion of endorsement.

</div>

Within the `claim` property, the endorsed entity may be of any type (though only Open Badges Vocabulary classes are expected to be understood by Open Badges-specific tools. While `Endorsement` is a very flexible data structure, its usefulness will be limited not by the creativity of endorsers, but by the ability for other tools to discover and understand those endorsements.

There is one special property for use in endorsement, the `endorsementComment`, which allows endorsers to make a simple claim in writing about the entity.

<div class="table-wrapper">

Property | Expected Type | Description/expected value
---------|---------------|-----------
<a id="endorsementComment"></a>endorsementComment | Text or [Markdown](#MarkdownText) | An endorser's comment about the quality or fitness of the endorsed entity.

</div>

Endorsements use the `claim` property to identify another entity by its `id` and declare properties about it. For example, the following allows an issuer to offer their own claim that an email address belongs to the profile identified as `https://otherissuer.example/1` and make a comment about the quality of their badges.
{% highlight json %}
{
 "@context": "https://w3id.org/openbadges/v2",
 "type": "Endorsement",
 "id": "https://example.org/assertions/123",
 "issuer": "https://example.org/issuer",
 "claim": {
   "id": "https://otherissuer.example/1",
   "email": "contact@otherissuer.example",
   "endorsementComment": "A great provider of badged learning."
 },
 "verification": {
   "type": "hosted"
 }
}
{% endhighlight %}
See more examples

## Additional Properties

Badges consist of sets of claims, properties with values that apply to Profiles, all earners of a badge, or individual badge recipients. Outside of extensions, additional properties may be added to these claim sets so long as they are mapped to an IRI as JSON-LD. For example, publishers of Badge Objects may:

1. Add individual mappings to the Badge Object's context: `"@context":["https://w3id.org/openbadges/v2", {"foo": "http://example.org/foo"}]`
2. Link to additional context files in the Badge Object's context: `"@context":["https://w3id.org/openbadges/v2", "http://example.org/context"]`
3. Add new properties using full IRIs as keys (or with compact IRIs valid in the existing context): `"http://example.org/foo":"bar"` or `"schema:comment":"baz"` where the IRI leads to the vocabulary definition for the term.

Processors should preserve properties that are valid data when rehosting or retransmitting, but it is permissible to perform valid JSON-LD transformations. Such transformations include "expanding", "compacting" and modifying the context. Transformations are assumed to be equivalent if the expanded or normalized RDF value of the new version is semantically equivalent to the expanded value of the original.

If a property would be useful beyond a publisher's internal use, an [Extension](#Extensions) is a recommended way to establish common practice for adding certain sets of information to badge objects.


## Primitive datatypes

* Boolean
* Text
* Array
* <a id="dateTime"></a>DateTime - Open Badges must express timestamps as strings compatible with [ISO 8601](http://en.wikipedia.org/wiki/ISO_8601) guidelines, including the time and a time zone indicator. It is recommended to publish all timestamps in UTC. Previous versions of Open Badges allowed Unix timestamps as integers. Open Badges v2.0 requires string ISO 8601 values with time zone indicators. For example, `2016-12-31T23:59:59+00:00` is a valid ISO 8601 timestamp. It contains the year, month, day, `T` separator, hour number 0-23, minute, optional seconds and decimal microsecond, and a time zone indicator (+/- an offset from UTC or the `Z` designator for UTC).
* URL - Fully qualified URL, including protocol, host, port if applicable, and path. Interpreters are only expected to interpret URLs in either the `http` or `https` schemes.
* IRI - In JSON-LD and Linked Data, IRIs (Internationalized Resource Identifiers) may look like fully qualified URLs or be namespaced within the JSON-LD context to be expanded to a full IRI. The only known supported IRI schemes are `http` and `https`.
* <a id="identityHash"></a>IdentityHash - A hash string preceded by a dollar sign ("$") and the algorithm used to generate the hash. For example: `sha256$28d50415252ab6c689a54413da15b083034b66e5` represents the result of calculating a SHA256 hash on the string "mayze". For more information, see [how to hash & salt in various languages](https://github.com/mozilla/openbadges/wiki/How-to-hash-&-salt-in-various-languages.).
* <a id="MarkdownText"></a> Markdown Text - Text that may contain formatting according to [Markdown syntax](https://daringfireball.net/projects/markdown/syntax). Due to uneven support in displayers, publishers are encouraged to limit usage to simple elements like links, emphasis, and lists. Displayers may choose a subset of Markdown formatting to support or how to render this field. Images and tables may or may not be supported.

# Implementation

## Publishing Badge Objects
Open Badges data is published as JSON-LD documents made up of the above data classes. These link together via use of common identification strings and properties. They rely on other data, including image files that are often hosted on HTTP(s) URIs outside of the JSON-LD documents that describe them.

### Setting Content-Type
Badge Objects encoded in JSON-LD should be served with the `application/ld+json` content type by default. If the request indicates only `application/json` as the `Accept` type, responses should include `application/json` in the response content type. If request is made for `text/html` or other content-type above `application/ld+json` or `application/json`, the requested content-type may be returned.

### <a id="Baking"></a>Badge Baking

Badge assertions may be "baked" into image files as portable credentials. Baking is currently supported for PNG and SVG formats. (See [Baking Specification](./baking/index.html) for implementation)


## Data Validation
Data Validation is a procedure that ensures a cluster of Badge Objects that make up an Open Badge are appropriately published and linked, and that each particular instance of a Badge Object conforms to requirements for its class. Validation of all data class instances used in an Open Badge is a part of badge verification.

Validation includes tests to ensure that:

* All required Badge Objects are appropriately linked and available to the validator with an eventual `200 OK`.
* Any relevant optional Badge Objects that are linked (such as `RevocationList`s) are available.
* Each Badge Object is a valid JSON-LD (Linked Data) document.
* Each Badge Object contains all required properties for its class.
* Each Badge Object contains values of the expected data type for all declared properties defined in the Vocabulary.

The use of the term "eventual 200 OK" is meant to mean that 3xx
redirects are allowed, as long as the request eventually terminates on an appropriate
resource that returns a 200 OK.


## <a id="implementation-verification"></a>Verification
Verification is the process of ensuring the data that makes up an Open Badge is correct for the purpose at hand. It includes a number of data validation checks as well as procedures to ensure the badge is trustworthy. Verification is distinct from Compliance Certification for applications and services that implement the Specification, though verification is typically a component of certification programs.

Verification includes tests to ensure that:

* All Badge Objects pass data validation. See [Data Validation](#data-validation) above.
* All Badge Objects were created by the appropriate issuer `Profile`(s) according to rules declared in their [VerificationObjects](#VerificationObject).
* The `Assertion` was awarded to a valid property value of the expected recipient. (For example, that the `Asssertion` was awarded to a known email address value for `email` type recipient `IdentityObject`.)
* The `Assertion` issuer is authorized to award Assertions of the declared `BadgeClass` (typically by being the issuer of the BadgeClass.)
* The `Assertion` has not expired.
* The `Assertion` has not been revoked by the issuer.

Additional checks may ensure that:

* The issuer Profile awarding the Assertion is trusted to have declared accurate information about its identity (typically via Endorsement).


### <a id="HostedBadge"></a>HostedBadge Verification

A hosted Assertion is a file containing validated `Assertion` data in JSON-LD served with the content-type `application/ld+json` and/or `application/json`. This should be available to anyone who the recipient would like to be able to verify it at a stable URI on your server (for example, `https://example.org/assertions/robotics-badge/123.json`). This URI is the source of truth for the badge, and any verification attempt will request it to make sure the Assertion exists and describes the expected achievement. Redirects are permissible as long as appropriate Assertion content is eventually returned. The hosting application must properly [set the content-type](#setting-content-type).

The Assertion `id` must be within the permitted scope for hosted verification declared in issuer Profile. See [VerificationObject](#VerificationObject). This defaults to requiring the Assertion and BadgeClass to be hosted on the same origin as the issuer Profile `id` if there is no `verification` property declared in the issuer Profile. For domain origins that host multiple applications and websites, `startsWith` path may be used, in which case, the `verificationProperty` (`id`) must start with the value found in the issuer Profile's VerificationObject `startsWith` declaration.

**Steps to verify a hosted badge Assertion**:
Verification of hosted assertions may be performed starting with the verification URL or with a full Assertion instance in hand. If starting with a full assertion that indicates `HostedBadge` verification, the input data should only be trusted to identify the URI of the hosted verification file, and upon loading the hosted verification file, the retrieved data should be used as the Assertion value.


#### Revoking Hosted Assertions ([example](./examples/index.html#revoked-hosted-assertion))
To mark a hosted assertion as revoked, respond with an HTTP Status of `410 Gone`. The response may include an `Assertion` body containing some additional metadata, such as a `revocationReason`, but it is not required to meet all normal property presence requirements. For revoked Assertions, only `id` and `revoked` are required.

If either the `410 Gone` status or a response body declaring `revoked` true is returned, the Assertion should be treated as revoked and thus invalid.

### <a id="SignedBadge"></a>SignedBadge Verification ([example](./examples/index.html#SignedBadge)) 

A signed badge may be published in the form of a [JSON Web Signature](http://self-issued.info/docs/draft-ietf-jose-json-web-signature.html). If so, the JSON representation of the badge assertion should be used as the JWS payload. 

A JWS has three components separated by dots (`.`):
{% highlight html %}
header.payload.signature
{% endhighlight %}

The JSON-LD representation of the `Assertion` should be used as the JWS payload. For compatibility purposes, using RSA-SHA256 is recommended.

The public key corresponding to the private key used to the sign the badge should be publicly accessible via HTTP and specified in the issuer Profile's `publicKey` property. If there are multiple keys declared in the issuer Profile, the Assertion's `VerificationObject` may specify the `id` of the public key that should be used for verification with its `creator` property.

**Steps to verify a JWS-signed badge Assertion**:

1. Base64 decode the JWS payload. This will be a JSON string representation of the badge assertion.
2. Parse the decoded JWS body into a JSON object. If the parsing operation fails, assertion MUST be treated as invalid.
3. Perform data validation on the Assertion and the (embedded or linked) BadgeClass and issuer Profile, as well as any other relevant present data.
4. Determine the correct signing key `id`(s) to test against the signature from the valid issuer Profile and Assertion VerificationObject. Do not trust a key that is not properly linked from the issuer Profile.
5. Perform an HTTP GET request on the trusted keys. If it is impossible to get a usable public key, the Assertion cannot be verified.
6. With each trusted public key, perform a JWS verification on the JWS object. If the verification fails, assertion MUST be treated as invalid.
7. Retrieve the revocation list from the Issuer Profile object if present and ensure the `id` of the badge does not appear in the `revokedAssertions` list. Legacy v1.x badges that lack a `id` property may be identified in this list by their `uid`.
8. If the above steps pass, assertion may be treated as valid.

Other signature suites may be later included in this document if they are investigated and approved.

#### Revoking a Signed Badge

To mark a badge as revoked, add an entry to the resource pointed at by the Issuer Profile `revocationList` URL with the **id** of the Assertion and, optionally, a reason why the badge is being revoked. See an [example](./examples/index.html#RevocationList).


# History <a id="History"></a>
 * [From 1.1 to 2.0](history/2.0.html)
 * [From 1.0 to 1.1](history/1.1.html) 
 * [From 0.5 to 1.0](https://github.com/mozilla/openbadges/wiki/Assertion-Specification-Changes)
 * [Early history of the specification](https://github.com/mozilla/openbadges-backpack/wiki/Assertions/_history)
