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
  "@context": "http://standard.openbadges.org/1.1/context.json",
  "@type": "assertion",
  "@id": "https://example.org/beths-robotics-badge.json",
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
  "@context": "http://standard.openbadges.org/1.1/context.json",
  "@type": "badgeclass",
  "@id": "https://example.org/robotics-badge.json",
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
  "name": "An Example Badge Issuer",
  "image": "https://example.org/logo.png",
  "url": "https://example.org",
  "email": "steved@example.org",
  "revocationList": "https://example.org/revoked.json"
}
{% endhighlight %}

## [Extension](../extensions/#ExampleExtension)
For examples of Badge Object Extensions and community-developed extensions ready for implementation, see the [Extensions page](../extensions/#ExampleExtension).

## [Signed Badges](../#SignedBadge) <a id="SignedBadge"></a>
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
A JSON dictionary of badge UIDs that have been revoked. The keys are the UIDs, and the value of each key is a string that could contain a reason for revocation. Checking this list is intended as part of the verification process for signed badges, just as checking for the hosted assertion is part of verifying a hosted badge.
{% highlight json %}
{
  "qp8g1s": "Issued in error",
  "2i9016k": "Issued in error",
  "1av09le": "Honor code violation"
}
{% endhighlight %}

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