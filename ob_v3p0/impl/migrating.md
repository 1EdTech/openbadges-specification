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

As portable signed credentials, there are now expanded privacy options for
learners to control how their data is used and shared. The OB 3.0 and CLR 2.0
releases represent a beginning, but these capabilities will take time and
require the launch of new features and new products to deliver on their
potential impact. A transition to this generation of specification should be
non-destructive but should also move quickly to take advantage of new
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

<pre class="json example" title="OpenBadges 3.0 Achievement with linked OpenBadges 2.0 BadgeClass via related association">
{
    "@context": "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json",
    "type": ["Achievement", "https://w3id.org/openbadges#BadgeClass"],
    "inLanguage": "en",
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
            "inLanguage": "es"
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
		"https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
	],
	"id": "did:web:example.com:issuers:540e388e-2735-4c3e-9709-80142801c774",
    "alsoKnownAs": "https://example.com/issuers/v2p0/540e388e-2735-4c3e-9709-80142801c774",
    "otherIdentifier": [{
        "type": ["IdentifierEntry"],
        "identifier": "https://example.com/issuers/v2p0/540e388e-2735-4c3e-9709-80142801c774",
        "identifierType": "identifier"
    }]
    "name": "Example Institution",
    "url": "https://example.edu",
    "email": "info@example.edu",
}
</pre>

Within the OB 2.0 representation of the issuer, a reverse link may be made with
`related`, as was done with the BadgeClass

<pre class="json example" title="Issuer profile relation between Open Badges 2.0 and Open Badges 3.0">
{
    "@context": "https://w3id.org/openbadges/v2",
    "id": "https://example.com/issuers/v2p0/540e388e-2735-4c3e-9709-80142801c774",
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

And finally, at the level of the `OpenBadgeCredential`, an association to the
original OB 2.0 Assertion may be made using "evidence". The use of "evidence"
instead of a more complicated construction with `related` enables human-readable
display of a useful link to the original document in as many cases as possible,
by any displayer that supports the concept of evidence.

<pre class="json example vc" title="Upgraded OB 2.0 assertion included within CLR 2.0">
{
    "@context": [
        "https://www.w3.org/ns/credentials/v2",
        "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
    ],
    "id": "urn:uuid:91537dba-56cb-11ec-bf63-0242ac130004",
    "type": ["VerifiableCredential", "OpenBadgeCredential"],
    "issuer": {
        "id": "did:web:example.com:issuers:540e388e-2735-4c3e-9709-80142801c774",
        "alsoKnownAs": "https://example.com/issuers/v2p0/540e388e-2735-4c3e-9709-80142801c774",
        "otherIdentifier": [{
            "type": ["IdentifierEntry"],
            "identifier": "https://example.com/issuers/v2p0/540e388e-2735-4c3e-9709-80142801c774",
            "identifierType": "identifier"
        }],
        "name": "Example Institution",
        "url": "https://example.edu",
        "email": "info@example.edu",
    },
    "validFrom": "2010-01-01T00:00:00Z",
    "name": "Example Competency Badge Issued under OB 2.0",
    "credentialSubject": {
        "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
        "type": "AchievementSubject",
        "achievement": {
            "id": "urn:uuid:a7467ef6-56cb-11ec-bf63-0242ac130002",
            "type": "Achievement",
            "creator": {
                "id": "https://example.edu/issuers/565049",
                "type": "Profile"
            },
            "name": "Example Competency Badge Issued under OB 2.0",
            "criteria": {
                "id": "https://example.edu/achievements/a7467ef6-56cb-11ec-bf63-0242ac130002/criteria"
            },
            "description": "This example badge was issued originally as an Open Badges 2.0 assertion",
            "image": {
                "id": "https://example.edu/achievements/sample.png",
                "type": "Image"
            }
        }
    },
    "evidence": [
        {
            "type": ["Evidence", "https://w3id.org/openbadges#Assertion"],
            "id": "https://example.org/ob2/assertions/10481810-e094-4ffe-806f-25de49c87933",
            "name": "Original Open Badges 2.0 assertion for this credential",
            "description": "This credential was originally issued as an Open Badges 2.0 assertion. It has been updated to the latest version for delivery to Verifiable Credentials wallets and verifiers or inclusion within a Comprehensive Learner Record (CLR 2.0)."
        }
    ]
}
</pre>

Notes about this example:

-   A new ID is assigned for the upgraded assertion, in this case an `urn:uuid`
    identifier
-   The original badge data, which was expressed as a "hosted" OB 2.0 assertion
    is linked via the OB 3.0 Evidence.
-   A strong hint that the evidence item is an OB 2.0 Assertion is the use of
    the full IRI `https://w3id.org/openbadges#Assertion` as an additional type
    for the `Evidence` item. Consumers should understand that if they desire,
    they may verify the original using OB 2.0 protocols.
-   For additional context and human readability of the evidence link, a `name`
    and `description` appear in the Evidence record describing the upgrade
    process.
-   As the issuer in this example is the same entity offering credentials in
    either OB 2.0 or OB 3.0 format, there is a proof expected to be included in
    this credential.

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

### Including older Open Badges in CLR 2.0

When Comprehensive Learner Record (CLR) issuers want to include Open Badges
issued over time, these credentials must match the expected schema of an OB 3.0
`OpenBadgeCredential`. But the CLR issuer might have collected them in an older
format, such as OB 2.0, which largely expressed the same achievement
information, except in a different schema. To ensure that consumers are able to
process data included in a CLR efficiently, the CLR issuer may use the
[technique above](#how-to-support-both-ob-2-0-and-ob-3-0-as-an-issuer) to
represent the OB 2.0 data in OB 3.0 format with a reference to the original as
"evidence".

If the issuer of the CLR is the same as the issuer of the embedded upgraded
credentials, they may sign each with their own key, presumably the same used to
sign the outer CLR itself. If the original issuer of an embedded credential is
another entity, the embedded `OpenBadgeCredential` may be included without
signature. In either case, the `related` reference back to the original enables
consumers or viewers to trace the verification back to the original. The
inclusion of the unsigned third party credential implies the CLR issuer's
verification or trust of the original. Consumers may perform their own
verification of the referenced original OB 2.0 assertion using the OB 2.0
verification protocols.

This approach enables the CLR to meet the schema requirements for CLR 2.0
without leaving behind the millions of achievement assertions issued using
previous versions of the Open Badges Specification.

Implementation notes:

-   If the issuer is the same entity between the OB 2.0 and OB 3.0 versions, the
    CLR issuer should include a proof for the upgraded credential, but if the
    issuer is different, the CLR issuer should not include a proof and should
    expect that interested verifiers could perform OB 2.0 verification based on
    the assertion linked in Evidence.
-   An approach for OB 2.0 signed assertions is not included, as these represent
    less than 1% of all OB 2.0 assertions in existence, but this approach could
    be modified to work with a signed assertion, perhaps using a data URI to
    embed the original OB 2.0 compact JWS string.
