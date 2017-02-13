---
title: Open Badges Baking Specification
subtitle: Instructions for Embedding Open Badges into PNG and SVG image files
show_sidebar: true
---
# Badge Baking

## What Is Badge Baking?

In OpenBadges we use structures called [assertions](../assertion.md), which are pieces of data that can be used to prove whether a not a person who says they got a badge earned it (in the technical sense that it was issued to them).

Badge Baking is the process of taking those assertions and embedding them into the image, so that when a user displays a badge on a page, software that is OpenBadges-aware can automatically extract that assertion data and perform the checks necessary to see if a person legitimately earned the badge.

## Technical Details

### PNGs

#### Baking

An <a href="http://www.w3.org/TR/PNG/#11iTXt">`iTXt` chunk</a> should be inserted into the PNG with **keyword** `openbadges`. The **text** can either be a signed badge assertion or the raw JSON for the OpenBadges assertion. Compression **MUST NOT** be used. At the moment, *language tag* and *translated keyword* have no semantics related to badge baking.

An example of creating a chunk (assuming an iTXt constructor):

{% highlight js %}
var chunk = new iTXt({
  keyword: 'openbadges',
  compression: 0,
  compressionMethod: 0,
  languageTag: '',
  translatedKeyword: '',
  text: signature || JSON.stringify(assertion)
})
{% endhighlight %}

An iTXt chunk with the keyword “openbadges” **MUST NOT** appear in a PNG more than once. When baking a badge that already contains OpenBadges data, the implementor may choose whether to pass the user an error or overwrite the existing chunk.

#### Extracting

Parse the PNG datastream until the first <a href="http://www.w3.org/TR/PNG/#11iTXt">`iTXt` chunk</a> is found with the keyword `openbadges`. The rest of the stream can be safely discarded. The text portion of the iTXt will either be the JSON representation of an OpenBadges assertion or a signature.

#### Legacy PNGs

The pre-specified behavior of badge baking worked differently. Instead of baking the whole assertion or signature into an `iTXt:openbadges` chunk, the URL pointing to the hosted assertion was baked into a `tEXt:openbadges` chunk. In order to get the full assertion, an additional HTTP request must be made after extracting the URL from the `tEXt` chunk.

### SVGs

#### Baking
First, Add an `xmlns:openbadges` attribute to the `<svg>` tag with the value "http://openbadges.org". Directly after the `<svg>` tag, add an `<openbadges:assertion>` tag with a `verify` attribute. The value of `verify` should either be a signed OpenBadges assertion **or** the URL from `verify.url` in the badge assertion.

If a signature is being baked, no tag body is necessary and the tag should be self closing.

If an assertion is being baked, the JSON representation of the assertion should go into the body of the tag, wrapped in `<![CDATA[...]]>`.

An example of a well baked SVG with a hosted assertion:

{% highlight xml %}
<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg"
     xmlns:openbadges="http://openbadges.org"
     viewBox="0 0 512 512">
  <openbadges:assertion verify="https://example.org/assertion.json">
    <![CDATA[
	   {
	     "@context": "https://w3id.org/openbadges/v2",
	     "id": "https://example.org/assertions/123",
	     "type": "Assertion",
	     "recipient": {
	       "type": "email",
	       "identity": "alice@example.org"
	     },
	     "issuedOn": "2016-12-31T23:59:59+00:00",
	     "verification": {
	       "type": "hosted"
	     },
	     "badge": {
	       "id": "https://example.org/badges/5",
		   "type": "BadgeClass",	       
	       "name": "3-D Printmaster",
	       "description": "This badge is awarded …",
	       "image": "https://example.org/badges/5/image",
	       "criteria": {
	         "narrative": "Students are tested on …"
	       },
	       "issuer": {
	         "id": "https://example.org/issuer",
	         "type": "Profile",
	         "name": "Example Maker Society",
	         "url": "https://example.org",
	         "email": "contact@example.org",
	         "verification": {
	            "allowedOrigins": "example.org"
	         }
	       }
	     }
	   }
    ]]>
  </openbadges:assertion>

  <rest-of-document...>
</svg>
{% endhighlight %}

There **MUST** be only one `<openbadges:assertion>` tag in an SVG. When baking a badge that already contains OpenBadges data, the implementor may choose whether to pass the user an error or overwrite the existing tag.

#### Extracting

Parse the SVG until you reach the first `<openbadges:assertion>` tag. The rest of the SVG data can safely be discarded.

If the tag has no body, the `verify` attribute will contain the signature of the badge. If there is a body, it will be the JSON representation of a badge assertion.

## Baking Specification Changelog

### 2013-11-05 Version 1.0.0
  * Support for full assertions added
  * Support for signed badges added
  * Support for SVGs added
  * PNG baking now uses `iTXt` chunk.

### Pre-release
  * Only PNGs supported: `tEXt` chunk used with keyword `openbadges`
  * Only hosted badges supported
  * Hosted URL embedded in PNG
