var md = `

## Concepts
This specification describes a method for packaging information about accomplishments, embedding it into portable image files as digital badges, and establishing resources for its validation. It includes term definitions for representations of data in Open Badges. These term definitions appear in the current [[[OB-JSONLD]]] for the Open Badges Specification.

In other words, Open Badges contain detailed metadata about achievements. Who earned a badge, who issued it, and what does it mean? The data is all inside. A simple example:

<pre>
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
</pre>

### Open Badges in Linked Data
[Linked Data](https://en.wikipedia.org/wiki/Linked_data) is a method of publishing data so that it can be understood in a variety of contexts. Open Badges are expressed in [JSON-LD](http://json-ld.org/) so that they can include and be included in documents outside the purposes considered in this specification. Open Badges take advantage of JSON-LD's features for internationalization/localization, identifying objects by unique IRIs, and extensibility.

Open Badges are expressed as linked data so that badge resources can be connected. The issuer's Profile in the above example is identified by the "id" <code>https://example.org/issuer</code>, which is a URL at which the profile can be discovered. Badge Objects, the instances of the data classes in the Open Badges Vocabulary, can link to one another's hosted URLs or can embed representations of their connected resources for increased portability. See <a data-cite="OB-EXAMPLES#open-badges-in-linked-data-0">Linked Data</a> examples.

### Internationalization and Multilingual Badges
Open Badges are used by thousands of issuers around the world, and users of those badges speak many languages. Because Open Badges is a Linked Data vocabulary expressed in JSON-LD, there are some excellent features available to issuers and platforms to use Open Badges in their preferred language. See [String internationalization in JSON-LD](http://json-ld.org/spec/latest/json-ld/#string-internationalization). Issuers can: 

* Declare which language a Badge Object is expressed in using language tags compliant with [[BCP47]].
* List multiple versions of Badge Objects to make available multiple equivalent versions of the same entity.

Additionally, developers who wish to write code in a language other than English can build a JSON-LD context file in their preferred language and then encounter badge property names familiar to them and their teams.

See <a data-cite="OB-EXAMPLES#Internationalization">Internationalization Examples</a>.

### Badge Connect API

Starting with Open Badges 2.1, this specification that adds the Badge Connect API that allows badge recipients to easily move their Assertions between platforms to streamline the experience of earning and using Open Badges. The initial scope for this specification will cover Assertions and Profiles, with potential additions in future versions of other types of data held by applications in the various Open Badges ecosystem roles of Issuer, Displayer, and Host.

## Open Badges Vocabulary
The Open Badges Vocabulary defines several data classes used to express achievements that is understandable in software and services that implement Open Badges. There are three core data classes: **[Assertions](#Assertion)**, **[BadgeClasses](#BadgeClass)**, and **[Profiles](#Profile)**. A set of one expression of each of these may be constructed into a valid Open Badge. Each data class is a collection of properties and values, and each defines which are mandatory and optional as well as the restrictions on the values those properties may take. They are published as [[JSON-LD]] for interoperability. If properties are included in JSON that cannot be mapped to JSON-LD terms defined in the object's <code>@context</code>, they are not considered part of the badge object's meaning.

**Extensions**:
 
Each Badge Object may have [additional properties](#additional-properties) beyond those defined here. Some of these additional properties may take the form of an Open Badges Extension, a structure that follows a standard format for collaboratively extending Badge Objects so that any issuer, earner, or consumer can understand the information added to badges. ([More...](#Extensions))

<h3 id="Assertion">Assertion</h3> (<a data-cite="OB-EXAMPLES#Assertion">example</a>)
Assertions are representations of an awarded badge, used to share information about a badge belonging to one earner. Assertions are packaged for transmission as JSON objects with a set of mandatory and optional properties. Fields marked **in bold letters** are mandatory.

| Property | Expected Type | Description
| -------- | ------------- | -----------
| **id** | IRI | Unique IRI for the Assertion. If using hosted verification, this should be the URI where the assertion is accessible. For signed Assertions, it is recommended to use a UUID in the <code>urn:uuid</code> namespace.
| **type** | JSON-LD type ([Multiple values allowed](#array))| valid JSON-LD representation of the Assertion type. In most cases, this will simply be the string <code>Assertion</code>. An array including <code>Assertion</code> and other string elements that are either URLs or compact IRIs within the current context are allowed.
| <a id="recipient"></a>**recipient** | [IdentityObject](#IdentityObject) | The recipient of the achievement.
| **badge** | @id: [BadgeClass](#BadgeClass) | IRI or document that describes the type of badge being awarded. If an HTTP/HTTPS IRI The endpoint should be a [BadgeClass](#BadgeClass).
| <a id="verify"></a> **verification** | [VerificationObject](#VerificationObject) | Instructions for third parties to verify this assertion. (Alias "verify" may be used in [context](v2/context.json).)
| <a id="issueDate"></a>**issuedOn** | [DateTime](#dateTime) | Timestamp of when the achievement was awarded.
| image | @id: [Image](#Image) | IRI or document representing an image representing this user's achievement. This must be a PNG or SVG image, and should be prepared via the [Baking specification](./baking/index.html). An 'unbaked' image for the badge is defined in the [BadgeClass](#BadgeClass) and should not be duplicated here.
| <a id="evidence"></a>evidence | @id: [Evidence](#Evidence) ([Multiple values allowed](#array)) | IRI or document describing the work that the recipient did to earn the achievement. This can be a page that links out to other pages if linking directly to the work is infeasible. 
| <a id="narrative"></a>narrative | Text or [Markdown Text](#MarkdownText) | A narrative that connects multiple pieces of evidence. Likely only present at this location if <code>evidence</code> is a multi-value array. 
| <a id="expirationDate"></a>expires | [DateTime](#dateTime) | If the achievement has some notion of expiry, this indicates a timestamp when a badge should no longer be considered valid. After this time, the badge should be considered expired.
| revoked  | Boolean       | Defaults to <code>false</code> if Assertion is not referenced from a [<code>revokedAssertions</code>](#revokedAssertions) list and may be omitted. See [RevocationList](#RevocationList). If <code>revoked</code> is true, only <code>revoked</code> and <code>id</code> are required properties, and many issuers strip a hosted Assertion down to only those properties when revoked.
| revocationReason | Text  | Optional published reason for revocation, if revoked. 

**Deprecated properties still in use by some implementations**: 

* <a id="uid"></a>uid -- String -- Unique Identifier for the badge. This is expected to be *locally* unique on a per-issuer basis and for hosted badges on a per-origin basis. It may not be necessarily globally unique. <code>uid</code> has been replaced by the IRI-based <code>id</code> property. It should not be used in v2.0+ Assertions.


<h3 id="BadgeClass">BadgeClass</h3> (<a data-cite="OB-EXAMPLES#BadgeClass">example</a>)
A collection of information about the accomplishment recognized by the Open Badge. Many assertions may be created corresponding to one BadgeClass

Property | Expected Type | Description
---------|---------------|-----------
**id** | IRI | Unique IRI for the BadgeClass. Most platforms to date can only handle HTTP-based IRIs. Issuers using signed assertions are encouraged to publish BadgeClasses using HTTP IRIs but may instead use ephemeral BadgeClasses that use an <code>id</code> in another scheme such as <code>urn:uuid</code>.
**type** | JSON-LD type ([Multiple values allowed](#array))| valid JSON-LD representation of the BadgeClass type. In most cases, this will simply be the string <code>BadgeClass</code>. An array including <code>BadgeClass</code> and other string elements that are either URLs or compact IRIs within the current context are allowed.
**name** | Text | The name of the achievement.
**description** | Text | A short description of the achievement.
**image** | @id: [Image](#Image) | IRI of an image representing the achievement. May be a [Data URI](http://en.wikipedia.org/wiki/Data_URI_scheme), or URI where the image may be found.
<a id="criteria"></a>**criteria** | @id: [Criteria](#Criteria) | URI or embedded criteria document describing how to earn the achievement.
**issuer** | @id: [Profile](#Profile) | IRI or document describing the individual, entity, or organization that issued the badge.
alignment | [AlignmentObject](#Alignment) ([Multiple values allowed](#array))| An object describing which objectives or educational standards this badge aligns to, if any.
<a id="tags"></a>tags | Text ([Multiple values allowed](#array)) | A tag that describes the type of achievement.


<h3 id="Profile">Profile (Issuer)</h3>

(<a data-cite="OB-EXAMPLES#Profile">example</a>)

A Profile is a collection of information that describes the entity or organization using Open Badges. Issuers must be represented as Profiles, and recipients, endorsers, or other entities may also be represented using this vocabulary. Each Profile that represents an Issuer may be referenced in many BadgeClasses that it has defined. Anyone can create and host an Issuer file to start issuing Open Badges. Issuers may also serve as recipients of Open Badges, often identified within an Assertion by specific properties, like their url or contact email address. An Issuer Profile is a subclass of the general Profile with some additional requirements.

Property | Expected Type | Description
---------|---------------|------------
**id** | IRI | Unique IRI for the Issuer/Profile file. Most platforms to date can only handle HTTP-based IRIs.
**type** | JSON-LD type ([Multiple values allowed](#array))| Valid JSON-LD representation of the Issuer or Profile type. In most cases, this will simply be the string <code>Issuer</code> or the more general <code>Profile</code>. An array including <code>Issuer</code> and other string elements that are either URLs or compact IRIs within the current context are allowed.
name | Text | The name of the entity or organization.
url | IRI | The homepage or social media profile of the entity, whether individual or institutional. Should be a URL/URI Accessible via HTTP. (<a data-cite="OB-EXAMPLES#SocialMediaUrls">examples</a>).
telephone | Text | A phone number for the entity. For maximum compatibility, the value should be expressed as a <code>+</code> and country code followed by the number with no spaces or other punctuation, like <code>+16175551212</code> ([E.164 format](http://en.wikipedia.org/wiki/E.164)).
description | Text | A short description of the issuer entity or organization.
image | @id: [Image](#Image) | An image representing the issuer. May be a Data URI, or URI where the image may be found or an instance of the Image class.
email | Text | Contact address for the individual or organization.
publicKey | @id: [CryptographicKey](#CryptographicKey) | The key(s) an issuer uses to sign Assertions.
verification | [VerificationObject](#VerificationObject) | Instructions for how to verify Assertions published by this Profile.
revocationList | IRI: [RevocationList](#RevocationList) | HTTP URI of the Badge Revocation List used for marking revocation of signed badges.

**A note on required properties**:
When used to represent a recipient of badges, only <code>id</code> and <code>type</code> are required to enable pseudonymous usage. When used as a badge issuer, the following properties are required: <code>id</code>, <code>type</code>, <code>name</code>, <code>url</code>, and <code>email</code>.


<h3 id="IdentityObject">IdentityObject</h3>
A collection of information about the recipient of a badge.

Property | Expected Type | Description
--------|------------|-----------
**identity** | [identityHash](#identityHash) or Text | Either the hash of the identity or the plaintext value. If it's possible that the plaintext transmission and storage of the identity value would leak personally identifiable information where there is an expectation of privacy, it is strongly recommended that an IdentityHash be used.
**type** | property IRI | The property by which the recipient of a badge is identified. This value should be an IRI mapped in the present context. For example, <code>email</code> maps to <code>http://schema.org/email</code> and indicates that the <code>identity</code> of the <code>IdentityObject</code> will represent a value of a [Profile's](#Profile) <code>email</code> property. Currently the only supported value for many platforms that implement Open Badges is <code>email</code>, but other properties are available. See [Profile Identifier Properties](#ProfileIdentifierProperties). 
**hashed** | Boolean | Whether or not the <code>identity</code> value is hashed.
salt | Text | If the recipient is hashed, this should contain the string used to salt the hash. If this value is not provided, it should be assumed that the hash was not salted.


<h3 id="VerificationObject">VerificationObject</h3>
A collection of information allowing an inspector to verify an Assertion. This is used as part of verification instructions in each Assertion but also as an instruction set in an issuer's Profile to describe verification instructions for Assertions the issuer awards.

Property | Expected Type | Description
---------|---------------|-----------
**type** | JSON-LD type  ([Multiple values allowed](#array))| The type of verification method. Supported values for single assertion verification are <code>HostedBadge</code> and <code>SignedBadge</code> (aliases in <a data-cite="OB-JSONLD#">context</a>) are available: <code>hosted</code> and <code>signed</code>). For instances used in Profiles, the type <code>VerificationObject</code> should be used.
verificationProperty | @id | The @id of the property to be used for verification that an Assertion is within the allowed scope. Only <code>id</code> is supported. Verifiers will consider <code>id</code> the default value if <code>verificationProperty</code> is omitted or if an issuer Profile has no explicit verification instructions, so it may be safely omitted.
startsWith | URI fragment string | The URI fragment that the verification property must start with. Valid Assertions must have an <code>id</code> within this scope. Multiple values allowed, and Assertions will be considered valid if their <code>id</code> starts with one of these values.
<a id="allowedOrigins"></a>allowedOrigins | URI hostname string ([Multiple values allowed](#array)) | The <a href="https://tools.ietf.org/html/rfc3986#section-3.2.2">host registered name subcomponent</a> of an allowed origin. Any given <code>id</code> URI will be considered valid.

<code>HostedVerification</code> and <code>SignedVerification</code> are subclasses of <code>VerificationObject</code>. Future subclasses may be developed to indicate instructions for verifying Assertions using different methods, such as blockchain-based procedures.

#### HostedBadge
Hosted badge Assertions that have an HTTP(s) <code>id</code> simply need to declare a verification type of <code>HostedBadge</code>, and verification will use the Assertion's <code>id</code> property.

#### SignedBadge
Cryptographically signed Assertions need to declare a verification type of <code>SignedBadge</code> within the JSON-LD. These badges are typically delivered as JSON Web Signatures (JWSs), so the signature value is outside the Assertion content, wrapping it. However, it may help to identify which publicKey is associated with the signature within the badge, so the <code>creator</code> field is available to be used in SignedBadges.

Property | Expected Type | Description
---------|---------------|-----------
**type** | JSON-LD type ([Multiple values allowed](#array)) | The type of verification method: <code>SignedBadge</code> (or legacy alias <code>signed</code>).
creator  | @id: [CryptographicKey](#CryptographicKey) | The (HTTP) id of the key used to sign the Assertion. If not present, verifiers will check public key(s) declared in the referenced issuer Profile. If a key is declared here, it must be authorized in the issuer Profile as well. <code>creator</code> is expected to be the dereferencable URI of a document that describes a [CryptographicKey](#CryptographicKey).


<h3 id="Evidence">Evidence</h3>

(<a data-cite="OB-EXAMPLES#Evidence">example</a>)

Descriptive metadata about evidence related to the issuance of an Assertion. Each instance of the Evidence class present in an Assertion corresponds to one entity, though a single entry can describe a set of items collectively. There may be multiple <code>evidence</code> entries referenced from an Assertion. The <code>narrative</code> property is also in scope of the Assertion class to provide an overall description of the achievement related to the badge in rich text. It is used here to provide a narrative of achievement of the specific entity described.

If both the <code>description</code> and <code>narrative</code> properties are present, displayers can assume the <code>narrative</code> value goes into more detail and is not simply a recapitulation of <code>description</code>.

Property | Expected Type | Description
---------|---------------|-----------
type     | JSON-LD Type ([Multiple values allowed](#array)) | Defaults to [Evidence](#Evidence).
id       | IRI           | The URI of a webpage presenting evidence of achievement. 
narrative | Text or Markdown Text | A narrative that describes the evidence and process of achievement that led to an Assertion.
name     | Text          | A descriptive title of the evidence.
description | Text       | A longer description of the evidence.
genre    | Text          | A string that describes the type of evidence. For example, <code>Poetry</code>, <code>Prose</code>, <code>Film</code>.
audience | Text          | A description of the intended audience for a piece of evidence.

For evidence that is ephemeral or completely described within an Assertion via use of the Evidence class, if it is necessary to identify this evidence piece uniquely in an overall narrative, an <code>id</code> of type <code>urn:uuid</code> or otherwise outside the HTTP scheme may be used, but displayers may have less success displaying this usage meaningfully. 


<h3 id="Image">Image</h3> 

(<a data-cite="OB-EXAMPLES#Image">example</a>)

Metadata about images that represent Assertions, BadgeClasses or Profiles. These properties can typically be represented as just the <code>id</code> string of the image, but using a fleshed-out document allows for including captions and other applicable metadata.

Property | Expected Type | Description
---------|---------------|-----------
type     | JSON-LD Type: [ImageObject](http://schema.org/ImageObject) ([Multiple values allowed](#array))| Defaults to schema:ImageObject.
**id**   | IRI           | The URI or Data URI of the image.
caption  | Text          | The caption for the image.
author   | @id: Profile  | The author of the image, if desired.


<h3 id="Criteria">Criteria</h3>

(<a data-cite="OB-EXAMPLES#Criteria">example</a>)

Descriptive metadata about the achievements necessary to be recognized with an <code>Assertion</code> of a particular <code>BadgeClass</code>. This data is added to the <code>BadgeClass</code> so that it may be rendered when that <code>BadgeClass</code> is displayed, instead of simply a link to human-readable criteria external to the badge. Embedding criteria allows either enhancement of an external criteria page or increased portability and ease of use by allowing issuers to skip hosting the formerly-required external criteria page altogether. 

Criteria is used to allow would-be recipients to learn what is required of them to be recognized with an <code>Assertion</code> of a particular <code>BadgeClass</code>. It is also used after the <code>Assertion</code> is awarded to a recipient to let those inspecting earned badges know the general requirements that the recipients met in order to earn it.

Property  | Expected Type | Description
----------|---------------|-----------
type      | JSON-LD Type  ([Multiple values allowed](#array))| Defaults to [Criteria](#Criteria).
id        | IRI           | The URI of a webpage that describes in a human-readable format the criteria for the BadgeClass.
narrative | Text or [Markdown Text](#MarkdownText) | A narrative of what is needed to earn the badge. 

On the surface <code>Criteria</code> is a very simple class, but it enables some powerful use cases, such as using a Markdown-formatted <code>narrative</code> to draw the connections between multiple elements in an <code>alignment</code> array. The open nature of the Open Badges vocabulary allows experimentation with <a data-cite="OB-EXTENSIONS#">extensions</a> in <code>Criteria</code> as well, to let the market establish patterns for machine-readable criteria and automatic-awarding badge contracts.


<h3 id="Alignment">AlignmentObject</h3>

The AlignmentObject is an alias for schema.org's [AlignmentObject](http://schema.org/AlignmentObject) and uses IRIs from that vocabulary. See an <a data-cite="OB-EXAMPLES#BadgeClass">example</a> as it would appear in a BadgeClass document.

Property | Expected Type | Description
---------|---------------|-----------
**targetName** | Text | Name of the alignment.
**targetUrl** | URL | URL linking to the official description of the alignment target, for example an individual standard within an educational framework.
targetDescription | Text | Short description of the alignment target.
targetFramework | Text | Name of the framework the alignment target.
targetCode | Text | If applicable, a locally unique string identifier that identifies the alignment target within its framework and/or <code>targetUrl</code>. 

In order to render displays of alignment within badge services, <code>targetName</code> is required. In order to accurately identify targets, <code>targetUrl</code> is required. In the event that <code>targetUrl</code> cannot be specific enough to identify the item, <code>targetCode</code> may be used to indicate specifically which item within the targetUrl is the alignment target.

**Note:** Open badges v1.x used <code>schema:name</code>, <code>schema:description, and </code>schema:url</code>. v2.0 updates the AlignmentObject to use the proper linked data IRIs from the Schema.org vocabulary. 


<h3 id="RevocationList">Revocation List</h3>

(<a data-cite="OB-EXAMPLES#RevocationList">example</a>)

The Revocation List is a document that describes badges an Issuer has revoked that used the <code>signed</code> verification method. If you find the badge in the <code>revokedAssertions</code> list, it has been revoked. 

An assertion reference may look like <code>{"id": "https://example.org/1", "revocationReason": "Violation of policy"}</code> or simply the string <code>"https://example.org/1"</code>. A UID-based reference may look like <code>{"uid": "abc123", "revocationReason": "Awarded in error"}</code>

Property | Expected Type | Description
---------|---------------|-----------
**type** | JSON-LD Type ([Multiple values allowed](#array))| <code>RevocationList</code>.
id       | IRI           | The <code>id</code> of the RevocationList.
issuer   | IRI: Profile  | The <code>id</code> of the Issuer.
**revokedAssertions** <a id="revokedAssertions"></a> | <code>Assertion</code> ([Multiple values allowed](#array)) | A string <code>id</code> or UID-based identification of a badge object that has been revoked.

**Revoked Assertions referenced by revokedAssertions array:** Properties from [Assertion](#Assertion) in scope for those that have been revoked. Implementers generally only include these properties, clearing out the values that were in place before revocation. An identifying property must be used, either <code>id</code> or (legacy) <code>uid</code>. If the issuer does not wish to declare a revocation reason or additional metadata, the <code>id</code> of the <code>Assertion</code> may be included alone either as a single string entry to the list or in an object that defines an <code>id</code> property.

Property | Expected Type | Description
---------|---------------|-----------
type     | JSON-LD Type ([Multiple values allowed](#array)) | Defaults to <code>Assertion</code>. May be omitted.
id       | IRI           | The <code>id</code> of the revoked Assertion.
uid      | Text          | Legacy identifier for pre-1.1 badges that did not use an IRI-based <code>id</code>.
revoked  | Boolean | <code>true</code> if the Assertion is revoked. Defaults to true if present in a <code>revokedAssertions</code> list and may be omitted.
revocationReason | Text | The published reason for revocation if desired.


<h3 id="CryptographicKey">CryptographicKey</h3>

(<a data-cite="OB-EXAMPLES#CryptographicKey">example</a>)

Alias for the [Key](https://web-payments.org/vocabs/security#Key) class from the [W3C Web Payments Community Group Security Vocabulary](https://web-payments.org/vocabs/security). A CryptographicKey document identifies and describes a Key used for signing Open Badges documents. 

For best compatibility with verification procedures, the <code>Profile</code> should be hosted at its HTTPS <code>id</code> and should identify a <code>publicKey</code> by the HTTPS <code>id</code> of a <code>CryptographicKey</code> document that identifies its issuer by the issuer's <code>id</code> using the <code>owner</code> property. This allows convenient and robust usage of these <code>id</code>s to identify both the issuer and the key used.

Property | Expected Type | Description
---------|---------------|-----------
type     | JSON-LD Type ([Multiple values allowed](#array)) | <code>CryptographicKey</code>.
id       | IRI           | The identifier for the key. Most platforms only support HTTP(s) identifiers.
owner    | IRI: [Profile](#Profile) | The identifier for the Profile that owns this key. There should be a two-way connection between this Profile and the CryptographicKey through the <code>owner</code> and <code>publicKey</code> properties.
publicKeyPem | Text      | The PEM key encoding is a widely-used method to express public keys, compatible with almost every Secure Sockets Layer library implementation.

## Properties
Below are listed several properties usable across several Classes. They are optional in all cases.

### related
The <code>related</code> property identifies another entity of the same type that should be considered the same for most purposes. It is primarily intended to identify alternate language editions or previous versions of BadgeClasses. See examples: <a data-cite="OB-EXAMPLES#Internationalization">alternate language versions</a> and <a data-cite="OB-EXAMPLES#badgeclass-version-control">BadgeClass version control</a>.

### version
The <code>version</code> property allows issuers to specify a version string or number. It is primarily used to update a BadgeClass without changing the meaning of previously awarded Assertions by duplicating and linking to the previous version. See <a data-cite="OB-EXAMPLES#badgeclass-version-control">example</a>.

Property | Expected Type | Description
---------|---------------|-----------
related  | @id ([Multiple values allowed](#array)) | Identifies a related version of the entity.
version  | Text or Number | The version identifier for the present edition of the entity.
endorsement | @id: [Endorsement](#Endorsement) Multiple values allowed) | A claim made about this entity. Note: As endorsements must be published after the publication of the entity they endorse, it will not always be possible to establish a two-way linkage with this property.


<h2 id="ProfileIdentifierProperties">Profile Identifier Properties</h2>

When profiles are referenced elsewhere in the Open Badges Specification, they may be identified precisely by dereferencable id, such as when a BadgeClass links to an issuer Profile by its <code>id</code> URL. Other times, such as when identifying the [recipient](#recipient) of an [Assertion](#Assertion), Profiles may be identified by the value of a specific property unique to the individual or organization represented in a Profile. All properties that serve as profile identifiers must have values with a string datatype.

**Properties considered serviceable identifiers include:**

* <code>email</code>
* <code>url</code>
* <code>telephone</code>

Many platforms that allow badge issuers and recipients to establish their identities as Profiles support only <code>email</code> (<code>https://schema.org/email</code>) as an identifier property.


<h2 id="Extensions">Extensions</h2>

The 1.1 version of the Open Badges Specification introduces Extensions as a means for issuers to add additional metadata to Badge Objects beyond what the standard specifies itself. Additional properties are allowed without using Extensions, but Extensions allow issuers to declare how they are adding information so that it can be understood by others and other issuers can add the same sort of information in a compatible way.

See the [[[OB-EXTENSIONS]]] page for specific examples and extensions ready to use in Badge Objects.

Extension authors define and host a new [[JSON-LD]] context file describing all the terms the extension covers. These context files may further define any [JSON-schema](http://json-schema.org/) that implementations of the extension should pass. If used, each schema is linked from the context and hosted as a separate JSON-schema files. Extensions are implemented in Open Badges as JSON objects inside an Assertion, BadgeClass or Issuer with their own link to the extension context and declaration of type.

Property | Expected Type | Description
--------|------------|-----------
**@context** | URL | JSON-LD context file shared among all implementations of the extension.
**type** | IRI ([Multiple values allowed](#array)) | IRI or compact IRI within the OBI or extension context that describe the type of data contained in the extension. The IRI is used to map optional JSON-schema validation to the extension. Must include 'extension' as one element.
\*anyProperties | Any | Any property names defined in the extension context may be used with any valid JSON value. 

An extension value should be included as a JSON object containing the <code>@context</code> and <code>@type</code> properties and any new properties whose names are mapped in the context file referenced by <code>@context</code>. 

The property name for the extension should map to an IRI within the <code>@context</code> defined at the root of the extended Badge Object. It is possible to use a fully qualified IRI (e.g. <code>http://example.org/newBadgeExtension</code>) or a compact IRI within the extension namespace defined in the <a data-cite="OB-JSONLD#">OBI context</a>, like <code>extension:newBadgeExtension</code>. In either case, the IRI should correspond to where a human-readable definition of the extension resides. For extensions using the <code>extension</code> namespace, this definition may be contributed to the community <a data-cite="OB-EXTENSIONS#">extensions repository</a> on this site.

See <a data-cite="OB-EXTENSIONS#">example extensions</a>.


<h3 id="validation">Extension Validation</h3>

Open Badges v1.1 implements an optional JSON-schema based mechanism of ensuring badge objects conform to syntactic requirements of the specification. JSON-schema can ensure that required properties exist and that expected data types are used. From the <a data-cite="OB-JSONLD#">context</a>s for badge objects and extensions, a <code>validation</code> [array](#array) may contain links to various JSON-schema against which badge objects may be tested. There are two proposed methods of specifying which component of a badge object should be matched against the JSON-schema validator: TypeValidation and FrameValidation. As of 1.1, only TypeValidation is implemented.

For example, this portion of the current Open Badges context links to a validator for Assertions. It indicates through TypeValidation that it should be run against JSON objects with the JSON-LD type of <code>Assertion</code> ([https://w3id.org/openbadges#Assertion]).
<pre>
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
</pre>


<h4 id="TypeValidation">Type Validation</h4>

Validators using the TypeValidation method match the schema indicated by the validator's <code>validationSchema</code> property against a JSON badge object document or portion of such a document that matches the validator's <code>validatesType</code> JSON-LD <code>type</code>.

Property | Expected Type | Description/expected value
--------|------------|-----------
**type** | string/compact IRI ([Multiple values allowed](#array)) | <code>TypeValidation</code>.
**validatesType** | string/compact IRI | Valid JSON-LD type for a badge component, such as <code>Assertion</code>, <code>extensions:ApplyLink</code>, or <code>https://w3id.org/openbadges/extensions#ApplyLink</code>. Compact forms preferred.
**validationSchema** | URL | Location of a hosted JSON-schema.


<h4 id="FrameValidation">Frame Validation</h4>

_status: proposed_

Validators that someday use the proposed FrameValidation method pass JSON-LD objects through the JSON-LD Frame indicated by the <code>validationFrame</code> property and test the result against the JSON-schema indicated by the validator's <code>validationSchema</code> property.


<h2 id="Endorsement">Endorsement</h2>

(<a data-cite="OB-EXAMPLES#Endorsement">example</a>)

Open Badges are trustworthy records of achievement. The vocabulary defined above, combined with the validation and verification procedures for badge Assertions, establish Open Badges as a reliable method for expressing and verifying achievements online. However, these procedures don't answer questions like, "Who trusts this BadgeClass to be a good certification of the competency it describes?" or, "Is this Profile's email address verified?" For these questions, there is Endorsement.

Endorsement leans on the Verifiable Claims work prototyped by members of the [Verifiable Claims Task Force](https://w3c.github.io/vctf/) at the [W3C](https://www.w3.org/) and the theoretical backing developed by the 2014 Endorsement Working Group. See [Endorsement Framework Paper](https://docs.google.com/document/d/1VVf19d72KmGMh1ywrLe7HCKEOqGSI0WjvwfGN_8Q2M4/edit#heading=h.xyxfmzqz2vqb).

The <code>Endorsement</code> Class is very similar to <code>Assertion</code>, except that there is no defined <code>badge</code> property. Instead, a <code>claim</code> property allows endorsers to make specific claims about other <code>Profiles</code>, <code>BadgeClasses</code>, or <code>Assertions</code>.

Property | Expected Type | Description/expected value
---------|---------------|-----------
**id**   | IRI           | Unique IRI for the Endorsement instance. If using hosted verification, this should be the URI where the assertion of endorsement is accessible. For signed Assertions, it is recommended to use a UUID in the urn:uuid namespace.
**type** | JSON-LD Type ([Multiple values allowed](#array)) | <code>Endorsement</code>, a subclass of VCTF's Credential.
**claim**    | @id           | An entity, identified by an <code>id</code> and additional properties that the endorser would like to claim about that entity.
**issuer** | @id: Profile | The profile of the Endorsement's issuer.
**issuedOn** | [DateTime](#dateTime) | Timestamp of when the endorsement was published.
**verification** | [VerificationObject](#VerificationObject) | Instructions for third parties to verify this assertion of endorsement.

Within the <code>claim</code> property, the endorsed entity may be of any type (though only Open Badges Vocabulary classes are expected to be understood by Open Badges-specific tools. While <code>Endorsement</code> is a very flexible data structure, its usefulness will be limited not by the creativity of endorsers, but by the ability for other tools to discover and understand those endorsements.

There is one special property for use in endorsement, the <code>endorsementComment</code>, which allows endorsers to make a simple claim in writing about the entity.

Property | Expected Type | Description/expected value
---------|---------------|-----------
endorsementComment | Text or [Markdown](#MarkdownText) | An endorser's comment about the quality or fitness of the endorsed entity.

Endorsements use the <code>claim</code> property to identify another entity by its <code>id</code> and declare properties about it. For example, the following allows an issuer to offer their own claim that an email address belongs to the profile identified as <code>https://otherissuer.example/1</code> and make a comment about the quality of their badges.
<pre>
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
</pre>
<a data-cite="OB-EXAMPLES#Endorsement">See more examples</a>


<h2 id="addtional">Additional Properties</h2>

Badges consist of sets of claims, properties with values that apply to Profiles, all earners of a badge, or individual badge recipients. Outside of extensions, additional properties may be added to these claim sets so long as they are mapped to an IRI as JSON-LD. For example, publishers of Badge Objects may:

1. Add individual mappings to the Badge Object's context: <code>"@context":["https://w3id.org/openbadges/v2", {"foo": "http://example.org/foo"}]</code>
2. Link to additional context files in the Badge Object's context: <code>"@context":["https://w3id.org/openbadges/v2", "http://example.org/context"]</code>
3. Add new properties using full IRIs as keys (or with compact IRIs valid in the existing context): <code>"http://example.org/foo":"bar"</code> or <code>"schema:comment":"baz"</code> where the IRI leads to the vocabulary definition for the term.

Processors should preserve properties that are valid data when rehosting or retransmitting, but it is permissible to perform valid JSON-LD transformations. Such transformations include "expanding", "compacting" and modifying the context. Transformations are assumed to be equivalent if the expanded or normalized RDF value of the new version is semantically equivalent to the expanded value of the original.

If a property would be useful beyond a publisher's internal use, an [Extension](#Extensions) is a recommended way to establish common practice for adding certain sets of information to badge objects.


## <a id="datatypes"></a>Primitive datatypes

* <a data-cite="RFC4627#boolean" id="boolean">Boolean</a> - A JSON boolean value as defined in [[RFC4627]]
* <a data-cite="RFC4627#string" id="text">Text</a> - A JSON string value as defined in [[RFC4627]]
* <a data-cite="RFC4627#array" id="array">Array</a> - A JSON array as defined in [[RFC4627]]. Arrays are used for all properties where multiple values are allowed when multiple values are used. Each entry in the array must match the type requirement specified for that property.
* <a data-cite="ISO8601#dateTime" id="dateTime">DateTime</a> - Open Badges must express timestamps as strings compatible with [[ISO8601]] guidelines, including the time and a time zone indicator. It is recommended to publish all timestamps in UTC. Previous versions of Open Badges allowed Unix timestamps as integers. Open Badges v2.0 requires string ISO 8601 values with time zone indicators. For example, <code>2016-12-31T23:59:59+00:00</code> is a valid ISO 8601 timestamp. It contains the year, month, day, <code>T</code> separator, hour number 0-23, minute, optional seconds and decimal microsecond, and a time zone indicator (+/- an offset from UTC or the <code>Z</code> designator for UTC).
* URL - Fully qualified URL, including protocol, host, port if applicable, and path. Interpreters are only expected to interpret URLs in either the <code>http</code> or <code>https</code> schemes.
* IRI - In JSON-LD and Linked Data, IRIs (Internationalized Resource Identifiers) may look like fully qualified URLs or be namespaced within the JSON-LD context to be expanded to a full IRI. The only known supported IRI schemes are <code>http</code> and <code>https</code>.
* <a id="identityHash"></a>IdentityHash - A hash string preceded by a dollar sign ("$") and the algorithm used to generate the hash. The supported algorithms are [MD5](https://www.ietf.org/rfc/rfc1321.txt) and [SHA-256](http://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.180-4.pdf), identified by the strings <code>md5</code> and <code>sha256</code> respectively. For example: <code>sha256$28d50415252ab6c689a54413da15b083034b66e5</code> represents the result of calculating a SHA-256 hash on the string "mayze". For more information, see [how to hash & salt in various languages](https://github.com/mozilla/openbadges/wiki/How-to-hash-&-salt-in-various-languages.).
* <a id="MarkdownText"></a> Markdown Text - Text that may contain formatting according to [Markdown syntax](https://daringfireball.net/projects/markdown/syntax). Due to uneven support in displayers, publishers are encouraged to limit usage to simple elements like links, emphasis, and lists. Displayers may choose a subset of Markdown formatting to support or how to render this field. Images and tables may or may not be supported.


# Implementation


## Publishing Badge Objects
Open Badges data is published as JSON-LD documents made up of the above data classes. These link together via use of common identification strings and properties. They rely on other data, including image files that are often hosted on HTTP(s) URIs outside of the JSON-LD documents that describe them.


### Setting Content-Type
Badge Objects encoded in JSON-LD should be served with the <code>application/ld+json</code> content type by default. If the request indicates only <code>application/json</code> as the <code>Accept</code> type, responses should include <code>application/json</code> in the response content type. If request is made for <code>text/html</code> or other content-type above <code>application/ld+json</code> or <code>application/json</code>, the requested content-type may be returned.


<h3 id="Baking">Badge Baking</h3>

Badge assertions may be "baked" into image files as portable credentials. Baking is currently supported for PNG and SVG formats. (See [[[OB-BAKE-10]]] for implementation)


## Data Validation
Data Validation is a procedure that ensures a cluster of Badge Objects that make up an Open Badge are appropriately published and linked, and that each particular instance of a Badge Object conforms to requirements for its class. Validation of all data class instances used in an Open Badge is a part of badge verification.

Validation includes tests to ensure that:

* All required Badge Objects are appropriately linked and available to the validator with an eventual <code>200 OK</code>.
* Any relevant optional Badge Objects that are linked (such as <code>RevocationList</code>s) are available.
* Each Badge Object is a valid JSON-LD (Linked Data) document.
* Each Badge Object contains all required properties for its class.
* Each Badge Object contains values of the expected data type for all declared properties defined in the Vocabulary.

The use of the term "eventual 200 OK" is meant to mean that 3xx
redirects are allowed, as long as the request eventually terminates on an appropriate
resource that returns a 200 OK.


<h2 id="implementation-verification">Verification</h2>

Verification is the process of ensuring the data that makes up an Open Badge is correct for the purpose at hand. It includes a number of data validation checks as well as procedures to ensure the badge is trustworthy. Verification is distinct from Compliance Certification for applications and services that implement the Specification, though verification is typically a component of certification programs.

Verification includes tests to ensure that:

* All Badge Objects pass data validation. See [Data Validation](#data-validation) above.
* All Badge Objects were created by the appropriate issuer <code>Profile</code>(s) according to rules declared in their [VerificationObjects](#VerificationObject).
* The <code>Assertion</code> was awarded to a valid property value of the expected recipient. (For example, that the <code>Asssertion</code> was awarded to a known email address value for <code>email</code> type recipient <code>IdentityObject</code>.)
* The <code>Assertion</code> issuer is authorized to award Assertions of the declared <code>BadgeClass</code> (typically by being the issuer of the BadgeClass.)
* The <code>Assertion</code> has not expired.
* The <code>Assertion</code> has not been revoked by the issuer.

Additional checks may ensure that:

* The issuer Profile awarding the Assertion is trusted to have declared accurate information about its identity (typically via Endorsement).


<h3 id="HostedBadge">HostedBadge Verification</h3>

A hosted Assertion is a file containing validated <code>Assertion</code> data in JSON-LD served with the content-type <code>application/ld+json</code> and/or <code>application/json</code>. This should be available to anyone who the recipient would like to be able to verify it at a stable URI on your server (for example, <code>https://example.org/assertions/robotics-badge/123.json</code>). This URI is the source of truth for the badge, and any verification attempt will request it to make sure the Assertion exists and describes the expected achievement. Redirects are permissible as long as appropriate Assertion content is eventually returned. The hosting application must properly [set the content-type](#setting-content-type).

The Assertion <code>id</code> must be within the permitted scope for hosted verification declared in issuer Profile. See [VerificationObject](#VerificationObject). This defaults to requiring the Assertion and BadgeClass to be hosted on the same origin as the issuer Profile <code>id</code> if there is no <code>verification</code> property declared in the issuer Profile. For domain origins that host multiple applications and websites, <code>startsWith</code> path may be used, in which case, the <code>verificationProperty</code> (<code>id</code>) must start with the value found in the issuer Profile's VerificationObject <code>startsWith</code> declaration.

**Steps to verify a hosted badge Assertion**:
Verification of hosted assertions may be performed starting with the verification URL or with a full Assertion instance in hand. If starting with a full assertion that indicates <code>HostedBadge</code> verification, the input data should only be trusted to identify the URI of the hosted verification file, and upon loading the hosted verification file, the retrieved data should be used as the Assertion value.


#### Revoking Hosted Assertions 

(<a data-cite="OB-EXAMPLES#revoked-hosted-assertion">example</a>)

To mark a hosted assertion as revoked, respond with an HTTP Status of <code>410 Gone</code>. The response may include an <code>Assertion</code> body containing some additional metadata, such as a <code>revocationReason</code>, but it is not required to meet all normal property presence requirements. For revoked Assertions, only <code>id</code> and <code>revoked</code> are required.

If either the <code>410 Gone</code> status or a response body declaring <code>revoked</code> true is returned, the Assertion should be treated as revoked and thus invalid.


<h3 id="SignedBadge">SignedBadge Verification</h3>

(<a data-cite="OB-EXAMPLES#SignedBadge">example</a>)

A signed badge may be published in the form of a [[[rfc7515]]]. If so, the JSON representation of the badge assertion should be used as the JWS payload. 

A JWS has three components separated by dots (<code>.</code>):
<pre>
header.payload.signature
</pre>

The JSON-LD representation of the <code>Assertion</code> should be used as the JWS payload. For compatibility purposes, using RSA-SHA256 is recommended.

The public key corresponding to the private key used to the sign the badge should be publicly accessible via HTTP and specified in the issuer Profile's <code>publicKey</code> property. If there are multiple keys declared in the issuer Profile, the Assertion's <code>VerificationObject</code> may specify the <code>id</code> of the public key that should be used for verification with its <code>creator</code> property.

**Steps to verify a JWS-signed badge Assertion**:

1. Base64 decode the JWS payload. This will be a JSON string representation of the badge assertion.
2. Parse the decoded JWS body into a JSON object. If the parsing operation fails, assertion MUST be treated as invalid.
3. Perform data validation on the Assertion and the (embedded or linked) BadgeClass and issuer Profile, as well as any other relevant present data.
4. Determine the correct signing key <code>id</code>(s) to test against the signature from the valid issuer Profile and Assertion VerificationObject. Do not trust a key that is not properly linked from the issuer Profile.
5. Perform an HTTP GET request on the trusted keys. If it is impossible to get a usable public key, the Assertion cannot be verified.
6. With each trusted public key, perform a JWS verification on the JWS object. If the verification fails, assertion MUST be treated as invalid.
7. Retrieve the revocation list from the Issuer Profile object if present and ensure the <code>id</code> of the badge does not appear in the <code>revokedAssertions</code> list. Legacy v1.x badges that lack a <code>id</code> property may be identified in this list by their <code>uid</code>.
8. If the above steps pass, assertion may be treated as valid.

Other signature suites may be later included in this document if they are investigated and approved.

#### Revoking a Signed Badge

To mark a badge as revoked, add an entry to the resource pointed at by the Issuer Profile <code>revocationList</code> URL with the **id** of the Assertion and, optionally, a reason why the badge is being revoked. See an <a data-cite="OB-EXAMPLES#RevocationList">example</a>.

<div></div>
`;