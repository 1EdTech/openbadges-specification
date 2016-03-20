---
title: Open Badges Extensions
subtitle: Community-developed additions to the Open Badges Specification
show_sidebar: true
layout: page
---

## {{ page.title }}
Extensions are community developed contributions to the Open Badges Specification. Any issuer may define and publish them to include new types of metadata in badges. Any other issuer may use the same extensions to publish similar information in a mutually recognizable way.

### [Open Badges Community Extensions](#CommunityExtensions)
Submit your published extensions to this page with a pull request on [GitHub](https://github.com/openbadges/openbadges-specification/blob/gh-pages/extensions/index.md), following the existing format of the page.


# Extension Example:

### <a name="ExampleExtension"></a> Example Extension Name
This is a definition of an example extension. If it were a real extension, it would describe the purpose of adding it to a badge object. If you follow the link [#ExampleExtension](#ExampleExtension), you'll get to this paragraph. This is the IRI (Internationalized Resource Identifier) to use for implementations of this extension, included below as the compact IRI `extensions:ExampleExtension`. See the [context](./exampleExtension/context.json) and [schema](./exampleExtension/schema.json) files that form the machine-readable core of this extension.

{::options parse_block_html="true" /}
<div class="table-wrapper">

Property     | Type        | Value Description
-------------|-------------|---------
**@context** | context IRI | [https://openbadgespec.org/extensions/exampleExtension/context.json](./exampleExtension/context.json)
**type**    | type IRI array |`['extension', 'extensions:ExampleExtension']`
**exampleProperty** | string | Any text the implementer likes.

</div>

**Extendable Badge Objects:**
Assertion, BadgeClass, Issuer

**Example implementation:**
{% highlight json %}
{ 
  "extensions:ExampleExtension": {
    "@context":"https://openbadgespec.org/extensions/exampleExtension/context.json",
    "type": ["Extension", "extensions:ExampleExtension"],
    "exampleProperty": "I'm a property, short and sweet."
  }
}
{% endhighlight %}


# Community Extensions:

### <a name="ApplyLink"></a> Apply Link
The apply link provides a url that allows potential badge earners to apply for an opportunty as specified by the badge issuer.

{::options parse_block_html="true" /}
<div class="table-wrapper">

Property     | Type        | Value Description
-------------|-------------|---------
**@context** | context IRI | [https://openbadgespec.org/extensions/applyLinkExtension/context.json](./applyLinkExtension/context.json)
**type**    | type IRI array |`['Extension', 'extensions:ApplyLink']`
**url** | string,uri | Valid url beginning with http:// or https://

</div>

**Extendable Badge Objects:**
BadgeClass

**Example implementation:**
{% highlight json %}
{ 
  "extensions:ApplyLink": {
    "@context":"https://openbadgespec.org/extensions/applyLinkExtension/context.json",
    "type": ["Extension", "extensions:ApplyLink"],
    "url": "http://website.com/apply"
  }
}
{% endhighlight %}

### <a name="Endorsement"></a>Endorsement
Any organization that is set up to issue badges may provide endorsements of other issuers' badge objects (Assertion, Badge Class or Issuer). For example, a school district may issue an endorsement to indicate approval of a specific Badge Class corresponding to professional development credits acceptable by the district. See the Badge Alliance Endorsement Working Group [framework paper](https://docs.google.com/document/d/1VVf19d72KmGMh1ywrLe7HCKEOqGSI0WjvwfGN_8Q2M4/edit) for background. 

Endorsement of a Badge Class serves to publicly acknowledge the value of a badge as *designed, assessed, and issued by a badge issuer*. Endorsements of an Issuer are presumed to apply to all Badge Classes and Assertions created by that Issuer. See the [context](./endorsement/context.json) and [schema](./endorsement/schema.json) for endorsement.

Property     | Type        | Value Description
-------------|-------------|---------
**@context** | context IRI | [https://w3id.org/openbadges/extensions/exampleExtension/context.json](./endorsement/context.json)
**type**    | type IRI array |`['Extension', 'extensions:Endorsement']`
**description** | string | The endorser's statement about the endorsement of this particular badge class.
<a name="Endorsement/endorsedObject"></a>endorsedObject | object | An optional embedded copy of the endorsed Badge Object with 'id' attribute set.

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

### <a name="accessibility"></a> Accessibility
An extension allowing for the addition of the content for people with disabilities.

{::options parse_block_html="true" /}
<div class="table-wrapper">

Property     | Type        | Value Description
-------------|-------------|---------
**@context** | context IRI | [https://w3id.org/openbadges/extensions/accessibility/context.json](https://w3id.org/openbadges/extensions/accessibility/context.json)
**type**    | type IRI array |`['Extension', 'extensions:Accessibility']`
**accessibilityAPI** | text | Indicates that the resource is compatible with the referenced accessibility API. Possible values: `['AndroidAccessibility','ARIA','ATK','AT-SPI','BlackberryAccessibility','iAccessible2','iOSAccessibility','JavaAccessibility','MacOSXAccessibility','MSAA','UIAutomation']`
**accessibilityControl** | text | Identifies one or more input methods that allow access to all of the application functionality. Possible values: `['fullKeyboardControl','fullMouseControl','fullSwitchControl','fullTouchControl','fullVideoControl','fullVoiceControl']`
**accessibilityFeature** | text | Content features of the resource, such as accessible media, supported enhancements for accessibility and alternatives. `['alternativeText','annotations','audioDescription','bookmarks','braille','captions','ChemML','describedMath','displayTransformability','highContrastAudio','highContrastDisplay','index','largePrint','latex','longDescription','MathML','none','printPageNumbers','readingOrder','signLanguage','structuralNavigation','tableOfContents','taggedPDF','tactileGraphic','tactileObject','timingControl','transcript','ttsMarkup','unlocked']`
**accessibilityHazard** | text | A characteristic of the described resource that is physiologically dangerous to some users. Related to http://www.w3.org/TR/UNDERSTANDING-WCAG20/seizure.html `['flashing','noFlashingHazard','motionSimulation','noMotionSimulationHazard','sound','noSoundHazard']`


</div>

**Extendable Badge Objects:**
Assertion, BadgeClass, Issuer

**Example implementation:**
{% highlight json %}
{
    "name": "Awesome Robotics Badge",
    "description": "For doing awesome things with robots that people think is pretty great.",
    "image": "http://openbadges.it/logo.png",
    "criteria": "https://example.org/robotics-badge.html",
    "tags": [
        "robots",
        "awesome"
    ],
    "issuer": "https://example.org/badge/issuer.json",
  "extensions:Accessibility": {
    "@context":"https://w3id.org/openbadges/extensions/accessibility/context.json",
    "type": ["Extension", "extensions:Accessibility"],
    "accessibilityAPI": "ARIA",
    "accessibilityControl": ["fullKeyboardControl","fullMouseControl","fullTouchControl"],
    "accessibilityFeature": "audioDescription",
    "accessibilityHazard": "noFlashingHazard",
    "url": "http://exampleaccessiblecontent.org/"
  }
}
{% endhighlight %}

# xAPI Integration
An exploratory prototype draft xAPI vocabulary has been defined so that Open Badges will soon be referencable from Experience API activity streams. See [xAPI Open Badges documentation]({{site.baseurl}}/xapi/) for details.
