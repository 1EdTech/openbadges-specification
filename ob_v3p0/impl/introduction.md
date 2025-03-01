## Introduction

The 1EdTech digital credentials specifications, Open Badges and Comprehensive
Learner Record (CLR) enable the recognition of learning achievements in many
contexts that are cryptographically verifiable as the learners present them to
unlock new opportunities across a lifetime of learning and employment. Key use
cases include the recognition of skills and competencies, degrees, certificates
and professional certifications, participation, and community engagement.

This implementation guide aims to inform product developers who are
investigating or planning implementation of the Open Badges 3.0 and/or CLR 2.0
specifications about the available implementation options and how to situate a
product within the ecosystem compatible with these specifications.

### Overview

Each Open Badges `OpenBadgeCredential` is digitally signed by its issuing
organization as Verifiable Credentials compatible with the
[[[VC-DATA-MODEL-2.0]]]. Issuers may bundle together multiple related
achievement credentials into transcripts and other longitudinal records for an
individual learner in a CLR as a `ClrCredential`, which is also signed using the
same technique as the individual credentials. Additionally, credentials can be
augmented with an `EndorsementCredential` from a third party to lend the support
of another individual or organization to the quality or relevance of an issuer
or credential data.

A RESTful API, with dynamic client registration, is available to transport data
in `OpenBadgeCredential` and `ClrCredential` format, under the control of the
learner, between systems where they are issued, hosted on behalf of the learner,
or verified by third parties in order to qualify the learner for job placement
or other opportunities. Implementing systems can participate in a variety of
roles

#### Spec documents (Normative References)

The full set of documents is comprised of the following documents:

-   [[[OB-30]]]
-   [[[OB-CERT-30]]]
-   [[[CLR-20]]]
-   [[[CLR-CERT-20]]]

#### Audiences

This implementation guide is intended for product developers across various
implementation roles necessary for the operation of an ecosystem where digital
credentials efficiently recognize achievements that matter and flow to the
contexts where these achievements each need to be understood. Products may be
situated to perform one or more roles within the ecosystem, such as issuing
credentials, hosting credentials on behalf of learners, and verifying
credentials.

### OB Overview

An Open Badge (`OpenBadgeCredential`) is a individual achievement recognized
about an individual learner. An Issuer makes a claim that a learner has met the
criteria of a particular defined `Achievement`.

### CLR Overview

A Comprehensive Learner Record allows many Open Badge achievement credentials to
be bundled together, with some additional associations between them defined.
This is like another onion layer wrapping the inner set of credentials that is
also signed. Individual component credentials are verifiable, and the wrapping
CLR is also verifiable. CLRs can contain achievements from multiple different
issuers to show a learner's progression with multiple organizations or
subdivisions of a large educational institution.

### Use Cases

Use cases are outlined in each the Open Badges and Comprehensive Learner Record
specifications. Use cases outline how each specification is intended to provide
value to end users through interoperability between products.

