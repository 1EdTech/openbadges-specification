## Migrating from OB 2.0, OB 2.1, and CLR 1.0

Open Badges 3.0 and Comprehensive Learner Record 2.0 are major releases, and
objects published under these versions are not backwards-compatible

Issuers who use Open Badges 2.0 typically make available standard-compliant
endpoints for each Issuer Profile, BadgeClass, and Assertion. In addition to
enabling verification of their badge awards, these endpoints often also serve to
present human-readable information to clients in HTML when HTML is requested by
browsers. Social media networks to which badge awards are shared gather
information to display awards from these endpoints as
[Open Graph Protocol](https://ogp.me/) metadata. Exceptions to the pattern of
one endpoint per Assertion or BadgeClass occur for implementers who have chosen
to use
[OB 2.0 signed verification](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#SignedBadge)
for assertions or
[ephemeral BadgeClass IDs](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#BadgeClass)
in the `urn:uuid` namespace.

For any system already using hosted endpoints for these objects, use cases
remain within the 3.0 ecosystem to continue that support in addition to
delivering these objects compliant with 3.0. In OB 3.0 and CLR 2.0, assertions
become `OpenBadgeCredentials` or `AchievementCredentials` (an alias), and
`BadgeClasses` become `Achievements`, which may be more likely to use `urn:uuid`
identifiers. As the ecosystem transitions to support OB 3.0 serialization of
these objects, some products will continue to support OB 2.0 representations, so
an efficient transition for issuer services likely involves a window of
continued support for 2.0 with no breaking changes for clients who rely on it
today.

The new OB 3.0 and CLR 2.0 specifications each define APIs over which
credentials can be exchanged, from issuers, to holders and then to displayers,
but as these standards implement Verifiable Credentials

As portable signed credentials, Open Badges and CLR will take advantage of newly
expanded options for both the potential of these credentials to contribute to
understanding of skills, qualifications and experience, but also expanded
privacy options for learners to control how their data is used and shared. The
OB 3.0 and CLR 2.0 releases represent a beginning, but these capabilities will
take time and require the launch of new features and new products to deliver on
their potential impact. A transition to this generation of specification should
be non-destructive but should also move quickly to take advantage of new
capabilities.

The recommendations in this guide are intended to identify opportunities for
interoperable implementation of of the Open Badges and Comprehensive Learner
Record specifications. This serves goals of enabling (a) immediate improvement
of last-gen credentials due to next-gen thinking, and (b) gradual technology
change.

### How to support both OB 2.0 and OB 3.0 as an Issuer

The quickstart in this implementation guide provides an example implementation
using a `did:web` issuer identifier, HTTPS Achievement identifier, and a
`urn:uuid` in the `OpenBadgeCredential`. Meanwhile, an issuer may wish to avoid
breaking support for OB 2.0 to ensure learners can still use their badges in
tools that do not yet support the new version. This is possible and can work
elegantly to express the relationships between related objects if a few steps
are followed. The _same achievement data_ may be exposed in OB 2.0 and OB
3.0/CLR 2.0 formats. It is not advisable to attempt to publish a combined
expression of an entity that is compatible with OB 3.0/CLR 2.0 and the previous
version formats, but it is possible to express the relationship between related
objects using different IDs for the new versions of these specifications.

For example, a `related` association may be made within an `Achievement` and the
OB 2.0 equivalent `BadgeClass` that represents the same achievement. The issuer
service does not store the data in two separate formats, but it is capable of
serializing the data into the relevant formats when requested at different
endpoints. It is a helpful hint to include the IRI of the legacy BadgeClass type
(but because the term `BadgeClass` doesn't appear in the OB 3.0 context and the
two contexts are not compatible with one another to be applied to the same
document, the full IRI `https://w3id.org/openbadges#BadgeClass` is used here).

<pre class="json example" title="OpenBadges 3.0 with OpenBadges 2.0 via related association">
{
    "@context": "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.1.json",
    "type": ["Achievement", "https://w3id.org/openbadges#BadgeClass"],
    "@language": "en",
    "id": "https://example.com/achievements/c3c1ea5b-9d6b-416d-ab7f-76da1df3e8d6"
    ...
    "related": [
        {
            "type": [
                "Related",
                "https://w3id.org/openbadges#BadgeClass"
            ],
            "id": "https://example.com/badgeclasses/c3c1ea5b-9d6b-416d-ab7f-76da1df3e8d6",
            "version": "Open Badges v2p0"
        },
        {
            "type": ["Related"],
            "id": "https://example.com/achievements/c3c1ea5b-9d6b-416d-ab7f-76da1df3e8d6/es",
            "@language": "es"
        }
    ]
}
</pre>

-   There is an existing OB 2.0 endpoint for a BadgeClass at HTTPS id
    `https://example.com/badgeclasses/c3c1ea5b-9d6b-416d-ab7f-76da1df3e8d6`
-   Implement the OB 3.0 serialization at an endpoint
    `https://example.com/achievements/c3c1ea5b-9d6b-416d-ab7f-76da1df3e8d6`
-   This example also shows another entry in the related array, to describe a
    Spanish translation of the achievement, serialized in OB 3.0 `Achievement`
    format.

An OB 2.0 related property could be implemented to make the reverse connection
from the OB 2.0 BadgeClass:

<pre class="json example" title="OpenBadges 2.0 with related OpenBadges 3.0">
{
    "@context": "https://w3id.org/openbadges/v2",
    "type": "BadgeClass",
    "id": "https://example.com/badgeclasses/c3c1ea5b-9d6b-416d-ab7f-76da1df3e8d6",
    "related": [{
        "type": ["https://purl.imsglobal.org/spec/vc/ob/vocab.html#Achievement"],
        "id": "https://example.com/achievements/c3c1ea5b-9d6b-416d-ab7f-76da1df3e8d6",
        "version": "Open Badges v3p0"
    }]
}
</pre>

-   Again, the type IRI is spelled out in full, because `Achievement` is not
    defined in the OB 2.0 context.

The issuer profile shown in the quickstart uses a `did:web` identifier, and the
issuer must use an HTTPS identifier for the OB 2.0 hosted profile. Within the
3.0 `Profile` as embedded in a credential, an `otherIdentifier` property is
described that may be used to link to the 2.0 representation.

Additionally, within the DID Document context, an `alsoKnownAs` property is
available, that may express the HTTPS id of the OB 2.0 representation of the
profile.

<pre class="json example" title="Issuer profile relation between Open Badges 3.0 and Open Badges 2.0">
{
	"@context": [
		"https://www.w3.org/ns/did/v1",
		"https://www.w3.org/2018/credentials/v1",
		"https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.1.json",
		"https://w3id.org/security/suites/ed25519-2020/v1"
	],
	"id": "did:web:example.com:issuers:540e388e-2735-4c3e-9709-80142801c774",
    "alsoKnownAs": "https://example.com/issuers/v2p0/540e388e-2735-4c3e-9709-80142801c774",
    "otherIdentifier": [{
        "type": ["IdentifierEntry"],
        "identifier": "https://example.com/issuers/v2p0/540e388e-2735-4c3e-9709-80142801c774",
        "identifierType": "identifier"
    }]
    ...
}
</pre>

Within the OB 2.0 representation of the issuer, a reverse link may be made with
`related`, as was done with the BadgeClass

<pre class="json example" title="Issuer profile relation between Open Badges 2.0 and Open Badges 3.0">
{
    "@context": "https://w3id.org/openbadges/v2",
    "id": "hhttps://example.com/issuers/v2p0/540e388e-2735-4c3e-9709-80142801c774",
    "type": "Profile",
    "name": "Example Institution",
    "url": "https://example.com",
    "email": "info@example.com",
    "related": [{
        "type": [
            "https://purl.imsglobal.org/spec/vc/ob/vocab.html#Profile"
        ],
        "id": "did:web:example.com:issuers:540e388e-2735-4c3e-9709-80142801c774",
        "version": "Open Badges v3p0"
    }]
}
</pre>

### How to migrate from CLR 1.0 to CLR 2.0

There is less of an ecosystem of consumption for CLR 1.0 than for OB 2.0, and
the increased complexity of a CLR makes support for multiple versions more
expensive than for Open Badges, so it is not likely to be worth the investment
to maintain simultaneous serialization of both formats of packaged records. A
CLR 2.0 platform that also serves as the issuer for the `OpenBadgeCredentials`
packaged within the `ClrCredential` may choose to implement the above
backwards-compatibility steps for increased visibility and shareability of the
individual achievements. At the level of the CLR, it is likely that new
consumption products coming on the scene will implement the capability to
process CLR in the new 2.0 format rather than the legacy version.

Migrating to CLR 2.0 involves a replacement of endpoints where CLR 1.0 documents
were available with the implementation of the CLR 2.0 API. If there are existing
clients or relying parties on the CLR 1.0 representations, the best path is to
work with those clients to upgrade to 2.0 representations and transfer via API
and then remove the 1.0 endpoints once a 2.0 channel has been established.

### Open Badges Extensions

[Open Badges 3.0](http://www.imsglobal.org/spec/ob/v3p0#extending) and [Comprehensive Learner Record 2.0](http://www.imsglobal.org/spec/clr/v2p0#extending) allows extensibility in several ways: data model, extensible enumerated vocabularies and API.

Open Badges 2.0 extensions are community developed contributions to the Open Badges Specification. Althought these extensions are not part of the core specification, 1Edtech keeps a list of community extensions at https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/extensions/index.html#CommunityExtensions.

These extension are compatible with the new version of Open Badges and CLR with some minor changes. Precisely, they are an extension of the data model. However, some of these extensions are deprecated in favor of the spec itself.

The OB 3.0 and CLR 2.0 context file doesn't define the type `Extension`. Thus, the addition of this type in the `@type` property of the extension is discouraged. Also, derived from the alignment with W3c's Verifiable Credentials, it's recommended to define the `@context` of the extension alongside the remaining contexts in the root element.

- [Apply Link](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/extensions/index.html#-apply-link): The apply link provides a url that allows potential badge earners to apply for an opportunity as specified by the badge issuer.

    The OB 3.0 JSON-LD context has already defined the same terms that this extension to all entities
    of the specification. However, you should follow the guidelines to extend the data model.

    So, you should create a new context link with the new type, as the example below

    <pre class="json example"
        title="Apply Link OB 3.0 JSON-LD Context"
    >
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
    </pre>

    Also you need a JSON schema. The existing extension JSON schema doesn't
    work, as it defines the attributes at the root level, while we need to
    define them for the `Achievement` entity.

    <pre class="json example"
        title="Apply Link OB 3.0 JSON Schema"
    >
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
    </pre>

    A credential with this extension is shown below. It adds the url of the above
    JSON-LD context (assuming is
    `https://openbadgespec.org/extensions/applyLinkExtension/context-3.0.0.json`)
    in its `@context` declaration and the url of the JSON schema in its
    `credentialSchema` attribute.

    <pre class="json example vc"
        data-schema="org.1edtech.ob.v3p0.achievementcredential.class"
        data-allowadditionalproperties="true"
        title="Sample OpenBadgeCredential with Apply Link extension"
    >
    {
        "@context": [
            "https://www.w3.org/2018/credentials/v1",
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
        "issuanceDate": "2010-01-01T00:00:00Z",
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
    </pre>

- [Endorsement](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/extensions/index.html#endorsement): Endorsement is part of the main specification since Open Badges 2.0.
- [Geo Location](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/extensions/index.html#geo-location):
This extension allows the addition of geographic coordinates associated with an
OB 2.0's badge object. For example, geolocation could represent where a Badge
Class is available, where a badge was earned or the location of an issuer. Some
of the use cases are part of the main specification in the new versions of the
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

    <pre class="json example"
        title="GeoLocation OB 3.0 JSON-LD Context"
    >
    {
        "@context": {
            "@protected": true,
            "schema": "http://schema.org/",
            "Place": "schema:Place",
        }
    }
    </pre>

    Also you need two JSON schemas, as detailed before. The existing extension
    JSON schema doesn't work, as it defines the attributes at the root level,
    while we need to define them for the `Achievement` and `AchievementCredential`
    entities.

    <pre class="json example"
        title="GeoLocation OB 3.0 JSON Schema for AchievementCredential"
    >
    {
        "$schema": "https://json-schema.org/draft/2019-09/schema#",
        "$id": "https://openbadgespec.org/extensions/geoCoordinatesExtension/schema_achievement_credential_obv3p0.json",
        "type": "object",
        "properties": {
            "place": {
                $ref":"#/$defs/Place"
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
    </pre>

    <pre class="json example"
        title="GeoLocation OB 3.0 JSON Schema for Achievement"
    >
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
                                $ref":"#/$defs/Place"
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
    </pre>

    A credential with this extension applied to both entities is shown below.
    It adds the url of the above JSON-LD context (assuming is
    `https://openbadgespec.org/extensions/geoCoordinatesExtension/context-3.0.0.json`)
    in its `@context` declaration and the url of the JSON schemas in its
    `credentialSchema` attribute.

    <div class="note">
        You only need to include the JSON schema of the extended entity to use.
    </div>

    <pre
        class="json example vc"
        data-schema="org.1edtech.ob.v3p0.achievementcredential.class"
        data-allowadditionalproperties="true"
        title="Sample OpenBadgeCredential with Geo Location extension"
    >
    {
        "@context": [
            "https://www.w3.org/2018/credentials/v1",
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
        "issuanceDate": "2010-01-01T00:00:00Z",
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
    </pre>

- [Accessibility](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/extensions/index.html#-accessibility): This extension allows the addition of the content for people with disabilities.

    This extension is not deprecated by the new version of the specs.
    The adaptation of this extension ultimately consist on extending the
    datamodel, adding existing accessibility attributes to the entities
    `Achievement`, `AchievementCredential` and `Profile`.

    The OB 3.0 JSON-LD context has already defined some terms that this
    extension to all entities of the specification. So, you'll need a JSON-LD
    context with the remaining terms.

    <pre class="json example"
        title="Accessibility OB 3.0 JSON-LD Context"
    >
    {
        "@context": {
            "@protected": true,
            "accessibilityAPI": "https://schema.org/accessibilityAPI",
            "accessibilityControl": "https://schema.org/accessibilityControl",
            "accessibilityFeature": "https://schema.org/accessibilityFeature",
            "accessibilityHazard": "https://schema.org/accessibilityHazard"
        }
    }
    </pre>

    Given the fact that this extension applies to three different entities, we
    would need three different JSON schemas. The existing extension JSON schema
    doesn't work, as it defines the attributes at the root level,
    while we need to define them for the `Achievement`, `AchievementCredential`
    and `Profile` entities.

    <pre class="json example"
        title="Accessibility OB 3.0 JSON Schema for AchievementCredential"
    >
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
    </pre>

    <pre class="json example"
        title="Accessibility OB 3.0 JSON Schema for Achievement"
    >
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
    </pre>

    <pre class="json example"
        title="Accessibility OB 3.0 JSON Schema for Issuer Profile"
    >
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
                        }
                        "required": ["url","accessibilityFeature"],
                        "additionalProperties": true
                    }
                },
                "additionalProperties": true
            }
        },
        "additionalProperties": true,
    }
    </pre>

    A credential with this extension applied to both entities is shown below.
    It adds the url of the above JSON-LD context (assuming is
    `https://openbadgespec.org/extensions/accessibilityExtension/context-3.0.0.json`)
    in its `@context` declaration and the url of the JSON schemas in its
    `credentialSchema` attribute.

    <div class="note">
        You only need to include the JSON schema of the extended entity to use.
    </div>

    <pre
        class="json example vc"
        data-schema="org.1edtech.ob.v3p0.achievementcredential.class"
        data-allowadditionalproperties="true"
        title="Sample OpenBadgeCredential with Accessibility extension"
    >
    {
        "@context": [
            "https://www.w3.org/2018/credentials/v1",
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
        "issuanceDate": "2010-01-01T00:00:00Z",
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
    </pre>

- [Creative Commons Content License](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/extensions/index.html#creative-commons-content-license): This extension enables issuers to indicate what permissions are granted to the public to reuse BadgeClass metadata in their own badges in terms of an expressive set of open content licenses that have broad global buy-in.

    This extension is not deprecated by the new version of the specs.
    The adaptation of this extension ultimately consist on extending the
    datamodel, adding a new attribute `license` of type `License` to the
    entity `Achievement`.

    Following the guidelines, we could define a new type `CCAchievement`.
    So, you'll need a JSON-LD context with this new type.

    <pre class="json example"
        title="Creative Commons Content License OB 3.0 JSON-LD Context"
    >
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
    </pre>

    Also you need a JSON schema. The existing extension JSON schema doesn't
    work, as it defines the attributes at the root level, while we need to
    define them for the `Achievement` entity.

    <pre class="json example"
        title="Creative Commons Content License OB 3.0 JSON Schema"
    >
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
                    id": {
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
    </pre>

    A credential with this extension is shown below. It adds the url of the above
    JSON-LD context (assuming is
    `https://openbadgespec.org/extensions/licenseExtension/context-3.0.0.json`)
    in its `@context` declaration and the url of the JSON schema in its
    `credentialSchema` attribute.

<pre
    class="json example vc"
    data-schema="org.1edtech.ob.v3p0.achievementcredential.class"
    data-allowadditionalproperties="true"
    title="Sample OpenBadgeCredential with Creative Commons Content License extension"
>
{
  "@context": [
    "https://www.w3.org/2018/credentials/v1",
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
  "issuanceDate": "2010-01-01T00:00:00Z",
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
  }
}
</pre>

- [Original Creator](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/extensions/index.html#-original-creator): This extension provides a way to track the origin of a badge when one organisation creates it for another. As the new version of the specs defines the `source` property of an `AchievementSubject` for, this extension is, therefore, deprecated. New versions of the specs also defines the `creator` property of an `Achievement`. See Section 2.4.1 Differentiating Issuers and Achievement Creators of [[OB-30]] details this behaviour.


#### Open Badge Extensions for Education

Among Open Badges 2.0 extensions there are two of them that have been authored 1EdTech initiatives:

- [Issuer Accreditation](https://www.imsglobal.org/1edtech-badge-extensions-education#accreditation-extension): This extension provides a reference to a single or to an array of multiple accreditation bodies as related to the Issuer Profile.

    Some of the attributes defined in the extension are part of the `Profile` entity in the new version of the specs, making them redundant when trying to use this extension in Open Badges 3.0 and CLR 2.0. These are mainly the properties related to location. Others attributes, like `logo`, `contactInstructions`, `educationalSector` and `accreditationDate` are still unique in the extension, as they aren't covered in the main specs.

    This extension is not deprecated by the new version of the specs, though it's recommended to use only those attributes not in the main spec.

<pre
    class="json example vc"
    data-schema="org.1edtech.ob.v3p0.achievementcredential.class"
    data-allowadditionalproperties="true"
    title="Sample OpenBadgeCredential with Issuer Accreditation extension"
>
{
  "@context": [
    "https://www.w3.org/2018/credentials/v1",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.1.json",
    "https://purl.imsglobal.org/spec/ob-accred/v1p0/context/"
  ],
  "id": "http://example.com/credentials/3527",
  "type": ["VerifiableCredential", "OpenBadgeCredential"],
  "issuer": {
    "id": "https://example.com/issuers/876543",
    "type": "Profile",
    "name": "Example Corp",
    "extensions:IssuerAccreditation": [{
        "type": ["extensions:IssuerAccreditation"],
        "name": "Northwest Commission on Colleges and Universities",
        "contactInstructions": "Call or email the Commission Office",
        "url": "http://www.nwccu.org/index.htm",
        "address": {
            "streetAddress": "8060 165th Ave. NE, Suite 100",
            "addressLocality": "Redmond",
            "addressRegion": "WA",
            "postalCode": "98052"
        },
        "description": "The Northwest Commission on Colleges and Universities (NWCCU) is an independent, non-profit membership organization recognized by the U.S. Department of Education as the regional authority on educational quality and institutional effectiveness of higher education institutions.",
        "areaServed": "The US seven-state Northwest region of Alaska, Idaho, Montana, Nevada, Oregon, Utah, and Washington. US-AK, US-ID, US-MT, US-NV, US-OR, US-UT, US-WA",
        "accreditationDate": "2010-09-01",
        "educationalSector": "Postsecondary"
    },
    {
        "type": ["extensions:issuerAccreditation"],
        "name": "Commission on Accreditation of Allied Health Education Programs",
        "contactInstructions": "Contact Kathleen Megivern, Executive Director, megivern@caahep.org",
        "url": "http://www.ncacasi.org",
        "address": {
            "streetAddress": "25400 US Highway 19 N, Suite 158",
            "addressLocality": "Clearwater",
            "addressRegion": "FL",
            "postalCode": "33763"
        },
        "description": "CAAHEP is the largest programmatic accreditor in the health sciences field. In collaboration with its Committees on Accreditation, CAAHEP reviews and accredits over 2000 educational programs in twenty-eight (28) health science occupations.",
        "accreditationDate": "2014-04-01",
        "educationalSector": "postsecondary"
    }]
  },
  "issuanceDate": "2010-01-01T00:00:00Z",
  "name": "Teamwork Badge",
  "credentialSubject": {
    "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
    "type": "AchievementSubject",
    "achievement": {
        "id": "https://example.com/achievements/21st-century-skills/teamwork",
        "type": "Achievement",
        "criteria": {
            "narrative": "Team members are nominated for this badge by their peers and recognized upon review by Example Corp management."
        },
        "description": "This badge recognizes the development of the capacity to collaborate within a group environment.",
        "name": "Teamwork"
  	}
  }
}
</pre>

- [Assessment](https://www.imsglobal.org/1edtech-badge-extensions-education#assessment-extension): This extension provides information about single or multiple assessments that would be completed by the recipient as part of the requirements for earning an OpenBadge. There could be multiple assessments of different types for each badge earned. Separate, independent evaluations of a single assessment could result in multiple assessment/evaluation records, all included in a single instance of the extension.

    This extension is not deprecated by the new version of the specs.

<pre
    class="json example vc"
    data-schema="org.1edtech.ob.v3p0.achievementcredential.class"
    data-allowadditionalproperties="true"
    title="Sample OpenBadgeCredential with Assessment extension"
>
{
  "@context": [
    "https://www.w3.org/2018/credentials/v1",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.1.json",
    "https://purl.imsglobal.org/spec/ob-assessment/v1p0/context/"
  ],
  "id": "http://example.com/credentials/3527",
  "type": ["VerifiableCredential", "OpenBadgeCredential"],
  "issuer": {
    "id": "https://example.com/issuers/876543",
    "type": "Profile",
    "name": "Example Corp"
  },
  "issuanceDate": "2010-01-01T00:00:00Z",
  "name": "Teamwork Badge",
  "credentialSubject": {
    "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
    "type": "AchievementSubject",
    "achievement": {
        "id": "https://example.com/achievements/21st-century-skills/teamwork",
        "type": "Achievement",
        "criteria": {
            "narrative": "Team members are nominated for this badge by their peers and recognized upon review by Example Corp management."
        },
        "description": "This badge recognizes the development of the capacity to collaborate within a group environment.",
        "name": "Teamwork",
        "extensions:assessmentExtension": {
            "type": ["extensions:AssessmentExtension"],
            "description": "A written evaluation based on a simulation of a medical procedure.",
            "assessments": [
            {
                "description": "The assessment presents a hypertension scenario with simulated lab results. It is administered to pathophysiology students in an undergraduate nursing program. Completing the assessment requires analytical writing describing and justifying the diagnoses and eliminating alternative diagnoses. See the Pathology of High Blood Pressure assignment and the hypertension scenario used for this assessment.",
                "type": "Artifact",
                "assessmentOutput": "Written responses to the questions posed in the hypertension scenario",
                "hasGroupParticipation": false,
                "hasGroupEvaluation": false,
                "evaluationMethod": "No studies have been done on reliability or validity but the hypertension scenario is consistent with scenarios encountered in nursing clinical practice.",
                "assessmentExample": "http://placeholderurl.com",
                "scoringMethodExampleDescription": "Placeholder text",
                "assessmentEvaluation": "http://placeholderurl.com"
            }
            ]
        }
  	}
  }
}
</pre>

- [Extra Description](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/extensions/index.html#IMSExtensions): This extension allows issuers to add additional descriptive fields to a BadgeClass or Issuer Profile.

    As the data model of both Open Badges 3.0 and Comprehensive Learnedr Record 2.0 allows extensibility in the affected entities, this extension is thus deprecated.
