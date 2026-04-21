var changes=`

## Changes to Open Badges 3.0 Specification

### Summary of Changes

The TrustEd Credential Profile defines additional requirements and guidance for the use of existing Open Badges 3.0 properties to support consistent representation of credential quality and achievement. This includes structured use of achievementType to distinguish knowledge and application credentials, and strengthened expectations for properties such as criteria, alignment, result, and evidence.

The profile also introduces guidance for representing assessment information, including use of rubrics, validated assessments, and outcome data, as well as expectations for accreditation and endorsement metadata. These changes enhance clarity, comparability, and interoperability while remaining fully compatible with the core OB3 specification.

### Changes to the Data Model

This profile specializes the Open Badges 3.0 Data model by defining a set of changes, mainly
modifying the cardinality of some properties to make them required.

#### Changes to Achievement

The existing following optional properties in [Achievement](#achievement) are MANDATORY:

- \`achievementType\`
- \`alignment\`
- \`resultDescription\`

#### Changes to AchievementCredential

The existing following optional properties in [AchievementCredential](#achievementcredential) are MANDATORY:

- \`awardedDate\`
- \`evidence\`

#### Changes to AchievementSubject

The existing following optional properties in [AchievementSubject](#achievementsubject) are MANDATORY:

- \`result\`

#### Changes to Result

The existing following optional properties in [Result](#result) are MANDATORY:

- \`resultDescription\`

### TrustEd Credential Profile Requirements

#### Achievement Type

- A TrustEd Credential MUST include \`achievementType\`.
- The value MUST distinguish between Knowledge and Application credentials.

#### Skills and Framework Alignment

- A TrustEd Credential MUST include at least one \`alignment\`.
- The alignment MUST reference an external skills framework via URI.

#### Evidence

- A TrustEd Credential MUST include at least one \`evidence\` object.

#### Result

- A TrustEd Credential MUST include a \`result\`.
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

- Accreditor information MUST be included when available.
- If not available, the field MAY be empty.

`;
