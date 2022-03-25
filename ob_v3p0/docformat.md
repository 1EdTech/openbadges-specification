var docformat = `

## Open Badges Document Formats {#docformat}

[AssertionCredentials](#org.1edtech.ob.v3p0.assertioncredential.class) can be exchanged as documents as defined in this section, or by using the [Open Badges API](#api). Documents can be exchanged as a text file, a web resource, or embedded in an image. The contents of an Open Badge document MUST meet the following criteria:

- The contents of the file MUST represent exactly one [AssertionCredential](#org.1edtech.ob.v3p0.assertioncredential.class)
- The [AssertionCredential](#org.1edtech.ob.v3p0.assertioncredential.class) MUST be serialized as JSON and JSON-LD (see [[[#serialization]]])
- JSON exchanged between systems that are not part of a closed ecosystem MUST be encoded using UTF-8 [[RFC3629]].

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

If the credential is signed using the [[[#jwt-proof]]] (VC-JWT) the contents of the file MUST be the [=Compact JWS=] string formed as a result of signing the [AssertionCredential](#org.1edtech.ob.v3p0.assertioncredential.class) with VC-JWT. The file extension SHOULD be ".jws" or ".jwt".

If an embedded proof method is used instead, the contents of the file MUST be the JSON representation of the [AssertionCredential](#org.1edtech.ob.v3p0.assertioncredential.class). The file extension SHOULD be ".json".

### Web Resource

If the credential is signed using the [[[#jwt-proof]]] (VC-JWT) the contents of the response MUST be the [=Compact JWS=] string formed as a result of signing the [AssertionCredential](#org.1edtech.ob.v3p0.assertioncredential.class) with VC-JWT. The <code>Content-Type</code> SHOULD be <code>text/plain</code>.

If an embedded proof method is used instead, the contents of the response MUST be the JSON representation of the [AssertionCredential](#org.1edtech.ob.v3p0.assertioncredential.class). The <code>Content-Type</code> SHOULD be <code>application/json</code> or <code>application/ld+json</code>.

### Baked Badge

AssertionCredentials may be exchanged as image files with the credential encoded (baked) within. This allows the credential to be portable wherever image files may be stored or displayed.

"Baking" is the process of taking an [AssertionCredential](#org.1edtech.ob.v3p0.assertioncredential.class) and embedding it into the image, so that when a user displays the image on a page, software that is Open Badges aware can automatically extract that AssertionCredential data and perform the checks necessary to see if a person legitimately earned the achievement within the image. The image MUST be in either PNG [[PNG]] or SVG [[SVG11]] format in order to support baking.

#### PNG

##### Baking {#png-baking}

An <a href="http://www.w3.org/TR/PNG/#11iTXt"><code>iTXt</code> chunk</a> should be inserted into the PNG with **keyword** <code>openbadges</code>.

If the credential is signed using the [[[#jwt-proof]]] (VC-JWT) the text value of the chunk MUST be the [=Compact JWS=] string formed as a result of signing the [AssertionCredential](#org.1edtech.ob.v3p0.assertioncredential.class) with VC-JWT. Compression MUST NOT be used.

<pre class="js example" title="An example of creating a chunk with VC-JWT proof (assuming an iTXt constructor)">
  var chunk = new iTXt({
    keyword: 'openbadges',
    compression: 0,
    compressionMethod: 0,
    languageTag: '',
    translatedKeyword: '',
    text: 'header.payload.signature'
  })
</pre>

If an embedded proof method is used instead, the text value of the chunk MUST be the JSON representation of the [AssertionCredential](#org.1edtech.ob.v3p0.assertioncredential.class). Compression MUST NOT be used.

<pre class="js example" title="An example of creating a chunk with embedded proof (assuming an iTXt constructor)">
  var chunk = new iTXt({
    keyword: 'openbadges',
    compression: 0,
    compressionMethod: 0,
    languageTag: '',
    translatedKeyword: '',
    text: '{
            "@context": [
              "https://www.w3.org/2018/credentials/v1",
              "https://purl.imsglobal.org/spec/ob/v3p0/context"
            ],
            "id": "http://example.edu/credentials/3732",
            "type": ["VerifiableCredential", "AssertionCredential"],
            "issuer": {
              "id": "https://example.edu/issuers/565049",
              "type": "IssuerProfile",
              "name": "Example University"
            },
            "issuanceDate": "2010-01-01T00:00:00Z",
            "credentialSubject": {
              "id": "did:example:ebfeb1f712ebc6f1c276e12ec21"
            },
            "proof": { }
          }'
  })
</pre>

An iTXt chunk with the keyword <code>openbadges</code> MUST NOT appear in a PNG more than once. When baking an image that already contains credential data, the implementor may choose whether to pass the user an error or overwrite the existing chunk.

##### Extracting {#png-extracting}

Parse the PNG datastream until the first <a href="http://www.w3.org/TR/PNG/#11iTXt"><code>iTXt</code> chunk</a> is found with the keyword <code>openbadges</code>. The rest of the stream can be safely discarded. The text portion of the iTXt will either be the JSON representation of a [[[#org.1edtech.ob.v3p0.assertioncredential.class]]] or the [=Compact JWS=] string that was the result of signing the [AssertionCredential](#org.1edtech.ob.v3p0.assertioncredential.class) with [[[#jwt-proof]]].

#### SVG

##### Baking {#svg-baking}

First, add an <code>xmlns:openbadges</code> attribute to the <code>&lt;svg></code> tag with the value "https://purl.imsglobal.org/ob/v3p0". Directly after the <code>&lt;svg></code> tag, add an <code>&lt;openbadges:credential></code> tag.

If the credential is signed using the [[[#jwt-proof]]] (VC-JWT) add a <code>verify</code> attribute to the <code>&lt;openbadges:credential></code> tag. The value of <code>verify</code> attribute MUST be the [=Compact JWS=] string formed as a result of signing the [AssertionCredential](#org.1edtech.ob.v3p0.assertioncredential.class) with VC-JWT.

<pre class="xml example" title="An example of a well baked SVG with VC-JWT proof">
  &lt;?xml version="1.0" encoding="UTF-8"?>
  &lt;svg xmlns="http://www.w3.org/2000/svg"
    xmlns:openbadges="https://purl.imsglobal.org/ob/v3p0"
    viewBox="0 0 512 512">
    &lt;openbadges:credential verify="header.payload.signature">&lt;/openbadges:credential>

    &lt;!-- rest-of-image -->
  &lt;/svg>
</pre>

If an embedded proof method is used instead, omit the <code>verify</code> attribute, and the JSON representation of the [AssertionCredential](#org.1edtech.ob.v3p0.assertioncredential.class) MUST go into the body of the tag, wrapped in <code>&lt;![CDATA[...]]></code>.

<pre class="xml example" title="An example of a well baked SVG with embedded proof">
  &lt;?xml version="1.0" encoding="UTF-8"?>
  &lt;svg xmlns="http://www.w3.org/2000/svg"
    xmlns:openbadges="https://purl.imsglobal.org/ob/v3p0"
    viewBox="0 0 512 512">
    &lt;openbadges:credential>
      &lt;![CDATA[
        {
          "@context": [
            "https://www.w3.org/2018/credentials/v1",
            "https://purl.imsglobal.org/spec/ob/v3p0/context"
          ],
          "id": "http://example.edu/credentials/3732",
          "type": ["VerifiableCredential", "AssertionCredential"],
          "issuer": {
            "id": "https://example.edu/issuers/565049",
            "type": "IssuerProfile",
            "name": "Example University"
          },
          "issuanceDate": "2010-01-01T00:00:00Z",
          "credentialSubject": {
            "id": "did:example:ebfeb1f712ebc6f1c276e12ec21"
          },
          "proof": { }
        }
      ]]>
    &lt;/openbadges:credential>

    &lt;!-- rest-of-image -->
  &lt;/svg>
</pre>

There MUST be only one <code>&lt;openbadges:assertion></code> tag in an SVG. When baking an image that already contains assertion data, the implementor may choose whether to pass the user an error or overwrite the existing tag.

##### Extracting

Parse the SVG until you reach the first <code>&lt;openbadges:assertion></code> tag. The rest of the SVG data can safely be discarded.

`;
