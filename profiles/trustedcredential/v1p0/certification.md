---
title: "Open Badges TrustEd Credential Profile Conformance and Certification Guide"
shorttitle: "TrustEd Credential Certification Guide"
docType: "conformance"
shortcode: "obtc-cert"
version: "1.0.0"
status: "Draft"
author: "1EdTech Consortium"
lastUpdated: 2026-09-03
description: >
  Conformance requirements and certification process for implementations
  of the Open Badges TrustEd Credential Profile 1.0.
category: Certification
discussion:
  enabled: true
releases:
  - version: "1.0.0"
    date: 2026-09-03
    comments: Initial working draft.
contributors:
  - name: "Rob Coyle"
    affiliation: "1EdTech Consortium"
    role: "Editor"
    companyUrl: "https://www.1edtech.org"
---

## Abstract

The Open Badges TrustEd Credential Profile is a profile of the Open Badges 3.0 Specification that defines additional requirements and recommendations for the use of Open Badges metadata to improve credential transparency, interoperability, portability, machine readability, and trust.

The TrustEd Credential Profile specializes Open Badges 3.0 by strengthening requirements for properties including achievement type, skills and framework alignment, criteria, evidence, results, assessment information, and accreditation.

This Conformance and Certification Guide defines the requirements that candidate platforms must meet to obtain 1EdTech certification for implementation of the TrustEd Credential Profile.

TrustEd Credential certification builds on Open Badges 3.0 certification. Candidate platforms MUST first meet the applicable Open Badges 3.0 certification requirements and then demonstrate the additional capabilities required to issue or receive TrustEd Credentials.

Certification requirements MAY introduce greater constraints than the minimum conformance requirements defined by the TrustEd Credential Profile for specific implementation or certification categories.

## 1. Introduction

The Open Badges TrustEd Credential Profile defines additional requirements and guidance for the use of Open Badges 3.0 metadata to support consistent representation and interpretation of credentials, achievement, assessment, skills, evidence, and outcomes.

This Conformance and Certification Guide defines the additional capabilities that implementations must demonstrate to receive 1EdTech TrustEd Credential certification.

Open Badges 3.0 certification is a prerequisite for TrustEd Credential certification.

### 1.1 Conformance Statements

As well as sections marked as non-normative, all examples, notes, placeholders, and Working Group Questions in this document are non-normative. Everything else is normative unless otherwise stated.

The key words MAY, MUST, MUST NOT, OPTIONAL, RECOMMENDED, REQUIRED, SHALL, SHALL NOT, SHOULD, and SHOULD NOT in this document are to be interpreted as described in [RFC2119].

An implementation that fails to implement a MUST, REQUIRED, or SHALL requirement, or fails to abide by a MUST NOT or SHALL NOT prohibition, is considered nonconformant.

SHOULD, SHOULD NOT, and RECOMMENDED statements constitute best practices. Failure to implement a SHOULD or RECOMMENDED requirement does not by itself constitute failure to conform unless this Conformance and Certification Guide explicitly makes support for that capability a certification requirement.

MAY and OPTIONAL statements indicate capabilities that implementers are free to choose whether or not to implement unless this Conformance and Certification Guide explicitly establishes support as a requirement for a certification category.

### 1.2 Documents

The following documents are relevant to TrustEd Credential implementation and certification:

- Open Badges Specification v3.0 [OB-30]
- Open Badges Specification Conformance and Certification Guide v3.0 [OB-CERT-30]
- Open Badges TrustEd Credential Profile v1.0 [OB-TC-10]
- Open Badges TrustEd Credential Profile Conformance and Certification Guide v1.0 [OB-TC-CERT-10]
- Open Badges TrustEd Credential Profile Implementation Guide [OB-TC-IMPL-10]
- TrustEd Credential Profile JSON Schema [OB-TC-SCHEMA-10]
- Open Badges Issuer Accreditation Extension v2.0 [OB-ACCRED-20]

[PLACEHOLDER: Add any additional contexts, schemas, or extension documents required for certification.]

### 1.3 Terms

Achievement
: The description of the accomplishment represented by an OpenBadgeCredential.

Candidate platform
: A platform implementing the TrustEd Credential Profile with the intent to obtain certification from 1EdTech.

Issuing organization
: The organization responsible for determining the substantive claims and content represented in an issued credential.

OpenBadgeCredential
: An AchievementCredential conforming to the Open Badges 3.0 Specification.

