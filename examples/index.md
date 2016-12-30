---
title: Open Badges Examples
subtitle: Examples of 1.1 Open Badge objects
show_sidebar: true
layout: page
---

# {{ page.title }}
Open Badges consist of information about accomplishments stored in Badge Objects.

## {{ page.subtitle }}
Information is divided between badge objects that describe an individual earner's accomplishment [(Assertion)](../#Assertion), the general features of the achievement [(BadgeClass)](../#BadgeClass), and the entity or organization issuing the badge [(Issuer)](../#Issuer)

## [Assertion](../#Assertion) <a id="Assertion"></a>
An example of a badge Assertion using the `hosted` verification method. This JSON object is "baked" into a badge image (optionally linked at the Assertion's `image` property) and also hosted at the location specified by the `@id` and `verify.url` properties.
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v1",
  "type": "Assertion",
  "id": "https://example.org/beths-robotics-badge.json",
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
  "expires": 1609458300,
  "badge": "https://example.org/robotics-badge.json",
  "verify": {
    "type": "hosted",
    "url": "https://example.org/beths-robotics-badge.json"
  }
}
{% endhighlight %}

 * Assertions may be expire on an optional expiration date or may be revoked by removing the hosted assertion. For clarity, the hosted verification server should respond with the HTTP Status Code `410 Gone`.

## [BadgeClass](../#BadgeClass) <a id="BadgeClass"></a>
The BadgeClass is hosted at the URL/IRI from the Assertion's `badge` property.
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v1",
  "type": "BadgeClass",
  "id": "https://example.org/robotics-badge.json",
  "name": "Awesome Robotics Badge",
  "description": "For doing awesome things with robots that people think is pretty great.",
  "image": "https://example.org/robotics-badge.png",
  "criteria": "https://example.org/robotics-badge.html",
  "tags": ["robots", "awesome"],
  "issuer": "https://example.org/organization.json",
  "alignment": [
    { "name": "CCSS.ELA-Literacy.RST.11-12.3",
      "url": "http://www.corestandards.org/ELA-Literacy/RST/11-12/3",
      "description": "Follow precisely a complex multistep procedure when 
      carrying out experiments, taking measurements, or performing technical 
      tasks; analyze the specific results based on explanations in the text."
    },
    { "name": "CCSS.ELA-Literacy.RST.11-12.9",
      "url": "http://www.corestandards.org/ELA-Literacy/RST/11-12/9",
      "description": " Synthesize information from a range of sources (e.g.,
      texts, experiments, simulations) into a coherent understanding of a
      process, phenomenon, or concept, resolving conflicting information when
      possible."
    }
  ]
}
{% endhighlight %}

## [Issuer](../#Issuer) <a id="Issuer"></a>
Metadata about the issuer is defined in JSON at a URL/IRI defined by the BadgeClass's `issuer` property.
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v1",
  "type": "Issuer",
  "id": "https://example.org/organization.json",
  "name": "An Example Badge Issuer",
  "image": "https://example.org/logo.png",
  "url": "https://example.org",
  "email": "steved@example.org",
  "revocationList": "https://example.org/revoked.json"
}
{% endhighlight %}

