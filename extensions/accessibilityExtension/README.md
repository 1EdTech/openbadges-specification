# Accessibility Extension
_Author: [Vincenzo Tilotta](https://github.com/tailot)_

An extension allowing for the addition of the content for people with disabilities.

## Open Badges 2.0

Property     | Type        | Value Description
-------------|-------------|---------
**@context** | context IRI | [https://w3id.org/openbadges/extensions/accessibilityExtension/context.json](https://w3id.org/openbadges/extensions/accessibilityExtension/context.json)
**type**    | type IRI array |`['Extension', 'extensions:Accessibility']`
**accessibilityAPI** | text | Indicates that the resource is compatible with the referenced accessibility API. Possible values: `['AndroidAccessibility', 'ARIA', 'ATK', 'AT-SPI', 'BlackberryAccessibility', 'iAccessible2', 'iOSAccessibility', 'JavaAccessibility', 'MacOSXAccessibility', 'MSAA', 'UIAutomation']`
**accessibilityControl** | text | Identifies one or more input methods that allow access to all of the application functionality. Possible values: `['fullKeyboardControl', 'fullMouseControl', 'fullSwitchControl', 'fullTouchControl', 'fullVideoControl', 'fullVoiceControl']`
**accessibilityFeature** | text | Content features of the resource, such as accessible media, supported enhancements for accessibility and alternatives. `['alternativeText', 'annotations', 'audioDescription', 'bookmarks', 'braille', 'captions', 'ChemML', 'describedMath', 'displayTransformability', 'highContrastAudio', 'highContrastDisplay', 'index', 'largePrint', 'latex', 'longDescription','MathML', 'none', 'printPageNumbers', 'readingOrder', 'signLanguage', 'structuralNavigation', 'tableOfContents', 'taggedPDF', 'tactileGraphic', 'tactileObject', 'timingControl', 'transcript', 'ttsMarkup', 'unlocked']`
**accessibilityHazard** | text | A characteristic of the described resource that is physiologically dangerous to some users. Related to http://www.w3.org/TR/UNDERSTANDING-WCAG20/seizure.html `['flashing', 'noFlashingHazard', 'motionSimulation', 'noMotionSimulationHazard', 'sound', 'noSoundHazard']`

**Extendable Badge Objects:**
Assertion, BadgeClass, Issuer

**Example implementation:**
```json
{
  "name": "Awesome Robotics Badge",
  "description": "For doing awesome things with robots that people think is pretty great.",
  "image": "http://openbadges.it/logo.png",
  "criteria": "https://example.org/robotics-badge.html",
  "tags": [
      "robots",
      "awesome"
  ],
  "issuer": "https://example.org/badge/issuer.json",
  "extensions:Accessibility": {
    "@context":"https://w3id.org/openbadges/extensions/accessibilityExtension/context.json",
    "type": ["Extension", "extensions:Accessibility"],
    "accessibilityAPI": "ARIA",
    "accessibilityControl": ["fullKeyboardControl","fullMouseControl","fullTouchControl"],
    "accessibilityFeature": "audioDescription",
    "accessibilityHazard": "noFlashingHazard",
    "url": "http://exampleaccessiblecontent.org/"
  }
}
```

## Open Badges 3.0

The adaptation of this extension ultimately consist on extending the
datamodel, adding existing accessibility attributes to the entities
`Achievement`, `AchievementCredential` and `Profile`.

The OB 3.0 JSON-LD context has already defined some terms that this
extension to all entities of the specification. So, you'll need a JSON-LD
context with the remaining terms.

### Accessibility OB 3.0 JSON-LD Context
```json
{
    "@context": {
        "@protected": true,
        "accessibilityAPI": "https://schema.org/accessibilityAPI",
        "accessibilityControl": "https://schema.org/accessibilityControl",
        "accessibilityFeature": "https://schema.org/accessibilityFeature",
        "accessibilityHazard": "https://schema.org/accessibilityHazard"
    }
}
```

Given the fact that this extension applies to three different entities, we
would need three different JSON schemas. The existing extension JSON schema
doesn't work, as it defines the attributes at the root level,
while we need to define them for the `Achievement`, `AchievementCredential`
and `Profile` entities.

### Accessibility OB 3.0 JSON Schema for AchievementCredential
```json
{
    "$schema": "https://json-schema.org/draft/2019-09/schema#",
    "$id": "https://openbadgespec.org/extensions/accessibilityExtension/schema_achievement_credential_obv3p0.json",
    "type": "object",
    "properties": {
        "accessibilityAPI": {
            "type": "string"
        },
        "accessibilityControl": {
            "type": "array",
            "items": {
                "type": "string"
            }
            },
        "accessibilityFeature": {
            "type": "string"
        },
        "accessibilityHazard": {
            "type": "string"
        },
        "url":{
            "type": "string",
            "format": "uri"
        },
    }
    "required": ["url","accessibilityFeature"],
    "additionalProperties": true,
}
```

### Accessibility OB 3.0 JSON Schema for Achievement
```json
{
    "$schema": "https://json-schema.org/draft/2019-09/schema#",
    "$id": "https://openbadgespec.org/extensions/accessibilityExtension/schema_achievement_obv3p0.json",
    "type": "object",
    "properties": {
        "credentialSubject": {
            "type": "object",
            "properties": {
                "achievement": {
                    "type": "object",
                    "properties": {
                        "accessibilityAPI": {
                            "type": "string"
                        },
                        "accessibilityControl": {
                            "type": "array",
                            "items": {
                                "type": "string"
                            }
                            },
                        "accessibilityFeature": {
                            "type": "string"
                        },
                        "accessibilityHazard": {
                            "type": "string"
                        },
                        "url":{
                            "type": "string",
                            "format": "uri"
                        },
                    }
                    "required": ["url","accessibilityFeature"],
                    "additionalProperties": true
                }
            },
            "additionalProperties": true
        }
    },
    "additionalProperties": true
}
```

### Accessibility OB 3.0 JSON Schema for Issuer Profile
```json
{
    "$schema": "https://json-schema.org/draft/2019-09/schema#",
    "$id": "https://openbadgespec.org/extensions/accessibilityExtension/schema_profile_obv3p0.json",
    "type": "object",
    "properties": {
        "credentialSubject": {
            "type": "object",
            "properties": {
                "issuer": {
                    "type": "object",
                    "properties": {
                        "accessibilityAPI": {
                            "type": "string"
                        },
                        "accessibilityControl": {
                            "type": "array",
                            "items": {
                                "type": "string"
                            }
                            },
                        "accessibilityFeature": {
                            "type": "string"
                        },
                        "accessibilityHazard": {
                            "type": "string"
                        },
                        "url":{
                            "type": "string",
                            "format": "uri"
                        },
                    },
                    "required": ["url","accessibilityFeature"],
                    "additionalProperties": true
                }
            },
            "additionalProperties": true
        }
    },
    "additionalProperties": true,
}
```

A credential with this extension applied to both entities is shown below.
It adds the url of the above JSON-LD context (assuming is
`https://openbadgespec.org/extensions/accessibilityExtension/context-3.0.0.json`)
in its `@context` declaration and the url of the JSON schemas in its
`credentialSchema` attribute.

> You only need to include the JSON schema of the extended entity to use.


### Sample OpenBadgeCredential with Accessibility extension
```json
{
    "@context": [
        "https://www.w3.org/ns/credentials/v2",
        "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.1.json",
        "https://openbadgespec.org/extensions/accessibilityExtension/context-3.0.0.json"
    ],
    "id": "http://example.com/credentials/3527",
    "type": ["VerifiableCredential", "OpenBadgeCredential", "Accessibility"],
    "issuer": {
        "id": "https://example.com/issuers/876543",
        "type": ["Profile","Accessibility"],
        "name": "Example Corp",
        "accessibilityAPI": "ARIA",
        "accessibilityControl": ["fullKeyboardControl","fullMouseControl","fullTouchControl"],
        "accessibilityFeature": "audioDescription",
        "accessibilityHazard": "noFlashingHazard",
        "url": "http://exampleaccessiblecontent.org/"

    },
    "validFrom": "2010-01-01T00:00:00Z",
    "name": "Teamwork Badge",
    "credentialSubject": {
        "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
        "type": "AchievementSubject",
        "achievement": {
            "id": "https://example.com/achievements/21st-century-skills/teamwork",
            "type": ["Achievement", "Accessibility"],
            "criteria": {
                "narrative": "Team members are nominated for this badge by their peers and recognized upon review by Example Corp management."
            },
            "description": "This badge recognizes the development of the capacity to collaborate within a group environment.",
            "name": "Teamwork",
            "accessibilityAPI": "ARIA",
            "accessibilityControl": ["fullKeyboardControl","fullMouseControl","fullTouchControl"],
            "accessibilityFeature": "audioDescription",
            "accessibilityHazard": "noFlashingHazard",
            "url": "http://exampleaccessiblecontent.org/"
        }
    },
    "accessibilityAPI": "ARIA",
    "accessibilityControl": ["fullKeyboardControl","fullMouseControl","fullTouchControl"],
    "accessibilityFeature": "audioDescription",
    "accessibilityHazard": "noFlashingHazard",
    "url": "http://exampleaccessiblecontent.org/",
    "credentialSchema": [{
        "id": "https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_achievementcredential_schema.json",
        "type": "1EdTechJsonSchemaValidator2019"
    }, {
        "id": "https://openbadgespec.org/extensions/accessibilityExtension/schema_achievement_credential_obv3p0.json",
        "type": "1EdTechJsonSchemaValidator2019"
    }, {
        "id": "https://openbadgespec.org/extensions/accessibilityExtension/schema_achievement_obv3p0.json",
        "type": "1EdTechJsonSchemaValidator2019"
    }, {
        "id": "https://openbadgespec.org/extensions/accessibilityExtension/schema_profile_obv3p0.json",
        "type": "1EdTechJsonSchemaValidator2019"
    }]
}
```
