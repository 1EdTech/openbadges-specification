## Recommended Practices

<p class="issue" title="Update `Property` fields">
Update `property` fields to include location in data model. 
Example: `achievementType` and `Achivement.achievementType`.
</p>

### Achievement Type Practices

`achievementType` values help identify the nature of the achievement being recognized.

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


#### Evidence Example
<pre class="example json" title="Evidence Exmaple">

{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
  ],
  "id": "https://example.com/credentials/3732f4b0-8c4a-4f95-8e3c-0f8c1b6f5a1d",
  "type": [
    "VerifiableCredential",
    "OpenBadgeCredential"
  ],
  "name": "Research Methods Foundations",
  "description": "Awarded for demonstrating foundational research methods skills.",
  "issuer": {
    "id": "https://example.com/issuers/540e388e-2735-4c3e-9709-80142801c774",
    "type": "Profile",
    "name": "Example Institution",
    "url": "https://example.com",
    "description": "An example educational institution.",
    "email": "info@example.com"
  },
  "validFrom": "2026-05-22T00:00:00Z",
  "awardedDate": "2026-05-22T00:00:00Z",
  "credentialSubject": {
    "id": "did:example:learner-123",
    "type": "AchievementSubject",
    "achievement": {
      "id": "https://example.com/achievements/research-methods-foundations",
      "type": "Achievement",
      "name": "Research Methods Foundations",
      "description": "The learner can design a basic research question, select an appropriate method, and summarize findings.",
      "achievementType": "Competency",
      "criteria": {
        "narrative": "Learners must submit a research plan and a short analysis of findings."
      }
    }
  },
  "evidence": [
    {
      "id": "https://example.com/evidence/research-plan-123",
      "type": "Evidence",
      "name": "Research Plan and Findings Summary",
      "description": "A submitted research plan with a short summary of findings and reflection on methodology.",
      "genre": "Research report",
      "audience": "Instructor and assessment reviewers",
      "narrative": "The learner developed a research question, selected a survey method, collected sample responses, and summarized the findings in a short written report."
    }
  ]
}
</pre>


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
<pre class="example json" title="Credential with Grades Example">
</pre>

#### Rubric Example
</pre class="example json" title="Credential with Rubric Example">
</pre>

### Assessment Transparency Practices

<p class="issue" title="Add more detial">
    Include reference to <a href="https://www.imsglobal.org/spec/ob-assessment/v1p0">Assessment Extension</a>. 
    Include direct assessment approach as minimal example.
</p>

Assessment metadata may provide additional information about how achievement was evaluated.

Assessment metadata may include:
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
<pre class="example json">
</pre>

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

#### Credit Hour Example
<pre class="example json" title="Credit Hour Example">
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
  ],
  "id": "https://example.edu/credentials/academic-credit-001",
  "type": [
    "VerifiableCredential",
    "OpenBadgeCredential"
  ],
  "name": "Introduction to Data Analysis",
  "description": "Awarded for successful completion of a credit-bearing introductory data analysis course.",
  "issuer": {
    "id": "https://example.edu/issuers/registrar",
    "type": "Profile",
    "name": "Example University",
    "url": "https://example.edu",
    "description": "An example postsecondary institution.",
    "email": "registrar@example.edu"
  },
  "validFrom": "2026-05-22T00:00:00Z",
  "awardedDate": "2026-05-22T00:00:00Z",
  "credentialSubject": {
    "id": "did:example:learner-456",
    "type": "AchievementSubject",
    "creditsEarned": 3.0,
    "achievement": {
      "id": "https://example.edu/achievements/introduction-to-data-analysis",
      "type": "Achievement",
      "name": "Introduction to Data Analysis",
      "description": "The learner can organize, analyze, and interpret data using introductory statistical methods and spreadsheet tools.",
      "achievementType": "Course",
      "creditsAvailable": 3.0,
      "criteria": {
        "narrative": "Learners must complete all required coursework and assessments for this 3-credit academic course. The credit value represents formally awarded academic credit under Example University's semester credit hour system."
      }
    }
  }
}
</pre>

