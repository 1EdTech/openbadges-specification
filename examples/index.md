---
title: Open Badges Examples
subtitle: Examples of Core Open Badges objects
show_sidebar: true
layout: page
---
{::options parse_block_html="true" /}

# {{ page.title }}
Open Badges consist of information about accomplishments stored in Badge Objects.

## {{ page.subtitle }}
Information is divided between badge objects that describe an individual earner's accomplishment [(Assertion)](../#Assertion), the general features of the achievement [(BadgeClass)](../#BadgeClass), and the entity or organization issuing the badge [(Issuer)](../#Issuer)

### <a id="Assertion"></a>Assertion Example ([definition](../#Assertion))
An example of a badge Assertion using the `hosted` verification method. This JSON object is "baked" into a badge image (optionally linked at the Assertion's `image` property) and also hosted at the location specified by the `@id` and `verify.url` properties.
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "type": "Assertion",
  "id": "https://example.org/beths-robotics-badge.json",
  "recipient": {
    "type": "email",
    "hashed": true,
    "salt": "deadsea",
    "identity": "sha256$c7ef86405ba71b85acd8e2e95166c4b111448089f2e1599f42fe1bba46e865c5"
  },
  "image": "https://example.org/beths-robot-badge.png",
  "evidence": "https://example.org/beths-robot-work.html",
  "issuedOn": "2016-12-31T23:59:59Z",
  "expires": "2017-06-30T23:59:59Z",
  "badge": "https://example.org/robotics-badge.json",
  "verification": {
    "type": "hosted"
  }
}
{% endhighlight %}

### <a id="BadgeClass"></a>BadgeClass Example ([definition](../#BadgeClass))
The BadgeClass is hosted at the URI identified in associated Assertions' `badge` property.
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "type": "BadgeClass",
  "id": "https://example.org/robotics-badge.json",
  "name": "Awesome Robotics Badge",
  "description": "For doing awesome things with robots that people think is pretty great.",
  "image": "https://example.org/robotics-badge.png",
  "criteria": "https://example.org/robotics-badge.html",
  "tags": ["robots", "awesome"],
  "issuer": "https://example.org/organization.json",
  "alignment": [
    { "targetName": "CCSS.ELA-Literacy.RST.11-12.3",
      "targetUrl": "http://www.corestandards.org/ELA-Literacy/RST/11-12/3",
      "targetDescription": "Follow precisely a complex multistep procedure when 
      carrying out experiments, taking measurements, or performing technical 
      tasks; analyze the specific results based on explanations in the text.",
      "targetCode": "CCSS.ELA-Literacy.RST.11-12.3"
    },
    { "targetName": "Problem-Solving",
      "targetUrl": "https://learning.mozilla.org/en-US/web-literacy/skills#problem-solving",
      "targetDescription": "Using research, analysis, rapid prototyping, and feedback to formulate a problem and develop, test, and refine the solution/plan.",
      "targetFramework": "Mozilla 21st Century Skills"
    }
  ]
}
{% endhighlight %}

**Notes**:

* The JSON-LD data model treats `"property": ["value"]` as equivalent to `"property": "value"`. An example of this is that `alignment` takes one or multiple AlignmentObjects. If only one value is present, it may or may not be included in `[]`. Not all of the Open Badges properties accept multiple values. For instance, `issuer` may only have one value.
* Many `@id`-type fields may have a property that appears as an IRI/URI or as an embedded JSON object (with `{}`). For example, `issuer` may include an embedded copy of the issuer Profile. Verifiers should fetch the issuer Profile from its HTTP `id` and in most cases treat the hosted value as the most up-to-date representation. In the case of signed-verification Assertions, an embedded `BadgeClass` or issuer `Profile` can be interpreted to be the value claimed at the time of issue, though `publicKeys` referenced in an embedded issuer `Profile` should not be trusted to belong to the issuer without checking the hosted Profile.

