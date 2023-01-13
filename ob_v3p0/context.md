# Context

OB 3.0 context file uses a versioning as a result of https://github.com/1EdTech/openbadges-specification/issues/497. This document recaps the changes made to this file

## Changelog

### 3.0.1

- Fixed `Achievement`'s `creator` IRI. Now points to `https://purl.imsglobal.org/spec/vc/ob/vocab.html#creator`
- Fixed `AchievementSubject`'s `achievement` IRI. Now points to `https://purl.imsglobal.org/spec/vc/ob/vocab.html#achievement-0`
- Fixed `Profiles`'s `phone` IRI. Now points to `https://purl.imsglobal.org/spec/vc/ob/vocab.html#phone`
- Added `image` attribute to `Achievement`.
- Removed `@type` from `alignment`. This fixes a compaction error.
- Removed `@type` from `otherIdentifier`. This fixes a compaction error.
- Removed `@type` from `Achievement`'s `resultDescription`. This fixes a compaction error.
- Removed `@type` from `AchievementSubject`'s `identifier`. This fixes a compaction error.