var equalitycomparison=`

## Credential equality and comparison algorithm

<dfn data-lt="credential equality and comparison">Credential equality and comparison</dfn> is the process to determine whether a [=verifiable credential=] is semantically equivalent to another one.

A Host SHOULD treat a credential as the same as another when both the [issuer](#profile) \`id\` and the [AchievementCredential](#achievementcredential) \`id\` are equal after unescaping of any percent encoded characters [[RFC3986]] followed by truncation of leading and trailing whitespace.

If the two credentials are equal according to the above, then the credential with the newer \`issuanceDate\` is the more up-to-date representation and could be interpreted as a replacement of the prior issued credential.

### Examples

#### Equality

Credentials [A](#example-sample-credential-a) and [B](#example-sample-credential-b) are equal since they have the same [\`id\`](#achievementcredential) and the same [\`issuer.id\`](#org.1edtech.ob.v3p0.profile.class).

<pre class="json example" data-schema="org.1edtech.ob.v3p0.achievementcredential.class"
  title="Sample credential A">
  {
    "@context": [
      "https://www.w3.org/2018/credentials/v1",
      "https://www.w3.org/2018/credentials/examples/v1",
      "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.2.json"
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
      "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.2.json"
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

Credentials [C](#example-sample-credential-c) and [D](#example-sample-credential-d) are equal since they have the same [\`id\`](#achievementcredential) and the same [\`issuer.id\`](#org.1edtech.ob.v3p0.profile.class).

<pre class="json example" data-schema="org.1edtech.ob.v3p0.achievementcredential.class"
  title="Sample credential C">
  {
    "@context": [
      "https://www.w3.org/2018/credentials/v1",
      "https://www.w3.org/2018/credentials/examples/v1",
      "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.2.json"
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
      "https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.2.json"
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

The credential C is the up-to-date representation because it has a more recent \`issuanceDate\` (\`2010-03-01T00:00:00Z\`).
`;
