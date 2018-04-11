---
title: Open Badges Extensions
subtitle: Community-developed additions to the Open Badges Specification
show_sidebar: true
layout: page2
---
<div id="top">
<a href="http://www.imsglobal.org"><img src="../images/imsglobal-logo.png" alt="IMS Global Logo" id="imslogo" /></a>
</div>

## {{ page.title }}
Extensions are community developed contributions to the Open Badges Specification. Any issuer may define and publish them to include new types of metadata in badges. Any other issuer may use the same extensions to publish similar information in a mutually recognizable way.

These extensions are not part of the core specification and are governed by licensing and copyright terms of the authoring individuals and organizations.

### Open Badges Community Extensions [(below)](#CommunityExtensions)
Submit your published extensions to this page with a pull request on [GitHub](https://github.com/openbadges/openbadges-specification/blob/master/extensions/index.md), following the existing format of the page.

<small>Note: Extension authors are not required to host extensions on this page in order for them to be valid. Extension authors may publish descriptions, context and/or schema files required for a new extension on any publicly-accessible location, however that location should provide stable hosting for many years, because extended badges will lose their meaning if these resources become inaccessible.</small>


# Extension Example:

### <a id="ExampleExtension"></a> Example Extension Name
This is a definition of an example extension. If it were a real extension, it would describe the purpose of adding it to a badge object. If you follow the link [#ExampleExtension](#ExampleExtension), you'll get to this paragraph. This is the IRI (Internationalized Resource Identifier) to use for implementations of this extension, included below as the compact IRI `extensions:ExampleExtension`. See the [context](./exampleExtension/context.json) and [schema](./exampleExtension/schema.json) files that form the machine-readable core of this extension.

{::options parse_block_html="true" /}
<div class="table-wrapper">

Property     | Type        | Value Description
-------------|-------------|---------
**@context** | context IRI | [https://openbadgespec.org/extensions/exampleExtension/context.json](./exampleExtension/context.json)
**type**    | type IRI array |`['Extension', 'extensions:ExampleExtension']`
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

# <a id="CommunityExtensions"></a> Community Extensions:

### <a id="ApplyLink"></a> Apply Link
_Author: [Kerri Lemoie](https://github.com/kayaelle)_

The apply link provides a url that allows potential badge earners to apply for an opportunty as specified by the badge issuer.

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

### <a id="Endorsement"></a>Endorsement
[Endorsement](../index.html#Endorsement), previously an extension, is now part of the core specification. See [original](endorsement).

This property definition still resides here in the extensions namespace, which is now replaced by the `claim` property:

Property     | Type        | Value Description
-------------|-------------|---------
<a id="endorsedObject"></a>endorsedObject | object | An optional embedded copy of the endorsed Badge Object with 'id' attribute set.


### <a id="GeoCoordinates"></a>Geo Location
_Authors: [Doug Belshaw](http://dougbelshaw.com) and [Kerri Lemoie](https://github.com/kayaelle)_

An extension allowing for the addition of the geographic coordinates associated with a badge object. For example, geolocation could represent where a BadgeClass is available, where a badge Assertion was earned or the location of an issuer. The required description property allows implementers to be more specific about the reason location is included.

<div class="table-wrapper">

Property     | Type        | Value Description
-------------|-------------|---------
**@context** | context IRI | [https://w3id.org/openbadges/extensions/geoCoordinatesExtension/context.json](https://w3id.org/openbadges/extensions/geoCoordinatesExtension/context.json)
**type**    | type IRI array |`['Extension', 'schema:Place' 'extensions:GeoCoordinates']`
name | text | The place's name, if available
**description** | text | A description of the location
**geo** | <a href="#GeoCoordinates">GeoCordinates</a> | The GeoCoordinates of a location (containing the following properties)

<a name="GeoCordinates"></a>**GeoCoordinates**:

Property     | Type        | Value Description
-------------|-------------|---------
**latitude** | number | The latitude of a location
**longitude** | number | The longitude of a location

</div>

**Extendable Badge Objects:**
Assertion, BadgeClass, Issuer

**Example implementation:**
{% highlight json %}
{
  ...
  "schema:location": {
    "@context": "https://openbadgespec.org/extensions/geoCoordinatesExtension/context.json",
    "type": ["Extension", "extensions:GeoCoordinates", "schema:Place"],
    "name": "Stadium of Light, Sunderland",
    "description": "A foodball stadium in Sunderland, England that is home to Sunderland A.F.C.",
    "geo": {
      "latitude": 54.914440,
      "longitude": -1.387721
    }
  }
}
{% endhighlight %}

### <a id="Accessibility"></a> Accessibility
_Author: [Vincenzo Tilotta](https://github.com/tailot)_

An extension allowing for the addition of the content for people with disabilities.

<div class="table-wrapper">

Property     | Type        | Value Description
-------------|-------------|---------
**@context** | context IRI | [https://w3id.org/openbadges/extensions/accessibilityExtension/context.json](https://w3id.org/openbadges/extensions/accessibilityExtension/context.json)
**type**    | type IRI array |`['Extension', 'extensions:Accessibility']`
**accessibilityAPI** | text | Indicates that the resource is compatible with the referenced accessibility API. Possible values: `['AndroidAccessibility', 'ARIA', 'ATK', 'AT-SPI', 'BlackberryAccessibility', 'iAccessible2', 'iOSAccessibility', 'JavaAccessibility', 'MacOSXAccessibility', 'MSAA', 'UIAutomation']`
**accessibilityControl** | text | Identifies one or more input methods that allow access to all of the application functionality. Possible values: `['fullKeyboardControl', 'fullMouseControl', 'fullSwitchControl', 'fullTouchControl', 'fullVideoControl', 'fullVoiceControl']`
**accessibilityFeature** | text | Content features of the resource, such as accessible media, supported enhancements for accessibility and alternatives. `['alternativeText', 'annotations', 'audioDescription', 'bookmarks', 'braille', 'captions', 'ChemML', 'describedMath', 'displayTransformability', 'highContrastAudio', 'highContrastDisplay', 'index', 'largePrint', 'latex', 'longDescription','MathML', 'none', 'printPageNumbers', 'readingOrder', 'signLanguage', 'structuralNavigation', 'tableOfContents', 'taggedPDF', 'tactileGraphic', 'tactileObject', 'timingControl', 'transcript', 'ttsMarkup', 'unlocked']`
**accessibilityHazard** | text | A characteristic of the described resource that is physiologically dangerous to some users. Related to http://www.w3.org/TR/UNDERSTANDING-WCAG20/seizure.html `['flashing', 'noFlashingHazard', 'motionSimulation', 'noMotionSimulationHazard', 'sound', 'noSoundHazard']`

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
    "@context":"https://w3id.org/openbadges/extensions/accessibilityExtension/context.json",
    "type": ["Extension", "extensions:Accessibility"],
    "accessibilityAPI": "ARIA",
    "accessibilityControl": ["fullKeyboardControl","fullMouseControl","fullTouchControl"],
    "accessibilityFeature": "audioDescription",
    "accessibilityHazard": "noFlashingHazard",
    "url": "http://exampleaccessiblecontent.org/"
  }
}
{% endhighlight %}


### <a id="LicenseExtension"></a>Creative Commons Content License
_Editor: [Nate Otto](http://ottonomy.net)_

The content license extension enables issuers to indicate what permissions are granted to the public to reuse BadgeClass metadata in their own badges in terms of an expressive set of open content licenses that have broad global buy-in.

Thanks to editorial contributions from [Timothy F Cook](https://twitter.com/timothyfcook), [Attila Szabó Nagy](https://about.me/sznattila), [Serge Ravet](https://twitter.com/szerge), and [Jim Goodell](https://twitter.com/jgoodell2)

<div class="table-wrapper">

| Property      | Type           | Value Description
|---------------|----------------|-----------------------
| **@context**  | context IRI    | [https://openbadgespec.org/extensions/licenseExtension/context.json](licenseExtension/context.json)
| **type**      | type IRI array | `["extension", "cc:License"]`
| **id**        | @id (IRI)      | The URL unique identifier for the license that is used. For example, 'http://creativecommons.org/licenses/by/4.0/' (Aliases available to international versions: `CC-BY`, `CC-BY-SA`, `CC-BY-NC`, `CC-BY-NC-SA`, `CC-BY-ND`)
| **legalCode** | @id (IRI)      | The URL unique identifier for the license that is used. For example, 'http://creativecommons.org/licenses/by/4.0/legalcode'

</div>

*Extendable Badge Objects*: BadgeClass

*Example Implementation* (Abbreviated JSON-LD BadgeClass):
{% highlight json %}
{
  "@context": "https://w3id.org/openbadges/v2",
  "type": "BadgeClass",
  "name": "Licensed Badge",
  "...": "...",
  "schema:license": {
    "@context": "https://openbadgespec.org/extensions/licenseExtension/context.json",
    "type": ["Extension", "extensions:LicenseExtension", "cc:License"],
    "id": "CC-BY",
    "name": "Creative Commons Attribution",
    "legalCode": "http://creativecommons.org/licenses/by/4.0/legalcode"
  }
}
{% endhighlight %}

**Get Started**: See examples of all international Creative Commons licenses in use on the [License Extensions Example Page](licenseExtension).


### <a id="OriginalCreator"></a> Original Creator
_Author: [Antti Koskinen](https://github.com/ajk)_

This extension provides a way to track the origin of a badge when one organisation creates it for another.

For example, presume we have organisations X, Y and Z. A badge is created by X and they grant Y and Z the right to issue it.
IssuerClass of X is stored as the OriginalCreator in the BadgeClass and either Y or Z becomes the issuer.


<div class="table-wrapper">

Property     | Type        | Value Description
-------------|-------------|---------
**@context** | context IRI | [https://openbadgespec.org/extensions/originalCreatorExtension/context.json](./originalCreatorExtension/context.json)
**type**     | type IRI array |`['Extension', 'extensions:OriginalCreator']`
**url**      | string, uri | Valid url pointing to the Issuer document of the issuer that originally defined this BadgeClass

</div>

**Extendable Badge Objects:**
BadgeClass

**Example implementation:**
{% highlight json %}
{
  "extensions:OriginalCreator": {
    "@context":"https://openbadgespec.org/extensions/originalCreatorExtension/context.json",
    "type": ["Extension", "extensions:OriginalCreator"],
    "url": "https://example.org/creator-organisation.json"
  }
}
{% endhighlight %}

### <a id="IssuerAccreditation"></a> Issuer Accreditation 
_Author: [IMS Global](https://github.com/imsglobal)_

This extension is located at [https://www.imsglobal.org/ims-badge-extensions-education](https://www.imsglobal.org/ims-badge-extensions-education)



### <a id="AssessmentExtension"></a> Assessment 
_Author: [IMS Global](https://github.com/imsglobal)_

This extension allows issuers to embed metadata about assessment(s) performed in the badge awarding process, potentially including some questions and related rubric data.
See [documentation](./assessmentExtension)

### <a id="ExtraDescriptionExtension"></a> Extra Description
_Author: [Nate Otto](http://ottonomy.net)_

The Extra Description Extension allows issuers to add additional markdown-formatted descriptive fields to a BadgeClass or Issuer Profile. Each section has a name and a narrative. See [documentation](./extraDescription)


# xAPI Integration
An exploratory prototype draft xAPI vocabulary has been defined so that Open Badges will soon be referenceable from Experience API activity streams. See [xAPI Open Badges documentation](../xapi/) for details.

