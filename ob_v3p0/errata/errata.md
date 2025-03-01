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

#### version 3.0.3
- `@id` of `image` in `Achievement` now points to `https://purl.imsglobal.org/spec/vc/ob/vocab.html#image`
- `@id` of `achievement` in `AchievementSubject` now points to `https://purl.imsglobal.org/spec/vc/ob/vocab.html#achievement`
- `@id` of `image` in `AchievementSubject` now points to `https://purl.imsglobal.org/spec/vc/ob/vocab.html#image`
- `@id` of `image` in `Profile` now points to `https://purl.imsglobal.org/spec/vc/ob/vocab.html#image`

#### version 3.0.2
- Added `@protected` to all `@context`.
- `"@type": "xsd:string"`` was removed where it appears. This is the default type, but in rare cases, processing systems handle an explicit declaration of this type differently from allowing the default. For VCs, it is considered more reliable to just allow the default to be applied.
- `id` and `type`` aliases are redeclared in every context. This avoids a narrow type of attack where somebody might place a context that redeclares these terms in between the top layer and a class-specific layer of a credential, changing the values of these terms within the class implementation.
- Changed `@container` of `allowedValue` from `@set` to `@list`, as `allowedValue` is an ordered list.
-`@id` of `image` now points to `https://purl.imsglobal.org/spec/vc/ob/vocab.html#Image`. This prevent a redefinition of the term, since its previous value was incorrectly equals to `Achievement.image`.

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
- Added `awardedDate` attribute to `VerifiableCredential`.

### Proofs (Signatures)

The section about Linked Data Proof Format previously defined a format and
algorithm to use in Open Badges. Concretely, it stated:

> In order to opt for this format you MUST use the [[[VC-DI-EDDSA]]] suite.

This statement may not follow the security requirements of the future as
the securing mechanisms evolve over time. Therefore, the especific list of
allowed proof format have been extracted out the [[[OB-CERT-30]]].