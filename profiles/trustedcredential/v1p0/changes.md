---
title: "Changes"
docType: "segment"
status: "PublicCandidateFinal"
author: "1Edtech Consortium"
lastUpdated: 2026-11-12
description: "Changes for TrustEd Credential 1.0 Profile"
---

## Changes to Open Badges 3.0 Specification

### Summary of Changes

The TrustEd Credential Profile defines additional requirements and guidance for the use of existing Open Badges 3.0 properties to support consistent representation of credential quality and achievement. This includes structured use of `achievementType` to describe the nature of the achievement, and strengthened expectations for properties such as criteria, alignment, result, and evidence.

The profile also introduces guidance for representing assessment information, including use of rubrics, validated assessments, and outcome data, as well as expectations for accreditation and endorsement metadata. These changes enhance clarity, comparability, and interoperability while remaining fully compatible with the core OB3 specification.

### Changes to the Data Model

This profile specializes the Open Badges 3.0 Data model by defining a set of changes, mainly modifying the cardinality of some properties to make them required.

#### Changes to Achievement

The existing following optional properties in [Achievement](#org.1edtech.ob.v3p0.achievement.class) are MANDATORY:

- `achievementType`
- `alignment`
- `resultDescription`

The value of `achievementType` MUST identify the nature of the achievement using the Open Badges 3.0 `achievementType`vocabulary or another conformant term from an allowed extensible vocabulary.

#### Changes to AchievementCredential

The existing following optional properties in [AchievementCredential](#org.1edtech.ob.v3p0.achievementcredential.class) are MANDATORY:

- `awardedDate`
- `evidence`

#### Changes to AchievementSubject

The existing following optional properties in [AchievementSubject](#org.1edtech.ob.v3p0.achievementsubject.class) are MANDATORY:

- `result`

#### Changes to Result

The existing following optional properties in [Result](#org.1edtech.ob.v3p0.result.class) are MANDATORY:

- `resultDescription`.

A new property in [Result](#org.1edtech.ob.v3p0.result.class) \'resultDate\' is MANDATORY

### TrustEd Credential Profile Requirements

#### Achievement Type

- A TrustEd Credential MUST include `achievementType`.
- The value MUST identify the nature of the achievement using the Open Badges 3.0 achievementType vocabulary or another conformant term from an allowed extensible vocabulary.

#### Skills and Framework Alignment

- A TrustEd Credential MUST include at least one `alignment`.
- Each alignment MUST reference an external skills framework via URI.

#### Evidence

- A TrustEd Credential MUST include at least one `evidence` object.

#### Result

- A TrustEd Credential MUST include a `result`.
- A TrustEd Credential MUST include `result.resultDate`.
- If `resultDescription.rubricCriterionLevel` is present, `result.achievedLevel` MUST be included.

#### Criteria

- A TrustEd Credential MUST include `criteria` as either a URI or narrative.

#### Assessment

- Assessment information SHOULD be provided.
- When present, it SHOULD follow OBEE assessment structures.

#### Duration

- Duration information SHOULD be included using `creditsAvailable` and/or `creditsEarned`.

#### Endorsement

- Endorsements SHOULD be included where applicable.

#### Accreditor

- Accreditor information MUST be included using the applicable [[[!OB-ACCRED-20]]] for accreditor information.
- The accreditor property MUST support multiple accreditor organizations.
- Organizations that are not accredited MAY include an empty list of accreditors.

#### JSON Schema

- A TrustEd Credential MUST include a `credentialSchema` entry with `id` `https://purl.1edtech.org/spec/ob/v3p0/obtc/v1p0/schema/json/ob_v3p0_obtc_v1p0_achievementcredential-jsonschema1.json` and `type` `1EdTechJsonSchemaValidator2019`.

```json
"credentialSchema": [
  {
    "id": "https://purl.1edtech.org/spec/ob/v3p0/obtc/v1p0/schema/json/ob_v3p0_obtc_v1p0_achievementcredential-jsonschema1.json",
    "type": "1EdTechJsonSchemaValidator2019"
  }
]
```

### JSON-LD Context

Because `resultDate` is not defined in the Open Badges 3.0 JSON-LD context, this profile publishes an additional JSON-LD context that defines it. The URL of this context is listed in the Resources section of this document.

- A TrustEd Credential MUST include this context in its `@context` array, after the Open Badges 3.0 context.
- Without it, `resultDate` is an undefined term and the credential will fail JSON-LD processing, including Data Integrity proof verification.

Because the `1EdTechJsonSchemaValidator2019` type required by the [JSON Schema](#data-model) requirement is defined in the Open Badges 3.0 extensions context, a TrustEd Credential MUST also include `https://purl.imsglobal.org/spec/ob/v3p0/extensions.json` in its `@context` array.

```json
"@context": [
  "https://www.w3.org/ns/credentials/v2",
  "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json",
  "https://purl.imsglobal.org/spec/ob/v3p0/extensions.json",
  "https://purl.1edtech.org/spec/ob/v3p0/obtc/v1p0/context.json"
]
```
