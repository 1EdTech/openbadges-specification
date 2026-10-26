---
title: "Proposal for Open Badges 3.1 Charter"
shorttitle: "Proposal for Open Badges 3.1 Charter"
docType: "publication"
shortcode: "OB-CHARTER-31"
version: "1.0"
status: "Draft"
author: "1EdTech Consortium"
lastUpdated: 2026-10-19
description: >
  Public A proposal to recharter the 1EdTech Digital Credentials Workgroup. Chair's draft for discussion.
category: Specification
discussion:
  enabled: true
  topicId: OB-CHARTER-31
releases:
  - version: "1.0"
    date: 2026-10-19
    comments: Initial proposal.
contributors:
  - name: "Nate Otto"
    affiliation: "Skybridge Skills"
    role: "Co-Chair, Open Badges"
    companyUrl: ""
---

# What's next for Open Badges and CLR

The workgroup would produce Open Badges 3.1, a minor release, with CLR 2.1
alongside and one credential transfer API shared by both. We don't rewrite
the data model to make upgrading easy. An OB 3.0 issuer can upgrade by adding
fields, switching a securing method, or dropping an option 3.1 narrows. Badges
issued under 3.0 stay valid 3.0 badges, and 3.1 verifiers should keep
accepting them. A new 3.1 context marks 3.1 badges, which may carry small new
requirements.

Open Badges 3.0 moved badges onto the W3C Verifiable Credentials Data Model.
Since then **VCDM 2.0** has become a W3C Recommendation, OB certification has
added selective disclosure securing methods, and the VC community has published
new status and DID method and post-quantum work items. Implementers have also
found gaps in OB and CLR: no precise way to describe a skill claim, no clear
link to registries, endorsements that can't be added after issue, evidence that
can change or become inaccessible, and duplicative APIs. Each can be fixed
without remodeling badges, so issuers need not wait for a 4.0.

## Proposed scope: OB and combined data model

We clarify the scope of OB to apply to the data model for claims, enabling a
clearer relationship to VCDM extensions throughout. We will point to these other
groups' specs rather than restating them.

**Skills.** A new `Skill` result type gives one clear way to claim a skill. An
achievement lists each skill it recognizes as a result description whose
alignments identify it in CASE, CTDL, ESCO or the issuer's own framework. Each
earner's result says they demonstrated it, optionally at a level. Achievement
alignments become plain related links. *Open:* `Skill` or `Competency`;
proficiency scales; reading 3.0 skill badges.

**VC Data Model 2.x and JWT.** 3.1 badges are issued on VCDM 2.0 and stay
compatible with 2.1. OB then points to each securing method's spec, such as Data
Integrity or VC-JOSE-COSE (with `EnvelopedVerifiableCredential` for nested
credentials). No property is duplicated per method, as `endorsementJwt` was. 3.0
JWTs remain valid 3.0 badges. *Open:* which combinations 3.1 certifies.

**Extension points and post-quantum.** The spec stays open to any VC securing,
status and DID method. Certification tests `eddsa-rdfc-2022` and
`ecdsa-sd-2023`; Bitstring Status List revocation and suspension; and `did:key`
and `did:web`. A badge may add an experimental post-quantum proof beside a
classical one; no migration is recommended yet. *Open:* certifying VC-JOSE-COSE;
credential and key lifetimes; when a post-quantum suite qualifies.

**Improve selective disclosure UX.** 3.1 lists the fields always disclosed
(issuer, dates, status, the whole achievement) and those a learner may withhold
(identity, results, evidence, other learner details). A derived credential may
omit all identity. `ecdsa-sd-2023` is certified; `bbs-2023` is named for
unlinkable disclosure. Wallet experience goes in the implementation guide.
*Open:* linking an identity-free badge to its presenter; certifying `bbs-2023`.

**Registries.** A new `sameAs` property on issuer profiles and achievements
holds version-specific registry URLs, such as Credential Engine records; a
`ctid` identifier type holds bare CTIDs. Verifiers should still accept badges
without registry links. OB stays open to the forthcoming W3C Recognized
Entities' `recognizedIn` extension; the implementation guide explains why a link
in a badge is not recognition. *Open:* schema.org or CTDL `sameAs`; whether 3.1
takes on versioning.

**Evidence integrity.** Evidence is linked, not embedded. Issuers may add a
VCDM 2.0 digest (`digestSRI` or `digestMultibase`), so any matching copy,
wherever it is stored, shows the evidence is unchanged. Verifiers that fetch
evidence should check it and show a mismatch without rejecting the badge.
Learners may withhold evidence. *Open:* disallowing embedded evidence; a
minimum credential size the transfer API must accept.

**Endorsements (preliminary).** 3.1 stops embedding endorsements, which
freeze at issue time. They travel alongside the badge instead, delivered over
the transfer API and presented with it. A displayer shows one
only if it verifies and matches what it endorses, including the endorsed
issuer, which 3.1 endorsements must name. Badges that build on earlier badges
point to them in `evidence`. *Open:* public discovery; where the issuer
binding goes; digests.

**Multilingual text.** Text fields may carry several languages as VCDM 2.0
language value objects (`@value`, `@language`, `@direction`), which the 3.0
schemas reject today. `inLanguage` and `related` stay as they are. *Open:*
adopt this in 3.1, or wait for 4.0?

**Combined credential transfer API.** A separate document, with its own
certification, replaces the duplicated OB and CLR API sections. It covers
holder-authorized transfer of any W3C Verifiable Credential between services,
including ongoing delivery the holder approves once.
New: delete, filtering by type, holder-chosen read access, replacement
(covering updates and revocation), and one credential in several formats.
*Open:* types in paths and scopes; how holders choose access; notifications; a
shared envelope with the Provisioning Task Force.

**Also:** an errata sweep of known contradictions, broken links and stale text
in OB 3.0 and CLR 2.0, including the 3.0 schemas' unsigned language-map form;
and implementation guidance on how employers and HR systems consume badges.

## CLR 2.1 and other groups

**CLR 2.1** takes the same changes where they apply, moves its certified
status method from `1EdTechRevocationList` to Bitstring Status List, drops its
API section for the combined API, and clarifies how CASE is used in CLR.
**The CLR Task Force**, launching in November, takes the larger questions:
separating CLR's audiences (registrar records and presentation to employers),
CLR as a package of references, and simplifying CLR. **The Credential
Provisioning Task Force** (Edu-API) owns institution-authorized transfer.

## Not in scope

A new data model or other major-version change. Support for OB or CLR claims in
other credential formats (mDL, SD-JWT VC, ACDC) is potential future work. The API
does not bind to OID4VCI, OID4VP or VCALM; the implementation guide points to
them as options. Achievement pathways belong to registries and CLR.

## How to take part

This is a draft. Each *Open* item is a question for the group. Comment on the
1EdTech Community post, join the Digital Credentials Workgroup calls or the CLR
Task Force.
