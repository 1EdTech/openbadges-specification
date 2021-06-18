# Open Badges 3.0

This is a change for [Open Badges](https://www.imsglobal.org/activity/digital-badges).

Proposed version change to Open Badges to 1) use the W3C Verifiable Credentials data model  in place of 2.0 verification model, 2) add properties that align with CLR such as AchievementType and ResultDescriptions, 3) add properties to allow for badge creator to be distinguished from badge issuer and convey allowed issuers for situations when the creator and the issuer(s) are not the same entity, 4) introduce the concept of a verifiable skill assertion.

<!--- Temporary Setup-only Section --->
# Extension folder setup process

  - [x] Free space
  - [x] Name the service/message/extension: `Open Badges 3.0`
  - [x] Create a short name/code name: `OBv3p0`
  - [x] Copy `proposals/a-template` directory to a new directory with the short name `proposals/OBv3p0`
  - [x] In new proposal directory find & replace: `ProperProjectName` with the actual name
  - [x] In new proposal directory find & replace: `ShortProjectName` with the actual short name
  - [x] Add a short description of the proposal at the top of this readme
  - [x] Update this readme with other details as needed
  - [x] Update the table in `proposals/readme.md` with the snippet below this checklist
  - [ ] (process decision needed) - See `GitHub Workflow Decisions below`
  - [ ] Delete this setup section and move onto work steps :)

## Proposal readme table row

```md
| [ProperProjectName](https://github.com/IMSGlobal/openbadges-specification/tree/develop/proposals/OBv3p0/specification.md) | Proposal | Open Badges 3.0 |
```
<!--- End Setup Section --->

## Documents

- [The Open Badges 3.0 Specification](specification.md)

### Current Status

Proposal

## Process

### Work steps

  - Update `specification.md` with the proposal
  - Push changes to feature branch `OBv3p0` as appropriate
  - Discuss with Open Badges workgroup
  - Tag issues with `OBv3p0`
  - Do work
  - GOTO 1

### Documentation finalization steps

- [ ] Update `respec-support/contributors.js`
- [ ] Update `respec-support/local-biblio.js`
- [ ] Access respec document via `respec-support/specification-wrapper.html` (needs web server to work properly)
- [ ] Clean up any respec errors in `specification.md` ([common markdown problems in respec](https://github.com/IMSGlobal/spec-central/blob/master/markdown-notes.md))
- [ ] Make sure the final respec formatting and structure works well for `specification.md`
