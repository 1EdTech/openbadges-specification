# Introduction

## Design Goals and Rationale
This draft proposal adds to the [Open Badges specification](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html) to enable recipients of badges to use [Decentralized Identifiers (DIDs)](https://w3c.github.io/did-core/) in their [IdentityObject](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#IdentityObject). The use of DIDs will enable recipients to use a cryptographically verifiable pseudonymous identifier in their issued Badges. For other stakeholders such as Issuers or Consumers DIDs enable cryptographic verification capabilities to ensure control of the Recipient over their badges.

## Use Cases

_This section is non-normative._

* A recipient of a Badge wants to use a DID as a pseudonymous identifier.

* A candidate recipient of a Badge provides their DID to a Badge Issuer

* A Badge Issuer generates a DID for a recipient

* An Issuer leverages DID infrastructure to cryptographically verify that a recipient controls a DID identifier.

* A Consumer leverages DID infrastructure to cryptographically verify that a recipient controls a Badge.


## Terminology
The following terms are used throughout this document:

* *Badge Issuer*: A service that allows for the creation of [BadgeClasses](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#BadgeClass) and the subsequent issuing of [Assertions](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#Assertion) to recipients that conform to the Open Badges specification. Beginning with Open Badges 2.0, the candidate platform must issue a valid [Baked Badge](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#Baking) and demonstrate how the Badge is retrieved by the recipient.

* *Badge Displayer*: An application that displays verified badges to viewers. Beginning with Open Badges 2.0, the candidate platform must display a minimum set of badge metadata and support viewer-initiated verification of a Badge.

* *Badge Host*: An application that can import, aggregate, and publicly host [Assertions](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#Assertion) for recipients. It also supports export of Badges at user request. Beginning with Open Badges 2.0, the candidate platform must be able to import all formats of Open Badges as well as prove that Badge metadata is not lost upon export of the badge.

* *DID*: [Decentralized Identifiers (DIDs)](https://w3c.github.io/did-core/) are a type of identifier that enables a verifiable, decentralized digital identity.

* *ID*:  Unique [IRI](https://tools.ietf.org/html/rfc3987) for the [Assertion](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#Assertion). If using [Hosted Verification](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#HostedBadge), this should be the [URI](https://tools.ietf.org/html/rfc3986) where the assertion is accessible. For [Signed Assertions](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#SignedBadge), it is recommended to use a [UUID in the urn:uuid namespace](https://tools.ietf.org/html/rfc4122).

# Sample Changes to Open Badge Specification 

## Modified Profile Identifier Properties
When [Profiles](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#Profile) are referenced elsewhere in the Open Badges Specification, they may be identified precisely by dereferencable id, such as when a [BadgeClass](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#BadgeClass) links to an issuer Profile by its id URL. Other times, such as when identifying the recipient of an [Assertion](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#Assertion), Profiles may be identified by the value of a specific property unique to the individual or organization represented in a Profile. All properties that serve as profile identifiers must have values with a string datatype.

Properties considered serviceable identifiers include:

**email**

**url**

**telephone**

**id**

Many platforms that allow badge issuers and recipients to establish their identities as Profiles support only [email](https://schema.org/email) as an identifier property.