## [Extension](../extensions/#ExampleExtension)
For examples of Badge Object Extensions and community-developed extensions ready for implementation, see the [Extensions page](../extensions/#ExampleExtension).

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
  "image": "https://example.org/beths-robot-badge.png",
  "evidence": "https://example.org/beths-robot-work.html",
  "issuedOn": 1359217910,
  "expires": 1609458300,
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

* In this example, the `badge` property in the Assertion is expanded to offer a full BadgeClass record, but not all identifying URIs are represented here as this type of expanded document. For example, `criteria` and `image` properties just use a URI instead of taking advantage of linked data classes for these items in the Specification. You may publish badge objects with a mix of URI references and expanded document formats that have indexable `id`s. Properties that in v1.1 expected a String URI datatype may now encounter a `{}` object containing an `id` property and other metadata. All such properties are now listed in the spec as expecting an @id (linked data subject) expecting the IRI or document representation of a certain data class.
* Because the properties describing the BadgeClass and issuer Profile are within the same context that's included at the top of the JSON-LD document, you don't need to include a new reference to the "@context" each time.
* Because this Assertion uses "hosted" verification, and there is no cryptographic signature to verify that the full document here is the exact one published by the issuer, verifier and displayer platforms will likely discard the embedded BadgeClass and issuer Profile here and replace them with the values discovered at their `id` URIs, because only those hosted documents can be trusted to be the creation of the issuer. If the Assertion uses "signed" verification, the validator may accept the embedded values as the intended BadgeClass and issuer Profile, and if they have multiple records for those entities that use the declared `id`, the validator may choose how to index and present that information. Issuers should change the `id`s of their BadgeClasses when they make edits if they wish the edits to essentially be understood as a different achievement than the one published under the original `id`.


## <a id="SignedBadge"></a> [Signed Badges](../#SignedBadge) 
A JSON Web Signature for a signed badge looks like the following. (Space has been added here around the `.` separators for clarity.)
{% highlight html %}
eyJhbGciOiJSUzI1NiJ9
.
eyJ1aWQiOiJhYmMtMTIzNCIsInJlY2lwaWVudCI6eyJ0eXBlIjoiZW1haWwiLCJoYXNoZWQiOnRydWUsInNhbHQiOiJkZWFkc2VhIiwiaWQiOiJzaGEyNTYkYzdlZjg2NDA1YmE3MWI4NWFjZDhlMmU5NTE2NmM0YjExMTQ0ODA4OWYyZTE1OTlmNDJmZTFiYmE0NmU4NjVjNSJ9LCJpbWFnZSI6Imh0dHBzOi8vZXhhbXBsZS5vcmcvYmV0aHMtcm9ib3QtYmFkZ2UucG5nIiwiZXZpZGVuY2UiOiJodHRwczovL2V4YW1wbGUub3JnL2JldGhzLXJvYm90LXdvcmsuaHRtbCIsImlzc3VlZE9uIjoxMzU5MjE3OTEwLCJiYWRnZSI6Imh0dHBzOi8vZXhhbXBsZS5vcmcvcm9ib3RpY3MtYmFkZ2UuanNvbiIsInZlcmlmeSI6eyJ0eXBlIjoic2lnbmVkIiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLm9yZy9wdWJsaWNLZXkucGVtIn19
.
Liv4CLviFH20_6RciUWf-jrUvMAecxT4KZ_gLHAeT_chrsCvBEE1uwgtwiarIs9acFfMi0FJzrGye6mhdHf3Kjv_6P7BsG3RPkYgK6-5i9uZv4QAIlvfNclWAoWUt4j0_Kip2ftzzWwc5old01nJRtudZHxo5eGosSPlztGRE9G_g_cTj32tz3fG92E2azPmbt7026G91rq80Mi-9c4bZm2EgrcwNBjO0p1mbKYXLIAAkOMuJZ_8S4Go8S0Sg3xC6ZCn03zWuXCP6bdY_jJx2BpmvqC3H55xWIU8p5c9RxI8YifPMmJq8ZQhjld0pl-L8kHolJx7KGfTjQSegANUPg
{% endhighlight %}
When base64 decoded this corresponds to the three JSON objects below for a signed 1.0 Open Badge:

 * header:
{% highlight json %}
{ "alg": "RS256" }
{% endhighlight %}
 * claims:
{% highlight json %}
{ "issuedOn": 1359217910, "uid": "abc-1234", "recipient": { "salt": "deadsea", "type": "email", "hashed": true, "id": "sha256$c7ef86405ba71b85acd8e2e95166c4b111448089f2e1599f42fe1bba46e865c5" }, "image": "https://example.org/beths-robot-badge.png", "evidence": "https://example.org/beths-robot-work.html", "verify": { "url": "https://example.org/publicKey.pem", "type": "signed" }, "badge": "https://example.org/robotics-badge.json" }
{% endhighlight %}
 * signature:
{% highlight html %}
Liv4CLviFH20_6RciUWf-jrUvMAecxT4KZ_gLHAeT_chrsCvBEE1uwgtwiarIs9acFfMi0FJzrGye6mhdHf3Kjv_6P7BsG3RPkYgK6-5i9uZv4QAIlvfNclWAoWUt4j0_Kip2ftzzWwc5old01nJRtudZHxo5eGosSPlztGRE9G_g_cTj32tz3fG92E2azPmbt7026G91rq80Mi-9c4bZm2EgrcwNBjO0p1mbKYXLIAAkOMuJZ_8S4Go8S0Sg3xC6ZCn03zWuXCP6bdY_jJx2BpmvqC3H55xWIU8p5c9RxI8YifPMmJq8ZQhjld0pl-L8kHolJx7KGfTjQSegANUPg
{% endhighlight %}

### [RevocationList](../#RevocationList) <a id="RevocationList"></a>
Issuers may have a RevocationList if they use `SignedBadge` verification. Checking this list is intended as part of the verification process for signed badges, just as checking for the hosted assertion is part of verifying a hosted badge. It is published as a JSON-LD document with type `RevocationList`. RevocationLists are linked from an issuer Profile via the `revocationList` property. The RevocationList identifies its issuer with the `issuer` property.

RevocationLists may identify revoked Assertions through their `revokedAssertions` property. Individual assertions are identified either by their `id` or (legacy) `uid` properties. `id`-identified Assertions may appear in a RevocationList as that id string or as an object with an `id` property and other metadata, usually just a `revocationReason`. The below example shows `id`s in the `urn:uuid` namespace, which is a recommended namespace for signed Assertions that do not have a hosted (HTTP) `id`.
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "id": "https://example.com/revocationList",
  "type": "RevocationList",
  "issuer": "https://example.com/issuer",
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

### <a id="SocialMediaUrls"></a> Social Media URLs in Profiles
When using the `url` property of a profile to denote a social media account, use the canonical url of the account. For example, for a Twitter account, use `https://twitter.com/OpenBadges`. For a Facebook page or account, the URL is in the format `https://www.facebook.com/OpenBadges`.

### <a id="setting-content-type"></a>Setting Content-Type

Badge Objects encoded in JSON should be served with the `application/json` content type. In the examples below `badge_assertion` is a native dictionary, hash
or associative array. `badge_assertion_json` is a prepared JSON string.

#### PHP
```javascript
// Do this before doing anything that starts a response
header('Content-Type: application/json');
```

#### Drupal 6
```javascript
// do not use drupal_json -- it sets the wrong header
drupal_add_http_header('Content-Type', 'application/json');
echo drupal_to_js(badge_assertion);
```
#### Drupal 7
```javascript
drupal_json_output(badge_assertion);
```

#### Django
```python
HttpResponse(badge_assertion_json, mimetype='application/json')
```

#### Rails
```ruby
render :json => badge_assertion
```

#### Apache
```apache
# Save your assertions as .json files and add this to your httpd.conf
AddType application/json        json
```

#### Nginx
```nginx
# In your server context, add the following:
types {
  applications/json     json;
}
```