### <a id="Issuer"></a><a id="Profile"></a>Issuer/Profile Example ([definition](../#Profile))
Metadata about the issuer is defined in JSON at a URL/IRI defined by the BadgeClass's `issuer` property.
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "type": "Issuer",
  "id": "https://example.org/organization.json",
  "name": "An Example Badge Issuer",
  "image": "https://example.org/logo.png",
  "url": "https://example.org",
  "email": "contact@example.org",
  "publicKey": "https://example.org/publicKey.json",
  "revocationList": "https://example.org/revocationList.json"
}
{% endhighlight %}

### Extension Examples ([definition](../#Extensions))
Extensions are formal sets of properties issuers and platforms add to the Open Badges Vocabulary. A number of community-developed extensions are published on the [Extensions page](../extensions/#ExampleExtension) with embedded examples of each.

## <a id="LinkedData"></a> Open Badges in Linked Data
Because Open Badges are Linked Data objects often hosted at HTTP IRIs, we can use the methods of identifying connections using Badge Objects can identify their connected resources either by their string IRI or by embedding a copy of the related document into the source document. For example, an Assertion may include its BadgeClass definition for portability instead of just linking to the URI of the BadgeClass object. Here, the BadgeClass and its issuer Profile record have been included in the Assertion. Each has its "id" property set to the URI where it is published, the unique identifier for that object. Displayer platforms can use that value to index these records. 
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "type": "Assertion",
  "id": "https://example.org/beths-robotics-badge.json",
  "recipient": {
    "type": "email",
    "hashed": true,
    "salt": "deadsea",
    "identity": "sha256$c7ef86405ba71b85acd8e2e95166c4b111448089f2e1599f42fe1bba46e865c5"
  },
  "issuedOn": "2016-12-31T23:59:59Z",
  "badge": {
    "id": "https://example.org/robotics-badge.json",
    "type": "BadgeClass",
    "name": "Awesome Robotics Badge",
    "description": "For doing awesome things with robots that people think is pretty great.",
    "image": "https://example.org/robotics-badge.png",
    "criteria": "https://example.org/robotics-badge.html",
    "issuer": {
      "type": "Profile",
      "id": "https://example.org/organization.json",
      "name": "An Example Badge Issuer",
      "image": "https://example.org/logo.png",
      "url": "https://example.org",
      "email": "steved@example.org",
    }
  },
  "verification": {
    "type": "hosted"
  }
}
{% endhighlight %}
**Notes**:

* In this example, the `badge` property in the Assertion is expanded to offer a full BadgeClass record, but not all identifying URIs (`@id`-type fields) are represented here as this type of expanded document. For example, `criteria` and `image` properties just use a URI here instead of taking advantage of linked data classes for these items in the Specification. You may publish badge objects with a mix of URI references and expanded document formats that have indexable `id`s. Properties that in v1.1 expected a String URI datatype may now encounter a `{}` object containing an `id` property and other metadata. All such properties are now listed in the spec as expecting an @id (linked data subject) expecting the IRI or document representation of a certain data class.
* Because the properties describing the BadgeClass and issuer Profile are within the same context that's included at the top of the JSON-LD document, you don't need to include a new reference to the "@context" each time.
* Because this Assertion uses "hosted" verification, and there is no cryptographic signature to verify that the full document here is the exact one published by the issuer, verifier and displayer platforms will likely discard the embedded BadgeClass and issuer Profile here and replace them with the values discovered at their `id` URIs, because only those hosted documents can be trusted to be the creation of the issuer. If the Assertion uses "signed" verification, the validator may accept the embedded values as the intended BadgeClass and issuer Profile, and if they have multiple records for those entities that use the declared `id`, the validator may choose how to index and present that information. Issuers should change the `id`s of their BadgeClasses when they make edits if they wish the edits to essentially be understood as a different achievement than the one published under the original `id`.

## Additional Vocabulary Classes Examples
While the Assertion, BadgeClass, and Profile are the minimal set of JSON-LD resources necessary for a valid badge, there are several secondary data classes that extend the usefulness, security, and portability of Open Badges.