TrustEd Credential
: An OpenBadgeCredential that identifies the applicable TrustEd Credential Profile and satisfies the requirements of that profile.

TrustEd Credential Issuer
: An application that enables an issuing organization to create and issue OpenBadgeCredentials conforming to the TrustEd Credential Profile.

TrustEd Credential Receiver
: An application that receives, validates, stores, processes, transfers, exports, shares, or otherwise consumes OpenBadgeCredentials conforming to the TrustEd Credential Profile.

TrustEd Credential Profile
: The Open Badges TrustEd Credential Profile v1.0.

TrustEd Profile validation
: Evaluation of whether an OpenBadgeCredential satisfies the requirements of the applicable TrustEd Credential Profile.

Verification
: Evaluation of whether a credential is authentic and valid according to the applicable Open Badges 3.0 verification mechanisms.

## 2. Conformance and Certification

This section is non-normative.

The goal of 1EdTech certification for the Open Badges TrustEd Credential Profile is to ensure interoperable implementations of systems that issue and receive TrustEd Credentials.

1EdTech certification for the TrustEd Credential Profile requires capabilities beyond those required for basic Open Badges 3.0 conformance.

In particular, certification verifies that candidate platforms can:

- correctly implement the additional TrustEd Credential Profile requirements;
- support applicable recommended and optional TrustEd Credential Profile capabilities required for certification;
- distinguish TrustEd Credential Profile conformance from underlying Open Badges 3.0 validity; and
- preserve TrustEd Credential metadata through applicable platform operations.

Certification may be achieved in one or more of the following proposed categories:

- TrustEd Credential Issuer
- TrustEd Credential Receiver

> **Working Group Question:** Confirm that TrustEd Credential Issuer and TrustEd Credential Receiver are the appropriate certification categories. Determine whether display requirements should be included within Receiver certification or whether a separate TrustEd Credential Displayer certification category is needed.

### 2.1 Certification Categorization

TrustEd Credential certification builds upon applicable Open Badges 3.0 certification.

A candidate platform MUST hold current Open Badges 3.0 certification appropriate to the TrustEd Credential certification category for which certification is sought.

[PLACEHOLDER: Confirm the exact Open Badges 3.0 prerequisite certification mapping.]

| TrustEd Credential Certification | Required Open Badges 3.0 Certification |
|---|---|
| TrustEd Credential Issuer | [PLACEHOLDER] |
| TrustEd Credential Receiver | [PLACEHOLDER] |

TrustEd Credential certification does not repeat the full Open Badges 3.0 certification process. It tests the additional requirements and capabilities necessary to support the TrustEd Credential Profile.

### 2.2 The Conformance Process

The process for conformance testing TrustEd Credential implementations includes the following:

1. Launch the 1EdTech Conformance Test Suite for the TrustEd Credential Profile and follow the onscreen instructions.

   [PLACEHOLDER: TrustEd Credential Conformance Test Suite URL]

2. Select the TrustEd Credential certification category or categories for which certification is sought.

3. Complete all required tests for the selected certification category.

4. Submit the test results according to the instructions provided by the conformance test system.

To pass certification:

- The organization MUST meet the applicable 1EdTech membership requirements.
- The candidate platform MUST hold the applicable Open Badges 3.0 certification.
- The candidate platform MUST pass all tests associated with the TrustEd Credential certification category for which certification is sought.
- The tests MUST be completed by a designated representative of the 1EdTech member organization.
- The submitting organization MUST attest that there has been no misrepresentation or manipulation of submitted results.

After 1EdTech reviews and approves the submitted results, the candidate platform may claim certification for the applicable TrustEd Credential certification category.

The 1EdTech Global Certified Products Directory will list the product's applicable TrustEd Credential certification details.

[PLACEHOLDER: Confirm final membership, submission, renewal, and certification-directory language against current 1EdTech certification policy.]

### 2.3 Identifying a TrustEd Credential

A TrustEd Credential MUST identify the applicable TrustEd Credential Profile schema using the `credentialSchema` property.

The schema reference enables a receiving implementation to determine that the credential claims conformance to the TrustEd Credential Profile and to identify the applicable TrustEd Credential Profile version.

The applicable `CredentialSchema` MUST conform to the requirements defined by the TrustEd Credential Profile.

> **Working Group Question:** Confirm that `credentialSchema` is the canonical machine-readable mechanism for:
>
> - identifying that an AchievementCredential claims conformance to the TrustEd Credential Profile; and
> - identifying the applicable TrustEd Credential Profile version.

