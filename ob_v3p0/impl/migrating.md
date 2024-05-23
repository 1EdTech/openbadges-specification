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
		"https://www.w3.org/ns/credentials/v2",
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
