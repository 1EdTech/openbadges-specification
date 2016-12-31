---
title: Endorsement Extension (Deprecated)
subtitle: Community-developed addition to the Open Badges Specification
show_sidebar: true
layout: page
---
The Endorsement extension is deprecated since v2.0, with the addition of [Endorsement](../../#Endorsement) to the specification.

### <a id="Endorsement"></a>Endorsement
_Author: [Nate Otto](http://ottonomy.net)_

Any organization that is set up to issue badges may provide endorsements of other issuers' badge objects (Assertion, Badge Class or Issuer). For example, a school district may issue an endorsement to indicate approval of a specific Badge Class corresponding to professional development credits acceptable by the district. See the Badge Alliance Endorsement Working Group [framework paper](https://docs.google.com/document/d/1VVf19d72KmGMh1ywrLe7HCKEOqGSI0WjvwfGN_8Q2M4/edit) for background. 

Endorsement of a Badge Class serves to publicly acknowledge the value of a badge as *designed, assessed, and issued by a badge issuer*. Endorsements of an Issuer are presumed to apply to all Badge Classes and Assertions created by that Issuer. See the [context](./endorsement/context.json) and [schema](./endorsement/schema.json) for endorsement.

Property     | Type        | Value Description
-------------|-------------|---------
**@context** | context IRI | [https://w3id.org/openbadges/extensions/exampleExtension/context.json](context.json)
**type**    | type IRI array |`['Extension', 'extensions:Endorsement']`
**description** | string | The endorser's statement about the endorsement of this particular badge class.
endorsedObject | object | An optional embedded copy of the endorsed Badge Object with 'id' attribute set.

**Extendable Badge Objects:**
Assertion, BadgeClass, Issuer

This extension is a little more involved in that it requires a whole Badge Class to be created for each issuer who wants to use it. From there, the extension itself must be added to an Assertion whose recipient identity is the IRI (URL) of the endorsed Badge Object. Endorsers may use one Badge Class for all their endorsements, or they may create multiple badge classes to provide different types of endorsement. Consumers should consider both the Badge Class's `description` field as well as the Assertion's Endorsement extension's `description` property. The extension poses the option to embed the entire endorsed object so questions of intent could be resolved in case the hosted endorsed object is changed by its issuer.

**Example implementation:**

BadgeClass (each endorsing issuer must define a BadgeClass to use for endorsement):
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v1",
  "id": "http://endorser.org/endorsementclass1",
  "type": "BadgeClass",
  "name": "Endorsement Badge",
  "description": "Endorser's badge of support. Badges receiving this have been vetted by the Endorser.",
  "image": "http://endorser.org/endorsementimage.png",
  "criteria": "http://endorser.org/what-it-takes",
  "issuer": "http://endorser.org/issuer1"
}
{% endhighlight %}

Assertion (full copy of endorsed object elided):
{% highlight json %}
{ 
  "@context": "https://w3id.org/openbadges/v1",
  "id": "http://endorser.org/endorsement124",
  "type": "Assertion",
  "recipient": {
    "identity": "http://anotherissuer.org/badgeclass5",
    "type": "@id",
    "hashed": false 
  },
  "badge": "http://endorser.org/endorsementclass1",
  "extensions:Endorsement": {
    "@context":"https://w3id.org/openbadges/extensions/endorsement/context.json",
    "type": ["Extension", "extensions:Endorsement"],
    "description": "This badge is truly a work of art, and meaningful for its earners besides.",
    "endorsedObject": {
        "**": "*** Full copy of endorsed object ***"
    }
  },
  "issuedOn": "2015-05-20"
}
{% endhighlight %}