## Migrating from OB 2.0, OB 2.1, and CLR 1.0
Open Badges 3.0 and Comprehensive Learner Record 2.0 are major releases, and objects published under these versions are not backwards-compatible

Issuers who use Open Badges 2.0 typically make available standard-compliant
endpoints for each Issuer Profile, BadgeClass, and Assertion. In addition to
enabling verification of their badge awards, these endpoints often also serve to
present human-readable information to clients in HTML when HTML is requested by
browsers. Social media networks to which badge awards are shared gather
information to display awards from these endpoints as [Open Graph
Protocol](https://ogp.me/) metadata. Exceptions to the pattern of one endpoint
per Assertion or BadgeClass occur for implementers who have chosen to use [OB
2.0 signed
verification](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#SignedBadge)
for assertions or [ephemeral BadgeClass
IDs](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#BadgeClass)
in the `urn:uuid` namespace.

For any system already using hosted endpoints for these objects, use cases
remain within the 3.0 ecosystem to continue that support in addition to
delivering these objects compliant with 3.0. In OB 3.0 and CLR 2.0, assertions
become `AchievementCredentials`, and `BadgeClasses` become `Achievements`, which
may be more likely to use `urn:uuid` identifiers. As the ecosystem transitions to support OB 3.0 serialization of these objects, some products will continue to support OB 2.0 representations, so an efficient transition for issuer services likely involves a window of continued support for 2.0 with no breaking changes for clients who rely on it today.

The new OB 3.0 and CLR 2.0 specifications each define APIs over which credentials can be exchanged, from issuers, to holders and then to displayers, but as these standards implement Verifiable Credentials

As portable signed credentials, Open Badges and CLR will take advantage of newly expanded options for both the potential of these credentials to contribute to understanding of skills, qualifications and experience, but also expanded privacy options for learners to control how their data is used and shared. The OB 3.0 and CLR 2.0 releases represent a beginning, but these capabilities will take time and require the launch of new features and new products to deliver on their potential impact. A transition to this generation of specification should be non-destructive but should also move quickly to take advantage of new capabilities.

The recommendations in this guide are intended to identify opportunities for interoperable implementation of of the Open Badges and Comprehensive Learner Record specifications. This serves goals of enabling (a) immediate improvement of last-gen credentials due to next-gen thinking, and (b) gradual technology change.
