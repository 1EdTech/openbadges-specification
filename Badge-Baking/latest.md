# Badge Baking

The metadata describing an Open Badge awarded to an earner is an [assertion](../Assertion/latest.md). A baked badge is a badge image with the assertion data embedded into it. The assertion for a badge can be used to verify its authenticity - to prove whether or not it was awarded by the issuer to the earner claiming it.

Badge Baking is the process of taking an assertion and embedding it into the badge image. When a user displays a baked badge on a page, software can extract that assertion data - then perform verification checks on it. Baking the data into the badge image makes it more portable, allowing the earner to display it wherever they choose.

Baked badges are either [PNGs](#pngs) or [SVGs](#svgs). This document outlines the technical implementation for baked badges of both types.

## Technical Details

### PNGs

#### Baking

An <a href="http://www.w3.org/TR/PNG/#11iTXt">`iTXt` chunk</a> __must__ be inserted into the PNG with the ___keyword___ `openbadges`. The text __must__ either be a ___signed badge assertion (JWS)___ or the ___raw JSON for the Open Badges assertion data___. Compression __must not__ be used. 

At the moment, _language tag_ and _translated keyword_ have no semantics related to badge baking.

An example of creating a chunk (assuming an `iTXt` constructor) follows:

```js
var chunk = new iTXt({
  keyword: 'openbadges',
  compression: 0,
  compressionMethod: 0,
  languageTag: '',
  translatedKeyword: '',
  text: signature || JSON.stringify(assertion)
})
```

* An `iTXt` chunk with the keyword `openbadges` __must not appear in a PNG more than once__. 
* When baking a badge that already contains Open Badges data, the implementor may choose whether to _pass the user an error or overwrite the existing chunk_.

#### Extracting

To extract the assertion data from a baked badge, implementors __should__ parse the PNG datastream until the ___first___ <a href="http://www.w3.org/TR/PNG/#11iTXt">`iTXt` chunk</a> is found with the keyword `openbadges`. The rest of the stream can be safely discarded. The text portion of the `iTXt` will either be the JSON representation of an Open Badges assertion or a JSON Web Signature.

### SVGs

#### Baking 

To create a baked badge using an SVG image, implementors should:

* Add an `xmlns:openbadges` attribute to the opening `<svg>` tag with the value `http://openbadges.org`. 
* Directly after the opening `<svg>` tag (as the `svg` element's first child), add an `<openbadges:assertion>` element with a `verify` attribute. 
 * The value of `verify` __must__ either be a ___signed Open Badges assertion (JWS)___ __or__ the ___URL of the hosted badge assertion___ (from the `verify.url` field in the badge assertion).

__If a JSON Web Signature is being baked__: no tag body is necessary and the tag should be self-closing.

__If a JSON assertion is being baked__: the JSON should go into the body of the tag, wrapped in `<![CDATA[...]]>` tags.

An example of a well-baked SVG with a hosted assertion follows:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg"
     xmlns:openbadges="http://openbadges.org"
     viewBox="0 0 512 512">
  <openbadges:assertion verify="https://example.org/assertion.json">
    <![CDATA[
       {
         "uid": "abcdef12345",
         "identity": {
           "recipient": "sha256$cbb08ce07dd7345341b9358abb810d29eb790fed",
           "type": "email",
           "hashed": true
         }
         "verify": {
           "type": "hosted",
           "url":"https://example.org/assertion.json"
         }
         "issuedOn": "2013-11-05",
         "badge": "https://example.org/badge.json"
       }
    ]]>
  </openbadges:assertion>

  <...rest of document...>
</svg>
```

There __must__ be ___only one___ `<openbadges:assertion>` element in a baked SVG. When baking a badge that already contains Open Badges data, the implementor __may__ choose whether to _pass the user an error or overwrite the existing element_.

#### Extracting

To extract the assertion data from a baked SVG bage, implementors __should__:
* Parse the SVG until the ___first___ `<openbadges:assertion>` tag is reached. 
 * The rest of the SVG data can safely be discarded.

___If the element has no body___: the `verify` attribute will contain the signature of the badge.

___If the element has a body___: it will contain the JSON representation of the badge assertion.