[PLACEHOLDER: Insert the final TrustEd Credential Profile JSON Schema URI.]

## 3. TrustEd Credential Issuer Conformance

This section is non-normative.

A TrustEd Credential Issuer is an application that enables an issuing organization to create and issue OpenBadgeCredentials conforming to the TrustEd Credential Profile.

The candidate platform MUST demonstrate that it can create and issue a conformant TrustEd Credential.

The candidate platform MUST also demonstrate that a credential that fails TrustEd Credential Profile requirements is not issued or represented as a TrustEd Credential.

A credential that does not satisfy TrustEd Credential Profile requirements MAY be issued as a standard Open Badges 3.0 credential if it otherwise satisfies Open Badges 3.0 requirements.

If the platform permits such issuance, it MUST clearly inform the person issuing the credential that:

- the credential does not meet TrustEd Credential requirements; and
- the credential will be issued as a standard Open Badges 3.0 credential rather than as a TrustEd Credential.

### 3.1 TrustEd Credential Issuer Compliance

The functional capabilities of a TrustEd Credential Issuer are:

- It MUST hold the applicable Open Badges 3.0 certification.
- It MUST support all properties required by the TrustEd Credential Profile.
- It MUST make applicable TrustEd Credential Profile properties required for platform certification available to issuing organizations.
- It MUST support the cardinality defined by the TrustEd Credential Profile.
- It MUST enforce applicable conditional TrustEd Credential Profile requirements.
- It MUST correctly serialize TrustEd Credential metadata.
- It MUST include the applicable TrustEd Credential Profile `credentialSchema` reference.
- It MUST NOT issue or represent a credential as a TrustEd Credential when TrustEd Credential Profile validation fails.
- It MAY issue such a credential as a standard Open Badges 3.0 credential if the user is clearly informed that TrustEd Credential requirements have not been met.

A property that is optional or recommended for inclusion in an individual TrustEd Credential is not necessarily optional for implementation by a certified TrustEd Credential Issuer.

### 3.2 Required TrustEd Credential Data Support

The candidate platform MUST support the additional data requirements defined by the TrustEd Credential Profile.

#### 3.2.1 Achievement

The candidate platform MUST support:

- `achievementType`;
- one or more `alignment` objects;
- `criteria`; and
- one or more `resultDescription` objects.

The value of `achievementType` MUST satisfy the requirements of the TrustEd Credential Profile.

At least one `alignment` MUST be included.

Each required alignment MUST reference an external skills or competency framework using the URI-based mechanism defined by the TrustEd Credential Profile.

The candidate platform MUST support multiple alignment objects.

#### 3.2.2 AchievementCredential

The candidate platform MUST support:

- `awardedDate`; and
- one or more `evidence` objects.

The candidate platform MUST support multiple evidence objects.

#### 3.2.3 AchievementSubject

The candidate platform MUST support one or more `result` objects.

The candidate platform MUST support multiple result objects.

#### 3.2.4 Result

The candidate platform MUST support:

- `resultDescription`; and
- `resultDate`.

If the applicable `ResultDescription` includes `rubricCriterionLevel`, the corresponding `Result` MUST include `achievedLevel` as required by the TrustEd Credential Profile.

### 3.3 Recommended and Optional Property Support

Properties that are RECOMMENDED or OPTIONAL for inclusion in an individual TrustEd Credential MAY nevertheless be required platform capabilities for TrustEd Credential certification.

A certified TrustEd Credential Issuer MUST make the applicable TrustEd Credential Profile capabilities identified for certification available to issuing organizations.

These capabilities include, where applicable:

- assessment information;
- duration and credit information, including `creditsAvailable` and `creditsEarned`;
- endorsements;
- achievement creator information;
- AchievementSubject source information; and
- other TrustEd Credential Profile properties identified by the certification requirements.

An individual credential is not required to include these properties unless required by the TrustEd Credential Profile for that credential or circumstance.

Failure of a candidate platform to support a capability explicitly required for TrustEd Credential platform certification constitutes certification failure.

> **Certification Scope Note:** The requirement to support recommended and optional properties applies to applicable TrustEd Credential Profile certification capabilities. It does not require implementation of every optional property defined anywhere in the complete Open Badges 3.0 data model.

### 3.4 Accreditation Support

