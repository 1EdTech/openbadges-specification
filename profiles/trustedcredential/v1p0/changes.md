var changes=`

## Changes to Open Badges 3.0 Specification

### Summary of Changes
The TrustEd Credential Profile defines additional requirements and guidance for the use of existing Open Badges 3.0 properties to support consistent representation of credential quality and achievement. This includes structured use of achievementType to distinguish knowledge and application credentials, and strengthened expectations for properties such as criteria, alignment, result, and evidence.

The profile also introduces guidance for representing assessment information, including use of rubrics, validated assessments, and outcome data, as well as expectations for accreditation and endorsement metadata. These changes enhance clarity, comparability, and interoperability while remaining fully compatible with the core OB3 specification.

### TrustEd Credential Profile Requirements

#### Achievement Type
- A TrustEd Credential MUST include <code>achievementType</code>.
- The value MUST distinguish between Knowledge and Application credentials.

#### Skills and Framework Alignment
- A TrustEd Credential MUST include at least one <code>alignment</code>.
- The alignment MUST reference an external skills framework via URI.

#### Evidence
- A TrustEd Credential MUST include at least one <code>evidence</code> object.

#### Result
- A TrustEd Credential MUST include a <code>result</code>.
- If <code>resultDescription.rubricCriterionLevel</code> is present, <code>result.achievedLevel</code> MUST be included.

#### Criteria
- A TrustEd Credential MUST include <code>criteria</code> as either a URI or narrative.

#### Assessment
- Assessment information SHOULD be provided.
- When present, it SHOULD follow OBEE assessment structures.

#### Duration
- Duration information SHOULD be included using <code>creditsAvailable</code> and/or <code>creditsEarned</code>.

#### Endorsement
- Endorsements SHOULD be included where applicable.

#### Accreditor
- Accreditor information MUST be included when available.
- If not available, the field MAY be empty.

`;
