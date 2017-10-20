---
title: Open Badges Extensions
subtitle: Community-developed additions to the Open Badges Specification
show_sidebar: true
layout: page
---

## {{ page.title }}
Extensions are community developed contributions to the Open Badges Specification. Any issuer may define and publish them to include new types of metadata in badges. Any other issuer may use the same extensions to publish similar information in a mutually recognizable way.

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
[Endorsement](../#Endorsement), previously an extension, is now part of the core specification. See [original](endorsement).

This property definition still resides here in the extensions namespace, which is now replaced by the `claim` property:

Property     | Type        | Value Description
-------------|-------------|---------
<a id="endorsedObject"></a>endorsedObject | object | An optional embedded copy of the endorsed Badge Object with 'id' attribute set.


### <a name="GeoCoordinates"></a>Geo Location
_Authors: [Doug Belshaw](http://dougbelshaw.com) and [Kerri Lemoie](https://github.com/kayaelle)_

An extension allowing for the addition of the geographic coordinates associated with a badge object. For example, geolocation could represent where a Badge Class is available, where a badge was earned or the location of an issuer. The required description property allows implementers to be more specific about the reason location is included. The extended value takes

<div class="table-wrapper">

Property     | Type        | Value Description
-------------|-------------|---------
**@context** | context IRI | [https://w3id.org/openbadges/extensions/geoCoordinatesExtension/context.json](https://w3id.org/openbadges/extensions/geoCoordinatesExtension/context.json)
**type**    | type IRI array |`['Extension', 'schema:Place' 'extensions:GeoCoordinates']`
**name** | text | The place's name, if available
**description** | text | A description of the location
**geo** | object | The GeoCoordinates of a location (containing the following properties)

**GeoCoordinates**:

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
  "@context": "https://w3id.org/openbadges/v1",
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

### <a name="IssuerAccreditation"></a> Issuer Accreditation (DRAFT)
_Author: [IMS Global](https://github.com/imsglobal)_

This extension provides a reference to a single or to an array of multiple accreditation bodies as related to the Issuer Profile. Please note that this extension is in draft mode and may not be ready for production.


<div class="table-wrapper">

Property     | Type        | Value Description
-------------|-------------|---------
**@context** | context IRI | [https://openbadgespec.org/extensions/issuerAccreditationExtension/context.json](./issuerAccreditationExtension/context.json)
**type**     | type IRI array |`['Extension', 'extensions:IssuerAccreditation']`
**name**     | string| The official name of the organization, e.g. the registered company name. (required)
<a name="accreditationContactInstructions"></a>**contactInstructions**     | string | Contact instructions for an accrediting organization. (required)
**url**     | string,uri | URL of the accrediting organization. (required)
**address**     | object | Physical address of the accrediting organization. Object contains specific locality information. (required)
**streetAddress**     | string | The street address. For example, 1600 Amphitheatre Pkwy.
**addressLocality**     | string |  The locality. For example, Mountain View.
**addressRegion**     | string |  The region. For example, CA.
**postalCode**     | string |  The postal code. For example, 94043.
**description**     | string |  The description of the accrediting organization.
**logo**     | string,uri |  The logo for the accrediting organization.
**parentOrganization**     | object | The larger organization that the accrediting organization is a branch of, if any.
**areaServed**     | string |  The geographic area where accreditation services are targeted.
<a name="accreditationDate"></a>**accreditationDate**     | string |  The date accreditation was valid (ex: 2009-07-31).
<a name="accreditationEducationSector"></a>**educationSector**     | string |  Focus of accreditation (ex: K12, Postsecondary, CTE, Workforce, Adult Ed).

</div>

**Extendable Badge Objects:**
Issuer

**Example implementation (Single Accreditor):**
{% highlight json %}
{
  "extensions:IssuerAccreditation": {
    "@context":"https://openbadgespec.org/extensions/issuerAccreditationExtension/context.json",
    "type": ["Extension", "extensions:IssuerAccreditation"],
    "name": "Higher Learning Commission",
    "contactInstructions": "Visit website to request an institutional status and requirements report",
    "url": "http://hlcommission.org",
    "address": {
      "streetAddress": "230 South LaSalle Street, Suite 7-500",
      "addressLocality": "Chicago",
      "addressRegion": "IL",
      "postalCode": "60604-1411"
    },
    "description": "The Higher Learning Commission accredits degree-granting post-secondary educational institutions in the North Central region of the United States.",
    "logo": "http://www.cgscfoundation.org/wp-content/uploads/2016/01/hlc-logo.png",
    "parentOrganization" : {
      "name": "North Central Association of Colleges and Schools",
      "url": "http://www.northcentralassociation.org/"
    },
    "areaServed": "HLC accredits degree-granting post-secondary educational institutions in the North Central region, which includes the following 19 states: Arizona, Arkansas, Colorado, Illinois, Indiana, Iowa, Kansa, Michigan, Minnesota, Missouri, Nebraska, New Mexico, North Dakota, Ohio, Oklahoma, South Dakota, West Virginia, Wisconsin, Wyoming",
    "accreditationDate": "2009-07-31",
    "educationalSector": "post-secondary"
}
{% endhighlight %}

**Example implementation (Two Accreditors):**
{% highlight json %}
{
  "extensions:IssuerAccreditation": [{
    "@context":"https://openbadgespec.org/extensions/issuerAccreditationExtension/context.json",
    "type": ["Extension", "extensions:IssuerAccreditation"],
    "name": "Northwest Commission on Colleges and Universities",
    "contactInstructions": "Call or email the Commission Office",
    "url": "http://www.nwccu.org/index.htm",
    "address": {
      "streetAddress": "8060 165th Ave. NE, Suite 100",
      "addressLocality": "Redmond",
      "addressRegion": "WA",
      "postalCode": "98052"
    },
    "description": "The Northwest Commission on Colleges and Universities (NWCCU) is an independent, non-profit membership organization recognized by the U.S. Department of Education as the regional authority on educational quality and institutional effectiveness of higher education institutions.",
    "areaServed": "The US seven-state Northwest region of Alaska, Idaho, Montana, Nevada, Oregon, Utah, and Washington. US-AK, US-ID, US-MT, US-NV, US-OR, US-UT, US-WA",
    "accreditationDate": "2010-09-01",
    "educationalSector": "Postsecondary"
  },
  {
    "@context":"https://openbadgespec.org/extensions/issuerAccreditation/context.json",
    "type": ["Extension", "extensions:issuerAccreditation"],
    "name": "Commission on Accreditation of Allied Health Education Programs",
    "contactInstructions": "Contact Kathleen Megivern, Executive Director, megivern@caahep.org",
    "url": "http://www.ncacasi.org",
    "address": {
      "streetAddress": "25400 US Highway 19 N, Suite 158",
      "addressLocality": "Clearwater",
      "addressRegion": "FL",
      "postalCode": "33763"
    },
    "description": "CAAHEP is the largest programmatic accreditor in the health sciences field. In collaboration with its Committees on Accreditation, CAAHEP reviews and accredits over 2000 educational programs in twenty-eight (28) health science occupations.",
    "accreditationDate": "2014-04-01",
    "educationalSector": "postsecondary"
}]
{% endhighlight %}

### <a name="Assessment"></a> Assessment (DRAFT)
_Author: [IMS Global](https://github.com/imsglobal)_

This extension provides information about single or multiple assessments that would be completed by the recipient as part of the requirements for earning an OpenBadge. There could be multiple assessments of different types for each badge earned. Separate, independent evaluations of a single assessment could result in multiple assessment/evaluation records, all included in a single instance of the extension. Please note that this extension is in draft mode and may not be ready for production.


<div class="table-wrapper">

Property     | Type        | Value Description
-------------|-------------|---------
**@context** | context IRI | [https://openbadgespec.org/extensions/assessmentExtension/context.json](./assessmentExtension/context.json)
**type**     | type IRI array |`['Extension', 'extensions:Assessment']`
<a name="assessmentOverallDescription"></a>**overallDescription**     | string| A description of how the assessment activity is organized, particularly describing the relationship between multiple assessments included in the extension. (required)
<a name="assessmentArray"></a>**assessment**     | array | array of [Assessment Objects](#AssessmentObject) (at least one Assessment Object required)

</div>

#### <a id="AssessmentObject"></a>Assessment Object

<div class="table-wrapper">

Property     | Type        | Value Description
-------------|-------------|---------
<a name="assessmentDescription"></a>**assessmentDescription**     | string | Description of the single assessment. (required)
<a name="assessmentType"></a>**assessmentType**     | string | One of the following keywords: Exam, Performance or Artifact. (required)
<a name="assessmentOutput"></a>**assessmentOutput**     | string | This field provides additional details about assessmentType. Values for assessmentOutput are expected to be words or phrases that describe the key features of the evidence that are produced in earning the badge. (required)
<a name="assessmentHasGroupParticipation"></a>**hasGroupParticipation**     | boolean |  Completing the assessment activity being referenced requires two or more participants. (required)
<a name="assessmentHasGroupEvaluation"></a>**hasGroupEvaluation**     | boolean |  Participants in the assessment activity being referenced are scored as a group.(required)
<a name="assessmentEvaluationMethod"></a>**evaluationMethod**     | string |  Information about how the assessment is scored.  What do the scores represent in a range of scores? If a rubric was used, what are the score ranges for each criteria?
<a name="assessmentExample"></a>**assessmentExample**     | string, uri |  An example based on the assessment type.
<a name="scoringMethodExampleDescription"></a>**scoringMethodExampleDescription**     | string |  The text of an example of the method or tool used to score the assessment.
<a name="assessmentEvaluation"></a>**assessmentEvaluation**     | string, uri |  Link to studies or other information about research or calculations of reliability and validity for the assessment or the scoring methods.

</div>

**Extendable Badge Objects:**
Badge Class

**Example implementation (Single Assessment):**
{% highlight json %}
"extensions:Assessment": {
  "@context":"https://openbadgespec.org/extensions/assessmentExtension/context.json",
  "type": ["Extension", "extensions:assessment"],
  "overallDescription": "The assessment included are a simulated clinical setting and an actual clinical setting.",
  "assessment": [
    {
      "assessmentDescription": "The assessment presents a hypertension scenario with simulated lab results. It is administered to pathophysiology students in an undergraduate nursing program. Completing the assessment requires analytical writing describing and justifying the diagnoses and eliminating alternative diagnoses. See the Pathology of High Blood Pressure assignment and the hypertension scenario used for this assessment.",
      "assessmentType": "Artifact",
      "assessmentOutput": "Written responses to the questions posed in the hypertension scenario",
      "hasGroupParticipation": false,
      "hasGroupEvaluation": false,
      "evaluationMethod": "No studies have been done on reliability or validity but the hypertension scenario is consistent with scenarios encountered in nursing clinical practice.",
      "assessmentExample": "http://placeholderurl.com",
      "scoringMethodExampleDescription": "Placeholder text",
      "assessmentEvaluation": "http://placeholderurl.com"
    }
  ]
}
{% endhighlight %}

**Example implementation (Two Assessments):**
{% highlight json %}
"extensions:Assessment": {
  "@context":"https://openbadgespec.org/extensions/assessmentExtension/context.json",
  "type": ["Extension", "extensions:assessment"],
  "overallDescription": "The assessments included are a simulated clinical setting and an actual clinical setting.",
  "assessment": [
    {
      "assessmentDescription": "The assessment presents a hypertension scenario with simulated lab results. It is administered to pathophysiology students in an undergraduate nursing program. Completing the assessment requires analytical writing describing and justifying the diagnoses and eliminating alternative diagnoses. See the Pathology of High Blood Pressure assignment and the hypertension scenario used for this assessment.",
      "assessmentType": "Artifact",
      "assessmentOutput": "Written responses to the questions posed in the hypertension scenario",
      "hasGroupParticipation": false,
      "hasGroupEvaluation": false,
      "evaluationMethod": "No studies have been done on reliability or validity but the hypertension scenario is consistent with scenarios encountered in nursing clinical practice.",
      "assessmentExample": "http://placeholderurl.com"
    },
    {
      "assessmentDescription": "Requires following standard procedures in measuring vital signs in a clinic patient and explaining the  results of a standard lab analysis on the basis of deviations from the norm.",
      "assessmentType": "Performance",
      "assessmentOutput": "Clinical demonstration of interpreting blood pressure and lab results to patient without diagnoses, evaluated by clinical supervisor.",
      "hasGroupParticipation": false,
      "hasGroupEvaluation": true,
      "evaluationMethod": "Clinical supervisor uses a checklist to verify that the clinical demonstration includes the key elements that need to be communicated to the patient.",
      "scoringMethodExampleDescription": "Placeholder text"
    }
  ]
}
{% endhighlight %}


# xAPI Integration
An exploratory prototype draft xAPI vocabulary has been defined so that Open Badges will soon be referencable from Experience API activity streams. See [xAPI Open Badges documentation]({{site.baseurl}}/xapi/) for details.
