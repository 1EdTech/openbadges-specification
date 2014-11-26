---
title: Open Badges Standard
subtitle: Awesome Sauce for the 21st Century
show_sidebar: true
---
## Open Badges: A common language for digital credentials
Open Badges are verifiable, portable digital credentials in the form of standardized JSON metadata about achievements "baked" into PNG or SVG image files.

Anybody can issue Open Badges, anyone can earn them, and anyone can verify their authenticity when an earner shares them. Thousands of issuers are recognizing millions of earners with badges.

## The Open Badges Standard in Depth
See [documentation]({{ site.url }}/docs#) for the full data specification. A valid Open Badge consists of an *Assertion*, a *Badge Class*, and an *Issuer*

### A Simple Example Assertion:
{% highlight json %}
```
{
  "@context": "http://standard.openbadges.org/1.1/context.json",
  "@id": "https://example.org/beths-robotics-badge.json",
  "@type": "assertion"
  "uid": "f2c20",
  "recipient": {
    "type": "email",
    "hashed": true,
    "salt": "deadsea",
    "identity": "sha256$c7ef86405ba71b85acd8e2e95166c4b111448089f2e1599f42fe1bba46e865c5"
  },
  "image": "https://example.org/beths-baked-robot-badge.png",
  "issuedOn": "2014-11-25T16:57:50-08:00",
  "badge": "https://example.org/robotics-badge.json",
  "verify": {
    "type": "hosted",
    "url": "https://example.org/beths-robotics-badge.json"
  }
}
```
{% endhighlight %}

This Assertion, embedded in an image file and delivered to an earner, is It is linked to a Badge Class `https://example.org/robotics-badge.json`, and an Issuer (through the Badge Class). Together, they constitute a verifiable claim about the earner's experience, as assessed and recognized by an Issuer. See more [examples]({{site.url}}/examples) of complete Open Badges.

## Developers
Open Badge software and services are available on a number of platforms ...

### Current Version: 1.1
Changelog: 

  * Added `@context`, `@type` and `@id` properties to make 1.1 Open Badge objects valid JSON-LD (Linked Data)
  * Defined extensions framework and JSON-schema based syntactic validation

Previous versions:

  * 1.0 ...
  * 0.5 ...

## Community Resources
  * openbadges.org
  * badgealliance.org
  * directory.openbadges.org