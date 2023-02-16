## Recommended Practices

Here are a variety of recommended practices and considerations for the
implementation of the Open Badges and CLR specifications. Conformance
certification requirements ensure some important things, but a healthy ecosystem
will develop out of the collaboration and experience of the implementor
community. These practices will continue to be augmented as implementation
proceeds. Implementers are encouraged to join the 1EdTech community and discuss
how we can further improve our implementations and guidance together.

### Selecting recipient and issuer identifiers, such as DID methods

Both issuers and recipients (credential subjects) of Open Badges and CLR
credentials may be identified with a range of identifiers.

Issuers may be identified with an HTTP URL that resolves to an issuer profile
that expresses profile and key information in JSON-LD. Or, they might be
identified by a Decentralized Identifier (DID) that resolves to a document with
some information about the issuer and/or its signing key(s).

DID methods most commonly used in interoperability testing by community members,
both for issuer identifiers and recipient identifiers:

-   The [did:key](https://w3c-ccg.github.io/did-method-key) method resolves
    identifiers to a DID document that contains a public key representation
    without accessing any remote resources by embedding a representation of the
    key itself in the DID path.
-   The [did:jwk](https://github.com/quartzjer/did-jwk/blob/main/spec.md) method
    is similar to `did:key`, except the value encoded in the DID path is a
    `base64url`-encoded representation of a key in JWK
    ([JSON Web Key](https://datatracker.ietf.org/doc/html/rfc7517)) format.
-   The `did:web` method is a quick way to use HTTP URLs with DIDs, because the
    value in the path of the DID decodes to a URL which is then fetched,
    resulting in a DID document. It relies on the DNS registration of a domain
    holder, but many DIDs may be associated with any one domain or subdomain.

Technically, this set of DID methods whose use is commonly observed among early
implementers is a narrow range of the DID methods proposed, and each of them
lacks some capabilities promoted as possibilities with certain DID methods, such
as the ability to rotate keys periodically, recover control after losing
relevant keys, or avoidance of the use of DNS. The
[DID Method Rubric](https://www.w3.org/TR/did-rubric/) provides a number of
relevant comparison factors. Usage of other DID methods may significantly change
in the coming years as the consumer technology landscape and open source
libraries develop.

The OB 3.0 and CLR 2.0 specifications make no normative requirements strictly
limiting which DID methods may be used, but implementers have an incentive to
create interoperable experiences with one another through implementing common
DID methods and testing interoperability paths for users. In practice, the DID
method(s) a credential's Issuer supports being the same as the DID methods Hosts
and Displayers (or other wallets and verifiers) support is what governs
interoperability.

The Open Badges, CLR and broader Verifiable Credentials ecosystems will take
time to converge on reliable interoperability pathways. Specific implementations
working together through cooperation and communication will create the
opportunities for others to make compatible implementation choices as well as
inform future normative specification versions.

### Selecting proof methods and crypto algorithms

The OB and CLR specifications define some requirements around the signing or
proving of credentials (see [Proofs](../ob_v3p0.html#data-integrity)). Two
formats of proof method are introduced, JWTs and Linked Data Proofs. Within each
format, there are still a range of options that issuers may select for
cryptographically signing the credentials. Notably, signing algorithm selection
and its closely related concept of key material expression format must be
considered. The best choices within these options sometimes depend on other
parts of the issuer's tech stack and which options are supported among wallets
and verifiers with whom badge recipients want to share their badges.

The OB specification identifies some specific options, which are used by the
conformance test suite to check product implementations. These identified
algorithms will likely see the broadest early implementation within Open Badges.

-   Linked Data Proofs using the
    [EdDSA Cryptosuite v2020](https://w3c-ccg.github.io/di-eddsa-2020/). Issuers
    produce an `Ed25519Signature2020` proof referencing a key URL of a public
    key expressed in `Ed25519VerificationKey2020` format as its
    verificationMethod.
-   JWTs with `RSA256` algorithm, with key material published as JSON Web Key
    (JWK).

A step-by-step guide to signing an OB or CLR is provided in the OB specification
section on
[Proofs](https://1edtech.github.io/openbadges-specification/ob_v3p0.html#data-integrity).
In order to achieve certification, implementers must be able to pass conformance
testing with one of the listed methods, but it is expected that the ecosystem
will grow as issuers, verifiers, and other services explore new approaches.

It is important to not only prevent unauthorized access to keys and application
processes that can trigger signing. At least as important to keeping the signing
keys themselves safe is being confident in knowing if keys may have been
accessed or compromised with a high degree of confidence. Considerations
include:

-   Issuers may wish to make use of
    [Hardware Security Modules (HSMs)](https://en.wikipedia.org/wiki/Hardware_security_module)
    whenever possible that prevent keys from leaving the device where authorized
    signing occurs.
-   Cloud platform Key Management Services are largely not yet compatible with
    Ed25519 keys and may not be able to generate the signatures within linked
    data proofs.
    -   HashiCorp Vault (open source or in HashiCorp cloud) offers a
        Ed25519-compatible
        [sign API](https://developer.hashicorp.com/vault/api-docs/secret/transit#sign-data)
        via its "Transit" API.
    -   Google Cloud Platform
        [supports](https://cloud.google.com/kms/docs/reference/rest/v1/CryptoKeyVersionAlgorithm)
        RSA and ECDSA on the non-NIST secp256k1 curve but not Ed25519.
    -   JWT signing with RSA family keys may have broader support in systems
        like this across all major cloud vendors offering a KMS.

### Publishing Achievement definitions and selecting Achievement identifiers

Arguably the most important field for an Achievement is the `id`, the creator's
primary identifier for that achievement. It is expressed as a URI. Two
approaches for identifier expression are common, with differing capabilities and
slightly different instructions for interpretation:

-   **Use an HTTPS URL as the identifier**: Issuer systems and other achievement
    publishing systems can publish achievements at the identifier URLs, from
    which clients can request the metadata directly from its creator when a
    client wants an authoritative representation of the issuer's current
    understanding of the metadata associated with the Achievement. When two
    OpenBadgeCredentials are issued at different points in time but reference
    the same `Achievement.id`, they may contain slightly different
    representations of the Achievement metadata itself. Relying parties are
    encouraged to understand the embedded signed data as the representation that
    the issuer had for the credential at the time it was issued, and they may
    encounter a different representation embedded in a different credential,
    which they should understand as a different version of the same achievement.
    The issuer may use the optional `version` property to express a label for
    each of these versions for presentation where relevant. At any point in
    time, a relying party may request an updated copy of the Achievement from
    its `id` URL. If the response returns Achievement data successfully, the
    client should understand the retrieved metadata to represent the issuer's
    _current_ understanding of the Achievement. When relying parties encounter
    the same HTTPS-type achievement ID in AchievmentCredentials across multiple
    issuers, they can assume that the issuers did intend to recognize the same
    achievement, as it is defined by its publisher, but they cannot make an
    assumption that each of the issuers were duly authorized to recognize this
    achievement by its creator or even that the Achievement honestly represents
    the identity of its creator, unless the relying party verifies an
    OpenBadgeCredential referencing this Achievement issued by the creator
    referenced in the copy of the Achievement retrieved from its ID URL. Future
    versions of Open Badges may address use cases and normative requirements
    serving use cases around verifiable authorship of an Achievement or
    delegation of capabilities related to an Achievement by the Achievement's
    creator.
-   **Use a UUID**: Issuers sometimes assign an identifier that is assumed to be
    locally unique to that issuer but cannot be dereferenced. Nevertheless,
    relying parties may encounter multiple OpenBadgeCredentials that reference
    an achievement with this ID over time. For OpenBadgeCredentials from the
    same issuer that reference an Achievement with the same ID, relying parties
    should interpret these as different versions of the same Achievement. When
    the same UUID-type Achievement.id is referenced by different issuers across
    multiple OpenBadgeCredentials, relying parties cannot authoritatively
    determine that the intent was to recognize the same semantic achievement.

A common use case among Open Badges implementers is for a verifier to expect a
particular Achievement claim in an `OpenBadgeCredential` from a specific issuer.
With Open Badges 2.0, it was presumed that verification that an achievement
(BadgeClass) was associated with a credential (Assertion) issuer as part of
verification, by determining that hosted Achievement IDs were on the same domain
as hosted Assertion IDs and/or hosted Issuer IDs. With OB 3.0, some of this
capability can no longer be assumed to remain. This is partly because there is
no longer a requirement for issuer profiles to use HTTP IDs, but also because
integrity verification is assumed to occur at the Verifiable Credentials Data
Model level only, because wallets and credentials verifiers will primarily focus
on verifying the integrity of the proof on each credential without assumed
capacity to verify other relationships represented deeply within these
credentials even if OB 3.0 had included such a mechanism in its scope.

### Sharing Open Badges and CLR Links as URLs and to Social Media

> Gene receives an Open Badge for the completion of a certificate program and
> wants to include it verifiably on a professional social network. He can post a
> reference to the badge as a URL on the his profile. The social network site
> displays a summary card showing the credential information.

The URL is the universal mechanism for sharing content on the web. URLs provide
the easiest mechanism for badge recipients to share their achievements on social
media, in resumes, and job applications. The vast majority of last-generation
Open Badges 2.0 and CLR 1.0 credentials in production support URLs for both
verification and sharing. Learners' need to be able to place their achievements
verifiably into platforms via URL sharing will continue, but platforms that hold
their data are encouraged to take advantage of new OB 3.0 and CLR 2.0
capabilities to grant greater control over sharing to data subjects themselves
as they implement share by URL capabilities.

Recommendations for the use of share URLs include:

-   Give data subjects easy to use options to limit or grant access to data or
    inclusion of their data in directories. Do not publish learner achievement
    data in credential format on unauthenticated URLs by default.
-   If Open Badges 2.0 verification endpoints are used, use content negotiation
    on sharing URLs to enable the presentation of Use
    [Open Graph Protocol](https://ogp.me) tags on the sharing URLs to enable
    easy generation of card previews.

### Inclusion of new OB and CLR metadata in OB 2.0 endpoints

### Implementing the OB 3.0 API

The OB API enables key use cases for interoperability between web services that
manage Open Badges on holders' behalf. This is centered on an ecosystem of
backpacks and clients. "Backpack" and "web wallet" are commonly used terms to
refer to a web service that holds Open Badges and/or CLR credentials for
learners, enabling them to manage and share them. Clients each often primarily
act to **issue credentials** or to **verify credentials** to display or convert
into local understanding of someone's capabilities and accomplishments.
Typically learners authorize issuers to send their credentials to backpacks and
then from those backpacks, authorize verifier clients to access them.

This is an ambitious ecosystem to propose, even though users are familiar with
the underlying OAuth and OpenID Connect experiences that tie together dozens of
their online accounts. There is the addition of dynamic client registration and
the wide variety of optional components these specifications feature.
Implementers should prioritize high success-rate user experiences in credential
acceptance. Products should take into account many factors and opportunities for
user failure including:

-   High conceptual complexity or use of jargon Forgotten passwords or no-longer
    working email addresses
-   Differing choices of DID methods, key formats/signature suites, or
    credential exchange protocol choices across different certifiable products.

Products that best aim to teach users a controlled number of concepts and
provide interfaces offering easy successful options for the most common actions
have a better chance of ensuring learners can take advantage of their digital
credentials. No learner should be disadvantaged by poor interoperability
experiences and dead ends.

#### Use Case: Issue a Credential to a Learner

Consider the following example two products using the OB 3.0 API to interact:

**Example: Sending an Open Badge to a credential backpack via API**

> Luis is in college pursuing a technical degree. He completes an assessment in
> class and receives a grade. He is notified by email that he has earned a badge
> and clicks through, where he is authenticated to the college's student Open
> Badges portal using his college single sign on. He sees that he has actually
> earned two badges, each representing competencies, that were assessed by his
> instructor. The website says the CLR is ready to save, so Luis selects that
> option. The application shows him a list of two credential backpack providers
> he can use to save. There is an advanced toggle that reveals an additional
> option to enter a service provider URL, but Luis closes that and picks one of
> the known options that looks good and has a good privacy policy. He selects
> that option and is directed to the backpack site where he signs up for an
> account. After he completes registration, he is prompted that he may return to
> the Open Badges portal to complete receiving his credential. He confirms and
> appears back in the Open Badges portal, where a confirmation message greets
> him saying all credentials were successfully transferred. He then confirms to
> return once more to the backpack site, where sees the two Open Badges
> representing his competencies.
>
> Luis looks at a page detailing the metadata of the first achievement,
> including the achievement type of Competency and a description of what he had
> been working to learn. He thinks that being able to look back at these and see
> the description will help him prepare for job interviews in the future.
>
> Luis sees an option to share his competency badge to a social media site. He
> proceeds and is prompted to customize sharing settings, including whether
> anyone with the link is able to view full verifiable details or if viewers
> need to request access. He selects full details and shares the generated URL
> to a professional social network site, where a preview card appears including
> relevant keywords for the competency. His post receives a like from one of
> Luis's friends immediately.

This is a long user workflow. What makes this interaction successful?

-   These products each have a clear sense of their scope of responsibility. One
    is the "Issuer" of the Open Badges, the other is the "Backpack". They can
    each implement the necessary parts of the experience that fits their role
    and not invest deeply in other parts. For example, the issuer platform
    doesn't need to offer a system of sharing URLs and online access control
    management, all it does is sign the credential and implement the Client side
    of the Open Badges API. The Backpack handles the sharing, including giving
    Luis significant control over URL-based access. This takes product focus.
-   Known-successful integrations are highlighted in the experience. This takes
    cooperation between implementation partners, but the benefit is clear: Luis
    doesn't need to know what an Open Badge is or how to find a compatible
    backpack on the
    [TrustEd Apps Directory](https://site.imsglobal.org/certifications?refinementList%5Bstandards_lvlx%5D%5B0%5D=Open%20Badges)
    in order to take advantage of his credential. Tested compatibility paths and
    instructions on how to take the next step are provided as the primary choice
    for non-advanced users.
-   The backpack platform implemented the [Open Graph Protocol](https://ogp.me)
    for the sharing URL, better supporting the social network site's generation
    of a preview card that included the badge image and a relevant title and
    content snippet.

### Implementing the CLR 2.0 API

`ClrCredential`s bundle a number of individual `OpenBadgeCredentials` together
and sometimes offer additional information about the relationships between
elements.

**Example: Sending a CLR to a credential backpack via API**

> Luis achieved his Associate Degree and is looking for jobs. He is notified by
> email that his CLR is ready and clicks through, where he is authenticated to
> the college's student CLR portal using his college single sign on. He sees the
> CLRCredential. This is his first CLR, and he wants to see how to use it to
> help his job search.
>
> The website says the CLR is ready to save, so Luis selects that option. The
> application shows him a list of two credential backpack providers he can use
> to save. There is an advanced toggle that reveals an additional option to
> enter a service provider URL, but Luis closes that and picks one of the known
> options that looks good and has a good privacy policy. He selects that option
> and is directed to the backpack site where he signs up for an account. After
> he completes registration, he is prompted that he may return to the CLR portal
> to complete receiving his credential. He confirms and appears back in the CLR
> portal, where a confirmation message greets him saying all credentials were
> successfully transferred. He then confirms to return once more to the backpack
> site, where sees the CLR Credential and all the individual Achievement
> Credentials within it representing the degree, the courses he took, and the
> competencies he mastered.

### Protocols for connection to Verifiable Credentials Wallets

While the OB 3.0 and CLR 2.0 APIs serve use cases for web services to verifiably
exchange credentials on behalf of holders, the Verifiable Credentials community
is exploring how more portable wallets, often operating on mobile devices which
cannot serve HTTP requests can serve additional use cases. All Verifiable
Credentials, including Open Badges and CLRs can and will be communicated over a
range of protocols. This is a space that is seeing significant experimentation
pre-standardization.

Implementers are encouraged to cooperate through communities like 1EdTech to
ensure high-quality user experience in the exchange of credentials between their
products, both via OB and CLR APIs and emerging protocols to carry these
credentials into next-generation use cases. When new user experience patterns
are presented that aim to become universal, take care to help the user through
the workflow, and give them fallback solutions whenever possible.

Protocols under development to transport Verifiable Credentials including Open
Badges and CLR include
[Credential Handler API (CHAPI)](https://w3c-ccg.github.io/credential-handler-api/),
[DIDComm](https://identity.foundation/didcomm-messaging/spec/v2.0/), and
[OIDC4VC](https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0.html).

**Example: The experience of a learner who receives their CLR**

Luis now is viewing his CLR in his backpack, a web service that holds Open
Badges & CLR Verifiable Credentials on his behalf:

> Luis is looking at his college's CLR portal. He sees these credentials are set
> to be issued to his college email address, but he just graduated and will lose
> access to that email address in 6 months. There is an option to prove control
> of a personal address and have the credentials issued to that address, but
> Luis also sees another option to connect a wallet on his mobile device, where
> he can use a securely generated passkey to create a cryptographically
> verifiable Decentralized Identifier (DID) to use. Links appear to mobile app
> stores for several mobile wallet options.
>
> Luis puts it off until Saturday but then reads a little about Verifiable
> Credentials and is interested to try out replacing his soon-to-expire email
> address with a DID. He chooses one of the wallet options that works on his
> device and sets it up. Back at the CLR portal on his desktop computer, he
> selects to proceed to connect to a mobile wallet. He chooses the CLR
> Credential and several of the competency achievements to send to the wallet
> initially. He is directed to an experience where through scanning a QR code
> displayed on screen and confirming some details on his phone, he is shown that
> there is a successful connection, and that credentials have been downloaded to
> the wallet. He sees them on his phone, which says he'll be able to use them in
> the future on websites that use Verifiable Credentials.

Here, Luis walks through the experience of downloading a mobile app to use as a
wallet for credentials including his `CLRCredential` and several
`OpenBadgeCredential`s. This issuer app seems to be compatible with a wide
variety of web wallets, perhaps even through implementing multiple protocols
used by these wallets with a variety of options. Some issuer services may be
operating with connections to fewer or different wallet applications.

Some recommendations for pre-standardization implementation of service
connection protocols include:

-   Test integrations and communicate with your implementation partners for the
    benefit of users' experience.
-   Share pain points (without exposing personal information) and learn about
    possible solutions from others.
-   Accurately inform users of the experimental status of features and
    integrations as necessary. Giving users an accurate sense of whether they
    are traveling a smooth and well-trodden path or a new route that may have
    pitfalls or dead ends goes a long way to gaining user trust.
-   Prioritize tested high-success pathways to product integration.
-   Provide some opportunities for users who desire it to learn about the work
    your product is doing under the hood to take care of their important data
    and empower them as participants in non-monopolistic ecosystems using open
    standards.
-   Give users fallback options that are likely to succeed if the first path
    they try fails. For example, offer the chance to choose any wallet that uses
    a certain supported protocol, but suggest one particular integration as an
    easy choice, so users don't get stuck if the wallet they previously used for
    a different issuer doesn't work with the protocol used on your site. If all
    else fails, maybe a signed credential in a JSON download is an adequate
    compromise.
-   Present benefits and risks to user to help them understand their choices.
    This example emphasized the user-owned nature of DIDs enabled by wallet
    connection in the face of the potential loss of control of an institutional
    or organizational email identifier. Products should make users aware of
    risks, such as any loss of data or verifiability that might be caused by
    losing a physical device.

### Managing credential status and revocation

The ability to mark a credential as revoked is an important capability for many
organizations that make use of Open Badges and CLR. The [[vc-data-model]] offers
an extensible mechanism by which a credential status resource may be exposed
within a credential. Various use cases and solutions have been developed to
enable credential status checking with a range of capabilities and implications.
OB and CLR reference optional 1EdTech extensions supporting verifiers in
obtaining updated representations of credentials and checking for revocation.
Issuers and verifiers need to support a common mechanism in order for status
checking to work, and yet issuers often need to produce the credential without
knowing which other parties might someday rely on it or what methods those
verifiers may support. Here are some mechanisms identified by the implementing
community for status and revocation management.

-   The
    [1EdTech Revocation List Status Method](https://imsglobal.org/spec/vcrl/v1p0/)
    accompanies the OB and CLR specifications. This enables verifiers to query
    for status results without revealing to the issuer which specific
    credential's status is being checked. It does reveal to the requester a list
    of credential IDs claimed by the issuer to be associated with it, though it
    is not assumed to be exhaustive or accurate except to indicate the status of
    the credential known to the requester, because issuers may use multiple
    lists concurrently, packaged with different sets of credentials and red
    herrings may appear in some lists. The 1EdTech certification process and
    validator software will support this status checking method. A reason for
    revocation may be available for a revoked credential.
-   The [1EdTech Refresh Service Method](https://imsglobal.org/spec/vccr/v1p0/)
    also accompanies the OB and CLR specifications and enables fetching of an
    updated version of a credential under inspection by a verifier. The 1EdTech
    verifier tools will request updated version if such an endpoint is indicated
    in the badge. There is no approach to authentication or variable
    authorization defined in this specification, so if an issuer uses it, it is
    presumed that any client could request the latest version of the credential
    from this endpoint if they knew the correct URL. Future versions of this
    specification may serve use cases that require more in-depth protection of
    refresh endpoints.
-   Another option in the space is the
    [Credential Status List 2021](https://w3c.github.io/vc-status-list-2021/)
    specification, which was adopted as a standards-track specification by the
    VCWG on December 14th 2022. This protocol enables an issuer to publish a
    compactly encoded list of status indicator bits covering many credentials at
    once in an unnamed order. Within each issued credential, the issuer includes
    a pointer to a specific bit within the bulk status list. This enables
    verifiers to efficiently query for status results without revealing which
    specific credential's status is being checked. It does not feature the
    ability to retrieve a revocation reason for a revoked credential, nor does
    it provide a refreshed version of the credential consistent with the
    issuer's latest status data, features that are sometimes bundled with
    revocation.

### Alignment with CASE items

### Skills
