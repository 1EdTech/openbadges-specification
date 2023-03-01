## Getting Started (for Developers)

It may seem like an overwhelming task to implement Open Badges 3.0 or CLR 2.0,
but there are straightforward options that can take your product to a certified
launch simply.

### Relationship between VC and CLR/OB

New to this version of the specification, the data model of both CLR and OB
adopts the convention of the [[VC-DATA-MODEL]].

Since Verifiable Credentials are extensible by design, CLR/OB defines a set of
extensions (also called profile) for reflecting the domain both specifications
cover: learning achievements, alignment with educational/workforce frameworks,
etc. CLR/OB also defines the verification algorithm for these credentials, as
well as a set of services for exchanging these credentials.

That means that `ClrCredential` and `AchievementCredential` are, in fact,
Verifiable Credentials, and can be used wherever a Verifiable Credential can be.
This assertion is not bidirectional, thus a Verifiable Credential might not be
an CLR/OB Credential. Only those credentials with the extension set defined by
the CLR/OB spec, and verifiable via CLR/Ob verification algorithm, can be
treated as CLR/OB Credentials.

### Issuer quickstart

Here is a quickstart tutorial to build an MVP of an Open Badges product that
issues Open Badges to learners. It aims to sketch out a simple path to a
successful conformant implementation of Open Badges 3.0 issuance. From this
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
application. See [[[VC-DID-WEB-METHOD]]] For example, if the web application
under development is running on the domain `example.com`, an issuer profile
identifier might be
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
    [Profile](https://www.imsglobal.org/spec/ob/v3p0#profile), and a
    representation of the public key component of the keypair this issuer uses
    to sign credentials in selected `JWK` or `Ed25519VerificationKey2020`
    format. See
    [Dereferencing the Public Key](https://www.imsglobal.org/spec/ob/v3p0#dereference)
-   When a client requests `Accept: */*` or `application/html`, an HTML
    representation of the `Achievement` should be presented. This should express
    information about the issuer using [Open Graph meta tags](https://ogp.me/),
    including at least name, description, and image tags for easy rendering of
    preview cards when the `Achievement` URL is shared to social media
    platforms, for instance.

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
		"https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.1.json",
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

Internally, an `Achievement` is a database record or document within an issuer
system that can be presented using the required and optional properties of the
Open Badges `Achievement` data model. For example, if your app uses a relational
database, Achievements would be stored in a database table that has columns for
each of the required fields and any supported optional fields. See
[Achievement Data Model](https://www.imsglobal.org/spec/ob/v3p0#achievement) for
a listing of fields, noting those with `[1]` or `[1..*]` multiplicity are the
required ones.

Open Badges Achievements are often associated with images that provide a visual
representation of the achievement. Images are optional but are visually
prominent components of badges and are often included. `OpenBadgeCredentials`
are issued for many `achievementTypes` (see
[enumeration](https://www.imsglobal.org/spec/ob/v3p0#org.1edtech.ob.v3p0.achievementtype.class))
that may not traditionally include an image, but OB 3.0 now enables this an
image to be included for any type of achievement.

For an issuing system that operates a web application on a stable domain, an
easy path forward is to select an HTTPS URL as the identifier for each defined
`Achievement` in its database. For example, if the web application under
development is running on the domain `example.com`, an achievement identifier
might be
`https://example.com/achievements/c3c1ea5b-9d6b-416d-ab7f-76da1df3e8d6`. See
[Publishing achievement definitions](#publishing-achievement-definitions-and-selecting-achievement-identifiers)
for a discussion of options for `Achievement` identifier. Again, is is best to
present a response to requests made to this URL that best matches what the
client is requesting, as it indicates with the `Accept` HTTP header.

-   When a client requests `Accept: application/json` or `application/ld+json`
    or does not include an `Accept` header, a JSON-LD that includes the OB 3.0
    context should be returned.
-   When a client requests `Accept: */*` or `application/html`, an HTML
    representation of the `Achievement` should be presented. This should express
    information about the [Open Graph meta tags](https://ogp.me/) including at
    least name, description, and image tags for easy rendering of preview cards
    when the `Achievement` URL is shared to social media platforms, for
    instance.

An example of the JSON-LD document that might be fetched from this endpoint
follows:

```jsonld
 {
 	"@context": "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.1.json",
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
be associated with organizations or natural persons. A
"[Self-sovereign identity](https://en.wikipedia.org/wiki/Self-sovereign_identity)
(SSI)" movement advocates for end user control over the identifiers that refer
to users. OB and CLR are compatible with identifiers that support traditional or
SSI approaches, including email addresses or student ID numbers on the
traditional side and Decentralized Identifiers (DIDs) with varying SSI
capabilities.

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
		"https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.1.json",
		"https://w3id.org/security/suites/ed25519-2020/v1"
	],
	"id": "urn:uuid:a9fc82eb-416f-47c3-8786-de890331d4a5",
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
-   This credential uses the id `urn:uuid:a9fc82eb-416f-47c3-8786-de890331d4a5`.
    Some implementers might choose an HTTPS URL on the same domain as the issuer
    DID Document and the Achievement, but is not assumed that the general public
    would be able to access data about this credential if they retrieved the
    `id` of the document. Other issuers may allow learners to rely on badge
    backpacks or mobile wallets to provide sharing capabilities that match the
    use case. See discussion:
    [Sharing badge links to social media](#sharing-open-badges-and-clr-links-as-urls-and-to-social-media).

Follow the steps in the Conformance Certification Guide for the
[issuer role](https://www.imsglobal.org/spec/ob/v3p0#conformance-and-certification-guide)
to submit a downloaded signed credential like the above for conformance checks.

### API quickstart

The API of Open Badges 3.0 and Comprehensive Learner Record 2.0 is divided into
four groups, wether the OB / CLR tool is a consumer or a provider of the API and
wether the operations it consumes / provides are read operations or write
operations.

<div class="note">
The API of Open Badges 3.0 and Comprehensive Learner Record 2.0 defines the
exchange of credentials and update of the profile between two hosts. The API
defines methods for revoking a previously allowed access, which prevents future
exchange of credentials. That said, this revocation doesn't affect the already
exchanged credentials. Open Badges Credentials and CLR Credentials have its own
revocation methods.
</div>

Depending of your certification goals it must be necessary to implement one or
more of these groups of API. For instance, if you're seeking the certification
as an Issuer (not Issuer only) you'll need to implement the
service-consumer-write group.

#### Consumer basics

Consumers of the OB / CLR API must acquire an OAuth 2.0 access token from an
authorization server for making API calls. The acquisition of the token implies
a set of steps:

Call the `ServiceDescription` endpoint. Once you know the base url of your
authorization server, make a GET call to the well-know `getServiceDescription`
endpoint. The response will contains all the endpoints needed for register your
client application (`x-imssf-registrationUrl`) and acquiring and access token
(`authorizationUrl`, `tokenUrl` and `refreshUrl`) with the desired scopes.

<pre class="html example" title="Sample getServiceDescription request">
GET /ims/ob/v3p0/discovery HTTP/1.1
Host: example.edu
Accept: application/json
</pre>

<pre class="http example" title="Sample getServiceDescription response">
HTTP/1.1 200 OK
Content-Type: application/json

...
"components": {
	"securitySchemes": {
		"OAuth2ACG": {
			"type": "oauth2",
			"description": "OAuth 2.0 Authorization Code Grant authorization",
			"x-imssf-name": "Example Provider",
			"x-imssf-privacyPolicyUrl": "provider.example.com/privacy",
			"x-imssf-registrationUrl": "provider.example.com/registration",
			"x-imssf-termsOfServiceUrl": "provider.example.com/terms",
			"flows": {
				"authorizationCode": {
					"tokenUrl": "provider.example.com/token",
					"authorizationUrl": "provider.example.com/authorize",
					"refreshUrl": "provider.example.com/token",
					"scopes": {
						"https://purl.imsglobal.org/spec/clr/v2p0/scope/delete" : "...",
						"https://purl.imsglobal.org/spec/clr/v2p0/scope/readonly" : "...",
						"https://purl.imsglobal.org/spec/clr/v2p0/scope/replace" : "..."
					}
				}
			}
		}
	},
	"schemas": {
		...
	}
}
...

</pre>

Register your client using OAuth 2.0 Dynamic Client Registration Protocol
[[RFC7591]]. To do that, make a POST call to the endpoint defined in the
`x-imssf-registrationUrl` field from the previous step.

<pre class="http example" title="Sample registration request">
POST /connect/register HTTP/1.1
Host: auth.1edtech.org
Accept: application/json
Content-Type: application/json; charset=utf-8

{
	"client_name": "Example Client Application",
	"client_uri": "https://client.1edtech.org/",
	"logo_uri": "https://client.1edtech.org/logo.png",
	"tos_uri": "https://client.1edtech.org/terms",
	"policy_uri": "https://client.1edtech.org/privacy",
	"software_id": "c88b6ed8-269e-448e-99be-7e2ff47167d1",
	"software_version": "v4.0.30319",
	"redirect_uris": [
		"https://client.1edtech.org/Authorize"
	],
	"token_endpoint_auth_method": "client_secret_basic",
	"grant_types": [
		"authorization_code",
		"refresh_token"
	],
	"response_types": [
		"code"
	],
	"scope": "https://purl.imsglobal.org/spec/ob/v3p0/scope/delete https://purl.imsglobal.org/spec/ob/v3p0/scope/assertion.readonly https://purl.imsglobal.org/spec/ob/v3p0/scope/replace offline_access"
}

</pre>

The response object will contain the details needed to perform the OAuth 2.0
Authorization Code Grant flow (`client_id`, `client_secret`, among others).

Acquire an access token following OAuth 2.0 Authorization Code Grant flow as
described in then IMS Security Framework [[SEC-11]]. Briefly, it consists in
building the `authorizationUrl` from the url defined in the `authorizationUrl`
field gotten from step one with some query parameters. The use of Proof Key for
Code Exchange (PKCE) [[RFC7636]] is recommended.

Once built, redirect the user to this url in order to start the OAuth 2.0
Authorization Code Grant flow.

<pre class="http example" title="Sample ACG authorization request (line breaks for clarity)">
	HTTP/1.1 302 Found
	Location: https://auth.1edtech.org/authorize?
	client_id=4ad36680810420ed
	&response_type=code
	&scope=https%3A%2F%2Fpurl.imsglobal.org%2Fspec%ob%2Fv3p0%2Fscope%2Fassertion.readonly%20offline_access
	&redirect_uri=https%3A%2F%client.1edtech.org%2FAuthorize
	&state=26357667-94df-4a14-bcb1-f55449ddd98d
	&code_challenge=XeDw66i9FLjn7XaecT_xaFyUWWfUub02Kw118n-jbEs
	&code_challenge_method=S256
</pre>

Once the authorization is made, the authorization server will redirect the
browser back to the specified `redirect_uri` with the `code`, `scope`, and
`state` query string parameters.

Then, you have to acquire an access token by making a POST request to the
`tokenUrl` gotten from the Service Description endpoint. The HTTP POST request
MUST include a Basic authorization header with the `client_id` and
`client_secret` provided in the registration response. The body of the token
request MUST include the following form fields: `grant_type`, `code`,
`redirect_uri`, `scope` and `code_verifier`.

<pre class="http example" title="Sample ACG token request (line breaks for clarity)">
	POST /token HTTP/1.1
	Host: auth.1edtech.org
	Authorization: Basic NDE2ZjI1YjhjMWQ5OThlODoxNWQ5MDA4NTk2NDdkZDlm
	Content-Type: application/x-www-form-urlencoded

	grant_type=authorization_code
		&code=7c7a73263ee14b2b48073d0615f286ec74f6636689046cb8dbede0b5e87a1338
		&redirect_uri=https%3A%2F%client.1edtech.org%2FAuthorize
		&scope=https%3A%2F%2Fpurl.imsglobal.org%2Fspec%2Fob%2Fv3p0%2Fscope%2Fassertion.readonly+offline_access
		&code_verifier=mYUQfKNgI1lSbY8EqtvNHLPzu0x%2FcVKO3fpWnX4VE5I%3D
</pre>

The response of this call will contain the access token to use in future calls
to the API.

<pre class="http example" title="Sample ACG token response">
	HTTP/1.1 200 OK
	Cache-Control: no-store, no-cache, max-age=0
	Pragma: no-cache
	Content-Type: application/json; charset=UTF-8

	{
		"access_token": "863DF0B10F5D432EB2933C2A37CD3135A7BB7B07A68F65D92",
		"refresh_token": "tGzv3JOkF0XG5Qx2TlKWIA",
		"expires_in": 3600,
		"token_type": "Bearer",
		"scope": "https://purl.imsglobal.org/spec/ob/v3p0/scope/assertion.readonly offline_access"
	}
</pre>

#### User stories for an issuer (API consumer) and host (API provider)

Here are a selection of user stories covering how to add on support for the OB
3.0 API as an Issuer to a simple product after completing the issuer quickstart
above. Completing the consumer-side portion of the will potentially qualify a
product for conformance certification as an Open Badges Issuer (with API
service-consumer-write support). This is a presentation of the experience of
using the API from the user's perspective. Additional under-the-hood technical
details for each procedure are described in the Specification section 6:
[Open Badges API](https://www.imsglobal.org/spec/ob/v3p0#api).

> As a badge holder, I can inform my issuer of my selected Open Badges host
> service.

Provide the base url or domain of the selected Open Badges host service to the
issuer. This could utilize a text input where a user can paste a URL, or a
consumer service could add known service providers to a list, presenting the
manual input as an advanced option.

> As an issuer service, I can discover information about an Open Badges host
> service.

The service consumer will call the `getServiceDescription` endpoint from the
base url of the Open Badges service provider (host).

> As an issuer service, I can register with a Open Badges host service provider.

By performing the OAuth 2.0 Client Dynamic Registration [[RFC7591]] to the
endpoint defined in the `x-imssf-registrationUrl` field of the Open Badges Host
service description.

> As a badge holder, I can request and approve a connection between my issuer
> and my host account.

By following the OAuth 2.0 Authorization Code Grant flow in their browser,
following redirects between the issuer and the host service.

> As a badge holder, I can select one, some or all `OpenBadgeCredentials` to
> transmit to my host account.

A basic service consumer (write) integration would typically push all awarded
badges to the host, and a more advanced service consumer may enable users to
select a specific scope of credentials for transmission.

> As a badge holder, I can see that new badges I am awarded are automatically
> transmitted to my host, even when I am not interacting with either the issuer
> or host services directly, if I have configured my issuer to send badges
> automatically.

> As a badge holder, I can deauthorize my issuer from connection to my Open
> Badges host, so my issuer can't retrieve badges from my Open Badges host no
> more.

By revoking the access token granted to the issuer from within the Open Badges
(service provider) interface.

> As a user who has revoked consumer access to my host, I should see the broken
> connection within the consumer app and be able to initiate reauthorization.

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
[token refresh](https://www.imsglobal.org/spec/ob/v3p0#token-refresh).

#### Provider basics

The above description of a consumer implementation shows the requests that are
made of a provider. This guide does not go into depth about how to accomplish
the provider side of these interactions, but the API roughly follows common
OAuth patterns for (a) dynamic client registration, authorization code access
token grants, and protected resource endpoint access.

-   Provide the `ServiceDescription` endpoint with the right values for the
    `OAuth2ACG`'s securitySchema. The urls there must point to your OAuth
    related endpoints.
-   Allow Registration of clients using `Dynamic Registration`.
-   Implement OAuth 2.0 Authorization Code Grant flow for granting tokens.
-   Enable access to protected resources to requests authenticated with an
    appropriately scoped access token.
-   Enable deauthorization of access tokens via user interface. Show a list of
    authorized applications and their associated access details and enable users
    to revoke authorizations from the service provider (host).

### Supporting Technical Resources

-   [OpenAPI 3.0 JSON File for Open Badges API](https://purl.imsglobal.org/spec/ob/v3p0/schema/openapi/ob_v3p0_oas.json)
-   [OpenAPI 3.0 YAML File for Open Badges API](https://purl.imsglobal.org/spec/ob/v3p0/schema/openapi/ob_v3p0_oas.yaml)
-   [Open Badges 3.0 JSON-LD Context File](https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.1.json)
