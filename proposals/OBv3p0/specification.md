var specification=`

## Specification

### What is the problem this solves for?

__Verifiable Credentials Increase Trustworthiness of Open Badges__

The [W3C Verifiable Credentials Data Model](https://w3c.github.io/vc-data-model/) specification describes how technologies can be used to present cryptographically verifiable and tamper-evident claims. Verifiable credentials (VCs) have universally accepted & interoperable approaches to verifying claims that can provide security and privacy enhancements to [IMS Global Open Badges](https://openbadgespec.org) that are not available in Open Badges 2.0. Adopting the conventions of the VC data model addresses market needs for interoperable and trustworthy machine-ready data to power connected ecosystems in education and workforce. These enhancements have the added value of releasing issuers of the burden of hosting verifiable badge JSON and opening possibilities of using Open Badges to describe achievements with more personal detail.

Publicly hosted badge data has been the preferred method of many Open Badges <=2.0 issuers. Hosted badge data is not always accessible or tamper-evident since it is hosted on web servers which can be shut down or go away. It also makes the data easy to change which can be convenient for issuers but not assuring for relying third-parties seeking to put the data to use. Changes to badge metadata such as criteria, the issuedOn date, and recipient email can reduce the perceived quality of data and reflect incorrect information about the learners' experiences. Digitally signed 2.0 badges provide more assurances and privacy than the hosted badges but are not commonly issued and are not interoperable with VC wallets.

There's been very little evidence that badge JSON data has been readily consumed by machines, but technologies and the education and workforce markets have evolved since Open Badges 2.0 was released 4 years ago. Machine learning and AI uses have expanded alongside blockchain and other decentralized technologies creating opportunity for connecting learners to opportunities, more accurate skills-based hiring, and updated curriculums more equitably reflecting the needs of students. The market is demanding that the achievement data be trustworthy. This means that it should be accessible, protected, have integrity, and communicate what was intended including that the issuer and subjects of the data can be authenticated and that the data has not been tampered with since it was issued. Shifting Open Badges to using the VC conventions to verify learner achievements meets these expectations and provides learners with more agency over their achievement data by giving them immediate access to it for as long as they need it, protecting it, and making it work with other credentials in and outside of education and workforce.

__Differentiating Issuers and Creators__

In Open Badges 2.0, the issuer is assumed to be the creator. Over the years, the Open Badges community has requested capabilities to distinguish between the issuer and creator of a badge. This is because there are plenty of examples where the assessor is the issuer but not the creator of the badge. The [Original Creator Extensions](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0Final/extensions/index.html#OriginalCreator) is a step in this direction but provides no properties to describe the eligibility of the issuers.

An issuer property is included in the VC assertion and is the entity that is digitally signing the credential. Because of this, the issuer property referenced in the BadgeClass is redundant. This is a logical placement for new properties to describe a creator and the eligibility of the issuer(s), giving relying third-parties more contextual information about the achievement and the parties involved.

__Recipient Identifiers__

With Open Badges <= 2.0, email addresses have been used as identifiers. This has been problematic because email addresses may be used by more than one person, are revoked when an individual leaves a job or school, are insecure, and aren't intended to be identifiers. Identifiers in VCs must be HTTP-based URLs or [Decentralized Identifier](https://www.w3.org/TR/did-use-cases/#intro).

 __Open Badges are More than Micro-credentials__

The CLR provides a property, [achievementType](https://purl.imsglobal.org/spec/clr/v1p0/context/clr_v1p0.html#dtExtensibleAchievementType), that describes the type of achievement being represented. Open Badges 2.0 does not have a property to describe what type of achievement is being recognized. This has led to misconceptions that Open Badges are always micro-credentials. Including achievementType as property of the BadgeClass can clarify this misconception and refine interpretations of Open Badges by relying third-parties. This will increase the perceived significance and usage of Open Badges to deliver verifiable single achievements such as degrees, licenses, courses, etc.

__Result Descriptions__

The CLR provides a property called [ResultDescription](https://purl.imsglobal.org/spec/clr/v1p0/context/clr_v1p0.html#dtResultDescription) which can assert levels of mastery associated to specific achievements. These levels of mastery may be aligned with rubrics and other rich skill descriptors hosted on networks such as IMS CASE, EMSI, and OSMT. Adding resultDescriptions to Open Badges can also associate single achievements with levels of mastery and skill descriptors to provide more contextual information about the achievements.

__Skill Assertions__

As part of this proposal, it is also being suggested that the Open Badges specification can be expanded to assert achievement of single skills. The differentiation between this type of assertion and a credential assertion is that a resultDescription and evidence can reference a single existing RSD rather than a badge that contains a BadgeClass with one or more alignments to RSDs. The effect is a more direct correlation of single skill achievements to meet the needs of skills-focused activities such as skills-based hiring.

### Changes to the data model

* **Replace existing Open Badges VerificationObject properties:** Verifiable Credentials have properties to describe an assertion of a claim and the instructions for cryptographically proving the claim. As seen in the examples below, some VC properties should replace the VerifiactionObject properties of Open Badges. For example, issuedOn will be replaced by [issuanceDate](https://www.w3.org/TR/vc-data-model/#issuance-date), expires by [expirationDate](https://www.w3.org/TR/vc-data-model/#expiration), and verification by [proof](https://www.w3.org/TR/vc-data-model/#proofs-signatures).

* **Image:** The Open Badges assertion has an optional image property which is expected to contain the badge metadata baked into an image. The 2.0 specification references the image in the BadgeClass and historically it has been expected that the baked image uses the BadgeClass image. In this model, the baking should continue to be optional as it is less needed with VCs. However, it is critical to note that the VC community is discussing methods of embedding verifiable data into files such as images, QR codes, and PDFs. This may not be ready for 3.0 but could be ready for a future version and referenced to encourage piloting.

The BadgeClass image is required in 2.0. In 3.0, it should be optional. The baking of the badge was a proposed method of transporting Open Badges. This is not required with VCs. Some badge issuers may wish to include images in their badges for when they are being displayed online and some wallets may wish to put the images to use.

* **Add recipient to the credentialSubject.id:** VCs have credentialSubject which references the claim being being verified. The credentialSubject ID property can reference the subject of the credential. This property can contain a URI representing the subject which may be a URL or a DID. It should be discussed whether other profile properties could be optionally included in the credentialSubject.

* **Issuer & Credential Subject Identities:** With VCs, [issuer](https://www.w3.org/TR/vc-data-model/#issuer) and [credentialSubject](https://www.w3.org/TR/vc-data-model/#credential-subject) id properties must be a URI. This could be an HTTP-based URL or a [Decentralized Identifier](https://www.w3.org/TR/did-use-cases/#intro).

* **credentialSubject.schema:hasCredential:** the hasCredential property from schema.org is intended to contain the BadgeClass properties including name, description, criteria, etc. schema:hasCredential.id should contain the canonical url for the BadgeClass. schema:hasCredential.type identifies the properties as belonging to the BadgeClass.

* **credentialSubject.schema:hasCredential.achievementType:** This property is taken from the CLR and may contain the same string values as proposed by the CLR.

* **credentialSubject.schema:hasCredential.creator** Open Badges as native VCs should continue to be one issuer of one claim about one recipient. With Open Badges, the issuer profile has been referenced in the BadgeClass. With Open Badges as VCs, the issuer is the entity that signs the credential. The issuer may be different from the creator of the badge being issued. As depicted in the example below, with Open Badges as VCs, the issuer profile may still include name, description, url, image, email, etc.

* **credentialSubject.evidence:** With OpenBadges <= 2.0, the evidence has been an assertion property. This proposal suggests that evidence should be included in the credentialSubject object so that the evidence is related to the claim, not the verification of the claim.

* **credentialSubject.resultDescription:** This property is taken from the CLR and may follow the same recommendations. As with evidence, this property should be included in the credentialSubject object.

* **Revoked Credentials:** VCs have a [credentialStatus](https://www.w3.org/TR/vc-data-model/#status) object. The id property must be a URL and the type property describes how the status of the credential may be checked.

* **Skill Assertion:** As depicted in the example below, this new type of Open Badge verifies a claim that a subject has attained a skill. In this instance, a credentialSubject.resultDescription would be required because it would reference the skill descriptor of the achieved skill. Evidence may be included to support the claim.

* **Verifiable Presentations:** One more more VCs can be combined into a [verifiable presentation](https://www.w3.org/TR/vc-data-model/#presentations) which is digitally signed by the presenter (typically the subject). A verifiable presentation is presented at the request of the verifier.  

### Changes to the Validator

This proposal will incur modifications to the validator and considerations as to how the validator handles prior versions of Open Badges and VC Open Badges. The working group can discuss topics such as whether validators should remain separate and if validated VC Open Badges should return VCs as receipts upon validation.

### Changes to the API

As with the validator, the BadgeConnect API will require adjustments to accommodate property changes. Conceptually, we will need to explore the flow and use cases of Open Badges as VCs.

### Considerations

* Learners may still share their badges online as HTML as they have in Open Badges <= 2.0 but Open Badges as VCs will be presented in response to verifiers requesting them. IN addition to using badges for online portfolios, badges as VCs can be exchanged as data.
* Issuers will need to adopt cryptographic signature strategies as recommended by the VC community.


### Examples

<figure class="example">
  <pre>
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
        "schema:hasCredential": {
          "id": "https://example.org/achievements/123",
          "type": "BadgeClass",
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
        "resultDescriptions": [{
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
  <figcaption><span>Example of Open Badge as a Verifiable Credential</span></figcaption>
</figure>

<figure class="example">
  <pre>
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
          "schema:hasCredential": {
            "id": "https://example.org/achievements/123",
            "type": "BadgeClass",
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
        },
        "evidence": {
            "id": "https://example.org/my-robot-drones-analysis.html",
            "name": "My Robot Drones Analysis",
            "description": "A paper in APA format analyzing five different types of robot drones that look like birds.",
            "narrative": "This research paper compared different types of robot drones that are sometimes mistaken for birds and their impacts on the environment.",
            "genre": "Journal Article"
          },
        },
        "proof": {
          "type": "RsaSignature2018",
          "created": "2017-06-18T21:19:10Z",
          "proofPurpose": "assertionMethod",
          "verificationMethod": "did:example:issuer#keys/1",
          "jws": "eyJhbGciOiJSUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il19..TCYt5X
          sITJX1CxPCT8yAV-TVkIEq_PbChOMqsLfRoPsnsgw5WEuts01mq-pQy7UJiN5mgRxD-WUc
          X16dUEMGlv50aqzpqh4Qktb3rk-BuQy72IFLOqV0G_zS245-kronKb78cPN25DGlcTwLtj
          PAYuNzVBAh4vGHSrQyHUdBBPM"
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
                "schema:hasCredential": {
                  "id": "https://example.org/robot-badge/123",
                  "type": "BadgeClass",
                  "achievementType": "Badge",
                  "name": "Awesome Robotics Badge",
                  "description": "For doing awesome things with robots that people think is pretty great.",
                  "image": "https://example.org/robotics-badge.png",
                  "creator": "did:example:issuer",
                  "criteria": "https://example.org/robotics-badge.html"
                },
              },
              "evidence": [{
                "id": "https://example.org/beths-robot-photos.html",
                "name": "Robot Photoshoot",
                "description": "A gallery of photos of the student's robot",
                "genre": "Photography"
                },
                {
                  "id": "https://example.org/beths-robot-work.html",
                  "name": "Robotics Reflection #1",
                  "description": "Reflective writing about the first week of a robotics learning journey."
              }],
              "proof": {
                "type": "RsaSignature2018",
                "created": "2017-06-18T21:19:10Z",
                "proofPurpose": "assertionMethod",
                "verificationMethod": "did:example:issuer#keys/1",
                "jws": "eyJhbGciOiJSUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il19..TCYt5X
                sITJX1CxPCT8yAV-TVkIEq_PbChOMqsLfRoPsnsgw5WEuts01mq-pQy7UJiN5mgRxD-WUc
                X16dUEMGlv50aqzpqh4Qktb3rk-BuQy72IFLOqV0G_zS245-kronKb78cPN25DGlcTwLtj
                PAYuNzVBAh4vGHSrQyHUdBBPM"
              },
            }],    
          "proof": {
            "type": "RsaSignature2018",
            "created": "2018-09-14T21:19:10Z",
            "proofPurpose": "authentication",
            "verificationMethod": "did:example:learner#keys-1",
            "challenge": "1f44d55f-f161-4938-a659-f8026467f126",
            "domain": "4jt78h47fh47",
            "jws": "eyJhbGciOiJSUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il19..kTCYt5
            XsITJX1CxPCT8yAV-TVIw5WEuts01mq-pQy7UJiN5mgREEMGlv50aqzpqh4Qq_PbChOMqs
            LfRoPsnsgxD-WUcX16dUOqV0G_zS245-kronKb78cPktb3rk-BuQy72IFLN25DYuNzVBAh
            4vGHSrQyHUGlcTwLtjPAnKb78"
          }
        }
  </pre>
  <figcaption><span>Example of two Open Badges as a Verifiable Credentials in a verifiable presentation  by the learner.</span></figcaption>
</figure>

<figure class="example">
  <pre>
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
        "resultDescriptions": [{
          "id": "urn:uuid:da72e42e-9f38-4c42-83ac-33f6cb9bb3b1"
        }]
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
  <figcaption><span>Example of a Skill Assertion</span></figcaption>
</figure>




### Example Admonitions

<aside class="note">Example of text content of note aside</aside>
<aside class="warning">Example of text content of warning aside</aside>
<aside class="issue">Example of text content of issue aside</aside>


`;
