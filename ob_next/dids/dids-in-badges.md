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

* *Badge Issuer*: A service that allows for the creation of [BadgeClasses](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#BadgeClass) and the subsequent issuing of [Assertions](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#Assertion) to recipients that conform to the Open Badges specification. Beginning with Open Badges 2.0, the candidate platform must issue a valid [Baked Badge](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#Baking) and demonstrate how the recipient retrieves the Badge.

* *Badge Displayer*: An application that displays verified badges to viewers. Beginning with Open Badges 2.0, the candidate platform must display a minimum set of badge metadata and support viewer-initiated verification of a Badge.

* *Badge Host*: An application that can import, aggregate, and publicly host [Assertions](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#Assertion) for recipients. It also supports export of Badges at user request. Beginning with Open Badges 2.0, the candidate platform must be able to import all formats of Open Badges as well as prove that Badge metadata is not lost upon export of the badge.

* *DID*: [Decentralized Identifiers (DIDs)](https://w3c.github.io/did-core/) are a type of identifier that enables a verifiable, decentralized digital identity.

* *ID*:  Unique [IRI](https://tools.ietf.org/html/rfc3987) for the [Assertion](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#Assertion). If using [Hosted Verification](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#HostedBadge), this should be the [URI](https://tools.ietf.org/html/rfc3986) where the assertion is accessible. For [Signed Assertions](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#SignedBadge), it is recommended to use a [UUID in the urn:uuid namespace](https://tools.ietf.org/html/rfc4122).

# Value Proposition

## What Is a DID?

[Decentralized Identifiers](https://w3c.github.io/did-core), or DIDs, "are a new type of identifier to provide verifiable, decentralized digital identity." In brief, DIDs are URLs, often backed by a distributed ledger, that can be resolved to a "DID Document" containing cryptographic key material of which the "controller" can prove ownership. The identity provides a mechanism for trustable interactions with the subject of a DID.

Unlike email addresses — controlled by a provider such as Google, Apple, or another corporation, or telephone numbers — controlled by telecom companies such as a Verizon, AT&T, and regulated by government agencies, DIDs are intended to be controlled by individual entities (individuals or organizations). This restriction is applied by the source the DID is backed with, which could be a centralized website (see: [did:github](https://github.com/decentralized-identity/github-did)), or a public decentralized blockchain (see: [did:btcr](https://w3c-ccg.github.io/didm-btcr)). DIDs enable high-trust interactions by leveraging public key cryptography.

DIDs are a key piece of decentralized infrastructure that are called out specifically in the [Verifiable Credentials Data Model](https://www.w3.org/TR/vc-data-model/) and [Identity Hub](https://github.com/decentralized-identity/identity-hub/blob/master/explainer.md) specifications among many others in the Self Sovereign and Digital Identity space.

An example DID document, [taken from the spec](https://w3c.github.io/did-core/#example-2-minimal-self-managed-did-document), is provided below:
```
{
  "@context": "https://www.w3.org/ns/did/v1",
  "id": "did:example:123456789abcdefghi",
  "authentication": [{
    "id": "did:example:123456789abcdefghi#keys-1",
    "type": "RsaVerificationKey2018",
    "controller": "did:example:123456789abcdefghi",
    "publicKeyPem": "-----BEGIN PUBLIC KEY...END PUBLIC KEY-----\r\n"
  }],
  "service": [{
    "id":"did:example:123456789abcdefghi#vcs",
    "type": "VerifiableCredentialService",
    "serviceEndpoint": "https://example.com/vc/"
  }]
}
```

A corresponding example Verifiable Credential, where the subject (who the credential is issued to) is a DID:

```
{
  "@context": [
    "https://www.w3.org/2018/credentials/v1",
    "https://www.w3.org/2018/credentials/examples/v1"
  ],
  "id": "http://example.edu/credentials/3732",
  "type": ["VerifiableCredential", "UniversityDegreeCredential"],
  "credentialSubject": {
    "id": "did:example:123456789abcdefghi",
    "degree": {
      "type": "BachelorDegree",
      "name": "Bachelor of Science and Arts"
    }
  },
  "proof": { ... }
}
```


## How Does Someone Get a DID?

There are two paths to get a DID: claim one yourself or join an Identity Platform that facilitates DIDs. A list of DID methods that are in development is [provided by the W3C](https://w3c.github.io/did-spec-registries/#did-methods). At present, there are over 50 DID methods! Each DIDs can be [“resolved”](https://w3c.github.io/did-core/#resolution) to a DID Document expressing information about the holder by resolvers that support the relevant DID method. Multiple DID resolution services have arisen, one such is hosted by the [DIF here](https://dev.uniresolver.io/).

Typically, recipients will get a DID upon joining an Identity Platform supporting DIDs. There are a number of companies currently in or joining the Identity space to facilitate individuals getting DIDs. To obtain more information on a specific DID method, and how to attain a DID for that method, it is recommended to go to the [DID registry](https://w3c.github.io/did-spec-registries/#did-methods) and find the method-specific documentation.

Recipients can have a single DID or multiple DIDs for greater privacy. DID management typically requires extensive infrastructure. When looking to claim a DID it is important to consider what a DID method, and Identity Platform provide for you: what security practices are being followed, what is the backing store for the DID, who makes up the organization(s) controlling the DID method, what are the legal implications of claiming such a DID, what DID operations are supported, and what control are you giving up, if any, in claiming a certain DID?

## Why DIDs Make Open Badges Better

The benefits of adding DIDs to Open Badges can be broken into three key points: security, portability, and interoperability.

As of Open Badges v2.0, trust in Open Badges is obtained in two ways: signed assertions and hosting. Both are viable methods that allow for trusted interactions with Badges allowing Badges to be transmitted as JWTs and trust to be derived from a web host, often over TLS. Adding DIDs to Badges would allow new trust interactions. One could challenge a recipient to prove they control a DID, or, a Badge can be wrapped in a [Verifiable Presentation](https://w3c.github.io/vc-data-model/#presentations-0). Adding DIDs to Badges could even invite new signed assertion mechanisms using [Linked Data Proofs](https://w3c-ccg.github.io/ld-proofs). Giving DIDs to recipients enables individual attestation by design. Giving DIDs to issuers enables trusted issuance of Badges to trusted parties.

Portability is the next important point. Most often, today, we see Badges in a Badge-host backpack. By adopting DIDs, Badges become more _[self sovereign](http://www.lifewithalacrity.com/2016/04/the-path-to-self-soverereign-identity.html)_ meaning that individuals can take control of their data without having to trust a corporation or other intermediary. With DIDs in a Badges, combined with innovations like the Badge Connect API, Badges could move freely between backpacks or other digital wallets a user controls.

If we consider corporate email addresses, we find another portability benefit of moving to DIDs. With a corporate email address an individual may be issued an achievement in the form of a Badge that represents some training completed. Sometimes, this training may be useful to future employers; however, once an individual leaves a company they likely do not have access to their corporate email address, and consequently lose access to their Badge. If the Badge, instead, was issued to a DID, the individual would retain control of their DID and achievement independent of their employer. This is one such example, though many more can be imagined, that show the strength of user-centric identity that is decentralized and portable.

The last main benefit of adding DIDs to Open Badges is interoperability. Open Badges are an excellent technology for displaying achievement. There are other technologies that have complementary strengths like [Verifiable Credentials](https://w3c.github.io/vc-data-model), which aren't so user friendly or visually appealing, but do contain trusted data in a similar way to Badges. Verifiable Credentials are one of many technologies utilizing DIDs, that could interoperate with Open Badges should they share the same recipient type. Tie-ins to other DID-infrastructure both strengthens the capabilities and reach of Open Badges, while simultaneously building a stronger decentralized ecosystem.

DIDs in Badges give new optionality to issuers and recipients operating in the Badging ecosystem, enabling, if one wishes, high-trust interactions, tie-in to other up-and-coming standards, and contributes to a narrative of user-centric data.

## Drawbacks of DIDs in Open Badges

Though Decentralized Identifiers are an official W3C specification, they have yet to see widespread adoption. Drawbacks in this sense are similar to drawbacks for all new, or up-and-coming technologies. We believe this drawback is minimized by the endorsement of the DID specification by the W3C, and a number of prominent technology companies and enthusiasts.

Additionally, introducing DIDs welcomes complexity around trust interactions and dealing with cryptographic operations. It is not trivial to properly implement systems that handle key management, signing, and verification. Much dilligence and attention must be paid to properly adhereing to security standards and guidelines, and keeping an eye on the space for potential vulnerabilities, leaks, and the advancement of the technology at hand.

The proposal as it stands is an optional addition to the specification. Those who do not choose to uptake it will still be compliant with the Open Badge standard. However, as we see an increase in mobility for Badges, with the Connect API, there may be uptake required for Badging Platforms to support DIDs in Badges.

# Sample Changes to Open Badge Specification 

## Modified Profile Identifier Properties
When [Profiles](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#Profile) are referenced elsewhere in the Open Badges Specification, they may be identified precisely by dereferenceable id, such as when a [BadgeClass](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#BadgeClass) links to an issuer Profile by its id URL. Other times, such as when identifying the recipient of an [Assertion](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/index.html#Assertion), Profiles may be identified by the value of a specific property unique to the individual or organization represented in a Profile. All properties that serve as profile identifiers must have values with a string datatype.

Properties considered serviceable identifiers include:

**email**

**url**

**telephone**

**id**

Many platforms that allow badge issuers and recipients to establish their identities as Profiles support only [email](https://schema.org/email) as an identifier property.
