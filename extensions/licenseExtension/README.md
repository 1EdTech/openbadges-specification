# Creative Commons Content License
_Editor: [Nate Otto](http://ottonomy.net)_

The content license extension enables issuers to indicate what permissions are granted to the public to reuse BadgeClass metadata in their own badges in terms of an expressive set of open content licenses that have broad global buy-in.

Thanks to editorial contributions from [Timothy F Cook](https://twitter.com/timothyfcook), [Attila Szabó Nagy](https://about.me/sznattila), [Serge Ravet](https://twitter.com/szerge), and [Jim Goodell](https://twitter.com/jgoodell2)


## Open Badges 2.0

| Property      | Type           | Value Description
|---------------|----------------|-----------------------
| **@context**  | context IRI    | [https://openbadgespec.org/extensions/licenseExtension/context.json](licenseExtension/context.json)
| **type**      | type IRI array | `["extension", "cc:License"]`
| **id**        | @id (IRI)      | The URL unique identifier for the license that is used. For example, 'http://creativecommons.org/licenses/by/4.0/' (Aliases available to international versions: `CC-BY`, `CC-BY-SA`, `CC-BY-NC`, `CC-BY-NC-SA`, `CC-BY-ND`)
| **legalCode** | @id (IRI)      | The URL unique identifier for the license that is used. For example, 'http://creativecommons.org/licenses/by/4.0/legalcode'

*Extendable Badge Objects*: BadgeClass

*Example Implementation* (Abbreviated JSON-LD BadgeClass):

```json
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
```

### Get Started

See examples of all international Creative Commons licenses in use on the [getting-started.md](licenseExtension).

## Open Badges 3.0

The adaptation of this extension ultimately consist on extending the
datamodel, adding a new attribute `license` of type `License` to the
entity `Achievement`.

Following the guidelines, we could define a new type `CCAchievement`.
So, you'll need a JSON-LD context with this new type.

### Creative Commons Content License OB 3.0 JSON-LD Context
```json
{
    "@context": {
        "@protected": true,
        "id": "@id",
        "type": "@type",
        "CCAchievement": {
            "@id" : "https://w3id.org/openbadges/extensions#CCAchievement",
            "@context": {
                "@protected": true,
                "id": "@id",
                "type": "@type",
                "license": "https://w3id.org/openbadges/extensions#License"
            }
        },
        "License": {
            "@id" : "https://w3id.org/openbadges/extensions#License",
            "@context": {
                "@protected": true,
                "cc": "http://creativecommons.org/ns#",
                "id": "@id",
                "type": "@type",
                "legalCode": "cc:legalcode",
                "License": "cc:License",
                "CC-0": "https://creativecommons.org/publicdomain/zero/1.0/",
                "CC-BY": "http://creativecommons.org/licenses/by/4.0/",
                "CC-BY-SA": "http://creativecommons.org/licenses/by-sa/4.0/",
                "CC-BY-NC": "http://creativecommons.org/licenses/by-nc/4.0/",
                "CC-BY-NC-SA": "http://creativecommons.org/licenses/by-nc-sa/4.0/",
                "CC-BY-ND": "http://creativecommons.org/licenses/by-nd/4.0/",
                "CC-BY-NC-ND": "https://creativecommons.org/licenses/by-nc-nd/4.0/"
            }
        }
    }
}
```

Also you need a JSON schema. The existing extension JSON schema doesn't
work, as it defines the attributes at the root level, while we need to
define them for the `Achievement` entity.

### Creative Commons Content License OB 3.0 JSON Schema
```json
{
    "$schema": "https://json-schema.org/draft/2019-09/schema#",
    "$id": "https://openbadgespec.org/extensions/licenseExtension/schema_obv3p0.json",
    "type": "object",
    "properties": {
        "credentialSubject": {
            "type": "object",
            "properties": {
                "achievement": {
                    "type": "object",
                    "properties": {
                        "license": {
                            "$ref":"#/$defs/License"
                        }
                    },
                    "required": ["id", "name"],
                    "additionalProperties": true
                }
            },
            "additionalProperties": true
        }
    },
    "additionalProperties": true,
    "$defs": {
        "License": {
            "type": "object",
            "properties": {
                "id": {
                    "type": "string",
                    "format": "url"
                },
                "name": {
                    "type": "string"
                },
                "http://creativecommons.org/ns#legalcode": {
                    "type": "string",
                    "format": "url"
                }
            },
            "required": ["id", "name"]
        }
    }
}
```

A credential with this extension is shown below. It adds the url of the above
JSON-LD context (assuming is
`https://openbadgespec.org/extensions/licenseExtension/context-3.0.0.json`)
in its `@context` declaration and the url of the JSON schema in its
`credentialSchema` attribute.

### Sample OpenBadgeCredential with Creative Commons Content License extension
```json
{
    "@context": [
        "https://www.w3.org/ns/credentials/v2",
        "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.1.json",
        "https://openbadgespec.org/extensions/licenseExtension/context-3.0.0.json"
    ],
    "id": "http://example.com/credentials/3527",
    "type": ["VerifiableCredential", "OpenBadgeCredential"],
    "issuer": {
        "id": "https://example.com/issuers/876543",
        "type": "Profile",
        "name": "Example Corp"
    },
    "validFrom": "2010-01-01T00:00:00Z",
    "name": "Teamwork Badge",
    "credentialSubject": {
        "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
        "type": "AchievementSubject",
        "achievement": {
            "id": "https://example.com/achievements/21st-century-skills/teamwork",
            "type": ["Achievement", "CCAchievement"],
            "criteria": {
                "narrative": "Team members are nominated for this badge by their peers and recognized upon review by Example Corp management."
            },
            "description": "This badge recognizes the development of the capacity to collaborate within a group environment.",
            "name": "Teamwork",
            "license": {
                "id": "CC-BY-ND",
                "name": "Creative Commons Attribution",
                "legalCode": "http://creativecommons.org/licenses/by/4.0/legalcode"
            }
        }
    },
    "credentialSchema": [{
        "id": "https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_achievementcredential_schema.json",
        "type": "1EdTechJsonSchemaValidator2019"
    }, {
        "id": "https://openbadgespec.org/extensions/licenseExtension/schema_obv3p0.json",
        "type": "1EdTechJsonSchemaValidator2019"
    }]
}
```
