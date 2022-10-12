var equalitycomparison=`

## Credential's equality and comparison algorithm

Credential equality and comparison is the process to determine whether a [=verifiable credential=]  is the same to another one.

Host SHOULD treat a credential as the same than another when the [issuer](#profile)'s \`id\` and the [AchievementCredential](#achievementcredential)'s \`id\` are the same. The one with the newer \`issuanceDate\` is the more up-to-date representation and could be interpreted as a replacement of the prior issued credential.

### Behavior in upsertCredential

It's up to the Host to decide whether or not replace its existing credential if the submitted credential is older than the existing following this algorithm.

It's up to the Host to decide whether or not replace its existing credential with another one if both are the same following this algorithm.

### Examples

#### Equality

Credentials [A](#example-sample-credential-a) and [B](#example-sample-credential-b) are equals since they have the same [\`id\`](#achievementcredential) and the same [\`issuer.id\`](#org.1edtech.ob.v3p0.profile.class).

<pre class="json example" data-schema="org.1edtech.ob.v3p0.achievementcredential.class"
  title="Sample credential A">
  {
    "@context": [
      "https://www.w3.org/2018/credentials/v1",
      "https://www.w3.org/2018/credentials/examples/v1",
      "https://purl.imsglobal.org/spec/ob/v3p0/context.json"
    ],
    "id": "http://example.edu/credentials/3732",
    "type": ["VerifiableCredential", "OpenBadgeCredential"],
    "issuer": {
      "id": "https://example.edu/issuers/565049",
      "type": ["IssuerProfile"],
      "name": "Example University"
    },
    "issuanceDate": "2010-01-01T00:00:00Z",
    "name": "Teamwork Badge",
    "credentialSubject": {
      "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
      "type": ["AchievementSubject"],
      "achievement": {
        "id": "https://example.com/achievements/21st-century-skills/teamwork",
        "type": [
            "Achievement"
        ],
        "criteria": {
            "narrative": "Team members are nominated for this badge by their peers and recognized upon review by Example Corp management."
        },
        "description": "This badge recognizes the development of the capacity to collaborate within a group environment.",
        "name": "Teamwork"
      }
    }
  }
</pre>

<pre class="json example" data-schema="org.1edtech.ob.v3p0.achievementcredential.class"
  title="Sample credential B">
  {
    "@context": [
      "https://www.w3.org/2018/credentials/v1",
      "https://www.w3.org/2018/credentials/examples/v1",
      "https://purl.imsglobal.org/spec/ob/v3p0/context.json"
    ],
    "id": "http://example.edu/credentials/3732",
    "type": ["VerifiableCredential", "OpenBadgeCredential"],
    "issuer": {
      "id": "https://example.edu/issuers/565049",
      "type": ["IssuerProfile"],
      "name": "Example University"
    },
    "issuanceDate": "2010-01-01T00:00:00Z",
    "name": "Teamwork Badge",
    "credentialSubject": {
      "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
      "type": ["AchievementSubject"],
      "achievement": {
        "id": "https://example.com/achievements/21st-century-skills/teamwork",
        "type": [
            "Achievement"
        ],
        "criteria": {
            "narrative": "Team members are nominated for this badge by their peers and recognized upon review by Example Corp management."
        },
        "description": "This badge recognizes the development of the capacity to collaborate within a group environment.",
        "name": "Teamwork"
      }
    }
  }
</pre>

Since they also have the same \`issuanceDate\` both are up-to-date.

#### Comparison

Credentials [C](#example-sample-credential-c) and [D](#example-sample-credential-d) are equals since they have the same [\`id\`](#achievementcredential) and the same [\`issuer.id\`](#org.1edtech.ob.v3p0.profile.class).

<pre class="json example" data-schema="org.1edtech.ob.v3p0.achievementcredential.class"
  title="Sample credential C">
  {
    "@context": [
      "https://www.w3.org/2018/credentials/v1",
      "https://www.w3.org/2018/credentials/examples/v1",
      "https://purl.imsglobal.org/spec/ob/v3p0/context.json"
    ],
    "id": "http://example.edu/credentials/3732",
    "type": ["VerifiableCredential", "OpenBadgeCredential"],
    "issuer": {
      "id": "https://example.edu/issuers/565049",
      "type": ["IssuerProfile"],
      "name": "Example University"
    },
    "issuanceDate": "2010-03-01T00:00:00Z",
    "name": "Teamwork Badge",
    "credentialSubject": {
      "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
      "type": ["AchievementSubject"],
      "achievement": {
        "id": "https://example.com/achievements/21st-century-skills/teamwork",
        "type": [
            "Achievement"
        ],
        "criteria": {
            "narrative": "Team members are nominated for this badge by their peers and recognized upon review by Example Corp management."
        },
        "description": "This badge recognizes the development of the capacity to collaborate within a group environment.",
        "name": "Teamwork"
      }
    }
  }
</pre>

<pre class="json example" data-schema="org.1edtech.ob.v3p0.achievementcredential.class"
  title="Sample credential D">
  {
    "@context": [
      "https://www.w3.org/2018/credentials/v1",
      "https://www.w3.org/2018/credentials/examples/v1",
      "https://purl.imsglobal.org/spec/ob/v3p0/context.json"
    ],
    "id": "http://example.edu/credentials/3732",
    "type": ["VerifiableCredential", "OpenBadgeCredential"],
    "issuer": {
      "id": "https://example.edu/issuers/565049",
      "type": ["IssuerProfile"],
      "name": "Example University"
    },
    "issuanceDate": "2010-01-01T00:00:00Z",
    "name": "Teamwork Badge",
    "credentialSubject": {
      "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
      "type": ["AchievementSubject"],
      "achievement": {
        "id": "https://example.com/achievements/21st-century-skills/teamwork",
        "type": [
            "Achievement"
        ],
        "criteria": {
            "narrative": "Team members are nominated for this badge by their peers and recognized upon review by Example Corp management."
        },
        "description": "This badge recognizes the development of the capacity to collaborate within a group environment.",
        "name": "Teamwork"
      }
    }
  }
</pre>

The credential A is the up-to-date representation because it has a newer \`issuanceDate\`.
`;