### <a id="SignedBadge"></a> Signed Badges Example ([definition](../#SignedBadge))
JSON Web Signatures, a branch of the [JSON Object Signing and Encryption (JOSE)](https://datatracker.ietf.org/wg/jose/documents/) group of standards is a signature method accepted for Open Badges objects. A JSON Web Signature (JWS) for a signed Assertion is made up of three components, packaged as a string with `.`s used as separators. (Space has been added here around the `.` separators for clarity.) This example is not a valid JWS, as the referenced key on example.org does not exist.
{% highlight html %}
eyJhbGciOiJSUzI1NiJ9
.
ew0KICAiQGNvbnRleHQiOiAiaHR0cHM6Ly93M2lkLm9yZy9vcGVuYmFkZ2VzL3YyIiwNCiAgInR5cGUiOiAiQXNzZXJ0aW9uIiwNCiAgImlkIjogImh0dHBzOi8vZXhhbXBsZS5vcmcvYmV0aHMtcm9ib3RpY3MtYmFkZ2UuanNvbiIsDQogICJyZWNpcGllbnQiOiB7DQogICAgInR5cGUiOiAiZW1haWwiLA0KICAgICJoYXNoZWQiOiB0cnVlLA0KICAgICJzYWx0IjogImRlYWRzZWEiLA0KICAgICJpZGVudGl0eSI6ICJzaGEyNTYkYzdlZjg2NDA1YmE3MWI4NWFjZDhlMmU5NTE2NmM0YjExMTQ0ODA4OWYyZTE1OTlmNDJmZTFiYmE0NmU4NjVjNSINCiAgfSwNCiAgImltYWdlIjogImh0dHBzOi8vZXhhbXBsZS5vcmcvYmV0aHMtcm9ib3QtYmFkZ2UucG5nIiwNCiAgImV2aWRlbmNlIjogImh0dHBzOi8vZXhhbXBsZS5vcmcvYmV0aHMtcm9ib3Qtd29yay5odG1sIiwNCiAgImlzc3VlZE9uIjogIjIwMTYtMTItMzFUMjM6NTk6NTlaIiwNCiAgImJhZGdlIjogImh0dHBzOi8vZXhhbXBsZS5vcmcvcm9ib3RpY3MtYmFkZ2UuanNvbiIsDQogICJ2ZXJpZnkiOiB7DQogICAgInR5cGUiOiAiU2lnbmVkQmFkZ2UiLA0KICAgICJjcmVhdG9yIjogImh0dHBzOi8vZXhhbXBsZS5vcmcvcHVibGljS2V5Ig0KICB9DQp9
.
Liv4CLviFH20_6RciUWf-jrUvMAecxT4KZ_gLHAeT_chrsCvBEE1uwgtwiarIs9acFfMi0FJzrGye6mhdHf3Kjv_6P7BsG3RPkYgK6-5i9uZv4QAIlvfNclWAoWUt4j0_Kip2ftzzWwc5old01nJRtudZHxo5eGosSPlztGRE9G_g_cTj32tz3fG92E2azPmbt7026G91rq80Mi-9c4bZm2EgrcwNBjO0p1mbKYXLIAAkOMuJZ_8S4Go8S0Sg3xC6ZCn03zWuXCP6bdY_jJx2BpmvqC3H55xWIU8p5c9RxI8YifPMmJq8ZQhjld0pl-L8kHolJx7KGfTjQSegANUPg
{% endhighlight %}
When base64 decoded this corresponds to the three JSON objects below for a signed 2.0 Open Badge:

<a id="example-signed-badge-assertion"></a>
Header:
{% highlight json %}
{ "alg": "RS256" }
{% endhighlight %}
Claims:
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "type": "Assertion",
  "id": "urn:uuid:a953081a-4bbd-4927-9653-7219bca00e3b",
  "recipient": {
    "type": "email",
    "hashed": true,
    "salt": "deadsea",
    "identity": "sha256$c7ef86405ba71b85acd8e2e95166c4b111448089f2e1599f42fe1bba46e865c5"
  },
  "evidence": "https://example.org/beths-robot-work.html",
  "issuedOn": "2016-12-31T23:59:59Z",
  "badge": "https://example.org/robotics-badge.json",
  "verification": {
    "type": "SignedBadge",
    "creator": "https://example.org/publicKey.json"
  }
}
{% endhighlight %}
Signature:
{% highlight html %}
Liv4CLviFH20_6RciUWf-jrUvMAecxT4KZ_gLHAeT_chrsCvBEE1uwgtwiarIs9acFfMi0FJzrGye6mhdHf3Kjv_6P7BsG3RPkYgK6-5i9uZv4QAIlvfNclWAoWUt4j0_Kip2ftzzWwc5old01nJRtudZHxo5eGosSPlztGRE9G_g_cTj32tz3fG92E2azPmbt7026G91rq80Mi-9c4bZm2EgrcwNBjO0p1mbKYXLIAAkOMuJZ_8S4Go8S0Sg3xC6ZCn03zWuXCP6bdY_jJx2BpmvqC3H55xWIU8p5c9RxI8YifPMmJq8ZQhjld0pl-L8kHolJx7KGfTjQSegANUPg
{% endhighlight %}

