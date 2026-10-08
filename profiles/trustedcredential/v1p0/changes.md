---
title: "Changes"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-12
description: "Changes for TrustEd Credential 1.0 Profile"
---

## Changes to Open Badges 3.0 Specification

### Summary of Changes

The TrustEd Credential Profile defines additional requirements and guidance for the use of existing Open Badges 3.0 properties to support consistent representation of credential quality and achievement. This includes structured use of \`achievementType\` to describe the nature of the achievement, and strengthened expectations for properties such as criteria, alignment, result, and evidence.

The profile also introduces guidance for representing assessment information, including use of rubrics, validated assessments, and outcome data, as well as expectations for accreditation and endorsement metadata. These changes enhance clarity, comparability, and interoperability while remaining fully compatible with the core OB3 specification.

### Changes to the Data Model

This profile specializes the Open Badges 3.0 Data model by defining a set of changes, mainly modifying the cardinality of some properties to make them required.

#### Changes to Achievement

The existing following optional properties in [Achievement](#achievement) are MANDATORY:

- \`achievementType\`
- \`alignment\`
- \`resultDescription\`

The value of \`achievementType\` MUST identify the nature of the achievement using the Open Badges 3.0 \`achievementType\`vocabulary or another conformant term from an allowed extensible vocabulary.

#### Changes to AchievementCredential

The existing following optional properties in [AchievementCredential](#achievementcredential) are MANDATORY:

- \`awardedDate\`
- \`evidence\`

#### Changes to AchievementSubject

The existing following optional properties in [AchievementSubject](#achievementsubject) are MANDATORY:

- \`result\`

#### Changes to Result

The existing following optional properties in [Result](#result) are MANDATORY:
A new property in [Result](#result) \'resultDate\' is MANDATORY

- \`resultDescription\`

### TrustEd Credential Profile Requirements

#### Achievement Type

- A TrustEd Credential MUST include \`achievementType\`.
- The value MUST identify the nature of the achievement using the Open Badges 3.0 achievementType vocabulary or another conformant term from an allowed extensible vocabulary.

#### Skills and Framework Alignment

- A TrustEd Credential MUST include at least one \`alignment\`.
- Each alignment MUST reference an external skills framework via URI.

#### Evidence

- A TrustEd Credential MUST include at least one \`evidence\` object.

#### Result

- A TrustEd Credential MUST include a \`result\`.
- A TrustEd Credential MUST include \`result.resultDate\`.
- If \`resultDescription.rubricCriterionLevel\` is present, \`result.achievedLevel\` MUST be included.

#### Criteria

- A TrustEd Credential MUST include \`criteria\` as either a URI or narrative.

#### Assessment

- Assessment information SHOULD be provided.
- When present, it SHOULD follow OBEE assessment structures.

#### Duration

- Duration information SHOULD be included using \`creditsAvailable\` and/or \`creditsEarned\`.

#### Endorsement

- Endorsements SHOULD be included where applicable.

#### Accreditor

- Accreditor information MUST be included using the applicable [Open Badges Issuer Accreditation Extension version 2.0](https://www.imsglobal.org/spec/ob-accred/v2p0/) for accreditor information.
- The accreditor property MUST support multiple accreditor organizations.
- Organizations that are not accredited MAY include an empty list of accreditors.
