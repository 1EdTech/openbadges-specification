---
title: "Recommended Practices"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-12
description: "Recommended Practices for TrustEd Credential 1.0 implementations"
---

## Recommended Practices

### Achievement Type Practices

`Achievement.achievementType` values help identify the nature of the achievement being recognized.

Using standardized achievement types improves interoperability and helps receiving systems distinguish between different forms of achievement, such as participation, knowledge attainment, applied competency, certification, licensure, or demonstrated performance.

TrustEd Credentials include `Achievement.achievementType` metadata to identify the nature of the achievement being recognized. Issuers SHOULD:

- use the most specific applicable achievement type available;
- maintain consistency in achievement type usage across credentials;
- map locally defined terms to recognized vocabularies when possible; and
- publish definitions for locally extended achievement type vocabularies.

Issuers SHOULD avoid using generic or institution-specific terminology that cannot be interpreted consistently by external systems or organizations.

### Skills and Framework Alignment Practices

<p class="issue" title="Revise Text">
  This is kinda junk text. We aren't clear here that the requirement is to use ResultDescription.alignment. This should talk about why that enables more precision.
</p>

Alignment metadata supports portability and comparability of credentials across educational institutions, employers, and workforce systems.

TrustEd Credentials use alignment metadata to support portability and comparability across educational institutions, employers, and workforce systems. Issuers SHOULD:

- use stable, resolvable URIs where possible;
- align credentials to the most granular applicable competency or skill statement;
- use recognized framework formats such as CASE, Credential Engine CTDL, ASN, ESCO, or O*NET where appropriate; and
- preserve framework versioning information when available.

Issuers SHOULD avoid using only free-text skills descriptions without associated identifiers or framework references.

### Criteria Transparency Practices

Criteria metadata describes the requirements necessary to earn the credential.

TrustEd Credentials include criteria metadata describing the requirements necessary to earn the credential. Issuers SHOULD:

- describe expected outcomes or performance requirements clearly;
- identify assessment or evaluation expectations where appropriate;
- ensure criteria are understandable to audiences outside the issuing organization; and
- maintain stable or versioned criteria definitions over time.

Issuers SHOULD prefer publicly accessible criteria URLs when feasible.

Minimal or ambiguous criteria statements such as “completed the course” may reduce the interpretability and value of the credential.

### Evidence Practices

<p class="issue" title="Add Additional Info">
  Add details about where to host, privacy considerations, etc.
</p>
Evidence metadata may help demonstrate learner achievement, competency, or performance.

Evidence may include:

- work products;
- portfolios;
- projects;
- presentations;
- assessment artifacts; or
- links to externally hosted materials.

TrustEd Credentials include evidence metadata that may help demonstrate learner achievement, competency, or performance. Issuers SHOULD:

- ensure evidence is directly related to the achievement criteria or outcomes;
- provide sufficient contextual information for interpretation;
- maintain evidence accessibility for an appropriate duration; and
- respect applicable privacy, consent, and data protection requirements.

Issuers SHOULD avoid including evidence links that are inaccessible, temporary, or unrelated to the achievement being asserted.

@standards/ob-trustedcredential/v1p0/impl/examples/evidence/exam.md

@standards/ob-trustedcredential/v1p0/impl/examples/evidence/course.md

### Result and Rubric Practices

<p class="issue" title="Add clarity">
  What does it mean to add a rubric with critera levels? When do you do grads/pass/fail, etc, and when do you do rubric.
</p>

Result metadata may provide additional transparency regarding assessment outcomes or demonstrated levels of achievement.

Result metadata may include:

- rubric criterion achieved level;
- proficiency levels;
- competency achievement levels;
- grades;
- pass/fail determinations; or
- narrative assessment outcomes.

TrustEd Credentials include result metadata to provide additional transparency regarding assessment outcomes or demonstrated levels of achievement. Issuers SHOULD:

- include sufficient contextual information for external interpretation;
- define rubric criteria clearly when rubrics are used;
- include stable identifiers or references for rubric levels where possible; and
- ensure `achievedLevel` values correspond to published rubric definitions.

Issuers SHOULD avoid including scores or assessment levels without sufficient contextual explanation.

#### Result as Grade Example

@standards/ob-trustedcredential/v1p0/impl/examples/grades/numeric.md

@standards/ob-trustedcredential/v1p0/impl/examples/grades/letters.md

@standards/ob-trustedcredential/v1p0/impl/examples/grades/gpa.md

@standards/ob-trustedcredential/v1p0/impl/examples/grades/mastery.md

#### Rubric Example

@standards/ob-trustedcredential/v1p0/impl/examples/grades/rubric.md

### Assessment Transparency Practices

<div class="issue" title="Add more detial">
    <ul>
        <li>Include direct assessment approach as minimal example.</li>
    </ul>
</div>

Assessment metadata may provide additional information about how achievement was evaluated.

Assessment metadata, as defined by [[[OB-ASSMT-20]]], may include:

- assessment modality;
- validation methodology;
- evaluator roles;
- performance tasks;
- examination methods;
- project-based assessments;
- proctoring information; or
- psychometric validation information when available.

When assessment metadata is included in a TrustEd Credential, issuers SHOULD:

