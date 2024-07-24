## Open Badges Extensions

[Open Badges 3.0](http://www.imsglobal.org/spec/ob/v3p0#extending) and [Comprehensive Learner Record 2.0](http://www.imsglobal.org/spec/clr/v2p0#extending) allows extensibility in several ways: data model, extensible enumerated vocabularies and API.

Extending the data model enables the addition of supplementary properties to an existing entity.

This process entails the development of two primary artifacts: a JSON-LD context and a JSON schema. This chapter provides guidance on constructing these essential components.

### Sample extension

If you, for instance, want to extend Achievement with a couple of fields, what you have to do is:

Let’s suppose you want to extend `Achievement` with a couple of fields, and decide to name your
extension type `MyCustomAchievement`. The two new fields to add are:

- `myField` of type `description` (required)
- `anotherField` of type `DateTime` (optional).

#### Custom JSON-LD context

The first step is to define a custom JSON-LD context with the added attributes. Following our
example extension, it would be as follows:

<pre class="json example" title="OB / CLR Extension JSON-LD Context">
{
  "@context": {
    "@protected": true,
    "id": "@id",
    "type": "@type",
    "MyCustomAchievement": {
      "@id" : "http://your_url/vocabulary#MyCustomAchievement",
      "@context": {
        "@protected": true,
        "id": "@id",
        "type": "@type",
        "myField": {
          "@id": "https://schema.org/description"
        },
        "anotherField": {
          "@id": "https://your_url/vocabulary#anotherField",
          "@type": "xsd:dateTime"
        }
      }
    }
  }
}
</pre>

Your credentials MUST include this context in their `@context`. ie:

<pre class="json example" title="Sample Credential with Extension JSON-LD Context">
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json",
    "https://your_url/your_context"
  ]
  ...
}
</pre>

In this example, “https://your_url/your_context” resolves to the above JSON-LD context.
Also, the Achievement in your credentials MUST also be of your newly created type. i.e.:

<pre class="json example" title="Sample Credential with Extension type">
{
  ...
  "credentialSubject": {
    ...
    "achievement": {
      "type": ["Achievement", "MyCustomAchievement"]
      ...
    }
  }
  ...
}
</pre>

#### Custom JSON Schema

The next step is to define a custom Define a JSON schema for your new type. Following our
example extension, it would be as follows:

<pre class="json example" title="OB / CLR Extension JSON Schema">
{
  "$schema": "https://json-schema.org/draft/2019-09/schema#",
  "$id": "https://your_url/your_schema.json",
  "type": "object",
  "properties": {
    "credentialSubject": {
      "type": "object",
      "properties": {
        "achievement": {
          "type": "object",
          "properties": {
            "myField": {
              "type": "string"
            },
            "anotherField": {
              "type": "string",
              "format": "date-time"
            }
          },
          "required": ["myField"],
          "additionalProperties": true
        }
      },
      "additionalProperties": true
    }
  },
  "additionalProperties": true
}
</pre>

<div class="note">
Note the existence of `additionalProperties` to allow fields from another schemas, like the ones 1EdTech provides.
</div>

Your credentials MUST include this schema in the credentialSchemaProperty so verifiers can check them against your schema. I.e:

<pre class="json example" title="Sample Credential with Extension JSON schema">
{
  ...
  "credentialSchema": [{
    "id": "https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_achievementcredential_schema.json",
    "type": "1EdTechJsonSchemaValidator2019"
  }, {
    "id": "https://your_url/your_schema.json",
    "type": "1EdTechJsonSchemaValidator2019"
  }]
  ...
}
</pre>

#### Example Credential

<pre class="json example" title="Sample Credential with Extension">
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json",
    "https://your_url/your_context"
  ],
  "id": "http://example.com/credentials/3527",
  "type": ["VerifiableCredential", "OpenBadgeCredential"],
  "issuer": {
    "id": "https://example.com/issuers/876543",
    "type": ["Profile"],
    "name": "Example Corp"
  },
  "validFrom": "2010-01-01T00:00:00Z",
  "name": "Teamwork Badge",
  "credentialSubject": {
    "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
    "type": ["AchievementSubject"],
    "achievement": {
  			"id": "https://example.com/achievements/21st-century-skills/teamwork",
  			"type": ["Achievement", "MyCustomAchievement"],
  			"criteria": {
  				"narrative": "Team members are nominated for this badge by their peers and recognized upon review by Example Corp management."
  			},
  			"description": "This badge recognizes the development of the capacity to collaborate within a group environment.",
  			"name": "Teamwork",
            "myField": "Put your custom value here."
            "anotherField": "2024-07-24T00.00:00Z"
  		}
  },
  "credentialSchema": [{
    "id": "https://purl.imsglobal.org/spec/ob/v3p0/schema/json/ob_v3p0_achievementcredential_schema.json",
    "type": "1EdTechJsonSchemaValidator2019"
  }, {
    "id": "https://your_url/your_schema.json",
    "type": "1EdTechJsonSchemaValidator2019"
  }]
}

</pre>
