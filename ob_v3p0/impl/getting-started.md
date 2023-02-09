## Getting started (for developers)

### Issuer quickstart

It may seem like an overwhelming task to implement Open Badges 3.0 or CLR 2.0,
but there are straightforward options that can take your product to a certified
launch simply. Here is a quickstart tutorial to build an MVP of an Open Badges
product that issues Open Badges to learners. It aims to sketch out a simple path
to a successful conformant implementation of Open Badges 3.0 issuance. From this
base, optional components of the specifications can be layered on to implement
relevant APIs, package records in CLR format, implementing revocation or refresh
services, and more. Products that complete all the user stories in this
quickstart will potentially be eligible for issuer-only certification.

We can track the workflows that must be built through a set of user stories.

**Issuer Profile**:

> As an institutional administrative agent, I can define an Issuer Profile that
> represents my organization.

See details on the
[selection of recipient and issuer identifiers](#selecting-recipient-and-issuer-identifiers-such-as-did-methods),
but for the purposes of a quickstart, hosting an issuer profile on an HTTPS url
associated with a `did:web` Decentralized Identifier is an easy choice for a web
application. See
[DID Web Method Specification](https://w3c-ccg.github.io/did-method-web/) For
example, if the web application under development is running on the domain
`example.com`, an issuer profile identifier might be
`did:web:example.com:issuers:540e388e-2735-4c3e-9709-80142801c774`, which would
resolve to a hosted resource available at
`https://example.com/issuers/540e388e-2735-4c3e-9709-80142801c774`. But what is
served at this URL when a client requests it? The most effective answer is to
present a response that best matches what the client is requesting, as it
indicates with the `Accept` HTTP header.

-   When a client requests `Accept: application/json` or `application/ld+json`
    or does not include an `Accept` header, a JSON-LD that includes the OB 3.0
    context should be returned. It should include its own primary id, all
    required properties from
    [Profile](https://1edtech.github.io/openbadges-specification/ob_v3p0.html#profile),
    and a representation of the public key component of the keypair this issuer
    uses to sign credentials in selected `JWK` or `Ed25519VerificationKey2020`
    format. See
    [Dereferencing the Public Key](https://1edtech.github.io/openbadges-specification/ob_v3p0.html#dereference)
-   When a client requests `Accept: */*` or `application/html`, an HTML
    representation of the Achievement should be presented. This should express
    information about the issuer using [Open Graph meta tags](https://ogp.me/),
    including at least name, description, and image tags for easy rendering of
    preview cards when the Achievement URL is shared to social media platforms,
    for instance.

In order to sign credentials, the issuer needs to have an associated key
referenced from their profile, whether that profile is resolved via a DID or an
HTTPS URL. Either a JWT stack using RSA 256 (or RSA with larger key sizes) or an
EdDSA stack using a JSON-LD linked data signature must be used to achieve
conformance certification as shown below. See
[Selecting proof methods and crypto algorithms](#selecting-proof-methods-and-crypto-algorithms)
for a detailed discussion on the management of keys and creation of signatures.

An example of a JSON-LD representation of an issuer profile follows, that uses
the EdDSA Cryptosuite 2020 option for signing credentials:

```jsonld
{
	"@context": [
		"https://www.w3.org/ns/did/v1",
		"https://www.w3.org/2018/credentials/v1",
		"https://purl.imsglobal.org/spec/ob/v3p0/context.json",
		"https://w3id.org/security/suites/ed25519-2020/v1"
	],
	"id": "did:web:example.com:issuers:540e388e-2735-4c3e-9709-80142801c774",
	"type": "Profile",
	"name": "Example Institution",
	"url": "https://example.com",
	"description": "An example of an educational institution, such as a University",
	"email": "info@example.com",
	"verificationMethod": [{
		"id": "did:web:example.com:issuers:540e388e-2735-4c3e-9709-80142801c774#key-0",
		"type": "Ed25519VerificationKey2020",
		"controller": "https://example.com/issuer/123",
		"publicKeyMultibase": "z6Mkf5rGMoatrSj1f4CyvuHBeXJELe9RPdzo2PKGNCKVtZxP"
	}]
}
```

**Achievement**:

> As an authorized institutional representative, I can define an `Achievement`
> on behalf of my organization, so that I can issue badges recognizing this
> achievement to learners.

Internally, an Achievement is a database record or document within an issuer
system that can be presented using the required and optional properties of the
Open Badges `Achievement` data model. For example, if your app uses a relational
database, Achievements would be stored in a database table that has columns for
each of the required fields and any supported optional fields. See
[Achievement Data Model](https://1edtech.github.io/openbadges-specification/ob_v3p0.html#achievement)
for a listing of fields, noting those with `[1]` or `[1..*]` multiplicity are
the required ones.

Open Badges Achievements are often associated with images that provide a visual
representation of the achievement. Images are optional but are visually
prominent components of badges and are often included. OpenBadgeCredentials are
issued for many `achievementTypes` (see
[enumeration](https://1edtech.github.io/openbadges-specification/ob_v3p0.html#org.1edtech.ob.v3p0.achievementtype.class))
that may not traditionally include an image, but OB 3.0 now enables this an
image to be included for any type of achievement.

For an issuing system that operates a web application on a stable domain, an
easy path forward is to select an HTTPS URL as the identifier for each defined
Achievement in its database. For example, if the web application under
development is running on the domain `example.com`, an achievement identifier
might be
`https://example.com/achievements/c3c1ea5b-9d6b-416d-ab7f-76da1df3e8d6`. See
[Publishing achievement definitions](#publishing-achievement-definitions-and-selecting-achievement-identifiers)
for a discussion of options for Achievement identifier. Again, is is best to
present a response to requests made to this URL that best matches what the
client is requesting, as it indicates with the `Accept` HTTP header.

-   When a client requests `Accept: application/json` or `application/ld+json`
    or does not include an `Accept` header, a JSON-LD that includes the OB 3.0
    context should be returned.
-   When a client requests `Accept: */*` or `application/html`, an HTML
    representation of the Achievement should be presented. This should express
    information about the [Open Graph meta tags](https://ogp.me/) including at
    least name, description, and image tags for easy rendering of preview cards
    when the Achievement URL is shared to social media platforms, for instance.

An example of the JSON-LD document that might be fetched from this endpoint
follows:

```jsonld
 {
 	"@context": "https://purl.imsglobal.org/spec/ob/v3p0/context.json",
 	"id": "https://example.com/achievements/c3c1ea5b-9d6b-416d-ab7f-76da1df3e8d6",
 	"type": "",
 	"name": "Advanced Shoe Tie",
 	"description": "Experts at shoe tying can securely fasten laces with a balanced knot.",
 	"achievementType": "Competency",
 	"creator": {
 		"id": "https://example.com/issuers/540e388e-2735-4c3e-9709-80142801c774",
 		"type": "Profile",
 		"name": "Example Institution",
 		"url": "https://example.com",
 		"description": "An example of an educational institution, such as a University",
 		"email": "info@example.com"
 	},
 	"criteria": {
 		"narrative": "# Requirements\nShoe tiers must complete..."
 	},
 	"image": {
 		"id": "https://example.com//achievements/c3c1ea5b-9d6b-416d-ab7f-76da1df3e8d6/image",
 		"type": "Image"
 	},
 	"tag": [
 		"research",
 		"computer science"
 	]
 }
```

Note that an image associated with the achievement is hosted at a related URL.
This could be alternatively presented as a data URI within the Achievement.

**Recipient Identifier**:

> As a learner, I am assigned a badge recipient identifier or can select one of
> my choosing.

See
[Selecting recipient and issuer identifiers](#selecting-recipient-and-issuer-identifiers-such-as-did-methods)
for an in-depth discussion on how identifiers may be trusted within software to
be associated with organizations or natural persons. A "[Self-sovereign
identity](https://en.wikipedia.org/wiki/Self-sovereign_identity" (SSI) movement
advocates for end user control over the identifiers that refer to users. OB and
CLR are compatible with identifiers that support traditional or SSI approaches,
including email addresses or student ID numbers on the traditional side and
Decentralized Identifiers (DIDs) with varying SSI capabilities.

A workable approach that straddles the divide and can achieve good credential
transferability to traditional and new verifiers (credential consumers, such as
employers) is to deliver badges that target recipients by human-verifiable means
at a minimum but then enable end users to present proof of control of a DID, at
which point they may claim a version of the credential signed to that identifier
instead.

Implementing this workflow varies for different organizations, depending on what
identity management solutions they already use. For example, if an app that
enables assessment and award of credentials connects to a Student Information
System to gain access to course rosters and the student records in that system
each include a student ID number and an email address, that application might
choose the email address as the best recipient identifier to use in credentials,
because it is easiest for target external consumers of those credentials to
verify is associated with an individual. That learner might share their badge on
a resume and the hiring manager they send it to can verify it matches them by
sending them a six digit code and asking their job applicant to read it back to
them.

Recommended options include:

-   If the platform supports integration with a wallet or other system where a
    learner can present and prove control of an identifier that is usable as a
    VC or VP issuer identifier, and the user has gone through this process, use
    their preferred identifier as `credentialSubject.id`.
-   If the badges will be delivered primarily for URL-based sharing or download,
    and the user has not presented a DID, do not include a
    `credentialSubject.id` property, and instead include an `identifier`
    property referencing a known identifier that may be verified by humans or
    other non-VC, such as an email address.

> As an educator, I can assess a learner and trigger the award of an
> `OpenBadgeCredential` recognizing that the student has met the criteria of the
> previously defined `Achievement`.

Implementing this workflow may look like an educator accessing details about the
credential, and then in an "award" section of those details, selecting a student
from a roster list and confirming. The result of this action is typically to
make a record in the product's database containing the metadata of the award,
such as its creation time, the recipient and their identifier, and any other
details such as what the educator may have entered in an evidence narrative text
box. While it is possible to generate the signature on the credential in order
to store it in the system as a signed document at this point, it is not
necessary to sign the credential except when delivering it, via download,
[wallet integration](#protocols-for-connection-to-verifiable-credentials-wallets),
or OB/CLR REST API.

> As a learner, I am notified that I have achieved the Achievement and that I
> can claim my badge.

Implementing this workflow may look like an email message sent to the recipient
with a link into the issuing coordination system.

> As a learner, I can access information about my badge in Open Badges 3.0
> `OpenBadgeCredential` format, complete with a reference to my recipient
> identifier and a cryptographic proof.

Within a notification email, a learner might see a link into the issuing
coordination system, where they are offered the chance to authenticate with
their organizational single-sign-on (SSO) provider. After successfully
authenticating, they can see options to access or share their badge. See
recommended practices about
[sharing badges](#sharing-open-badges-and-clr-links-as-urls-and-to-social-media)
via URL, but those capabilities might be available within an Open Badges Host
platform, not necessarily an issuer coordination app that produces signed
`OpenBadgeCredentials`. Here, the recipient may see a download JSON option,
which upon activation yields a signed verifiable credential like the following.

```jsonld
{
	"@context": [
		"https://www.w3.org/2018/credentials/v1",
		"https://purl.imsglobal.org/spec/ob/v3p0/context.json",
		"https://w3id.org/security/suites/ed25519-2020/v1"
	],
	"id": "http://example.com/credentials/3527",
	"type": [
		"VerifiableCredential",
		"OpenBadgeCredential"
	],
	"issuer": {
		"id": "did:web:example.com:issuers:540e388e-2735-4c3e-9709-80142801c774",
		"type": "Profile",
		"name": "Example Institution",
		"url": "https://example.com",
		"description": "An example of an educational institution, such as a University",
		"email": "info@example.com"
	},
	"issuanceDate": "2010-01-01T00:00:00Z",
	"name": "Advanced Shoe Tie",
	"credentialSubject": {
		"type": "AchievementSubject",
		"identifier": {
			"type": "IdentityObject",
			"hashed": true,
			"identityHash": "sha256$658625b25ab3d75d613ca97d9a5a77f70e2192feca5557f4ad09a4d4f121f5fc",
			"identityType": "email",
			"salt": "FleurDeSel"
		},
		"achievement": {
			"id": "https://example.com/achievements/c3c1ea5b-9d6b-416d-ab7f-76da1df3e8d6",
			"type": "",
			"name": "Advanced Shoe Tie",
			"description": "Experts at shoe tying can securely fasten laces with a balanced knot.",
			"achievementType": "Competency",
			"creator": {
				"id": "https://example.com/issuers/540e388e-2735-4c3e-9709-80142801c774",
				"type": "Profile",
				"name": "Example Institution",
				"url": "https://example.com",
				"description": "An example of an educational institution, such as a University",
				"email": "info@example.com"
			},
			"criteria": {
				"narrative": "# Requirements\nShoe tiers must complete..."
			},
			"image": {
				"id": "https://example.com//achievements/c3c1ea5b-9d6b-416d-ab7f-76da1df3e8d6/image",
				"type": "Image"
			},
			"tag": [
				"research",
				"computer science"
			]
		}
	},
	"proof": [{
		"type": "Ed25519Signature2020",
		"created": "2022-12-15T16:56:16Z",
		"verificationMethod": "did:web:example.com:issuers:540e388e-2735-4c3e-9709-80142801c774#key-0",
		"proofPurpose": "assertionMethod",
		"proofValue": "z4o2Pva6ksbXtCCzHv4VM8Ss9WJg2tnxgDbVwfZr1dq3i2jjzNHWPPpHHRw8s1AknGzL4XjBZVyh3BzSo59qz8NBp"
	}]
}
```

Several things to note about this credential.

-   There is no primary credential subject ID in this example. The recipient has
    not yet presented proof of control of a DID, so the credential identifies
    them by their email address. The identityHash is the SHA-256 hash of the
    concatenated student email address and credential salt
    `jjefferson18@example.comFleurDeSel`. This enables the student to present
    the credential and their institutional email address to a verifier who can
    check the hash to ensure the badge belongs to them.
-   The `verificationMethod.id` identifies the issuer's public signing key using
    a fragment identifier within the issuer's identifier. This is the same ID
    that appeared in the representation of the key in the issuer DID document
    itself.

Follow the steps in the Conformance Certification Guide for the
[issuer role](https://1edtech.github.io/openbadges-specification/ob_v3p0.html#conformance-and-certification-guide)
to submit a downloaded signed credential like the above for conformance checks.

### API topology and quickstart

Learn how to add on support for the OB 3.0 API as an Issuer to a simple product
that Issuers who completed the issuer quickstart above. Completing this portion
of the quickstart will potentially qualify a product for conformance
certification as an Open Badges Issuer (with API service-consumer-write support)

> As a badge holder, I can inform my issuer of my selected Open Badges host
> service.

> As an issuer service, I can discover information about an Open Badges host
> service.

> As an issuer service, I can register with a Open Badges host service.

> As a badge holder, I can request and approve a connection between my issuer
> and my host account.

> As a badge holder, I can select one, some or all AchievmentCredentials to
> transmit to my host account.

> As a badge holder, I can see that new badges I am awarded are automatically
> transmitted to my host, even when I am not interacting with either the issuer
> or host services directly, if I have configured my issuer to send badges
> automatically.

> As a badge holder, I can deauthorize my issuer from connection to my Open
> Badges host.

While authenticated with a host service, one action users may take is to view
the connected issuer(s) or displayer(s) they have authorized and to revoke some
of those approvals. When a user takes this action, it invalidates any access
tokens or refresh tokens the connected services, so that those services may no
longer access API endpoints on the user's behalf. This should be handled in the
issuer or displayer service as a potential expected outcome, after which the
service may display an inactive status on the connection and/or prompt the user
to reauthorize if they desire to continue sending badges to that host once
again.

Your issuer service may discover that your access credentials no longer work as
expected when you receive a 401 or 403 status response from the host when
attempting to access a protected endpoint and then subsequently receive an error
response when attempting
[token refresh](https://1edtech.github.io/openbadges-specification/ob_v3p0.html#token-refresh).

### Key terms definitions

### Spec documents (Normative References)

The full set of documents is comprised of the following documents:

-   [[[OB-30]]]
-   [[[OB-CERT-30]]]
-   CLR 2.0
-   CLR CERT 2.0

### Supporting resources (Code Libraries - See below)

-   [OpenAPI 3.0 JSON File for Open Badges API](https://purl.imsglobal.org/spec/ob/v3p0/schema/openapi/ob_v3p0_oas.json)
-   [OpenAPI 3.0 YAML File for Open Badges API](https://purl.imsglobal.org/spec/ob/v3p0/schema/openapi/ob_v3p0_oas.yaml)
-   [Open Badges 3.0 JSON-LD Context File](https://purl.imsglobal.org/spec/ob/v3p0/context.json)

### Relationship between VC and CLR/OB

### Introduction to proofs
