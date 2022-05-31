# Open Badges 3.0

This version aligns 1EdTech Open Badges Specification to the conventions of the [W3C Verifiable Credentials Data Model](https://w3c.github.io/vc-data-model/) for the use cases of Defined Achievement Claim and a Skill Claim.

This consists of several specific proposed changes to Open Badges to:

1. use the W3C Verifiable Credentials data model for assertion format, using a `schema:hasCredential` claim to link the credential subject to the defined achievement that they have earned.
2. introduce conventions for using Decentralized Identifiers (DIDs) for issuer and/or recipient identification.
3. add properties to allow for the issuer of an Assertion/Credential issuer to be a separate entity from the BadgeClass creator, where the creator may define eligibility for issuers.
4. add properties that align with CLR such as [AchievementType](https://purl.imsglobal.org/spec/clr/v1p0/context/clr_v1p0.html#dtExtensibleAchievementType) and [ResultDescription](https://purl.imsglobal.org/spec/clr/v1p0/context/clr_v1p0.html#dtResultDescription).
5. introduce the complementary use case of a skill assertion.

The credentials that would be produced under this proposal could easily be bundled into Comprehensive Learner Records and Verifiable Presentations. Portability and learner data privacy may be improved by expanding the usage of cryptographic proofs/signatures, because this format will be compatible with a growing array of proof schemas that are developed for the Verifiable Credentials Data Model.

[Reading List](readinglist.md) - This reading list has links to resources about Verifiable Credentials.

## Base Document Workflow

Currently, all content is being collected in a single Respec document: [http://imsglobal.github.io/openbadges-specification/ob_v3p0.html](http://imsglobal.github.io/openbadges-specification/ob_v3p0.html). This document is assembled from many sources:

- [Main Respec File](ob_v3p0.html) which pulls in (transcludes) section files such as:
  - [Abstract](abstract.md)
  - [Introduction](introduction.md)
  - [Overview](overview.md)
  - [Serialization](serialization.md)
  - [Certification Requirements](certification.md)
  - etc

- The Data Model sections are created by a custom 1EdTech Respec plug-in that reads the data model from the MPS (Model Processing Service) and renders the Respec HTML
- The API (Service Model) section will be created in the same way in the future. Currently the API section is pulled in from [api.html](api.html)
- As the spec nears Candidate Final status, we will likely split up the single document into 2 or more documents for more focussed sets of audiences

### Artifacts

JSON Schema, OpenAPI, and maybe even context files will also be generated in the future. But for now the context file is [hand written](context.json) and available at [http://imsglobal.github.io/openbadges-specification/context.json](http://imsglobal.github.io/openbadges-specification/context.json).

### Updating the Base Document

Every commit and PR merge to the develop branch/ob_v3p0 folder will kick off a GitHub action that will:

1. Sideload (update) the data model into the MPS from the [ob_v3p0.lines](ob_v3p0.lines) file
2. Render the ob_v3p0.html file
3. Export the rendered file to [http://imsglobal.github.io/openbadges-specification/ob_v3p0.html](http://imsglobal.github.io/openbadges-specification/ob_v3p0.html)

That process takes 1-2 minutes.

## Regenerating the context file

Every commit and PR merge to the develop branch/ob_v3p0/context.json file will kick off a GitHub action that will:

1. Copy the file to [https://imsglobal.github.io/openbadges-specification/context.json](https://imsglobal.github.io/openbadges-specification/context.json)

The context file will eventually live on the 1EdTech PURL server. But please use https://imsglobal.github.io/openbadges-specification/context.json for now.

### Editing the .lines files

The data model is defined using "lines" files. There are two "lines" files in this repo:

1. [ob_v3p0.lines](ob_v3p0.lines) - This file establishes the Model name, version, description; defines classes that are unique to Open Badges (i.e. not shared with the CLR standard); and Includes or Transcludes shared data classes.
2. [common_credentials.lines](common_credentials.lines) - This file defines the credential classes that ARE shared by the Open Badges and CLR standards. Any changes made to this file will appear in both the OB and CLR standards.

The format for "lines" files is explained in [lines.md](lines.md).

1EdTech provides a tool to update the data model in the MPS and browse the data model in a web page. This tool makes it fairly easy to detect errors prior to updating the Base Document.

To load your local changes to [ob_v3p0.lines](ob_v3p0.lines) into the browser, simply upload the file to MPS.

To load your local changes to [common_credentials.lines](common_credentials.lines) into the browser, push your changes to origin. This will kick off the action that updates the model in the MPS browser.

#### Validating examples

In addition to rendering a normative data model, the plugin can also validate examples against the JSON Schema for the example. Any schema errors will be displayed in the rendered example. You can request schema validation by decorating the example with a `data-schema` attribute where the value is the `id` of the class.

```html
<pre class="json example" data-schema="org.1edtech.ob.v3p0.achievementcredential.class"
  title="Sample assertion credential">
  {
    "@context": [
      "https://www.w3.org/2018/credentials/v1",
      "https://www.w3.org/2018/credentials/examples/v1",
      "https://imsglobal.github.io/openbadges-specification/context.json"
    ],
    "id": "http://example.edu/credentials/3732",
    "type": ["VerifiableCredential", "OpenBadgeCredential"],
    "issuer": {
      "id": "https://example.edu/issuers/565049",
      "type": "IssuerProfile",
      "name": "Example University"
    },
    "issuanceDate": "2010-01-01T00:00:00Z",
    "credentialSubject": {
      "id": "did:example:ebfeb1f712ebc6f1c276e12ec21"
    }
  }
</pre>
```

#### Previewing the base document locally

1. Clone, fork, or download this repo.
2. Follow the instructions in [respec-cdm-plugin.md](respec-cdm-plugin.md) to configure the CDM plugin. You should use the same `apiKey` that you use to access MPS. **DO NOT** commit your API KEY back into the repo.
3. Open ob_v3p0.html with a browser (e.g. file://path/openbadges-specification/ob_v3p0/ob_v3p0.html or http://localhost:3000/ob_v3p0/ob_v3p0.html).
