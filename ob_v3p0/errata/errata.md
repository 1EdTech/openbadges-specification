## Errata for Open Badges 3.0 Specification

### Context file

The context file for Open Badges 3.0 follows a versioning as a result of https://github.com/1EdTech/openbadges-specification/issues/497. All changes to this file that may lead to invalid signatures and errors (breaking changes) must lead to a new version of the file.

#### What constitutes a breaking change

The policy used to determine what constitutes breaking changes to the specification, and therefore to the context file, can be summarized as:

- Adding new terms to the model/context *is not* a breaking change.
- Changing term mappings or removing terms *is* a breaking change.

This policy implies that a downstream consumer must be willing to be forgiving on the data they receive: they must be willing/capable of ignoring terms they don't currently understand.

An example for this could be the change *"add the term 'identifier' to the CLR context where it may appear in nodes of type 'ClrSubject'"*. Let's look at how an issuer and a verifier of a ClrCredential might need to understand or react to this change:

> As an issuer of ClrCredentials, if you previously included identifier at this level, it had been dropped upon any JSON-LD processing operation. No change is needed to your system, but now the term will not be dropped by consumers (or by your cryptographic signing library) anymore. Bug fixed.

> As a consumer of ClrCredentials, now when I verify a ClrCredential where the issuer had included an identifier for the user at this level, it will now show up, whereas previously it would not have appeared if any JSON-LD operation had been done on the data. No other change to software is necessary.

According to this policy, this section recaps all the changes made to the context file which constitute a breaking change, and therefore, a new version of the file.

<div class="note">
Previous versions of the context file will remain accessible, in order to keep backwards compatibility with existing credentials. However, it's recommended to refer to the newest version of the file.
</div>

#### version 3.0.2
- Changed `@container` of `allowedValue` from `@set` to `@list`, as `allowedValue` is an ordered list.

#### version 3.0.1

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
