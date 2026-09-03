---
title: "Direct assessment - offical"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-06
description: "Direct Assessment - Official example for TrustEd Credential 1.0 implementations"
---

##### Official exam for professional certification - with validation methodology and  modality

The following example describes a credential for the `Certified Network Security Professional (CNSP)`
certification exam, that certifies that the holder can configure, secure, monitor, and troubleshoot
enterprise network security infrastructure according to industry best practices.

###### Assessment Modality

**Delivery**

- Computer-based examination
- Administered at authorized testing centers or through remote online proctoring
- Closed-book
- Identity verification required
- Live or AI-assisted proctoring

**Exam Structure**

| Section | Questions | Time |
| --- | --- | --- |
| Network Fundamentals | 20 | 25 min |
| Security Technologies | 35 | 45 min |
| Threat Analysis | 20 | 30 min |
| Troubleshooting Scenarios | 15 | 20 min |
| **Total** | **90** | **120 min** |

**Question Types**

- Multiple choice (single answer)
- Multiple response
- Drag-and-drop configuration
- Performance-based simulation
- Case study

*Example:* A firewall rule blocks outbound HTTPS traffic from a subnet while allowing DNS queries. Which configuration change would restore secure web access without compromising the security policy?

**Scoring**

- Scale: 100–900
- Passing score: 720
- Performance-based items may have partial credit
- Immediate unofficial score report
- Official digital certificate issued within 48 hours

###### Validation Methodology

**Job Task Analysis (JTA)**

The certification begins with a formal Job Task Analysis.

Subject Matter Experts (SMEs):

- identify professional tasks
- rank their importance
- rank their frequency
- identify required knowledge and skills

The examination blueprint is derived from this analysis.

**Competency Mapping**

Every exam question is mapped to one or more competency statements.

| Competency | Questions |
|---|---|
| Configure firewall policies | 12 |
| Detect network attacks | 18 |
| Secure remote access | 10 |

**Item Development**

Questions are written by certified SMEs following standardized item-writing guidelines.

Each question undergoes:

- technical review
- editorial review
- bias review
- accessibility review

**Pilot Testing**

New questions are included as unscored items within operational exams.

Statistical analysis evaluates:

- item difficulty
- discrimination index
- distractor effectiveness
- response time

Poor-performing items are revised or discarded.

**Psychometric Validation**

The certification body performs psychometric analyses such as:

- Classical Test Theory (CTT)
- Item Response Theory (IRT) where applicable
- Reliability analysis (e.g., Cronbach's alpha)
- Standard Error of Measurement (SEM)

These analyses ensure the examination is reliable and fair.

**Standard Setting**

The passing score is established using a recognized standard-setting method such as:

- Angoff Method
- Modified Angoff
- Bookmark Method

Panels of SMEs estimate the performance expected of a minimally competent candidate.

**Ongoing Quality Assurance**

The certification program includes:

- annual review of the exam blueprint
- periodic Job Task Analysis updates (every 3–5 years)
- statistical monitoring of exam performance
- item bank maintenance
- security monitoring for compromised questions

###### Security Controls

- Candidate identity verification
- Secure browser
- Live or AI-assisted remote proctoring
- Randomized question selection
- Randomized answer order
- Encrypted delivery
- Audit logging
- Plagiarism and misconduct investigation process

###### Certification Decision

A candidate is certified only if:

- the passing score is achieved,
- no examination integrity violations are detected,
- identity verification is successful.

###### Validity Period

- Certification valid for **3 years**.
- Renewal through continuing professional development (CPD), retesting, or a combination of both.

###### Example

> **Note**: include the information that is relevant to your particular case, not everything/every
> field may always be required.

```obv3p0
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json",
    "https://purl.imsglobal.org/spec/ob/v3p0/extensions.json",
    "https://purl.imsglobal.org/spec/ob-assessment/v2p0/context/"
  ],
  "id": "https://northbridge-cyber.example.org/credentials/e7270d68-9c49-4ef7-a2a4-74cdb458af27",
  "type": ["VerifiableCredential", "OpenBadgeCredential"],
  "name": "Certified Network Security Professional (CNSP)",
  "description": "This credential certifies that the holder can configure, secure, monitor, and troubleshoot enterprise network security infrastructure according to industry best practices.",
  "issuer": {
    "id": "https://northbridge-cyber.example.org/issuers/certification-board",
    "type": ["Profile"],
    "name": "Northbridge Cyber Certification Alliance",
    "url": "https://northbridge-cyber.example.org",
    "email": "certification@northbridge-cyber.example.org",
    "description": "An independent certification body governing professional credentials in enterprise network security."
  },
  "validFrom": "2026-06-15T09:00:00Z",
  "validUntil": "2029-06-15T09:00:00Z",
  "awardedDate": "2026-06-15T09:00:00Z",
  "credentialSubject": {
    "id": "did:example:d4aced7e-77cc-4b33-a4dd-6559855c7615",
    "type": ["AchievementSubject"],
    "identifier": [
      {
        "type": "IdentityObject",
        "hashed": false,
        "identityType": "emailAddress",
        "identityHash": "jordan.reyes@example.com"
      }
    ],
    "result": [
      {
        "type": ["Result"],
        "resultDescription": "urn:uuid:eb780ead-bbd2-46a7-af20-91c995f7a739",
        "value": "742"
      }
    ],
    "achievement": {
      "id": "https://northbridge-cyber.example.org/achievements/cnsp",
      "type": ["Achievement"],
      "achievementType": "Certification",
      "name": "Certified Network Security Professional (CNSP)",
      "description": "Certifies that the holder can configure, secure, monitor, and troubleshoot enterprise network security infrastructure according to industry best practices.",
      "fieldOfStudy": "Network Security",
      "humanCode": "CNSP",
      "creator": {
        "id": "https://northbridge-cyber.example.org/issuers/certification-board",
        "type": ["Profile"],
        "name": "Northbridge Cyber Certification Alliance",
        "url": "https://northbridge-cyber.example.org"
      },
      "criteria": {
        "narrative": "A candidate is certified only if: (1) the passing scaled score of 720 (on a 100–900 scale) is achieved on the CNSP examination; (2) no examination integrity violations are detected during delivery; and (3) identity verification is completed successfully. The examination is a closed-book, computer-based test administered either at an authorized testing center or via remote online proctoring (live or AI-assisted), with mandatory candidate identity verification. Certification is valid for 3 years and may be renewed through continuing professional development (CPD), retesting, or a combination of both."
      },
      "resultDescription": [
        {
          "id": "urn:uuid:eb780ead-bbd2-46a7-af20-91c995f7a739",
          "type": ["ResultDescription", "AssessmentResultDescription"],
          "name": "CNSP Examination Scaled Score",
          "resultType": "ScaledScore",
          "valueMin": "100",
          "valueMax": "900",
          "requiredValue": "720",
          "alignment": [
            {
              "type": ["Alignment"],
              "targetName": "Configure firewall policies",
              "targetDescription": "12 of 90 exam questions map to this competency statement.",
              "targetFramework": "CNSP Competency Map",
              "targetType": "ceasn:Competency",
              "targetUrl": "https://northbridge-cyber.example.org/competencies/configure-firewall-policies"
            },
            {
              "type": ["Alignment"],
              "targetName": "Detect network attacks",
              "targetDescription": "18 of 90 exam questions map to this competency statement.",
              "targetFramework": "CNSP Competency Map",
              "targetType": "ceasn:Competency",
              "targetUrl": "https://northbridge-cyber.example.org/competencies/detect-network-attacks"
            },
            {
              "type": ["Alignment"],
              "targetName": "Secure remote access",
              "targetDescription": "10 of 90 exam questions map to this competency statement.",
              "targetFramework": "CNSP Competency Map",
              "targetType": "ceasn:Competency",
              "targetUrl": "https://northbridge-cyber.example.org/competencies/secure-remote-access"
            }
          ],
          "description": "A 90-question, 120-minute proctored examination covering network fundamentals, security technologies, threat analysis, and troubleshooting scenarios. Delivered as a closed-book, computer-based exam at an authorized testing center or via live/AI-assisted remote online proctoring, with mandatory candidate identity verification. Question types include single-answer multiple choice, multiple response, drag-and-drop configuration, performance-based simulation, and case study items (e.g., diagnosing why a firewall rule blocks outbound HTTPS traffic while allowing DNS queries, and selecting the configuration change that restores secure web access without weakening the security policy).",
          "assessmentType": "Exam",
          "assessmentOutput": "A scaled score from 100–900 with an immediate unofficial score report; performance-based simulation items may receive partial credit. An official digital certificate is issued within 48 hours of a passing result.",
          "hasGroupParticipation": false,
          "hasGroupEvaluation": false,
          "evaluationMethod": "The examination blueprint originates from a formal Job Task Analysis (JTA) in which subject matter experts (SMEs) identify professional tasks and rank their importance, frequency, and required knowledge/skills. Every item is mapped to one or more competency statements (see alignment). Items are authored by certified SMEs under standardized item-writing guidelines and undergo technical, editorial, bias, and accessibility review. New items are seeded as unscored pilot items within operational exams and evaluated statistically for difficulty, discrimination index, distractor effectiveness, and response time before being retired or promoted to scored status. The certification body applies Classical Test Theory (CTT) and, where applicable, Item Response Theory (IRT), along with reliability analysis (e.g., Cronbach's alpha) and Standard Error of Measurement (SEM) to confirm the exam is reliable and fair. The passing score of 720 was established using a recognized standard-setting method (e.g., Angoff, Modified Angoff, or Bookmark) in which SME panels estimate the expected performance of a minimally competent candidate. Ongoing quality assurance includes annual review of the exam blueprint, JTA updates every 3–5 years, statistical monitoring of exam performance, item bank maintenance, and security monitoring for compromised items.",
          "sections": [
            {
              "type": "Section",
              "title": "Network Fundamentals",
              "description": "20 questions, 25 minutes.",
              "required": "true"
            },
            {
              "type": "Section",
              "title": "Security Technologies",
              "description": "35 questions, 45 minutes.",
              "required": "true"
            },
            {
              "type": "Section",
              "title": "Threat Analysis",
              "description": "20 questions, 30 minutes.",
              "required": "true"
            },
            {
              "type": "Section",
              "title": "Troubleshooting Scenarios",
              "description": "15 questions, 20 minutes.",
              "required": "true"
            }
          ]
        }
      ]
    }
  },
  "credentialSchema": [
    {
      "id": "https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_achievementcredential_schema.json",
      "type": "1EdTechJsonSchemaValidator2019"
    },
    {
      "id": "https://purl.imsglobal.org/spec/ob-assessment/v2p0/schema/",
      "type": "1EdTechJsonSchemaValidator2019"
    }
  ]
}
```

In this example:

- The certification is valid for 3 years (`validUntil`)
- It leverages the [[OB-ASSMT-20]] for describing the sections. Please refer to that document to see an example
of an assessment with questions.
- `achievementType`: `Certification` — matches the credential type (JTA-based professional cert with a validity/renewal cycle), distinct from Assessment or Course.
- `resultDescription` uses the combined type `["ResultDescription", "AssessmentResultDescription"]`, following the pattern in [[OB-ASSMT-20]] — this lets a single object carry both the standard scoring fields (`resultType`, `valueMin`/`valueMax`, `requiredValue`) and the assessment-specific fields (`assessmentType`, `evaluationMethod`, `sections`, etc.) in one place.
- `resultType`: `ScaledScore` (not `RawScore`) — the `100–900` range is a converted/scaled score, not a raw question count, which is the correct semantic distinction per the ResultType enum.
- `evaluationMethod` carries the full validation methodology — JTA, item development/review, pilot testing, psychometric validation (CTT/IRT/Cronbach's alpha/SEM), standard-setting (Angoff family), and ongoing QA. This is the field the extension spec designates for "how the assessment is scored" and reliability/validity information, so it's the natural home for everything under your doc's "Validation Methodology" heading.
- Competency mapping is expressed as alignment entries on the ResultDescription, using `targetType`: `"ceasn:Competency"` and putting the question counts in `targetDescription`, rather than inventing a non-spec field.
- Modality/delivery details is expressed in `criteria.narrative` (certification decision) and the `ResultDescription.description`/`assessmentOutput` — the extension has no dedicated "modality" field, so delivery format (testing center vs. remote proctoring, closed-book, identity verification, AI-assisted proctoring) is folded into narrative text rather than a fabricated property.
- Security controls (secure browser, randomized items, encrypted delivery, audit logging, misconduct investigation) were not separately modeled — they're operational/security controls rather than assessment-result or achievement-definition data, so adding them as invented fields would overreach the spec. Let me know if you'd like these captured via `credentialStatus`/`termsOfUse` or a separate extension instead.
- Result.`value`: `"742"` on the AchievementSubject is an illustrative passing score, included so the example shows a fully wired assertion (not just the definition-level `resultDescription`).
