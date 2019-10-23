var md = `

## Examples of Core Open Badges objects
Information is divided between badge objects that describe an individual earner's accomplishment (<a data-cite="OB-20#Assertion">Assertion</a>), the general features of the achievement (<a data-cite="OB-20#BadgeClass">BadgeClass</a>), and the entity or organization issuing the badge (<a data-cite="OB-20#Profile">Issuer</a>).


<h3 id="Assertion">Assertion Example</h3>

(<a data-cite="OB-20#Assertion">definition</a>)

An example of a badge Assertion using the <code>hosted</code> verification method. This JSON object is "baked" into a badge image (optionally linked at the Assertion's <code>image</code> property) and also hosted at the location specified by the <code>@id</code> and <code>verify.url</code> properties.
<pre>
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
</pre>


<h3 id="BadgeClass">BadgeClass Example</h3>

(<a data-cite="OB-20#BadgeClass">definition</a>)

The BadgeClass is hosted at the URI identified in associated Assertions' <code>badge</code> property.
<pre>
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
      "targetDescription": "Follow precisely a complex multistep procedure when carrying out experiments, taking measurements, or performing technical tasks; analyze the specific results based on explanations in the text.",
      "targetCode": "CCSS.ELA-Literacy.RST.11-12.3"
    },
    { "targetName": "Problem-Solving",
      "targetUrl": "https://learning.mozilla.org/en-US/web-literacy/skills#problem-solving",
      "targetDescription": "Using research, analysis, rapid prototyping, and feedback to formulate a problem and develop, test, and refine the solution/plan.",
      "targetFramework": "Mozilla 21st Century Skills"
    }
  ]
}
</pre>

**Notes**:

* The JSON-LD data model treats <code>"property": ["value"]</code> as equivalent to <code>"property": "value"</code>. An example of this is that <code>alignment</code> takes one or multiple AlignmentObjects. If only one value is present, it may or may not be included in <code>[]</code>. Not all of the Open Badges properties accept multiple values. For instance, <code>issuer</code> may only have one value.
* Many <code>@id</code>-type fields may have a property that appears as an IRI/URI or as an embedded JSON object (with <code>{}</code>). For example, <code>issuer</code> may include an embedded copy of the issuer Profile. Verifiers should fetch the issuer Profile from its HTTP <code>id</code> and in most cases treat the hosted value as the most up-to-date representation. In the case of signed-verification Assertions, an embedded <code>BadgeClass</code> or issuer <code>Profile</code> can be interpreted to be the value claimed at the time of issue, though <code>publicKeys</code> referenced in an embedded issuer <code>Profile</code> should not be trusted to belong to the issuer without checking the hosted Profile.


<h3 id="Profile">Profile (Issuer) Example</h3>

(<a data-cite="OB-20#Profile">definition</a>)

Metadata about the issuer is defined in JSON at a URL/IRI defined by the BadgeClass's <code>issuer</code> property.
<pre>
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
</pre>


<h3 id="Extensions">Extension Examples</h3>

(<a data-cite="OB-20#Extensions">definition</a>)

Extensions are formal sets of properties issuers and platforms add to the Open Badges Vocabulary. A number of community-developed extensions are published on the [[[OB-EXTENSIONS]]] page with embedded examples of each.

## Open Badges in Linked Data
Because Open Badges are Linked Data objects often hosted at HTTP IRIs, we can use the methods of identifying connections using Badge Objects can identify their connected resources either by their string IRI or by embedding a copy of the related document into the source document. For example, an Assertion may include its BadgeClass definition for portability instead of just linking to the URI of the BadgeClass object. Here, the BadgeClass and its issuer Profile record have been included in the Assertion. Each has its "id" property set to the URI where it is published, the unique identifier for that object. Displayer platforms can use that value to index these records. 
<pre>
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
</pre>

**Notes**:
* In this example, the <code>badge</code> property in the Assertion is expanded to offer a full BadgeClass record, but not all identifying URIs (<code>@id</code>-type fields) are represented here as this type of expanded document. For example, <code>criteria</code> and <code>image</code> properties just use a URI here instead of taking advantage of linked data classes for these items in the Specification. You may publish badge objects with a mix of URI references and expanded document formats that have indexable <code>id</code>s. Properties that in v1.1 expected a String URI datatype may now encounter a <code>{}</code> object containing an <code>id</code> property and other metadata. All such properties are now listed in the spec as expecting an @id (linked data subject) expecting the IRI or document representation of a certain data class.
* Because the properties describing the BadgeClass and issuer Profile are within the same context that's included at the top of the JSON-LD document, you don't need to include a new reference to the "@context" each time.
* Because this Assertion uses "hosted" verification, and there is no cryptographic signature to verify that the full document here is the exact one published by the issuer, verifier and displayer platforms will likely discard the embedded BadgeClass and issuer Profile here and replace them with the values discovered at their <code>id</code> URIs, because only those hosted documents can be trusted to be the creation of the issuer. If the Assertion uses "signed" verification, the validator may accept the embedded values as the intended BadgeClass and issuer Profile, and if they have multiple records for those entities that use the declared <code>id</code>, the validator may choose how to index and present that information. Issuers should change the <code>id</code>s of their BadgeClasses when they make edits if they wish the edits to essentially be understood as a different achievement than the one published under the original <code>id</code>.

## Additional Vocabulary Classes Examples
While the Assertion, BadgeClass, and Profile are the minimal set of JSON-LD resources necessary for a valid badge, there are several secondary data classes that extend the usefulness, security, and portability of Open Badges. The examples below are often abbreviated to highlight a specific feature, so not all examples contain all the required properties to constitute a valid Badge Object of their type.


<h3 id="SignedBadge">Signed Badges Example</h3>

(<a data-cite="OB-20#SignedBadge">definition</a>)

[[[RFC7515]]] is a signature method accepted for Open Badges objects. A JSON Web Signature (JWS) for a signed Assertion is made up of three components, packaged as a string with <code>.</code>s used as separators. (Space has been added here around the <code>.</code> separators for clarity.) This example is not a valid JWS, as the referenced key on example.org does not exist.
<pre>
eyJhbGciOiJSUzI1NiJ9
.
ew0KICAiQGNvbnRleHQiOiAiaHR0cHM6Ly93M2lkLm9yZy9vcGVuYmFkZ2VzL3YyIiwNCiAgInR5cGUiOiAiQXNzZXJ0aW9uIiwNCiAgImlkIjogImh0dHBzOi8vZXhhbXBsZS5vcmcvYmV0aHMtcm9ib3RpY3MtYmFkZ2UuanNvbiIsDQogICJyZWNpcGllbnQiOiB7DQogICAgInR5cGUiOiAiZW1haWwiLA0KICAgICJoYXNoZWQiOiB0cnVlLA0KICAgICJzYWx0IjogImRlYWRzZWEiLA0KICAgICJpZGVudGl0eSI6ICJzaGEyNTYkYzdlZjg2NDA1YmE3MWI4NWFjZDhlMmU5NTE2NmM0YjExMTQ0ODA4OWYyZTE1OTlmNDJmZTFiYmE0NmU4NjVjNSINCiAgfSwNCiAgImltYWdlIjogImh0dHBzOi8vZXhhbXBsZS5vcmcvYmV0aHMtcm9ib3QtYmFkZ2UucG5nIiwNCiAgImV2aWRlbmNlIjogImh0dHBzOi8vZXhhbXBsZS5vcmcvYmV0aHMtcm9ib3Qtd29yay5odG1sIiwNCiAgImlzc3VlZE9uIjogIjIwMTYtMTItMzFUMjM6NTk6NTlaIiwNCiAgImJhZGdlIjogImh0dHBzOi8vZXhhbXBsZS5vcmcvcm9ib3RpY3MtYmFkZ2UuanNvbiIsDQogICJ2ZXJpZnkiOiB7DQogICAgInR5cGUiOiAiU2lnbmVkQmFkZ2UiLA0KICAgICJjcmVhdG9yIjogImh0dHBzOi8vZXhhbXBsZS5vcmcvcHVibGljS2V5Ig0KICB9DQp9
.
Liv4CLviFH20_6RciUWf-jrUvMAecxT4KZ_gLHAeT_chrsCvBEE1uwgtwiarIs9acFfMi0FJzrGye6mhdHf3Kjv_6P7BsG3RPkYgK6-5i9uZv4QAIlvfNclWAoWUt4j0_Kip2ftzzWwc5old01nJRtudZHxo5eGosSPlztGRE9G_g_cTj32tz3fG92E2azPmbt7026G91rq80Mi-9c4bZm2EgrcwNBjO0p1mbKYXLIAAkOMuJZ_8S4Go8S0Sg3xC6ZCn03zWuXCP6bdY_jJx2BpmvqC3H55xWIU8p5c9RxI8YifPMmJq8ZQhjld0pl-L8kHolJx7KGfTjQSegANUPg
</pre>
When base64 decoded this corresponds to the three JSON objects below for a signed 2.0 Open Badge:

Header:
<pre>
{ "alg": "RS256" }
</pre>
Claims:
<pre>
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
</pre>
Signature:
<pre>
Liv4CLviFH20_6RciUWf-jrUvMAecxT4KZ_gLHAeT_chrsCvBEE1uwgtwiarIs9acFfMi0FJzrGye6mhdHf3Kjv_6P7BsG3RPkYgK6-5i9uZv4QAIlvfNclWAoWUt4j0_Kip2ftzzWwc5old01nJRtudZHxo5eGosSPlztGRE9G_g_cTj32tz3fG92E2azPmbt7026G91rq80Mi-9c4bZm2EgrcwNBjO0p1mbKYXLIAAkOMuJZ_8S4Go8S0Sg3xC6ZCn03zWuXCP6bdY_jJx2BpmvqC3H55xWIU8p5c9RxI8YifPMmJq8ZQhjld0pl-L8kHolJx7KGfTjQSegANUPg
</pre>

#### Using Cryptographic Keys
In the above example, a keypair with <code>publicKey</code> identifier <code>https://example.org/publicKey.json</code> was used to sign a badge Assertion. The following resources should exist for this to be a functional example:

Type       | id            | Description
-----------|---------------|-----------
Assertion  | <code>urn:uuid:a953081a-4bbd-4927-9653-7219bca00e3b</code> | There is no HTTP(s) <code>id</code> for this <code>Assertion</code>, because it was delivered as a JWS. It links to the BadgeClass document with the <code>badge</code> property. [See immediately above](#SignedBadge).
BadgeClass | <code>https://example.org/robotics-badge.json</code> | A <code>BadgeClass</code> document that links to the Issuer. [See above](#BadgeClass).
Profile    | <code>https://example.org/organization.json</code>| A issuer <code>Profile</code> document that links to the CryptographicKey document with its <code>publicKey</code> property. [See above](#Profile)
PublicKey  | <code>https://example.org/publicKey.json</code> | A <code>CryptographicKey</code> document that links to the issuer <code>Profile</code> with its <code>owner</code> property. [See below](#CryptographicKey.


<h3 id="CryptographicKey">CryptographicKey Example</h3>

(<a data-cite="OB-20#CryptographicKey">definition</a>)

A public key document should describe an Open Badges issuer's public key. For maximum compatibility, it should have its own HTTP(S) identifier, and should identify its issuer using the <code>owner</code> property. The <code>publicKeyPem</code> shown below has been abbreviated with <code>...</code> for readability.

<pre>
{
  "@context": "https://w3id.org/openbadges/v2",
  "type": "CryptographicKey",
  "id": "https://example.org/publicKey.json",
  "owner": "https://example.org/organization.json",
  "publicKeyPem": "-----BEGIN PUBLIC KEY-----\\nMIIBG0BA...OClDQAB\\n-----END PUBLIC KEY-----\\n"
}
</pre>


<h3 id="RevocationList">RevocationList Example</h3>

(<a data-cite="OB-20#RevocationList">definition</a>)

Issuers may have a RevocationList if they use <code>SignedBadge</code> verification. Checking this list is intended as part of the verification process for signed badges, just as checking for the hosted assertion is part of verifying a hosted badge. It is published as a JSON-LD document with type <code>RevocationList</code>. RevocationLists are linked from an issuer Profile via the <code>revocationList</code> property. The RevocationList identifies its issuer with the <code>issuer</code> property.

RevocationLists may identify revoked Assertions through their <code>revokedAssertions</code> property. Individual assertions are identified either by their <code>id</code> or (legacy) <code>uid</code> properties. <code>id</code>-identified Assertions may appear in a RevocationList as that id string or as an object with an <code>id</code> property and other metadata, usually just a <code>revocationReason</code>. The below example shows <code>id</code>s in the <code>urn:uuid</code> namespace, which is a recommended namespace for signed Assertions that do not have a hosted (HTTP) <code>id</code>.
<pre>
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
</pre>


<h3 id="HostedBadge">Revoked Hosted Assertion Example</h3>

(see more about <a data-cite="OB-20#HostedBadge">Hosted Verification</a>)

Revoked hosted Assertions should be returned with the HTTP status <code>410 Gone</code>. The response body may contain an Assertion document with <code>"revoked": true</code> that contains additional metadata. It does not need to meet the full requirements of the <code>Assertion</code> class. Only <code>id</code> and <code>revoked</code> properties must be present
<pre>
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "revoked": true,
  "revocationReason": "Turns out the student's robot was just three stacked children in a trenchcoat with dryer vent hose arms."
}
</pre>


<h3 id="Criteria">Criteria Example</h3>

(<a data-cite="OB-20#Criteria">definition</a>)

A BadgeClass's <code>criteria</code> field may be populated with a HTTP(s) URI string or an instance of the <code>Criteria</code> class. Here, a URI is used:
<pre>
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "criteria": "https://example.org/robotics-badge.html"
}
</pre>

Embedding criteria into the badge allows display platforms to render criteria information to viewers without directing them to an external website. It may be used in parallel to a criteria URI as follows:
<pre>
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "criteria": {
    "id": "https://example.org/robotics-badge.html",
    "narrative": "To earn the **Awesome Robotics Badge**, students must construct a basic robot.\\n\\nThe robot must be able to:\\n\\n * Move forward and backwards.\\n * Pick up a bucket by its handle."
  }
}
</pre>

The Criteria class may also appear without using an external URI to increase portability, as fewer information dependencies then exist outside of the JSON-LD metadata. Additionally, the narrative can be used to make complex links with the BadgeClass's alignment targets.
<pre>
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "criteria": {
    "id": "https://example.org/robotics-badge.html",
    "narrative": "To earn the **Awesome Robotics Badge**, students must construct a basic robot.\\n\\nThe robot must be able  to:\\n\\n  * Move forward and backwards [1](https://example.org/robot-skills/1).\\n  * Pick up a bucket by its handle [2](https://example.org/robot-skills/2)."
  },
  "alignment": [
    {
      "targetUrl": "https://example.org/robot-skills/1",
      "targetName": "Basic Locomotion"
    },
    {
      "targetUrl": "https://example.org/robot-skills/2",
      "targetName": "Object Manipulation"
    }
  ]
}
</pre>


<h3 id="Evidence">Evidence Example</h3>

(<a data-cite="OB-20#Evidence">definition</a>)

Metadata related to evidence may be included in Assertions in several ways.

The issuer may provide a text/Markdown <code>narrative</code> describing the evidence:
<pre>
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "narrative": "This student invented her own type of robot. This included: \\n\\n  * Working robot arms\\n  * Working robot legs"
}
</pre>

Evidence may be referenced by URI <code>id</code>:
<pre>
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "evidence": "https://example.org/beths-robot-work.html"
}
</pre>

Evidence may be more fully described by using the <a data-cite="OB-20#Evidence">Evidence</a> class:
<pre>
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "evidence": {
    "id": "https://example.org/beths-robot-work.html",
    "name": "My Robot",
    "description": "A webpage with a photo and a description of the robot the student built for this project.",
    "narrative": "The student worked very hard to assemble and present a robot. She documented the process with photography and text.",
    "genre": "ePortfolio"
}
</pre>

It is possible to include multiple values for evidence in an Assertion.
Evidence may be more fully described by using the <a data-cite="OB-20#Evidence">Evidence</a> class:
<pre>
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "narrative": "This student invented her own type of robot. This included: \\n\\n  * Working robot arms\\n  * Working robot legs",
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
</pre>


<h3 id="Image">Image</h3>

(<a data-cite="OB-20#Image">definition</a>)

In order to provide extra useful information for rendering images, sometimes additional metadata about images is included in Badge Objects using the <code>Image</code> class.

Images are often referenced by their HTTP URI where they may be accessed. Displayers usually render this as the image source in HTML.
<pre>
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "image": "https://example.org/beths-robot-badge.png"
}
</pre>

However, additional properties are available, and can be referenced wherever images appear in Badge Objects. For example, a <code>caption</code> can aid in rendering alt text in browsers. If <code>author</code> is used, it may be the <code>id</code> of an Open Badges Profile, but it may be another <code>id</code> that represents the author. Displayers should not assume this is a URI that will resolve to a compatible instance of a <code>Profile</code>.
<pre>
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "image": {
    "id": "https://example.org/beths-robot-badge.png",
    "caption": "A pretty badge, with many happy trees.",
    "author": "https://en.wikipedia.org/wiki/Bob_Ross"
  }
}
</pre>


<h3 id="SocialMediaUrls">Social Media URLs in Profiles</h3>

When using the <code>url</code> property of a profile to denote a social media account, use the canonical url of the account. For example, for a Twitter account, use <code>https://twitter.com/OpenBadges</code>. For a Facebook page or account, the URL is in the format <code>https://www.facebook.com/OpenBadges</code>.


<h3 id="badgeclass-version-control">BadgeClass Versioning</h3>

The <code>version</code> property allows issuers to set a version number or string for a BadgeClass. This is particularly useful when replacing a previous version with an update.
<pre>
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge-v2.json",
  "name": "Awesomer Robotics Badge",
  "version": 2,
  "related": {
    "id": "https://example.org/beths-robotics-badge.json",
    "version": 1
  }
}
</pre>


<h2 id="Internationalization">Internationalization Examples</h2>

The string internationalization features of JSON-LD make it possible for issuers to declare which language a Badge Object is expressed in:
<pre>
{
  "@context": "https://w3id.org/openbadges/v2",
  "@language": "en-us",
  "id": "https://example.org/beths-robotics-badge.json",
  "name": "Awesome Robotics Badge"
}
</pre>

It is also possible to list multiple versions of Badge Objects to make available multiple equivalent versions of the same entity.
<pre>
{
  "@context": "https://w3id.org/openbadges/v2",
  "@language": "en-us",
  "id": "https://example.org/beths-robotics-badge.json",
  "name": "Awesome Robotics Badge",
  "related": [{
      "id": "https://example.org/beths-robotics-badge-es.json?l=es",
      "@language": "es"
    }]
}
</pre>

**Notes**:

* Language codes must be compatible with [[[BCP47]]]. Think "en" or "es-MX".
* JSON-LD allows much more expressive combinations of multiple languages in one document. It is likely that you may be able to produce Badge Objects taking advantage of these features that will not be understood by some or all validators or display tools. It is recommended to keep implementations as simple as possible and communicate with the standards group when you want to move beyond the example techniques expressed here.


<h2 id="Endorsement">Endorsement Examples</h2>

An endorser can use an <code>Endorsement</code> to indicate trust in an email address. Suppose the [issuer Profile record above](#Profile) exists, but inspectors are unsure whether it is a trustworthy record that truly represents the organization it describes. Endorsements can show that an external party has verified one or more properties of the Issuer. Automated services could be developed to verify properties like <code>email</code> or <code>telephone</code>, and human verification services could provide more in-depth verification.

Here, an endorser claims to have verified the email address published in the Profile.
<pre>
{
 "@context": "https://w3id.org/openbadges/v2",
 "type": "Endorsement",
 "id": "https://example.org/endorsement-123.json",
 "issuer": "https://example.org/issuer-5.json",
 "claim": {
   "id": "https://example.org/organization.json",
   "email": "contact@example.org",
 },
 "verification": {
   "type": "hosted"
 }
}
</pre>

Another prominent use of Endorsements is to provide a comment expressing approval of a BadgeClass, that it is a good representation of the achievement it describes. The endorser could publish the following about the [above](#BadgeClass) BadgeClass.
<pre>
{
 "@context": "https://w3id.org/openbadges/v2",
 "type": "Endorsement",
 "id": "https://example.org/endorsement-124.json",
 "issuer": "https://example.org/issuer-5.json",
 "claim": {
   "id": "https://example.org/robotics-badge.json",
   "endorsementComment": "This badge and its associated learning material are great examples of beginning robotics education."
 },
 "verification": {
   "type": "hosted"
 }
}
</pre>

The same method could be used to support a single recipient's achievement through endorsing an <code>Assertion</code>. Here the endorser also offers an addition to the evidence to be considered associated with the badge.
<pre>
{
 "@context": "https://w3id.org/openbadges/v2",
 "type": "Endorsement",
 "id": "https://example.org/endorsement-125.json",
 "issuer": "https://example.org/issuer-5.json",
 "claim": {
   "id": "https://example.org/beths-robotics-badge.json",
   "endorsementComment": "This student built a great robot.",
   "evidence": "https://example.org/photos/my-photos-of-the-robot-competition.html"
 },
 "verification": {
   "type": "hosted"
 }
}
</pre>

<div></div>
`;