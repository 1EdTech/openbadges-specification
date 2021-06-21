# Open Badges 2.0 VC Package Specification

This is a change for [Open Badges](https://www.imsglobal.org/activity/digital-badges).

This packaging specification describes how to represent an OB 2.0 data model in a W3C Verifiable Credential.

<!--- Temporary Setup-only Section --->
# Extension folder setup process

  - [x] Free space
  - [ ] Name the service/message/extension: `Proper Project Name`
  - [ ] Create a short name/code name: `proper-project`
  - [ ] Copy `proposals/a-template` directory to a new directory with the short name `proposals/proper-project`
  - [ ] In new proposal directory find & replace: `ProperProjectName` with the actual name
  - [ ] In new proposal directory find & replace: `ShortProjectName` with the actual short name
  - [ ] Add a short description of the proposal at the top of this readme
  - [ ] Update this readme with other details as needed
  - [ ] Update the table in `proposals/readme.md` with the snippet below this checklist
  - [ ] (process decision needed) - See `GitHub Workflow Decisions below`
  - [ ] Delete this setup section and move onto work steps :)

## Proposal readme table row

```md
| [ProperProjectName](https://github.com/IMSGlobal/openbadges-specification/tree/develop/proposals/ShortProjectName/specification.md) | Proposal | _Very_ short description |
```
<!--- End Setup Section --->

## Documents

- [The ProperProjectName Specification](specification.md)

### Current Status

Proposal

## Process

### Work steps

  - Update `specification.md` with the proposal
  - Push changes to feature branch `ShortProjectName` as appropriate
  - Discuss with Open Badges workgroup
  - Tag issues with `ShortProjectName`
  - Do work
  - GOTO 1

### Documentation finalization steps

- [ ] Update `respec-support/contributors.js`
- [ ] Update `respec-support/local-biblio.js`
- [ ] Access respec document via `respec-support/specification-wrapper.html` (needs web server to work properly)
- [ ] Clean up any respec errors in `specification.md` ([common markdown problems in respec](https://github.com/IMSGlobal/spec-central/blob/master/markdown-notes.md))
- [ ] Make sure the final respec formatting and structure works well for `specification.md`

