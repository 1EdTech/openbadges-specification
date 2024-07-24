# Geo Location Extension
_Authors: [Doug Belshaw](http://dougbelshaw.com) and [Kerri Lemoie](https://github.com/kayaelle)_

An extension allowing for the addition of the geographic coordinates associated with a badge object. For example, geolocation could represent where a BadgeClass is available, where a badge Assertion was earned or the location of an issuer. The required description property allows implementers to be more specific about the reason location is included.

## Open Badges 2.0

Property     | Type        | Value Description
-------------|-------------|---------
**@context** | context IRI | [https://w3id.org/openbadges/extensions/geoCoordinatesExtension/context.json](https://w3id.org/openbadges/extensions/geoCoordinatesExtension/context.json)
**type**    | type IRI array |`['Extension', 'schema:Place' 'extensions:GeoCoordinates']`
name | text | The place's name, if available
**description** | text | A description of the location
**geo** | <a href="#GeoCoordinates">GeoCordinates</a> | The GeoCoordinates of a location (containing the following properties)

<a name="GeoCordinates"></a>**GeoCoordinates**:

Property     | Type        | Value Description
-------------|-------------|---------
**latitude** | number | The latitude of a location
**longitude** | number | The longitude of a location


**Extendable Badge Objects:**
Assertion, BadgeClass, Issuer

**Example implementation:**
```json
{
  ...
  "schema:location": {
    "@context": "https://openbadgespec.org/extensions/geoCoordinatesExtension/context.json",
    "type": ["Extension", "extensions:GeoCoordinates", "schema:Place"],
    "name": "Stadium of Light, Sunderland",
    "description": "A foodball stadium in Sunderland, England that is home to Sunderland A.F.C.",
    "geo": {
      "latitude": 54.914440,
      "longitude": -1.387721
    }
  }
}
```

## Open Badges 3.0

Some of the use cases are part of the main specification in the new versions of the
specs. Precisely, the `Profile` entity – which represents an issuer or a creator
of the achievement – contains the `address` property of type `Address` with the
geographic coordinates.

However, this extension covers uses cases not covered by the main spec,
like where the badge is available, or where a badge was earned. Therefore,
implementors may use this extension to fulfill these requirements.

We can leverage the http://schema.org/Place term for extending the datamodel.
So, the adaptation of this extension ultimately consist on extending the
datamodel, adding a `place` attribute of type `Place` to the entities
`Achievement` and `AchievementCredential`.

Given the fact that this extension applies to two different entities, we
would need two different JSON schemas. The JSON-LD context, on the other
hand, could be the same for both extensions.

```json
// GeoLocation OB 3.0 JSON-LD Context
{
    "@context": {
        "@protected": true,
        "schema": "http://schema.org/",
        "Place": "schema:Place",
    }
}
```

Also you need two JSON schemas, as detailed before. The existing extension
JSON schema doesn't work, as it defines the attributes at the root level,
while we need to define them for the `Achievement` and `AchievementCredential`
entities.

```json
// GeoLocation OB 3.0 JSON Schema for AchievementCredential
{
    "$schema": "https://json-schema.org/draft/2019-09/schema#",
    "$id": "https://openbadgespec.org/extensions/geoCoordinatesExtension/schema_achievement_credential_obv3p0.json",
    "type": "object",
    "properties": {
        "place": {
            "$ref":"#/$defs/Place"
        }
    },
    "required": ["place"],
    "additionalProperties": true,
    "$defs": {
        "Place": {
            "type":"object",
            "properties": {
                "name": {
                    "type": "string"
                },
                "description": {
                    "type": "string"
                },
                "geo": {
                    "$ref":"#/$defs/GeoCoordinates"
                }
            }
        },
        "GeoCoordinates": {
            "description":"The geographic coordinates of a location.",
            "type":"object",
            "properties":{
                "type":{
                    "description":"The value of the type property MUST be an unordered set. One of the items MUST be the IRI 'GeoCoordinates'.",
                    "$comment":"Origin: IRI (DerivedType); A `NormalizedString` that represents an Internationalized Resource Identifier (IRI), which extends the ASCII characters subset of the Uniform Resource Identifier (URI).",
                    "type":"string",
                    "enum":[
                        "GeoCoordinates",
                    ]
                },
                "latitude":{
                    "description":"The latitude of the location [[WGS84]].",
                    "$comment":"Origin: Float (PrimitiveType)",
                    "type":"number",
                    },
                "longitude":{
                    "description":"The longitude of the location [[WGS84]].",
                    "$comment":"Origin: Float (PrimitiveType)",
                    "type":"number",
                }
            },
            "required":[
                "type",
                "latitude",
                "longitude",
            ],
            "additionalProperties":true,
        }
    }
}
```

```json
// GeoLocation OB 3.0 JSON Schema for Achievement
{
    "$schema": "https://json-schema.org/draft/2019-09/schema#",
    "$id": "https://openbadgespec.org/extensions/geoCoordinatesExtension/schema_achievement_obv3p0.json",
    "type": "object",
    "properties": {
        "credentialSubject": {
            "type": "object",
            "properties": {
                "achievement": {
                    "type": "object",
                    "properties": {
                        "place": {
                            "$ref":"#/$defs/Place"
                        }
                    },
                    "required": ["place"],

                    "additionalProperties": true
                }
            },
            "additionalProperties": true
        }
    },
    "additionalProperties": true,
    "$defs": {
        "Place": {
            "type":"object",
            "properties": {
                "name": {
                    "type": "string"
                },
                "description": {
                    "type": "string"
                },
                "geo": {
                    "$ref":"#/$defs/GeoCoordinates"
                }
            }
        },
        "GeoCoordinates": {
            "description":"The geographic coordinates of a location.",
            "type":"object",
            "properties":{
                "type":{
                    "description":"The value of the type property MUST be an unordered set. One of the items MUST be the IRI 'GeoCoordinates'.",
                    "$comment":"Origin: IRI (DerivedType); A `NormalizedString` that represents an Internationalized Resource Identifier (IRI), which extends the ASCII characters subset of the Uniform Resource Identifier (URI).",
                    "type":"string",
                    "enum":[
                        "GeoCoordinates",
                    ]
                },
                "latitude":{
                    "description":"The latitude of the location [[WGS84]].",
                    "$comment":"Origin: Float (PrimitiveType)",
                    "type":"number",
                    },
                "longitude":{
                    "description":"The longitude of the location [[WGS84]].",
                    "$comment":"Origin: Float (PrimitiveType)",
                    "type":"number",
                }
            },
            "required":[
                "type",
                "latitude",
                "longitude",
            ],
            "additionalProperties":true,
        }
    }
}
```

A credential with this extension applied to both entities is shown below.
It adds the url of the above JSON-LD context (assuming is
`https://openbadgespec.org/extensions/geoCoordinatesExtension/context-3.0.0.json`)
in its `@context` declaration and the url of the JSON schemas in its
`credentialSchema` attribute.

> You only need to include the JSON schema of the extended entity to use.

```json
// Sample OpenBadgeCredential with Geo Location extension
{
    "@context": [
        "https://www.w3.org/ns/credentials/v2",
        "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.1.json",
        "https://openbadgespec.org/extensions/geoCoordinatesExtension/context-3.0.0.json"
    ],
    "id": "http://example.com/credentials/3527",
    "type": ["VerifiableCredential", "OpenBadgeCredential", "Place"],
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
            "type": ["Achievement", "Place"],
            "criteria": {
                "narrative": "Team members are nominated for this badge by their peers and recognized upon review by Example Corp management."
            },
            "description": "This badge recognizes the development of the capacity to collaborate within a group environment.",
            "name": "Teamwork",
            "place": {
                "name": "Stadium of Light, Sunderland",
                "description": "A foodball stadium in Sunderland, England that is home to Sunderland A.F.C.",
                "geo": {
                    "latitude": 54.914440,
                    "longitude": -1.387721
                }
            }
        }
    },
    "credentialSchema": [{
        "id": "https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_achievementcredential_schema.json",
        "type": "1EdTechJsonSchemaValidator2019"
    }, {
        "id": "https://openbadgespec.org/extensions/geoCoordinatesExtension/schema_achievement_credential_obv3p0.json",
        "type": "1EdTechJsonSchemaValidator2019"
    }, {
        "id": "https://openbadgespec.org/extensions/geoCoordinatesExtension/schema_achievement_obv3p0.json",
        "type": "1EdTechJsonSchemaValidator2019"
    }],
    "place": {
        "name": "Stadium of Light, Sunderland",
        "description": "A foodball stadium in Sunderland, England that is home to Sunderland A.F.C.",
        "geo": {
            "latitude": 54.914440,
            "longitude": -1.387721
        }
    }
}
```
