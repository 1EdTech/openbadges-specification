# Open Badges Next Use Cases

This document contains use cases submitted by the members of the Open Badges Workgroup for consideration in the next
version of the Open Badges Specification. Each use case contains a title, user stories and/or information about a
specific problem or opportunity, information about the motivation or importance, and a description of a
specification-level capability or restriction that could serve the use case when implemented in the ecosystem. New use
cases may be submitted by pull request. All information submitted must be compatible with IMS Global intellectual
property rights policies for open implementation of specifications resulting from the contribution.

When the next version of the specification is assigned a version number and drafted as draft documents, selected use
cases from this document will be incorporated, and this document will be deleted.

## Describe a Rubric in a Badgeclass and associated Results in an Assertion
As an Issuer, I would like to augment a BadgeClass with a Rubric, which is a matrix of Rubric Criteria and Performance
Levels at which learners or recipients may be expected to perform.

I would like to augment an Assertion of a BadgeClass that features a Rubric with a Result, which describes how a
particular learner or recipient performed in terms of an achieved Performance Level for one or more Rubric Criteria in
the BadgeClass that this Assertion recognizes.

The related Comprehensive Learner Record specification added the concept of
[ResultDescription](https://www.imsglobal.org/sites/default/files/spec/clr/v1p0/InfoModel/clr_InfoModel.html#Data_ResultDescription)
and [Result](https://www.imsglobal.org/sites/default/files/spec/clr/v1p0/InfoModel/clr_InfoModel.html#Data_Result) to
CLR Achievements (BadgeClass) and Assertions, respectively. This concept is a natural fit with the matching Open Badges
classes and could be imported into the Open Badges Specification to enable badge issuers to describe the available
performance levels that assessments may recognize for a BadgeClass and the performance levels particular learners
achieved. Each ResultDescription has an identifier that is unique within the BadgeClass, and each Result in the
Assertion identifies which ResultDescription it applies to and which achievedLevel applies.

This introduces the concept that an assertion may recognize an achievement that has not yet "passed" a threshold
"required level". The mere existence of an Assertion may no longer be enough to recognize that the Issuer's desired
criteria have been met to the full satisfaction of the Issuer, only that at least some progress toward those criteria
was made. This may pose complications with systems whose existing logic relies on the existence of an assertion.
Specific guidance for interpretation by inspectors or consumers should be provided in the specification for how such
assertions should be interpreted.

The value of incorporating Rubrics into Open Badges comes from the ability to better describe achievement at a more
granular level. This potentially results in capabilities like understanding how an individual's skill has improved over
time across multiple Assertions of the same BadgeClass. Additionally, application forms and assessment forms within
applications that serve issuers might be automatically generated from Rubric data.