- clearly describe the methods used to determine achievement;
- distinguish participation-based recognition from assessed achievement;
- provide sufficient context to support independent interpretation; and
- maintain consistency between assessment metadata, criteria, and result information.

Providing assessment transparency may improve confidence in the rigor and reliability of the credential.

#### Direct Assessment Example

<pre class="example json" title="Direct Assessment Example">
</pre>

<div class="note">
TBD
</div>

### Duration and Effort Practices

Duration and effort metadata may help communicate the approximate level of learner engagement associated with earning a credential.

This information may include:

- instructional hours;
- learner effort;
- academic credit;
- continuing education units;
- clock hours; or
- competency equivalencies.

When duration or effort metadata is included in a TrustEd Credential, issuers SHOULD:

- clearly distinguish between estimated learner effort, instructional time, and formally awarded academic credit;
- use recognized credit or workload systems where appropriate; and
- provide sufficient contextual explanation for interpretation by external audiences.

@standards/ob-trustedcredential/v1p0/impl/examples/credit-hour.md

@standards/ob-trustedcredential/v1p0/impl/examples/clinical-hour.md

### Endorsement and Accreditation Practices

`Endorsement` and accreditation metadata, defined by [[[OB-ACCRED-10]]] may provide additional trust signals regarding the quality, recognition, or external validation of a credential.

`AchivementCredential.endorsement` (As an EndorsementCredential) may communicate support from:

- employers;
- professional associations;
- licensing authorities; or
- other recognized third parties.

When accreditation or endorsement metadata is included in a TrustEd Credential, issuers SHOULD:

- clearly distinguish endorsements from formal accreditation or regulatory approval;
- identify accrediting or endorsing organizations using stable identifiers where available;
- include sufficient contextual information describing the scope of the endorsement or accreditation; and
- maintain current and accurate endorsement or accreditation references.

Issuers SHOULD avoid presenting informal affiliations or partnerships as formal accreditation.

#### Endorsement Example

<pre class="example json" title="Endorsement Example">
</pre>

<div class="note">
TBD
</div>

#### Accreditation Examples

1. Example Institutional Accreditation
2. Institution and Program Accreditation Exmaple

@standards/ob-trustedcredential/v1p0/impl/examples/accreditation/institution.md

<pre class="example json" title="Institution and Program Accreditation Example">
</pre>

<div class="note">
TBD
</div>

### Achievement Creator Practices

The `creator` property on an `Achievement` may be used to identify the individual, organization, or entity responsible for defining, developing, authoring, or maintaining the achievement. For example, an instituion might administer state-defined teacher licensure requirements, such that the institution is issuing the credential, but the state is the creator of the requirements. Or a centralized Registrar's office is issuing a credential on behalf of a deparment or school of the institution. See the [Differentiating Credential Issuers and Achievement Creators](https://www.imsglobal.org/spec/ob/v3p0#differentiating-issuers-and-achievement-creators) use case from the Open Badges Specification for more information.

In TrustEd Credentials, the `Achievement.creator` property may help provide additional transparency regarding:

- subject matter expertise;
- assessment authorship;
- curriculum or competency ownership;
- industry participation; or
- external collaboration in development of the credential.

When creator metadata is included, issuers SHOULD:

- clearly distinguish between the issuing organization and the creator of the achievement definition;
- identify creators using stable identifiers where possible;
- maintain consistency in creator metadata practices across credentials.
- include creator metadata when external organizations, employers, faculty, or industry experts contributed significantly to the achievement definition or assessment design; and

<div class="issue">
<ul>
<li>We can clarify the file <code>identify creators using stable identifiers where possible;</code>, i.e use the same identifier for an institution in issuer.id and creator.id.</li>
<li>Or suggest that an institution should have an use the same Profile information</li>
<li>Write an example. Point to example here: https://www.imsglobal.org/spec/ob/v3p0#differentiating-issuers-and-achievement-creators</li>
</div>

#### Achievement Creator Example

<pre class="example json" title="Achievement Creator Example">
</pre>

<div class="note">
TBD
</div>

### Achievement Subject Source Practices

The `source` property of `AchievementSubject` may be used when a person, organization, or system assesses the achievement on behalf of the issuer. For example, a school may assess the achievement, while the school district issues the credential; an appreciship placement organization may assess on behalf of the institution; or a testing center is used to administer or evaluate a performance or test."

In TrustEd Credentials, `AchievementSubject.source` metadata may improve traceability, verification, and interoperability by identifying the originating organization, system or process associated with learner achievement data.

When `AchievementSubject.source` metadata is included, issuers SHOULD:

- identify the originating system or source using stable identifiers where possible;
- include sufficient contextual information to support verification or audit processes; and
- ensure source references remain stable and accessible over time when feasible.

Issuers SHOULD avoid exposing sensitive internal identifiers or personally identifiable information through source metadata.

<div class="issue">
<ul>
<li>Distinguish between institutions and persons</li>
<li>Suggest the minimum data here to allow the compromise of consumption described in previous chapter</li>
<li>Unnecessary qualifier</li>
</div>

#### Source Example

<pre class="example json" title="Source Example">

</pre>

<div class="note">
TBD: Provide minimal example, such as testing center, not a whole profile
</div>