[Open Badges use cases](https://www.imsglobal.org/spec/ob/v3p0#use-cases)
include:

-   Assertion Issuance to Wallet
-   Assertion Issuance Without a Wallet
-   Recipient Presentation of Assertion
-   License Issuance
-   Single Skill Assertion
-   Mapping Skills
-   Verifying Continuing Education
-   Self-assertion
-   Endorsement
-   Re-issue an OB 2.0 Badge as an OB 3.0 Badge
-   Authorization to Issue Given by Creator to Issuer
-   Revocation of an Issued Credential
-   Badge Class Status

[Comprehensive Learner Record use cases (not yet published)](https://github.com/1EdTech/ComprehensiveLearnerRecord/blob/develop/clr_v2p0/usecases.md)
include:

-   Recent graduate wants to hold a copy of their own official transcript
-   Job applicant provides proof of degree and transcript to potential employer
-   Job applicant provides proof of degree and specific courses/engagements from
    the CLR
-   Higher Ed Competency-Based Education
-   Issuer Asserting All Student Achievements Comprehensively as a CLR
-   Issuer Asserting Partial Transcript at Intermediate Points in Learning
    Journey
-   Issuer Asserting Student Up to Date Partial Transcript of Achievements as
    CLR on Request
-   Internal Organizational Staff Development and Promotion
-   Upskilling with Higher Ed Professional/Continuing Education
-   Teacher Placement with a District
-   Professional Licensure Test Taker results
-   Students in Tutoring Program

### OB/CLR in the 1EdTech Ecosystem

The core of both Open Badges and Comprehensive Learner Record is an assertion
about an achievement. As defined in [[[OB-30]]] and [[[CLR-20]]], an assertion
is specific to one learner. It contains a claim that the learner has made a
particular achievement and metadata about the achievement, the issuer, and the
learner, including possible evidence that provides support for the claim.

These concepts are also present in some way in other specifications within
1EdTech, enabling connections between specifications.

<div class="note">
This section is purely informative. The scenarios described here does not define
any additional requirements of the specification to conform to.
</div>

A clear connection to other specifications occurs through the alignment of
achievements. An alignment of an `Achievement` to can refer to a [[[CASE-10]]]'s
`CFItem` for linking the achievement to a learning object in a CASE's Competency
Framework Package.

Another possible connection with other 1EdTech's specifications is the issuer of
the credential. Since it can be an organization or entity it can represent the
same entity described as an `Org` in [[[OR-11]]] [[OR-11]] or [[[EDUAPI-10]]]
[[EDUAPI-10]].

Moreover, the learner who the credential is issued to can have a relationship
with the `User` entity in [[OR-11]] or the `Person` entity in [[EDUAPI-10]], as
well.

Also, [[OR-11]] covers performance of the learner in a context such an
assignment vi the `Result` entity. This can be related with the
`Result Definition` of the issued `Achievement`, and the `Result` of an
`AchievementSubject`.

Open Badges and Comprehensive Learner Record can be implemented by systems that
use other specifications as well. For example, an Open Badges or CLR application
be offered as a tool within an LMS using [[[LTI-13]]] to launching the OB or
CLR-specific interfaces.

### Relationship between Verifiable Credentials and OB/CLR

New to this version of the specification, Open Badges and Comprehensive Learner
Record are compatible with the [[[VC-DATA-MODEL-2.0]]] (both version 2.0 and the
previous [[[VC-DATA-MODEL]]]). The VC Data Model describes an envelope that may
be used to express many different types of messages, or "claims", about
credential subjects, but credential-type-specific schemas such as OB and CLR are
needed in the VC ecosystem to enable coordination of specific credential types
and shared expectations for their use.

Open Badges and CLR define three
[verifiable credential types](https://www.w3.org/TR/vc-data-model-2.0/#types)
and expectations for the claims that may be expressed using these types.

-   `OpenBadgeCredential` (alias `AchievementCredential`, formerly "Assertion"
    in OB 2.0): An assertion that an individual credentialSubject has achieved
    the criteria of a specified "Achievement" (formerly "BadgeClass"). Metadata
    about the achievement, its alignment to standards or competency frameworks,
    evidence related to its attainment, and the learner and issuer's identifying
    information may be expressed in the credential.
-   `ClrCredential`: a container for several `AchievementCredentials` and
    associations that link them. Capable of representing both a degree and
    subsidiary credentials or a detailed transcript full of courses completed
    and progress through a framework of learning outcomes.
-   `EndorsementCredential`: An endorsement of the quality or value, this is an
    open-ended low-level container that instead of targeting an individual
    learner, usually makes claims about an `Achievement`, `Issuer Profile` or
    `OpenBadgeCredential`. Endorsements may be issued by individuals or
    organizations, potentially even badge recipients themselves.

CLR and OB also define the verification algorithm for these credentials, as well
as a set of APIs for exchanging these credentials. But they will also circulate
within the broader Verifiable Credentials ecosystem, including through tools
that do not apply the full range of domain-specific checks. `ClrCredential` and
`OpenBadgeCredential` are Verifiable Credentials and may circulate through
wallets and protocols that support other credential types as well. The validity
status within these general tools may only show a subset of the checks needed to
consider OB/CLR valid and fit for a particular purpose.

In addition, issuers may issue these types and make use of issuer identifier
types (DID methods), cryptographic key or signature types, status methods, or
other Verifiable Credentials options beyond those known to the OB/CLR spec.
These additional components may be noted as possibilities in future updates to
the OB/CLR specs, but for best interoperability within OB/CLR tools and
conformance certification from 1EdTech, issuers should support issuer
identifiers, key types, signature types, and (if applicable) status methods
mentioned in these specifications. Consult the
[TrustEd Apps Directory](https://site.imsglobal.org/certifications) and
participate in the 1EdTech membership community to coordinate the selection and
rollout of these components as well as potential incorporation into
specification updates as named options.
