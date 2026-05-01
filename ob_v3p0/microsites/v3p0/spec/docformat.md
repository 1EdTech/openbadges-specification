# Open Badges Document Formats {#docformat}

[OpenBadgeCredentials](#org.1edtech.ob.v3p0.achievementcredential.class) can be exchanged as documents as defined in this section, or by using the [Open Badges API](#api). Documents can be exchanged as a text file, a web resource, or embedded in an image. The contents of an Open Badge document MUST meet the following criteria:

-   The contents of the file MUST represent exactly one [OpenBadgeCredential](#org.1edtech.ob.v3p0.achievementcredential.class)
-   The [OpenBadgeCredential](#org.1edtech.ob.v3p0.achievementcredential.class) MUST be serialized as JSON and JSON-LD (see [[[#serialization]]])
-   JSON exchanged between systems that are not part of a closed ecosystem MUST be encoded using UTF-8 [[RFC3629]].

## Example: Sample OpenBadgeCredential file contents

```obv3p0 org.1edtech.ob.v3p0.achievementcredential.class preventAdditionalProperties=true
  {
    "@context": [
      "https://www.w3.org/ns/credentials/v2",
      "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json",
      "https://purl.imsglobal.org/spec/ob/v3p0/extensions.json"
    ],
    "id": "http://example.edu/credentials/3732",
    "type": ["VerifiableCredential", "OpenBadgeCredential"],
    "issuer": {
      "id": "https://example.edu/issuers/565049",
      "type": ["Profile"],
      "name": "Example University"
    },
    "validFrom": "2010-01-01T00:00:00Z",
    "name": "Example University Degree",
    "credentialSubject": {
      "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
      "type": ["AchievementSubject"],
      "achievement": {
        "id": "https://example.com/achievements/21st-century-skills/teamwork",
        "type": ["Achievement"],
        "criteria": {
          "narrative": "Team members are nominated for this badge by their peers and recognized upon review by Example Corp management."
        },
        "description": "This badge recognizes the development of the capacity to collaborate within a group environment.",
        "name": "Teamwork"
      }
    },
    "credentialSchema": [{
      "id": "https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_achievementcredential_schema.json",
      "type": "1EdTechJsonSchemaValidator2019"
    }]
  }
```

## File Format

If the credential is signed using the [[[#jwt-proof]]] (VC-JWT) the contents of the file MUST be the [=Compact JWS=] string formed as a result of signing the [OpenBadgeCredential](#org.1edtech.ob.v3p0.achievementcredential.class) with VC-JWT. The file extension SHOULD be ".jws" or ".jwt".

If an embedded proof method is used instead, the contents of the file MUST be the JSON representation of the [OpenBadgeCredential](#org.1edtech.ob.v3p0.achievementcredential.class). The file extension SHOULD be ".json".

## Web Resource

If the credential is signed using the [[[#jwt-proof]]] (VC-JWT) the contents of the response MUST be the [=Compact JWS=] string formed as a result of signing the [OpenBadgeCredential](#org.1edtech.ob.v3p0.achievementcredential.class) with VC-JWT. The `Content-Type` SHOULD be `text/plain`.

If an embedded proof method is used instead, the contents of the response MUST be the JSON representation of the [OpenBadgeCredential](#org.1edtech.ob.v3p0.achievementcredential.class). The `Content-Type` SHOULD be `application/vc+ld+json`, although generic representations such `application/ld+json` or `application/json` are also allowed.

## Baked Badge

OpenBadgeCredentials may be exchanged as image files with the credential encoded (baked) within. This allows the credential to be portable wherever image files may be stored or displayed.

"Baking" is the process of taking an [OpenBadgeCredential](#org.1edtech.ob.v3p0.achievementcredential.class) and embedding it into the image, so that when a user displays the image on a page, software that is Open Badges aware can automatically extract that OpenBadgeCredential data and perform the checks necessary to see if a person legitimately earned the achievement within the image. The image MUST be in either PNG [[PNG]] or SVG [[SVG11]] format in order to support baking.

### PNG

#### Baking {#png-baking}

An [`iTXt`](http://www.w3.org/TR/PNG/#11iTXt) chunk should be inserted into the PNG with **keyword** `openbadgecredential`.

If the credential is signed using the [[[#jwt-proof]]] (VC-JWT) the text value of the chunk MUST be the [=Compact JWS=] string formed as a result of signing the [OpenBadgeCredential](#org.1edtech.ob.v3p0.achievementcredential.class) with VC-JWT. Compression MUST NOT be used.

##### Example: An example of creating a chunk with VC-JWT proof (assuming an iTXt constructor)

```js
  var chunk = new iTXt({
    keyword: 'openbadgecredential',
    compression: 0,
    compressionMethod: 0,
    languageTag: '',
    translatedKeyword: '',
    text: 'header.payload.signature'
  })
```

If an embedded proof method is used instead, the text value of the chunk MUST be the JSON representation of the [OpenBadgeCredential](#org.1edtech.ob.v3p0.achievementcredential.class). Compression MUST NOT be used.

##### Example: An example of creating a chunk with embedded proof (assuming an iTXt constructor)

```js
  var chunk = new iTXt({
    keyword: 'openbadgecredential',
    compression: 0,
    compressionMethod: 0,
    languageTag: '',
    translatedKeyword: '',
    text: '{
            "@context": [
              "https://www.w3.org/ns/credentials/v2",
              "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
            ],
            "id": "http://example.edu/credentials/3732",
            "type": ["VerifiableCredential", "OpenBadgeCredential"],
            "issuer": {
              "id": "https://example.edu/issuers/565049",
              "type": "Profile",
              "name": "Example University"
            },
            "validFrom": "2010-01-01T00:00:00Z",
            "credentialSubject": {
              "id": "did:example:ebfeb1f712ebc6f1c276e12ec21"
            },
            "proof": { }
          }'
  })
```

An iTXt chunk with the keyword `openbadgecredential` MUST NOT appear in a PNG more than once. When baking an image that already contains credential data, the implementer may choose whether to pass the user an error or overwrite the existing chunk.

#### Extracting {#png-extracting}

Parse the PNG datastream until the first [`iTXt`](http://www.w3.org/TR/PNG/#11iTXt) chunk is found with the keyword `openbadgecredential`. The rest of the stream can be safely discarded. The text portion of the iTXt will either be the JSON representation of a [[[#achievement-credential]]] or the [=Compact JWS=] string that was the result of signing the [OpenBadgeCredential](#org.1edtech.ob.v3p0.achievementcredential.class) with [[[#jwt-proof]]].

### SVG

#### Baking {#svg-baking}

First, add an `xmlns:openbadges` attribute to the `<svg>` tag with the value "https://purl.imsglobal.org/ob/v3p0". Directly after the `<svg>` tag, add an `<openbadges:credential>` tag.

If the credential is signed using the [[[#jwt-proof]]] (VC-JWT) add a `verify` attribute to the `<openbadges:credential>` tag. The value of `verify` attribute MUST be the [=Compact JWS=] string formed as a result of signing the [OpenBadgeCredential](#org.1edtech.ob.v3p0.achievementcredential.class) with VC-JWT.

##### Example: An example of a well baked SVG with VC-JWT proof

```xml
  <?xml version="1.0" encoding="UTF-8"?>
  <svg xmlns="http://www.w3.org/2000/svg"
    xmlns:openbadges="https://purl.imsglobal.org/ob/v3p0"
    viewBox="0 0 512 512">
    <openbadges:credential verify="header.payload.signature"></openbadges:credential>

    <!-- rest-of-image -->
  </svg>
```

If an embedded proof method is used instead, omit the `verify` attribute, and the JSON representation of the [OpenBadgeCredential](#org.1edtech.ob.v3p0.achievementcredential.class) MUST go into the body of the tag, wrapped in `<![CDATA[...]]>`.

##### Example: An example of a well baked SVG with embedded proof

```xml
  <?xml version="1.0" encoding="UTF-8"?>
  <svg xmlns="http://www.w3.org/2000/svg"
    xmlns:openbadges="https://purl.imsglobal.org/ob/v3p0"
    viewBox="0 0 512 512">
    <openbadges:credential>
      <![CDATA[
        {
          "@context": [
            "https://www.w3.org/ns/credentials/v2",
            "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
          ],
          "id": "http://example.edu/credentials/3732",
          "type": ["VerifiableCredential", "OpenBadgeCredential"],
          "issuer": {
            "id": "https://example.edu/issuers/565049",
            "type": "Profile",
            "name": "Example University"
          },
          "validFrom": "2010-01-01T00:00:00Z",
          "credentialSubject": {
            "id": "did:example:ebfeb1f712ebc6f1c276e12ec21"
          },
          "proof": { }
        }
      ]]>
    </openbadges:credential>

    <!-- rest-of-image -->
  </svg>
```

There MUST be only one `<openbadges:credential>` tag in an SVG. When baking an image that already contains OpenBadgeCredential data, the implementer may choose whether to pass the user an error or overwrite the existing tag.

#### Extracting

Parse the SVG until you reach the first `<openbadges:credential>` tag. The rest of the SVG data can safely be discarded.
