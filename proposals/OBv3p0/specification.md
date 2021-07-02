var specification=`

## Specification

### What is the problem this solves for?
This proposal describes how to integrate Open Badges with the next generation of general-purpose digital credentials, the [W3C Verifiable Credentials Data Model](https://w3c.github.io/vc-data-model/), within which Open Badges can take its place as the leading schema for educational achievement claims within a growing world of widely interoperable digital credentials.

Verifiable Credentials (VCs) are a format that is used to publish a limitless variety of claims about a subject person or other entity, typically through a cryptographic proof. VCs can be delivered as part of presentations that are also cryptographically verifiable. These layers of cryptographic proof can provide security and privacy enhancements to Open Badges that are not yet available in version 2.0. Adoption of Verifiable Credentials can increase adoption by addressing market needs for trustworthy machine-ready data to power connected ecosystems in education and workforce and can unlock the door for Open Badges credentials to be included in a growing number of multi-purpose digital credential wallets entering the market. Stepping further into signed VCs and another associated technology, decentralized identifiers (DIDs), unlocks increased longevity and resilience of Open Badges that can describe achievements even more expressively than they do today.

This proposal for a 3.0 version of Open Badges also makes important steps to blend innovations from the Comprehensive Learner Record (CLR) 1.0 specification by including recent additions made to the CLR parallels to the OB Assertion and BadgeClass data classes. This enables concepts like achievement types (beyond just "Badge") and result descriptions to be expressed in a BadgeClass.

Introducing a new major capability to Open Badges is also on the table: skill assertions are a proposed method for many issuers to make a claim about the achievement of a skill more directly than is possible with existing versions of Open Badges, without requiring the creation of a BadgeClass for each issuer who wishes to recognize a skill that is important to a particular industry or discipline.


### What does adopting Verifiable Credentials entail?
This proposal is for a small but critical change to the structure of the Open Badges Assertion class, to adopt the conventions of the Verifiable Credential Data Model. This means that badges issued under the proposed version would not be conformant to all of the existing 2.x data model requirements.

An existing Open Badges Assertion structures its objects like this:
An Assertion identifies a recipient with a "recipient" relationship to an IdentityObject that contains identifying properties. It identifies which badge it represents with a "badge" relationship to a BadgeClass. It identifies its verification information with a "verification" relationship to a VerificationObject. It identifies its issuer with an "issuer" relationship between the BadgeClass and the Issuer.
[!Open Badges 2.0 Diagram](./figure01-openbadges-2.0-diagram.png)

The proposed Verifiable Credentials structure offers the same information with a slightly different structure:
A Verifiable Credential identifies its recipient with a "credentialSubject" relationship to a subject class that is identified by an identifier. It identifies its issuer with an "issuer" relationship to an Issuer. The Credential claims the subject has met the criteria of a specific BadgeClass (also known by its CLR alias as an "Achievement") with a "hasCredential" relationship to that defined achievement. It identifies its verification information with a "proof" relationship to an instance of a proof that follows a standardized schema.
[!Open Badges 3.0 proposed diagram](./figure02-openbadges-3.0-diagram.png)

#### Digital Wallets, Verifiable Presentations, and Learner Experiences
Open Badges as VCs are designed to be issued and offered to learners who may accept them into their digital wallet. Wallets are software that runs on either the web or as a native app on a mobile device or desktop environment. A web wallet is another term to describe the application role known under 2.0 as a "Host". There is an existing and growing ecosystem of deployed technology; integration with these becomes possible if Open Badges adopts VCs along the lines of this proposal. For example, a number of generic Verifiable Credentials wallet implementations are available from a variety of vendors as native mobile apps. From a wallet, recipients may package their badges along with their other VCs into verifiable presentations. A presentation contains the credentials that the learner wishes to share with a relying party. The digital wallet application digitally signs the presentation using the key of the learner. The verifying third-parties can cryptographically verify that the presentation came unmodified directly from the credential holder as well as the integrity of each of the VCs included in the presentation as credentials signed by each of their respective issuers.

It is possible from a wallet to package credentials into a verifiable presentation in response to a request from a relying party who requests credentials for a certain purpose. For example, a potential employer seeking to fill an internship role, may need to verify that a student is over 18, has completed a course on communication, and is a current student. A student could use their wallet to package three VCs (driver's license, course completion badge, and student ID) into a presentation that is signed by their private key. When the presentation is sent to the employer's website, the employer can verify that the VCs belong to the student and that the VCs are authentic. Protocols and interoperability around making and fulfilling requests is still early stage, but when these technologies are tested in the wild, it would be a good idea to already have educational credentials claim schemas available for the claim types ("defined achievement" and "skill assertion") possible to make with Open Badges.

The growing collection of VC wallets is an example of how adopting a Verifiable Credentials-based approach allows Open Badges to grow in impact and take advantage of existing momentum in the digital credentials space around tooling that is entering the market and heading towards maturity.

#### Verifiable Credentials Support Increases Strength and Learner Data Privacy of Open Badges
Currently, Open Badges 2.0 data can be verified via either (a) publicly accessible hosted JSON badge data or (b) JWS digitally signed badges with a limited number of algorithms and key types, depending on the verification method chosen by the issuer. In order to keep up with evolving cryptographic standards without taking on the burden of writing cryptographic suites as a community not specializing in that function, adopting Verifiable Credentials proofs allows experts to update algorithms to keep up with improvements to cryptography-breaking processing power.

Publicly hosted badge data has been the preferred method of many Open Badges issuers. This method can risk the privacy of badge recipients who are reliant on the issuers to host their data leaving them with no control over its accessibility. There is also the potential that data about individuals is publicly accessible without their knowledge. Most Open Badges don't contain significant amounts of personally identifiable information, but they are subject to correlation. This could lead to on-site identification, email spam, and also cause badges to be correlatable with other personally identifying data on the web.

Hosted badge data is also not tamper-evident since it is hosted on web servers typically as dynamically-generated JSON files populated by queries made to relational databases or static JSON files. This makes the data easy to change without any historic reference or preservation. Changes to badge metadata such as criteria, the issuedOn date, and recipient email post verification can reduce the perceived quality of data and reflect wrong information about the learners' experiences.

Digitally signed 2.0 badges provide more security and privacy than the hosted badges. The verification process verifies the issuer and that the data has not been modified since it was signed. This method checks that there is a valid and accessible public key, that it is the correct signing key, the JWS verification passes, and the badge assertion is not found on a revocation list hosted by the issuer. This verification process reflects typical JWS signature suite methods, is the sole digital signature suite for Open Badges, and does not verify the recipients of badges.

For the most part, badges have been consumed by humans viewing attractive web pages hosted by issuers and/or shared online. This functionality won't disappear with 3.0 because badges on the web increase insights and exposure for issuers and learners. But web viewable badges are not machine verifiable and are not part of the Open Badges specification.

There's been very little evidence that badge JSON data is being readily consumed by machines, but technologies and the education and workforce markets have evolved since Open Badges 2.0 was released 4 years ago. Machine learning and AI uses have expanded alongside blockchain and other decentralized technologies creating opportunity for connecting learners to opportunities, more accurate skills-based hiring, and updated curriculums more equitably reflecting the needs of students. The market is demanding that the achievement data be trustworthy. This means that it should be accessible, protected, have integrity, and communicate what was intended including that the issuer and subjects of the data have been authenticated and that the data has not been tampered with since it was issued.

#### Decentralized Identifiers and Self-Sovereign Identity
[Decentralized identifiers (DIDs)](https://www.w3.org/TR/did-core/) are a type of identifier for people, organizations and any other entity, where each identifier is controlled independently of centralized registries. Each DID can be resolved through an operation described by its particular "DID Method" to reveal a DID document that describes the subject. Whereas previous versions of Open Badges required HTTP(s) identifiers for issuers and typically used email (or rarely URL) identifiers for learners, adoption of the Verifiable Credentials Data Model provides simple conventions for badge issuers and recipients to begin to use DIDs when they desire.

Verification of control of identifiers is an important concept within any type of digital credential, both with respect to the issuer and the subject (recipient) of the credential. For issuers, Open Badges has relied on its own bespoke rules for determining whether a hosted Assertion URL or cryptographic key URL is associated with an issuer profile identified by a particular URL, and URLs used for recipient identifiers have no built-in mechanism for authentication. Email and telephone number based recipient identifier authentication are up to the relying party, but there are common methods for performing this task essential to establishing trusted proof of control of credentials presented by a subject.

DIDs typically offer cryptographic proof of control, based on authorized keys or other verification methods expressed in the associated DID Document. While these protocols are not broadly implemented across domains today, the structure provides a forward-looking flexible and extensible mechanism to build the types of protocols needed to connect credentials back to the identities of their issuers and subjects. The Open Badges community may ultimately recommend use of only a small number of these capabilities in early releases or recommend them only for experimental use, like with cryptographic proof methods. But this is still an important step, because there is no reason for the Open Badges community to be closed to interoperability through the protocols being developed for use by the wallets and services coming into being elsewhere by delaying the option to use DIDs for recipient and issuer identifiers.

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