The candidate platform MUST support accreditor information as required by the TrustEd Credential Profile using the applicable Open Badges Issuer Accreditation Extension v2.0.

The candidate platform MUST:

- support accreditor information;
- support multiple accreditor organizations; and
- support the TrustEd Credential Profile representation permitted for issuing organizations that are not accredited.

The candidate platform MUST NOT require an issuing organization to provide false accreditation information in order to issue a TrustEd Credential.

### 3.5 TrustEd Credential Issuer Tests

The candidate platform MUST successfully complete the following tests:

1. **Issue a conformant TrustEd Credential.**

   Create a TrustEd Credential containing the required TrustEd Credential Profile data and issue the credential using the candidate platform.

   The resulting credential MUST satisfy the applicable Open Badges 3.0 and TrustEd Credential Profile requirements.

2. **Demonstrate TrustEd Profile identification.**

   Issue a TrustEd Credential containing the applicable TrustEd Credential Profile `credentialSchema`.

3. **Demonstrate required property support.**

   Demonstrate that the candidate platform supports the properties required by the TrustEd Credential Profile.

4. **Demonstrate applicable recommended and optional property support.**

   Demonstrate that the candidate platform makes the TrustEd Credential Profile capabilities required for platform certification available to the issuing organization.

5. **Demonstrate multiple-value support.**

   Demonstrate support for representative properties whose TrustEd Credential Profile cardinality permits multiple values, including alignment, evidence, result, and accreditor information.

6. **Demonstrate failed TrustEd issuance handling.**

   Attempt to issue a credential that does not satisfy one or more required TrustEd Credential Profile requirements.

   The candidate platform MUST NOT issue or represent the credential as a TrustEd Credential.

   The candidate platform MAY:

   - prevent issuance; or
   - allow the credential to be issued as a standard Open Badges 3.0 credential.

   If standard Open Badges 3.0 issuance is permitted, the platform MUST clearly inform the user that TrustEd Credential requirements have not been met and that the credential will not be issued as a TrustEd Credential.

7. **Demonstrate conditional requirement enforcement.**

   Demonstrate that applicable conditional TrustEd Credential requirements are correctly enforced.

   This MUST include the applicable relationship between `rubricCriterionLevel` and `achievedLevel`.

8. **Demonstrate accreditation support.**

   Demonstrate creation of TrustEd Credential data containing applicable accreditation information.

9. **Demonstrate multiple accreditor support.**

   Demonstrate support for more than one accreditor organization.

10. **Demonstrate the non-accredited issuing organization case.**

    Demonstrate creation of a TrustEd Credential for an issuing organization that is not accredited using the representation permitted by the TrustEd Credential Profile.

[PLACEHOLDER: Determine which Issuer tests require automated validation, uploaded artifacts, video evidence, or another certification-evidence mechanism.]

## 4. TrustEd Credential Receiver Conformance

This section is non-normative.

A TrustEd Credential Receiver is an application that receives, validates, stores, processes, transfers, exports, shares, or otherwise consumes OpenBadgeCredentials conforming to the TrustEd Credential Profile.

The candidate platform MUST demonstrate that it recognizes and validates TrustEd Credentials and preserves TrustEd Credential metadata.

The candidate platform MUST distinguish TrustEd Credential Profile conformance from underlying Open Badges 3.0 validity.

### 4.1 TrustEd Credential Receiver Compliance

The functional capabilities of a TrustEd Credential Receiver are:

- It MUST hold the applicable Open Badges 3.0 certification.
- It MUST recognize when a credential claims conformance to the TrustEd Credential Profile.
- It MUST identify the applicable TrustEd Credential Profile version.
- It MUST validate the credential against the applicable TrustEd Credential Profile.
- It MUST process all properties required by the TrustEd Credential Profile.
- It MUST be capable of processing applicable TrustEd Credential Profile recommended and optional properties required for certification when present.
- It MUST support the cardinality defined by the TrustEd Credential Profile.
- It MUST preserve TrustEd Credential metadata during receipt and storage.
- It MUST preserve TrustEd Credential metadata during subsequent export, transfer, or sharing.
- It MUST distinguish Open Badges 3.0 validity from TrustEd Credential Profile conformance.
- It MUST NOT represent a credential as a conformant TrustEd Credential when TrustEd Credential Profile validation fails.

A receiving platform MUST NOT silently discard valid TrustEd Credential metadata solely because the platform does not actively use or display that information.

