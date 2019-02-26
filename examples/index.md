---
title: Open Badges Examples
subtitle: Examples of Core Open Badges objects
show_sidebar: true
layout: page_sub
---
{::options parse_block_html="true" /}

<div id="top">
<a href="http://www.imsglobal.org"><img src="../images/imsglobal-logo.png" alt="IMS Global Logo" id="imslogo" /></a>
</div>

<p class="status">IMS Final Release</p>

<h1 class="infoModelTitle">{{page.title}} <br/> IMS Final Release</h1>

<br>

<table class="versionTable" title="Version/Release Details">
<tr>
<td>Date Issued:</td>
<td>12 April 2018</td>
</tr>
<tr>
<td>Status</td>
<td>IMS Final Release</td>
</tr>
<tr>
<td>Latest version:</td>
<td><a href="https://www.imsglobal.org/spec/ob/v2p0/examples/">https://www.imsglobal.org/spec/ob/v2p0/examples/</a></td>
</tr>
</table>

<br>

<div class="iprDistribution">
	
**IPR and Distribution Notices**

Recipients of this document are requested to submit, with their comments, notification of any relevant patent claims or other intellectual property rights of which they may be aware that might be infringed by any implementation of the specification set forth in this document, and to provide supporting documentation.

IMS takes no position regarding the validity or scope of any intellectual property or other rights that might be claimed to pertain to the implementation or use of the technology described in this document or the extent to which any license under such rights might or might not be available; neither does it represent that it has made any effort to identify any such rights. Information on IMS's procedures with respect to rights in IMS specifications can be found at the IMS Intellectual Property Rights web page: [http://www.imsglobal.org/ipr/imsipr_policyFinal.pdf](http://www.imsglobal.org/ipr/imsipr_policyFinal.pdf).

