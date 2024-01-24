# Context

OB 3.0 context file uses a versioning as a result of https://github.com/1EdTech/openbadges-specification/issues/497. This document recaps the changes made to this file

## Changelog

### 3.0.3

- `@id` of `image` in `Achievement` now points to `https://purl.imsglobal.org/spec/vc/ob/vocab.html#image`
- `@id` of `achievement` in `AchievementSubject` now points to `https://purl.imsglobal.org/spec/vc/ob/vocab.html#achievement`
- `@id` of `image` in `AchievementSubject` now points to `https://purl.imsglobal.org/spec/vc/ob/vocab.html#image`
- `@id` of `image` in `Profile` now points to `https://purl.imsglobal.org/spec/vc/ob/vocab.html#image`
- Removed `image` attribute

### 3.0.2

- Added `@protected` to all `@context`.
- `"@type": "xsd:string"`` was removed where it appears. This is the default type, but in rare cases, processing systems handle an explicit declaration of this type differently from allowing the default. For VCs, it is considered more reliable to just allow the default to be applied.
- `id` and `type`` aliases are redeclared in every context. This avoids a narrow type of attack where somebody might place a context that redeclares these terms in between the top layer and a class-specific layer of a credential, changing the values of these terms within the class implementation.
- Changed `@container` of `allowedValue` from `@set` to `@list`, as `allowedValue` is an ordered list.
-`@id` of `image` now points to `https://purl.imsglobal.org/spec/vc/ob/vocab.html#Image`. This prevent a redefinition of the term, since its previous value was incorrectly equals to `Achievement.image`.

### 3.0.1

- Fixed `Achievement`'s `creator` IRI. Now points to `https://purl.imsglobal.org/spec/vc/ob/vocab.html#creator`
- Fixed `AchievementSubject`'s `achievement` IRI. Now points to `https://purl.imsglobal.org/spec/vc/ob/vocab.html#achievement-0`
- Fixed `Profiles`'s `phone` IRI. Now points to `https://purl.imsglobal.org/spec/vc/ob/vocab.html#phone`
- Added `image` attribute to `Achievement`.
- Removed `@type` from `alignment`. This fixes a compaction error.
- Removed `@type` from `otherIdentifier`. This fixes a compaction error.
- Removed `@type` from `Achievement`'s `resultDescription`. This fixes a compaction error.
- Removed `@type` from `AchievementSubject`'s `identifier`. This fixes a compaction error.
- Added `image` attribute to `AchievementSubject`.
- Removed `@type` from `AchievementSubject`'s `result`. This fixes a compaction error.
- Fixed `@type` from `AchievementSubject`'s `source`. This fixes a compaction error.
- Removed `@type` from `ResultDescription`'s `rubricCriterionLevel`. This fixes a compaction error.
- Removed `@type` from `endorsement`. This fixes a compaction error.
- Added `image` attribute to `Profile`.
- Fixed `Profile`'s `address` IRI. Now points to `https://purl.imsglobal.org/spec/vc/ob/vocab.html#address`
- Removed `@type` from `Achievement`'s `related`. This fixes a compaction error.
- Added `type` attribute to `Profile`s `address`. This fixes a compaction error.
- Fixed `type` attribute of `Profile`s `parentOrg`.
- Fixed `type` attribute of `Image`.
- Fixed `@id` attribute of `Alignment`. Now points to `https://schema.org/AlignmentObject`.


