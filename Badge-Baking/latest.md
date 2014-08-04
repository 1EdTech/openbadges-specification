# Badge Baking

In Open Badges we use structures called [assertions](../assertion.md). An assertion is a collection of data that can be used to prove whether a not a person who says they got a badge earned it (i.e. that the badge issuer issued the badge to this particular earner).

Badge Baking is the process of taking an assertion and embedding it into the badge image, so that when a user displays a badge on a page, software that is OpenBadges-aware can automatically extract that assertion data and perform the checks necessary to see if a person legitimately earned the badge (this is _badge verification_). Baking the data into the badge image makes it more portable, allowing the earner to display it wherever they choose.

## Technical Details

### PNGs

#### Baking

An <a href="http://www.w3.org/TR/PNG/#11iTXt">`iTXt` chunk</a> should be inserted into the PNG with **keyword** `openbadges`. The **text** can either be a signed badge assertion or the raw JSON for the Open Badges assertion data. Compression **MUST NOT** be used. At the moment, *language tag* and *translated keyword* have no semantics related to badge baking.

An example of creating a chunk (assuming an iTXt constructor):

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

An iTXt chunk with the keyword `openbadges` **MUST NOT** appear in a PNG more than once. When baking a badge that already contains Open Badges data, the implementor may choose whether to pass the user an error or overwrite the existing chunk.

#### Extracting

To extract the assertion data from a baked badge, parse the PNG datastream until the first <a href="http://www.w3.org/TR/PNG/#11iTXt">`iTXt` chunk</a> is found with the keyword `openbadges`. The rest of the stream can be safely discarded. The text portion of the iTXt will either be the JSON representation of an Open Badges assertion or a signature.

### SVGs

#### Baking 

To create a baked badge using an SVG image, first add an `xmlns:openbadges` attribute to the `<svg>` tag with the value "http://openbadges.org". Directly after the `<svg>` tag, add an `<openbadges:assertion>` tag with a `verify` attribute. The value of `verify` should either be a signed Open Badges assertion **or** the URL from the `verify.url` field in the badge assertion.

__If a signature is being baked__: no tag body is necessary and the tag should be self-closing.

__If a JSON assertion is being baked__: the JSON should go into the body of the tag, wrapped in `<![CDATA[...]]>`.

An example of a well-baked SVG with a hosted assertion:

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

There **MUST** be only one `<openbadges:assertion>` tag in an SVG. When baking a badge that already contains Open Badges data, the implementor may choose whether to pass the user an error or overwrite the existing tag.

#### Extracting

To extract the assertion data from a baked SVG bage, parse the SVG until you reach the first `<openbadges:assertion>` tag. The rest of the SVG data can safely be discarded.

If the tag has no body, the `verify` attribute will contain the signature of the badge - if there is a body, it will contain the JSON representation of the badge assertion.
