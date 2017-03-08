---
title: Open Badges Baking Specification
subtitle: Instructions for Embedding Open Badges into PNG and SVG image files
show_sidebar: true
layout: page
---
{::options parse_block_html="true" /}

<div id="top">
<a href="http://www.imsglobal.org"><img src="../images/imsglobal-logo.png" alt="IMS Global Logo" border="0" /></a>
</div>

<p class="status">IMS Candidate Final / Public Draft</p>

<h1 class="infoModelTitle">{{page.title}} <br/> IMS Candidate Final / Public Draft</h1>

<br>

<table class="versionTable" title="Version/Release Details" summary="Details about the version and release.">
<tr>
<td>Date Issued:</td>
<td>08 March, 2017</td>
</tr>
<tr>
<td>Status</td>
<td>IMS Candidate Final / Public Draft</td>
</tr>
<tr>
<td>Latest version:</td>
<td><a href="http://www.imsglobal.org/@@@/">http://www.imsglobal.org/@@@/</a></td>
</tr>
</table>

<br>

<div class="iprDistribution">
	
**IPR and Distribution Notices**

Recipients of this document are requested to submit, with their comments, notification of any relevant patent claims or other intellectual property rights of which they may be aware that might be infringed by any implementation of the specification set forth in this document, and to provide supporting documentation.

IMS takes no position regarding the validity or scope of any intellectual property or other rights that might be claimed to pertain to the implementation or use of the technology described in this document or the extent to which any license under such rights might or might not be available; neither does it represent that it has made any effort to identify any such rights. Information on IMS's procedures with respect to rights in IMS specifications can be found at the IMS Intellectual Property Rights web page: http://www.imsglobal.org/ipr/imsipr_policyFinal.pdf.

Copyright © 2017 IMS Global Learning Consortium, published under the IMS Global [contributor license agreement](https://www.imsglobal.org/sites/default/files/IMS%20Individual%20Contributor%20License%20Agreement.pdf) and [specification license](https://www.imsglobal.org/speclicense.html). This specification is free for anyone to use or implement.

Permission is granted to all parties to use excerpts from this document as needed in producing requests for proposals.

The limited permissions granted above are perpetual and will not be revoked by IMS or its successors or assigns.

THIS SPECIFICATION IS BEING OFFERED WITHOUT ANY WARRANTY WHATSOEVER, AND IN PARTICULAR, ANY WARRANTY OF NONINFRINGEMENT IS EXPRESSLY DISCLAIMED. ANY USE OF THIS SPECIFICATION SHALL BE MADE ENTIRELY AT THE IMPLEMENTER'S OWN RISK, AND NEITHER THE CONSORTIUM, NOR ANY OF ITS MEMBERS OR SUBMITTERS, SHALL HAVE ANY LIABILITY WHATSOEVER TO ANY IMPLEMENTER OR THIRD PARTY FOR ANY DAMAGES OF ANY NATURE WHATSOEVER, DIRECTLY OR INDIRECTLY, ARISING FROM THE USE OF THIS SPECIFICATION.

Public contributions, comments and questions can be posted here: https://www.imsglobal.org/forums/ims-glc-public-forums-and-resources/open-badges-community-forum.

<p class="endWarranty">The IMS Logo is a trademark of the IMS Global Learning Consortium, Inc. in the United States and/or other countries.</p>

<p class="endWarranty">For more information: https://www.imsglobal.org/trademarks </p>

_Documents Name: {{page.title}}_

_Revision: 08 March 2017_

</div>

<br/>

<hr/>

#### Status of this Document
<div class="note good-news">
This document is a Candidate Final / Public Draft of the Open Badges 2.0 specification, released on 08 March 2017 by IMS Global Learning Consortium. The specification will be considered final when approved by the IMS Technical Advisory Board and published as Final Release by IMS Global.
</div>

# Badge Baking

## What Is Badge Baking?

Open Badges may be transmitted as image files with badge Assertions encoded within. This allows Open Badges to be portable wherever image files may be stored or displayed. Each [Assertion](../#Assertion) expresses verifiable information about an individual's achievement. 

Badge Baking is the process of taking an Assertion and embedding it into the badge image, so that when a user displays a badge on a page, software that is OpenBadges-aware can automatically extract that Assertion data and perform the checks necessary to see if a person legitimately earned the badge. The [BadgeClass](../#BadgeClass) image must be in either PNG or SVG format in order to support baking.

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
  <openbadges:assertion verify="https://example.org/assertions/123">
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

### 2017-02-13 Version 1.0.0
  * Update SVG example to use Open Badges 2.0 syntax
  * Fix typo in introduction
  
### 2013-11-05 Version 1.0.0
  * Support for full assertions added
  * Support for signed badges added
  * Support for SVGs added
  * PNG baking now uses `iTXt` chunk.

### Pre-release
  * Only PNGs supported: `tEXt` chunk used with keyword `openbadges`
  * Only hosted badges supported
  * Hosted URL embedded in PNG