The Consortium draws attention to the fact that it is claimed that compliance with this specification may involve the use of a patent concerning  [https://patents.google.com/patent/US10033536B2/en](US10033536B2) and [https://patents.google.com/patent/US10068074B2/en] (US10068074B2). The Consortium takes no position concerning the evidence, validity or scope of such patent rights.

The patent holder has assured the Consortium that it is willing to license patent rights it owns or controls which would necessarily be infringed by any implementation of this specification to those licensees (Members and non-Members alike) desiring to implement this specification. The statement of the patent holder to such effect has been filed with the Consortium. Information may be obtained from:
Credly
349 Fifth Avenue,Suite 726
New York, NY 10016

Attention is also drawn to the possibility that some of the elements of this specification may be the subject of patent rights other than those identified above. The Consortium shall not be responsible for identifying any or all such patent rights.

The following participating organizations have made explicit license commitments to this specification:

<table width="100%" border="1">
    <tr>
      <td>Org  name </td>
      <td>&nbsp;Date license made</td>
      <td>Patent or other description</td>
      <td>&nbsp;Type</td>
    </tr>
    <tr>
      <td>Credly</td>
      <td>March 18, 2018</td>
      <td><a href="https://patents.google.com/patent/US10033536B2/en">US10033536B2</a> and <a href="https://patents.google.com/patent/US10068074B2/en">US10068074B2</a></td>
      <td>RF RAND (Required Elements)</td>
    </tr>
    <tr>
      <td>Pearson </td>
      <td>November 21, 2017</td>
      <td>&nbsp;</td>
      <td>RF RAND (Required Elements)</td>
    </tr>
  </table>



Copyright © 2018 IMS Global Learning Consortium. All Rights Reserved.

If you wish to distribute this document or use this document  to implement a product or service, you must
    complete a valid license registration with IMS and  receive an email from IMS granting the license. To
    register, follow the instructions on the IMS website: [http://www.imsglobal.org/specificationdownload.cfm](Specification Download)

This document may be copied and furnished to others by  Licensee organizations registered on the IMS
    website provided that the above copyright notice and this  paragraph are included on all such copies.
    However, this document itself may not be modified in any  way, such as by changing the details of the
    specification, removing the copyright notice or references  to IMS, except as needed for the purpose of
    developing IMS specifications under the auspices of a  chartered IMS work group.

Permission is granted to all parties to use excerpts from this document as needed in producing requests for proposals.

The limited permissions granted above are perpetual and will not be revoked by IMS or its successors or assigns.

THIS SPECIFICATION IS BEING OFFERED WITHOUT ANY WARRANTY WHATSOEVER, AND IN PARTICULAR, ANY WARRANTY OF NONINFRINGEMENT IS EXPRESSLY DISCLAIMED. ANY USE OF THIS SPECIFICATION SHALL BE MADE ENTIRELY AT THE IMPLEMENTER'S OWN RISK, AND NEITHER THE CONSORTIUM, NOR ANY OF ITS MEMBERS OR SUBMITTERS, SHALL HAVE ANY LIABILITY WHATSOEVER TO ANY IMPLEMENTER OR THIRD PARTY FOR ANY DAMAGES OF ANY NATURE WHATSOEVER, DIRECTLY OR INDIRECTLY, ARISING FROM THE USE OF THIS SPECIFICATION.

Public contributions, comments and questions can be posted here: [https://www.imsglobal.org/forums/ims-glc-public-forums-and-resources/open-badges-community-forum](https://www.imsglobal.org/forums/ims-glc-public-forums-and-resources/open-badges-community-forum).

<p class="endWarranty">The IMS Logo is a trademark of the IMS Global Learning Consortium, Inc. in the United States and/or other countries.</p>

<p class="endWarranty">For more information: [https://www.imsglobal.org/trademarks](https://www.imsglobal.org/trademarks) </p>

_Documents Name: {{page.title}}_

</div>

<br/>

<hr/>

#### Status of this Document
<div class="note good-news">
This document is made available for adoption by the public community at large.
</div>

## {{ page.subtitle }}
Information is divided between badge objects that describe an individual earner's accomplishment [(Assertion)](../index.html#Assertion), the general features of the achievement [(BadgeClass)](../index.html#BadgeClass), and the entity or organization issuing the badge [(Issuer)](../index.html#Issuer)

### <a id="Assertion"></a>Assertion Example ([definition](../index.html#Assertion))
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

### <a id="BadgeClass"></a>BadgeClass Example ([definition](../index.html#BadgeClass))
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

### <a id="Issuer"></a><a id="Profile"></a>Issuer/Profile Example ([definition](../index.html#Profile))
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

### Extension Examples ([definition](../index.html#Extensions))
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
While the Assertion, BadgeClass, and Profile are the minimal set of JSON-LD resources necessary for a valid badge, there are several secondary data classes that extend the usefulness, security, and portability of Open Badges. The examples below are often abbreviated to highlight a specific feature, so not all examples contain all the required properties to constitute a valid Badge Object of their type.

### <a id="SignedBadge"></a> Signed Badges Example ([definition](../index.html#SignedBadge))
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
Profile    | `https://example.org/organization.json`| A issuer `Profile` document that links to the CryptographicKey document with its `publicKey` property. [See above](#Profile)
PublicKey  | `https://example.org/publicKey.json` | A `CryptographicKey` document that links to the issuer `Profile` with its `owner` property. See below](#CryptographicKey).

</div>

### <a id="CryptographicKey"></a>CryptographicKey Example ([definition](../index.html#CryptographicKey))
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


### <a id="RevocationList"></a>RevocationList Example ([definition](../index.html#RevocationList))
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

### <a id="revoked-hosted-assertion"></a>Revoked Hosted Assertion Example (see more about [Hosted Verification](../index.html#HostedBadge))
Revoked hosted Assertions should be returned with the HTTP status `410 Gone`. The response body may contain an Assertion document with `"revoked": true` that contains additional metadata. It does not need to meet the full requirements of the `Assertion` class. Only `id` and `revoked` properties must be present
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "revoked": true,
  "revocationReason": "Turns out the student's robot was just three stacked children in a trenchcoat with dryer vent hose arms."
}
{% endhighlight %}


### <a id="Criteria"></a>Criteria Example ([definition](../index.html#Criteria))
A BadgeClass's `criteria` field may be populated with a HTTP(s) URI string or an instance of the `Criteria` class. Here, a URI is used:
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "criteria": "https://example.org/robotics-badge.html"
}
{% endhighlight %}

Embedding criteria into the badge allows display platforms to render criteria information to viewers without directing them to an external website. It may be used in parallel to a criteria URI as follows:
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "criteria": {
    "id": "https://example.org/robotics-badge.html",
    "narrative": "To earn the **Awesome Robotics Badge**, students must construct a
    basic robot.\n\nThe robot must be able to:\n\n  * Move forward and backwards.\n
    * Pick up a bucket by its handle."
  }
}
{% endhighlight %}

The Criteria class may also appear without using an external URI to increase portability, as fewer information dependencies then exist outside of the JSON-LD metadata. Additionally, the narrative can be used to make complex links with the BadgeClass's alignment targets.
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.org/beths-robotics-badge.json",
  "criteria": {
    "id": "https://example.org/robotics-badge.html",
    "narrative": "To earn the **Awesome Robotics Badge**, students must construct a
    basic robot.\n\nThe robot must be able to:\n\n  * Move forward and backwards 
    [1](https://example.org/robot-skills/1).\n  * Pick up a bucket by its handle
    [2](https://example.org/robot-skills/2)."
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
{% endhighlight %}

### <a id="Evidence"></a>Evidence Example ([definition](../index.html#Evidence))
Metadata related to evidence may be included in Assertions in several ways.

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

Evidence may be more fully described by using the [Evidence](../index.html#Evidence) class:
{% highlight json %}
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
{% endhighlight %}

It is possible to include multiple values for evidence in an Assertion.
Evidence may be more fully described by using the [Evidence](../index.html#Evidence) class:
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


### <a id="Image"></a>Image Example ([definition](../index.html#Image))
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
}
{% endhighlight %}


### <a id="SocialMediaUrls"></a> Social Media URLs in Profiles
When using the `url` property of a profile to denote a social media account, use the canonical url of the account. For example, for a Twitter account, use `https://twitter.com/OpenBadges`. For a Facebook page or account, the URL is in the format `https://www.facebook.com/OpenBadges`.


### <a id="badgeclass-version-control"></a> BadgeClass Versioning
The `version` property allows issuers to set a version number or string for a BadgeClass. This is particularly useful when replacing a previous version with an update.
{% highlight json %}
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
{% endhighlight %}


## <a id="Internationalization"></a> Internationalization Examples
The string internationalization features of JSON-LD make it possible for issuers to declare which language a Badge Object is expressed in:
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "@language": "en-us",
  "id": "https://example.org/beths-robotics-badge.json",
  "name": "Awesome Robotics Badge"
}
{% endhighlight %}

It is also possible to list multiple versions of Badge Objects to make available multiple equivalent versions of the same entity.
{% highlight json %}
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
{% endhighlight %}

**Notes**:

* Language codes must be compatible with [BCP47](https://tools.ietf.org/html/bcp47). Think "en" or "es-MX".
* JSON-LD allows much more expressive combinations of multiple languages in one document. It is likely that you may be able to produce Badge Objects taking advantage of these features that will not be understood by some or all validators or display tools. It is recommended to keep implementations as simple as possible and communicate with the standards group when you want to move beyond the example techniques expressed here.


## <a id="Endorsement"></a> Endorsement Examples
An endorser can use an `Endorsement` to indicate trust in an email address. Suppose the [issuer Profile record above](#Issuer) exists, but inspectors are unsure whether it is a trustworthy record that truly represents the organization it describes. Endorsements can show that an external party has verified one or more properties of the Issuer. Automated services could be developed to verify properties like `email` or `telephone`, and human verification services could provide more in-depth verification.

Here, an endorser claims to have verified the email address published in the Profile.
{% highlight json %}
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
{% endhighlight %}

Another prominent use of Endorsements is to provide a comment expressing approval of a BadgeClass, that it is a good representation of the achievement it describes. The endorser could publish the following about the [above](#BadgeClass) BadgeClass.
{% highlight json %}
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
{% endhighlight %}

The same method could be used to support a single recipient's achievement through endorsing an `Assertion`. Here the endorser also offers an addition to the evidence to be considered associated with the badge.
{% highlight json %}
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
{% endhighlight %}
