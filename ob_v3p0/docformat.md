var docformat = `

## Open Badges Document Formats {#docformat}

[=Open Badges=] can be exchanged as JSON-LD documents as defined in this section, or by using the [Open Badges API](#api). Open Badges documents can be exchanged as a file or web resource, displayed as a QR code, or embedded in an image. The contents of an Open Badge document MUST meet the following criteria:

- The contents of the file MUST represent exactly one [AssertionCredential](#org.1edtech.ob.v3p0.assertioncredential.class)
- The contents MUST be JSON and JSON-LD (see [[[#serialization]]])

<pre class="json example vc" data-schema="org.1edtech.ob.v3p0.assertioncredential.class"
      title="Sample AssertionCredential file contents"
      data-vc-vm="https://example.edu/issuers/565049#key-1">
  {
    "@context": [
      "https://www.w3.org/2018/credentials/v1",
      "https://imsglobal.github.io/openbadges-specification/context.json"
    ],
    "id": "http://example.edu/credentials/3732",
    "type": ["VerifiableCredential", "AssertionCredential"],
    "issuer": {
      "id": "https://example.edu/issuers/565049",
      "type": "Profile",
      "name": "Example University"
    },
    "issuanceDate": "2010-01-01T00:00:00Z",
    "credentialSubject": {
      "id": "did:example:ebfeb1f712ebc6f1c276e12ec21"
    },
    "credentialSchema": [{
      "id": "https://imsum2.herokuapp.com/jsonschema?classId=org.1edtech.ob.v3p0.assertioncredential.class",
      "type": "JsonSchemaValidator2020"
    }]
  }
</pre>

### File Format

- JSON text exchanged between systems that are not part of a closed ecosystem MUST be encoded using UTF-8 [[RFC3629]].

### Web Resource

When the <code>id</code> of an Assertion is a [URL](#url), a GET request to that URL MUST return JSON representing an [AssertionCredential](#org.1edtech.ob.v3p0.assertioncredential.class) as described above.

- The <code>Content-Type</code> SHOULD be <code>application/json</code> or <code>application/ld+json</code>.
- The content MUST be encoded using UTF-8 [[RFC3629]].

### QR Code Format

Some Assertions are quite long. Due to the large size of the resulting JSON string, the string MUST be compressed prior to rendering the QR Code. To ensure interoperability, the string MUST be compressed using Concise Binary Object Representation (CBOR) [[RFC8949]].

<div class="issue">
  Is this even practical?
</div>

### Image Format

<div class="issue" title="Baking an ObPresentation">
  <p>
    Can an ObPresentation be baked into an image? What are the implications?
  </p>
</div>

Assertions may be exchanged as image files with assertions encoded within. This allows assertions to be portable wherever image files may be stored or displayed.

"Baking" is the process of taking an [AssertionCredential](#org.1edtech.ob.v3p0.assertioncredential.class) and embedding it into the image, so that when a user displays the image on a page, software that is Open Badges or CLR-aware can automatically extract that Assertion data and perform the checks necessary to see if a person legitimately earned the achievement within the image. The image must be in either PNG or SVG format in order to support baking.

#### Technical Details

##### PNGs

###### Baking {#png-baking}

An <a href="http://www.w3.org/TR/PNG/#11iTXt"><code>iTXt</code> chunk</a> should be inserted into the PNG with **keyword** <code>openbadges</code>. The **text** MUST be the JSON for the [[[#org.1edtech.ob.v3p0.assertioncredential.class]]]. Compression MUST NOT be used.

<pre class="js example" title="An example of creating a chunk (assuming an iTXt constructor)">
  var chunk = new iTXt({
    keyword: 'openbadges',
    compression: 0,
    compressionMethod: 0,
    languageTag: '',
    translatedKeyword: '',
    text: JSON.stringify(assertion)
  })
</pre>

An iTXt chunk with the keyword <code>openbadges</code> MUST NOT appear in a PNG more than once. When baking an image that already contains assertion data, the implementor may choose whether to pass the user an error or overwrite the existing chunk.

###### Extracting {#png-extracting}

Parse the PNG datastream until the first <a href="http://www.w3.org/TR/PNG/#11iTXt"><code>iTXt</code> chunk</a> is found with the keyword <code>openbadges</code>. The rest of the stream can be safely discarded. The text portion of the iTXt will be the JSON representation of a [[[#org.1edtech.ob.v3p0.assertioncredential.class]]].

##### SVGs

###### Baking {#svg-baking}

First, Add an <code>xmlns:openbadges</code> attribute to the <code>&lt;svg></code> tag with the value "https://purl.imsglobal.org/ob/v3p0". Directly after the <code>&lt;svg></code> tag, add an <code>&lt;openbadges:assertion></code> tag.

The JSON representation of the [AssertionCredential](#org.1edtech.ob.v3p0.assertioncredential.class) MUST go into the body of the tag, wrapped in <code>&lt;![CDATA[...]]></code>.

<pre class="xml example" title="An example of a well baked SVG">
&lt;?xml version="1.0" encoding="UTF-8"?>
&lt;svg xmlns="http://www.w3.org/2000/svg"
  xmlns:clr="https://purl.imsglobal.org/ob/v3p0"
  viewBox="0 0 512 512">
  &lt;openbadges:assertion>
    &lt;![CDATA[
      {
        "@context": [
          "https://www.w3.org/2018/credentials/v1",
          "https://www.w3.org/2018/credentials/examples/v1"
        ],
        "id": "http://example.edu/credentials/3732",
        "type": ["VerifiableCredential", "OpenBadge"],
        "issuer": {
          "id": "https://example.edu/issuers/565049",
          "type": "IssuerProfile",
          "name": "Example University"
        },
        "issuanceDate": "2010-01-01T00:00:00Z",
        "credentialSubject": {
          "id": "did:example:ebfeb1f712ebc6f1c276e12ec21"
        }
      }
    ]]>
  &lt;/openbadges:assertion>

  &lt;!-- rest-of-image -->
&lt;/svg>
</pre>

There MUST be only one <code>&lt;openbadges:assertion></code> tag in an SVG. When baking an image that already contains assertion data, the implementor may choose whether to pass the user an error or overwrite the existing tag.

###### Extracting

Parse the SVG until you reach the first <code>&lt;openbadges:assertion></code> tag. The rest of the SVG data can safely be discarded.

`;
