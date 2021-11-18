var datamodel=`

## Understanding the Data Model

### Asserting an Achievement

A badge is represented as a single [Assertion](https://www.imsglobal.org/spec/ob/v3p0/InfoModel/ob_InfoModel.html#assertion).
An Assertion is an extension of <a>Verifiable Credential</a> as defined in the [[[vc-data-model]]]. The <a>recipient</a> is
identified by the <code>id</code> property of the <code>credentialSubject</code>. And the
[Achievement](https://www.imsglobal.org/spec/ob/v3p0/InfoModel/ob_InfoModel.html#assertion) is defined by the
<code>achievement</code> property of the <code>credentialSubject</code>.

<pre class="example" title="Example of an Open Badge as a Verifiable Credential">
{
  "@context": [
    "https://www.w3.org/2018/credentials/v1",
    "https://w3id.org/openbadges/v3"
    ],
    "type": [
      "VerifiableCredential",
      "Open Badge"
    ],
    "id": "https://website-that-supports-or-displays-the-badge.html",
    "issuer": {
      "id": "did:example:issuer",
      "name": "An Example Issuer",
      "image": "https://example.org/logo.png",
      "url": "https://example.org",
      "email": "contact@example.org"
    },
    "issuanceDate": "2010-01-01T19:23:24Z",
    "credentialSubject": {
      "id": "did:example:learner",
      "achievement": {
        "id": "https://example.org/achievements/123",
        "type": "Achievement",
        "achievementType": "Certificate",
        "name": "Robotic Drones Analysis",
        "description": "Learn to analyze and present the different types of robotic drones",
        "image": "https://example.org/drone-image.png",
        "creator": "did:example:issuer",
        "criteria": "https://example.org/robotics-drone-analysis.html",
        "tags": ["robots", "not birds"],
        "alignment": [{
          "targetName": "CCSS.ELA-Literacy.RST.11-12.3",
          "targetUrl": "http://www.corestandards.org/ELA-Literacy/RST/11-12/3",
          "targetDescription": "Follow precisely a complex multistep procedure when carrying out experiments, taking measurements, or performing technical tasks; analyze the specific results based on explanations in the text.",
          "targetCode": "CCSS.ELA-Literacy.RST.11-12.3"
        }],
        "resultDescription": [{
          "id": "urn:uuid:da72e42e-9f38-4c42-83ac-33f6cb9bb3b1",
          "name": "Mastery",
          "resultType": "PerformanceLevel",
          "rubricCriterionLevels": [{
            "id": "urn:uuid:24df3f14-4b9b-41b9-9e6b-d48798442425",
            "name": "Below Basic",
            "level": "Below Basic",
            "description": "The student made fewer than 3 citations"
            },
            {
            "id": "urn:uuid:c225be08-c67d-4ec8-ae8e-4860e83588ef",
            "name": "Basic",
            "level": "Basic",
            "description": "The student made 3-5 citations"
            },
            {
            "id": "urn:uuid:f256d3a9-c117-43bf-9e25-dc69691e18a1",
            "name": "Exceeds",
            "level": "Exceeds",
            "description": "The student made more than 5 citations"
          }]
        }],
      },
      "results": [
        {
          "resultDescription": "urn:uuid:da72e42e-9f38-4c42-83ac-33f6cb9bb3b1",
          "achievedLevel": "urn:uuid:f256d3a9-c117-43bf-9e25-dc69691e18a1"
        }
      ],
      "evidence": {
        "id": "https://example.org/my-robot-drones-analysis.html",
        "name": "My Robot Drones Analysis",
        "description": "A paper in APA format analyzing five different types of robot drones that look like birds.",
        "narrative": "This research paper compared different types of robot drones that are sometimes mistaken for birds and their impacts on the environment.",
        "genre": "Journal Article"
      }
    },
    "proof": {
      "type": "RsaSignature2018",
      "created": "2017-06-18T21:19:10Z",
      "proofPurpose": "assertionMethod",
      "verificationMethod": "did:example:issuer#keys/1",
      "jws": "eyJhbGciOiJSUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il19..TCYt5X"
    }
  }
</pre>

### Asserting a Skill

A <a>skill</a> can be directly asserted without an achievement using the <code>results</code> property
of <code>credentialSubject</code>.

<pre class="example" title="Example of a Skill Assertion">
{
  "@context": [
    "https://www.w3.org/2018/credentials/v1",
    "https://w3id.org/openbadges/v3"
    ],
    "type": [
      "VerifiableCredential",
      "Open Badge"
    ],
    "issuer": {
      "id": "did:example:issuer",
      "name": "An Example Issuer",
      "url": "https://example.org"
    },
    "issuanceDate": "2010-01-01T19:23:24Z",
    "credentialSubject": {
      "id": "did:example:learner",
      "results": [
        {
          "resultDescription": "urn:uuid:da72e42e-9f38-4c42-83ac-33f6cb9bb3b1"
        }
      ],
    },
    "proof": {
      "type": "RsaSignature2018",
      "created": "2017-06-18T21:19:10Z",
      "proofPurpose": "assertionMethod",
      "verificationMethod": "did:example:issuer#keys/1",
      "jws": "eyJhbGciOiJSUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il19..TCYt5X"
    }
  }
</pre>

### Presenting a Set of Badges

The <a>recipient</a> can share their badges with others using a <a>Verifiable Presentation</a> as defined by [[[vc-data-model]]].

<pre class="example" title="Example of a Verifiable Presentation by the Recipient">
  {
  "@context": [
    "https://www.w3.org/2018/credentials/v1"
  ],
  "type": "VerifiablePresentation",
  "verifiableCredential": [{
    "@context": [
      "https://www.w3.org/2018/credentials/v1",
      "https://w3id.org/openbadges/v3"
    ],
    "type": [
      "VerifiableCredential",
      "Open Badge"
    ],
    "id": "https://website-that-supports-or-displays-the-badge.html",
      "issuer": {
        "id": "did:example:issuer",
        "name": "An Example Issuer",
        "image": "https://example.org/logo.png",
        "url": "https://example.org",
        "email": "contact@example.org"
      },
      "issuanceDate": "2010-01-01T19:23:24Z",
      "credentialSubject": {
        "id": "did:example:learner",
        "achievement": {
          "id": "https://example.org/achievements/123",
          "type": "Achievement",
          "achievementType": "Certificate",
          "name": "Robotic Drones Analysis",
          "description": "Learn to analyze and present the different types of robotic drones",
          "image": "https://example.org/drone-image.png",
          "creator": "did:example:issuer",
          "criteria": "https://example.org/robotics-drone-analysis.html",
          "tags": ["robots", "not birds"],
          "alignment": [{
            "targetName": "CCSS.ELA-Literacy.RST.11-12.3",
            "targetUrl": "http://www.corestandards.org/ELA-Literacy/RST/11-12/3",
            "targetDescription": "Follow precisely a complex multistep procedure when carrying out experiments, taking measurements, or performing technical tasks; analyze the specific results based on explanations in the text.",
            "targetCode": "CCSS.ELA-Literacy.RST.11-12.3"
          }]
        },
        "evidence": {
          "id": "https://example.org/my-robot-drones-analysis.html",
          "name": "My Robot Drones Analysis",
          "description": "A paper in APA format analyzing five different types of robot drones that look like birds.",
          "narrative": "This research paper compared different types of robot drones that are sometimes mistaken for birds and their impacts on the environment.",
          "genre": "Journal Article"
        }
      },
      "proof": {
        "type": "RsaSignature2018",
        "created": "2017-06-18T21:19:10Z",
        "proofPurpose": "assertionMethod",
        "verificationMethod": "did:example:issuer#keys/1",
        "jws": "eyJhbGciOiJSUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il19..TCYt5X"
      }
    },
    {
      "@context": [
        "https://www.w3.org/2018/credentials/v1",
        "https://w3id.org/openbadges/v3"
      ],
      "type": [
        "VerifiableCredential",
        "Open Badge"
      ],
      "id": "https://website-that-supports-or-displays-the-badge.html",
      "issuer": {
        "id": "did:example:issuer",
        "name": "An Example Issuer",
        "image": "https://example.org/logo.png",
        "url": "https://example.org",
        "email": "contact@example.org"
      },
      "issuanceDate": "2010-01-01T19:23:24Z",
      "credentialSubject": {
        "id": "did:example:learner",
        "achievement": {
          "id": "https://example.org/robot-badge/123",
          "type": "Achievement",
          "achievementType": "Badge",
          "name": "Awesome Robotics Badge",
          "description": "For doing awesome things with robots that people think is pretty great.",
          "image": "https://example.org/robotics-badge.png",
          "creator": "did:example:issuer",
          "criteria": "https://example.org/robotics-badge.html"
        },
        "evidence": [{
          "id": "https://example.org/beths-robot-photos.html",
          "name": "Robot Photoshoot",
          "description": "A gallery of photos of the student's robot",
          "genre": "Photography"
        },
        {
          "id": "https://example.org/beths-robot-work.html",
          "name": "Robotics Reflection 1",
          "description": "Reflective writing about the first week of a robotics learning journey."
        }]
      },
      "proof": {
        "type": "RsaSignature2018",
        "created": "2017-06-18T21:19:10Z",
        "proofPurpose": "assertionMethod",
        "verificationMethod": "did:example:issuer#keys/1",
        "jws": "eyJhbGciOiJSUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il19..TCYt5X"
      }
  }],  
  "proof": {
    "type": "RsaSignature2018",
    "created": "2018-09-14T21:19:10Z",
    "proofPurpose": "authentication",
    "verificationMethod": "did:example:learner#keys-1",
    "challenge": "1f44d55f-f161-4938-a659-f8026467f126",
    "domain": "4jt78h47fh47",
    "jws": "eyJhbGciOiJSUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il19..kTCYt5"
  }
}
</pre>

### Including Extra Data

TBD

`;