### 4.2 Validation and TrustEd Credential Status

A certified TrustEd Credential Receiver MUST distinguish among the following conditions.

#### 4.2.1 Invalid Open Badge

The credential fails applicable Open Badges 3.0 validation.

The candidate platform MUST NOT represent the credential as a TrustEd Credential.

#### 4.2.2 Valid Open Badge Without TrustEd Credential Claim

The credential satisfies applicable Open Badges 3.0 requirements but does not identify the TrustEd Credential Profile.

The candidate platform MAY process the credential as a valid Open Badge.

The candidate platform MUST NOT represent the credential as a TrustEd Credential.

#### 4.2.3 Valid Open Badge With Failed TrustEd Credential Conformance

The credential:

- satisfies applicable Open Badges 3.0 requirements;
- claims conformance to the TrustEd Credential Profile; and
- fails one or more applicable TrustEd Credential Profile requirements.

The candidate platform MUST distinguish this condition from an invalid Open Badge.

The candidate platform MUST NOT represent the credential as a conformant TrustEd Credential.

#### 4.2.4 Valid TrustEd Credential

The credential:

- satisfies applicable Open Badges 3.0 requirements;
- identifies the applicable TrustEd Credential Profile; and
- satisfies the applicable TrustEd Credential Profile requirements.

The candidate platform MAY represent the credential as a valid TrustEd Credential.

### 4.3 Data Preservation

A certified TrustEd Credential Receiver MUST preserve the original TrustEd Credential data necessary to maintain credential meaning and conformance.

If the credential is subsequently exported, transferred, or shared, the candidate platform MUST preserve that data without loss or alteration that would cause the credential to fail TrustEd Credential Profile conformance.

Where the TrustEd Credential Profile permits multiple values, the candidate platform MUST preserve the applicable values and their relationships.

A candidate platform is not required to expose every TrustEd Credential property as a native user-interface field, provided that the underlying TrustEd Credential data is preserved.

A subsequent export, transfer, or sharing operation MUST preserve applicable TrustEd Credential metadata and cardinality.

### 4.4 TrustEd Credential Receiver Tests

The candidate platform MUST successfully complete the following tests:

1. **Receive a conformant TrustEd Credential.**

   Receive and validate a conformant TrustEd Credential supplied by the conformance test system.

2. **Receive a valid Open Badge without a TrustEd claim.**

   Receive a valid Open Badges 3.0 credential that does not claim conformance to the TrustEd Credential Profile.

   The candidate platform MUST NOT represent the credential as a TrustEd Credential.

3. **Receive a credential that fails Open Badges validation.**

   The candidate platform MUST identify the credential as invalid and MUST NOT represent it as a TrustEd Credential.

4. **Receive a valid Open Badge that fails TrustEd Credential Profile validation.**

   Receive a credential that satisfies Open Badges 3.0 requirements and claims TrustEd Credential Profile conformance but fails one or more TrustEd Credential Profile requirements.

   The candidate platform MUST distinguish the TrustEd conformance failure from an underlying Open Badges validation failure.

5. **Demonstrate required metadata processing.**

   Demonstrate correct processing of required TrustEd Credential metadata.

6. **Demonstrate applicable recommended and optional metadata processing.**

   Demonstrate that applicable TrustEd Credential Profile metadata required for receiver certification is processed and preserved when present.

7. **Demonstrate multiple-value support.**

   Demonstrate correct processing and preservation of representative TrustEd Credential properties whose cardinality permits multiple values.

8. **Demonstrate accreditation processing.**

   Demonstrate correct processing and preservation of accreditation information, including multiple accreditors and the permitted non-accredited issuing organization case.

9. **Demonstrate TrustEd Credential preservation.**

   Receive and store a conformant TrustEd Credential and subsequently export, transfer, or share it.

   The resulting credential MUST preserve applicable TrustEd Credential metadata and MUST remain conformant to the applicable TrustEd Credential Profile.

[PLACEHOLDER: Determine which Receiver tests require automated validation, uploaded artifacts, video evidence, or another certification-evidence mechanism.]

## 5. TrustEd Credential Displayer Conformance

> **Working Group Question:** Determine whether a separate TrustEd Credential Displayer certification category is required or whether applicable display requirements should be incorporated into TrustEd Credential Receiver certification.

If a separate TrustEd Credential Displayer certification category is adopted, this section should define requirements for applicable capabilities such as:

- recognizing TrustEd Credential status;
- distinguishing TrustEd Credentials from standard Open Badges;
- distinguishing failed TrustEd Credential conformance from invalid Open Badges;
- presenting applicable TrustEd Credential metadata;
- presenting verification status; and
- presenting applicable achievement, alignment, criteria, evidence, result, assessment, endorsement, and accreditation information.

[PLACEHOLDER: Remove this section if display requirements are incorporated into Receiver certification.]

## 6. Implementation Guidance and Certification

The Open Badges TrustEd Credential Profile Implementation Guide provides non-normative recommended practices for populating TrustEd Credential metadata to improve transparency, portability, machine readability, interoperability, and trust.

The Implementation Guide does not independently define TrustEd Credential Profile conformance.

Certification tests MAY use recommendations from the Implementation Guide to:

- construct representative test data;
- provide implementation guidance;
- provide warnings or explanatory messages; and
- demonstrate recommended implementation patterns.

Failure to follow a recommendation contained only in the Implementation Guide MUST NOT result in certification failure unless that requirement is explicitly identified as normative for the applicable certification category in this Conformance and Certification Guide or the TrustEd Credential Profile.

## 7. Working Group Questions

This section is non-normative and should be removed before final publication once all questions are resolved.

### 7.1 TrustEd Credential Profile Identification

Confirm that `credentialSchema` is the canonical machine-readable mechanism for:

- identifying that an AchievementCredential claims conformance to the TrustEd Credential Profile; and
- identifying the applicable TrustEd Credential Profile version.

### 7.2 Certification Categories

Confirm that the initial TrustEd Credential certification categories are:

- TrustEd Credential Issuer; and
- TrustEd Credential Receiver.

Determine whether display requirements should be included within Receiver certification or whether a separate TrustEd Credential Displayer certification category is required.

### 7.3 Open Badges 3.0 Certification Prerequisites

Define the exact Open Badges 3.0 certification prerequisite or prerequisites for:

- TrustEd Credential Issuer certification; and
- TrustEd Credential Receiver certification.

### 7.4 Certification Evidence

Determine which TrustEd Credential certification tests require:

- automated conformance testing;
- credential artifact submission;
- video demonstration;
- attestation; or
- another form of certification evidence.

## 8. Items to Complete Before Publication

This section is non-normative and should be removed before final publication.

- [ ] Confirm the valid `.microsite` category.
- [ ] Confirm the final document shortcode.
- [ ] Confirm the final TrustEd Credential Profile JSON Schema URI.
- [ ] Confirm the TrustEd Credential Conformance Test Suite URL.
- [ ] Confirm the exact Open Badges 3.0 prerequisite certification mapping.
- [ ] Confirm final certification membership and submission language.
- [ ] Confirm certification evidence requirements.
- [ ] Confirm whether separate Displayer certification is required.
- [ ] Resolve the `credentialSchema` Working Group Question.
- [ ] Add final normative and informative reference URLs.
- [ ] Add contributors.
- [ ] Remove Working Group Questions and publication placeholders as decisions are finalized.

## References

### Normative References

[RFC2119]
: *Key words for use in RFCs to Indicate Requirement Levels*. S. Bradner. IETF. March 1997.

[OB-30]
: *Open Badges Specification v3.0*. 1EdTech Consortium.
  [PLACEHOLDER: canonical URL]

[OB-TC-10]
: *Open Badges TrustEd Credential Profile v1.0*. 1EdTech Consortium.
  [PLACEHOLDER: canonical URL]

[OB-TC-SCHEMA-10]
: *Open Badges TrustEd Credential Profile JSON Schema v1.0*. 1EdTech Consortium.
  [PLACEHOLDER: canonical URL]

[OB-ACCRED-20]
: *Open Badges Issuer Accreditation Extension v2.0*. 1EdTech Consortium.
  [PLACEHOLDER: canonical URL]

### Informative References

[OB-CERT-30]
: *Open Badges Specification Conformance and Certification Guide v3.0*. 1EdTech Consortium.
  https://www.imsglobal.org/spec/ob/v3p0/cert/

[OB-TC-IMPL-10]
: *Open Badges TrustEd Credential Profile Implementation Guide*. 1EdTech Consortium.
  [PLACEHOLDER: canonical URL]

[VC-DATA-MODEL-20]
: *Verifiable Credentials Data Model v2.0*. W3C.
  [PLACEHOLDER: canonical URL]