#### Using Cryptographic Keys
In the above example, a keypair with `publicKey` identifier `https://example.org/publicKey.json` was used to sign a badge Assertion. The following resources should exist for this to be a functional example:

<div class="table-wrapper">

Type       | id            | Description
-----------|---------------|-----------
Assertion  | `urn:uuid:a953081a-4bbd-4927-9653-7219bca00e3b` | There is no HTTP(s) `id` for this `Assertion`, because it was delivered as a JWS. It links to the BadgeClass document with the `badge` property. [See immediately above](#example-signed-badge-assertion).
BadgeClass | `https://example.org/robotics-badge.json` | A `BadgeClass` document that links to the Issuer. [See above](#BadgeClass).
Profile    | `https://example.org/organization.json`| A issuer `Profile` document that links to the PublicKey document with its `publicKey` property. [See above](#Profile)
PublicKey  | `https://example.org/publicKey.json` | A `PublicKey` document that links to the issuer `Profile` with its `owner` property. See below](#CryptographicKey).

</div>

### <a id="CryptographicKey"></a>CryptographicKey Example ([definition](../#CryptographicKey))
A public key document should describe an Open Badges issuer's public key. For maximum compatibility, it should have its own HTTP(S) identifier, and should identify its issuer using the `owner` property. The `publicKeyPem` shown below has been abbreviated with `...` for readability.

{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "type": "CryptographicKey",
  "id": "https://example.org/publicKey.json",
  "owner": "https://example.org/organization.json",
  "publicKeyPem": "-----BEGIN PUBLIC KEY-----\nMIIBG0BA...OClDQAB\n-----END PUBLIC KEY-----\n"
}
{% endhighlight %}


### <a id="RevocationList"></a>RevocationList Example ([definition](../#RevocationList))
Issuers may have a RevocationList if they use `SignedBadge` verification. Checking this list is intended as part of the verification process for signed badges, just as checking for the hosted assertion is part of verifying a hosted badge. It is published as a JSON-LD document with type `RevocationList`. RevocationLists are linked from an issuer Profile via the `revocationList` property. The RevocationList identifies its issuer with the `issuer` property.

RevocationLists may identify revoked Assertions through their `revokedAssertions` property. Individual assertions are identified either by their `id` or (legacy) `uid` properties. `id`-identified Assertions may appear in a RevocationList as that id string or as an object with an `id` property and other metadata, usually just a `revocationReason`. The below example shows `id`s in the `urn:uuid` namespace, which is a recommended namespace for signed Assertions that do not have a hosted (HTTP) `id`.
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/revocationList.json",
  "type": "RevocationList",
  "issuer": "https://example.org/issuer",
  "revokedAssertions": [
    "urn:uuid:3c574c87-b96f-4f06-8eb5-68a29335b60e",
    {
      "id": "urn:uuid:e79a6c18-787e-4868-8e65-e6a4530fb418",
      "revocationReason": "Honor code violation"
    },
    {
      "uid": "abc123",
      "revocationReason": "Issued in error."
    }
  ]
}
{% endhighlight %}

### <a id="revoked-hosted-assertion"></a>Revoked Hosted Assertion Example (see more about [Hosted Verification](../#HostedBadge))
Revoked hosted Assertions should be returned with the HTTP status `410 Gone`. The response body may contain an Assertion document with `"revoked": true` that contains additional metadata. It does not need to meet the full requirements of the `Assertion` class. Only `id` and `revoked` properties must be present

{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "revoked": true,
  "revocationReason": "Turns out the student's robot was just three stacked children in a trenchcoat with dryer vent hose arms."
}
{% endhighlight %}


### <a id="Evidence"></a>Evidence Example ([definition](../#Evidence))
Metadata related to evidence may be included in Assertions in several ways. (Some required properties elided in the following examples.)

The issuer may provide a text/Markdown `narrative` describing the evidence:
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "narrative": "This student invented her own type of robot. This included: \n\n  * Working robot arms\n  * Working robot legs"
}
{% endhighlight %}

Evidence may be referenced by URI `id`:
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "evidence": "https://example.org/beths-robot-work.html"
}
{% endhighlight %}

