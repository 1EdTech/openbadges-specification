# Apply Link Extension

_Author: [Kerri Lemoie](https://github.com/kayaelle)_

The apply link provides a url that allows potential badge earners to apply for an opportunty as specified by the badge issuer.

## Open Badges 2.0

Property     | Type        | Value Description
-------------|-------------|---------
**@context** | context IRI | [https://openbadgespec.org/extensions/applyLinkExtension/context.json](./applyLinkExtension/context.json)
**type**    | type IRI array |`['Extension', 'extensions:ApplyLink']`
**url** | string,uri | Valid url beginning with http:// or https://

**Extendable Badge Objects:**
BadgeClass

**Example implementation:**
```json
{
  "extensions:ApplyLink": {
    "@context":"https://openbadgespec.org/extensions/applyLinkExtension/context.json",
    "type": ["Extension", "extensions:ApplyLink"],
    "url": "http://website.com/apply"
  }
}
```

## Open Badges 3.0

The OB 3.0 JSON-LD context has already defined the same terms that this extension to all entities
of the specification. However, you should follow the guidelines to extend the data model.

So, you should create a new context link with the new type, as the example below

```json
// Apply Link OB 3.0 JSON-LD Context
{
    "@context": {
        "@protected": true,
        "id": "@id",
        "type": "@type",
        "ApplyLinkAchievement": {
            "@id" : "https://w3id.org/openbadges/extensions#ApplyLinkAchievement",
            "@context": {
                "@protected": true,
                "id": "@id",
                "type": "@type"
            }
        }
    }
}
```json

Also you need a JSON schema. The existing extension JSON schema doesn't
work, as it defines the attributes at the root level, while we need to
define them for the `Achievement` entity.

```json
// Apply Link OB 3.0 JSON Schema
{
    "$schema": "https://json-schema.org/draft/2019-09/schema#",
    "$id": "https://openbadgespec.org/extensions/applyLinkExtension/schema_obv3p0.json",
    "type": "object",
    "properties": {
        "credentialSubject": {
            "type": "object",
            "properties": {
                "achievement": {
                    "type": "object",
                    "properties": {
                        "url": {
                            "type": "string",
                            "format": "uri"
                        }
                    },
                    "required": ["url"],
                    "additionalProperties": true
                }
            },
            "additionalProperties": true
        }
    },
    "additionalProperties": true
}
```

A credential with this extension is shown below. It adds the url of the above
JSON-LD context (assuming is
`https://openbadgespec.org/extensions/applyLinkExtension/context-3.0.0.json`)
in its `@context` declaration and the url of the JSON schema in its
`credentialSchema` attribute.

```json
// Sample OpenBadgeCredential with Apply Link extension
{
    "@context": [
        "https://www.w3.org/ns/credentials/v2",
        "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.1.json",
        "https://openbadgespec.org/extensions/applyLinkExtension/context-3.0.0.json"
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
            "type": ["Achievement", "ApplyLinkAchievement"],
            "criteria": {
                "narrative": "Team members are nominated for this badge by their peers and recognized upon review by Example Corp management."
            },
            "description": "This badge recognizes the development of the capacity to collaborate within a group environment.",
            "name": "Teamwork",
            "url": "http://website.com/apply"
        }
    },
    "credentialSchema": [{
        "id": "https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_achievementcredential_schema.json",
        "type": "1EdTechJsonSchemaValidator2019"
    }, {
        "id": "https://openbadgespec.org/extensions/applyLinkExtension/schema_obv3p0.json",
        "type": "1EdTechJsonSchemaValidator2019"
    }]
}
```