#### Clinial Hours Example
<pre class="example json" title="Clinical Hours Example">
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json"
  ],
  "id": "https://example.org/credentials/clinical-hours-001",
  "type": [
    "VerifiableCredential",
    "OpenBadgeCredential"
  ],
  "name": "Supervised Clinical Practice: Patient Care Foundations",
  "description": "Awarded for completing supervised clinical practice hours in patient care settings.",
  "issuer": {
    "id": "https://example.org/issuers/health-sciences-program",
    "type": "Profile",
    "name": "Example Health Sciences Program",
    "url": "https://example.org",
    "description": "An example clinical education provider.",
    "email": "credentials@example.org"
  },
  "validFrom": "2026-05-22T00:00:00Z",
  "awardedDate": "2026-05-22T00:00:00Z",
  "credentialSubject": {
    "id": "did:example:learner-789",
    "type": "AchievementSubject",
    "creditsEarned": 120.0,
    "activityStartDate": "2026-01-12T00:00:00Z",
    "activityEndDate": "2026-05-08T00:00:00Z",
    "achievement": {
      "id": "https://example.org/achievements/supervised-clinical-practice-patient-care-foundations",
      "type": "Achievement",
      "name": "Supervised Clinical Practice: Patient Care Foundations",
      "description": "The learner completed supervised clinical practice demonstrating foundational patient care skills.",
      "achievementType": "Fieldwork",
      "creditsAvailable": 120.0,
      "criteria": {
        "narrative": "Learners must complete 120 supervised clinical clock hours in an approved patient care setting. The value in creditsAvailable and creditsEarned represents clinical clock hours, not academic credit hours. Hours are verified by an approved clinical supervisor."
      }
    },
    "source": {
      "id": "https://example.org/profiles/clinical-supervisor-office",
      "type": "Profile",
      "name": "Clinical Supervisor Office",
      "url": "https://example.org/clinical-supervision",
      "description": "The office responsible for verifying supervised clinical practice hours."
    }
  }
}
</pre>


### Endorsement and Accreditation Practices

`Endorsement` and accreditation metadata may provide additional trust signals regarding the quality, recognition, or external validation of a credential.

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

#### Accredidation Examples
1. Example Institutional Accredidation
2. Institution and Program Accredidation Exmaple

<pre class="example json" title="Institution Accredidation Example">
</pre>

<pre class="example json" title="Instition and Program Accredidation Example">
</pre>

### Achievement Creator Practices

The `creator` property on an `Achievement` may be used to identify the individual, organization, or entity responsible for defining, developing, authoring, or maintaining the achievement. For example, an instituion might administer state-defined teacher licensure requirements, such that the institution is issuing the credential, but the state is the creator of the requirements. Or a centralized Registrar's office is issuing a credential on behalf of a deparment or school of the institution.

In TrustEd Credentials, the `Achievement.creator` property may help provide additional transparency regarding:
- subject matter expertise;
- assessment authorship;
- curriculum or competency ownership;
- industry participation; or
- external collaboration in development of the credential.

When creator metadata is included, issuers SHOULD:
- clearly distinguish between the issuing organization and the creator of the achievement definition;
- identify creators using stable identifiers where possible;
- include creator metadata when external organizations, employers, faculty, or industry experts contributed significantly to the achievement definition or assessment design; and
- maintain consistency in creator metadata practices across credentials.

Issuers SHOULD avoid using the `Achievement.creator`property to represent the learner earning the credential.

#### Achievement Creator Example
<pre class="example json" title="Achievement Creator Example">
</pre>

### Achievement Subject Source Practices

The `source` property of `AchievementSubject` may be used when a person, organization, or system assesses the achievement on behalf of the issuer. For example, a school may assess the achievement, while the school district issues the credential; an appreciship placement organization may assess on behalf of the institution; or a testing center is used to administer or evaluate a performance or test."

In TrustEd Credentials, `AchievementSubject.source` metadata may improve traceability, verification, and interoperability by identifying the originating organization, system or process associated with learner achievement data.

When `AchievementSubject.source` metadata is included, issuers SHOULD:
- identify the originating system or source using stable identifiers where possible;
- include sufficient contextual information to support verification or audit processes;
- maintain consistency between source metadata and related assessment, evidence, and result information; and
- ensure source references remain stable and accessible over time when feasible.

Issuers SHOULD avoid exposing sensitive internal identifiers or personally identifiable information through source metadata.

#### Source Example
<pre class="example json" title="Source Example">
Provide minimal example, such as testing center, not a whole profile
</pre>