Evidence may be more fully described by using the [Evidence](../#Evidence) class:
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "evidence": {
    "id": "https://example.org/beths-robot-work.html",
    "name": "My Robot",
    "description": "A webpage with a photo and a description of the robot the student built for this project.",
    "narrative": "The student worked very hard to assemble and present a robot. She documented the process with photograpy and text.",
    "genre": "ePortfolio"
}
{% endhighlight %}

It is possible to include multiple values for evidence in an Assertion.
Evidence may be more fully described by using the [Evidence](../#Evidence) class:
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "narrative": "This student invented her own type of robot. This included: \n\n  * Working robot arms\n  * Working robot legs",
  "evidence": [
    {
      "id": "https://example.org/beths-robot-photos.html",
      "name": "Robot Photoshoot",
      "description": "A gallery of photos of the student's robot",
      "genre": "Photography"
    },
    {
      "id": "https://example.org/beths-robot-work.html",
      "name": "Robotics Reflection #1",
      "description": "Reflective writing about the first week of a robotics learning journey."
    }
  ]
{% endhighlight %}


### <a id="Image"></a>Image Example ([definition](../#Image))
In order to provide extra useful information for rendering images, sometimes additional metadata about images is included in Badge Objects using the `Image` class.

Images are often referenced by their HTTP URI where they may be accessed. Displayers usually render this as the image source in HTML.
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "image": "https://example.org/beths-robot-badge.png"
}
{% endhighlight %}

However, additional properties are available, and can be referenced wherever images appear in Badge Objects. For example, a `caption` can aid in rendering alt text in browsers. If `author` is used, it may be the `id` of an Open Badges Profile, but it may be another `id` that represents the author. Displayers should not assume this is a URI that will resolve to a compatible instance of a `Profile`.
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "image": {
    "id": "https://example.org/beths-robot-badge.png",
    "caption": "A pretty badge, with many happy trees.",
    "author": "https://en.wikipedia.org/wiki/Bob_Ross"
}
{% endhighlight %}


### <a id="SocialMediaUrls"></a> Social Media URLs in Profiles
When using the `url` property of a profile to denote a social media account, use the canonical url of the account. For example, for a Twitter account, use `https://twitter.com/OpenBadges`. For a Facebook page or account, the URL is in the format `https://www.facebook.com/OpenBadges`.
