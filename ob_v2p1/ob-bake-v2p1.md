var md=`

# Badge Baking

## What Is Badge Baking?

Open Badges may be transmitted as image files with badge Assertions encoded within. This allows Open Badges to be portable wherever image files may be stored or displayed. Each [Assertion](../index.html#Assertion) expresses verifiable information about an individual's achievement. 

Badge Baking is the process of taking an Assertion and embedding it into the badge image, so that when a user displays a badge on a page, software that is OpenBadges-aware can automatically extract that Assertion data and perform the checks necessary to see if a person legitimately earned the badge. The [BadgeClass](../index.html#BadgeClass) image must be in either PNG or SVG format in order to support baking.

## Technical Details

### PNGs

#### Baking

An <a href="http://www.w3.org/TR/PNG/#11iTXt"><code>iTXt</code> chunk</a> should be inserted into the PNG with **keyword** <code>openbadges</code>. The **text** can either be a signed badge assertion or the raw JSON for the OpenBadges assertion. Compression **MUST NOT** be used. At the moment, *language tag* and *translated keyword* have no semantics related to badge baking.

An example of creating a chunk (assuming an iTXt constructor):

<pre>
var chunk = new iTXt({
  keyword: 'openbadges',
  compression: 0,
  compressionMethod: 0,
  languageTag: '',
  translatedKeyword: '',
  text: signature || JSON.stringify(assertion)
})
</pre>

An iTXt chunk with the keyword “openbadges” **MUST NOT** appear in a PNG more than once. When baking a badge that already contains OpenBadges data, the implementor may choose whether to pass the user an error or overwrite the existing chunk.

#### Extracting

Parse the PNG datastream until the first <a href="http://www.w3.org/TR/PNG/#11iTXt"><code>iTXt</code> chunk</a> is found with the keyword <code>openbadges</code>. The rest of the stream can be safely discarded. The text portion of the iTXt will either be the JSON representation of an OpenBadges assertion or a signature.

#### Legacy PNGs

The pre-specified behavior of badge baking worked differently. Instead of baking the whole assertion or signature into an <code>iTXt:openbadges</code> chunk, the URL pointing to the hosted assertion was baked into a <code>tEXt:openbadges</code> chunk. In order to get the full assertion, an additional HTTP request must be made after extracting the URL from the <code>tEXt</code> chunk.

### SVGs

#### Baking
First, Add an <code>xmlns:openbadges</code> attribute to the <code>&lt;svg></code> tag with the value "http://openbadges.org". Directly after the <code>&lt;svg></code> tag, add an <code>&lt;openbadges:assertion></code> tag with a <code>verify</code> attribute. The value of <code>verify</code> should either be a signed OpenBadges assertion **or** the URL from <code>verify.url</code> in the badge assertion.

If a signature is being baked, no tag body is necessary and the tag should be self closing.

If an assertion is being baked, the JSON representation of the assertion should go into the body of the tag, wrapped in <code>&lt;![CDATA[...]]></code>.

An example of a well baked SVG with a hosted assertion:

<pre>
&lt;?xml version="1.0" encoding="UTF-8"?>
&lt;svg xmlns="http://www.w3.org/2000/svg"
     xmlns:openbadges="http://openbadges.org"
     viewBox="0 0 512 512">
  &lt;openbadges:assertion verify="https://example.org/assertions/123">
    &lt;![CDATA[
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
  &lt;/openbadges:assertion>

  <rest-of-document...>
&lt;/svg>
</pre>

There **MUST** be only one <code>&lt;openbadges:assertion></code> tag in an SVG. When baking a badge that already contains OpenBadges data, the implementor may choose whether to pass the user an error or overwrite the existing tag.

#### Extracting

Parse the SVG until you reach the first <code>&lt;openbadges:assertion></code> tag. The rest of the SVG data can safely be discarded.

If the tag has no body, the <code>verify</code> attribute will contain the signature of the badge. If there is a body, it will be the JSON representation of a badge assertion.

## Baking Specification Changelog

### 2018-04-16 Version 1.0.0 Final
  * IMS Final Release, no material changes since last version
	
### 2017-02-13 Version 1.0.0
  * Update SVG example to use Open Badges 2.0 syntax
  * Fix typo in introduction
  
### 2013-11-05 Version 1.0.0
  * Support for full assertions added
  * Support for signed badges added
  * Support for SVGs added
  * PNG baking now uses <code>iTXt</code> chunk.

### Pre-release
  * Only PNGs supported: <code>tEXt</code> chunk used with keyword <code>openbadges</code>
  * Only hosted badges supported
  * Hosted URL embedded in PNG

  `;