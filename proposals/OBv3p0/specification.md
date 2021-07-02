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
An Assertion identifies a recipient with a `recipient` relationship to an IdentityObject that contains identifying properties. It identifes which badge it represents with a `badge` relationship to a BadgeClass. It identifies its verification information with a `verification` relationship to a VerificationObject. It identifies its issuer with an `issuer` relationship between the BadgeClass and the Issuer.
[!Open Badges 2.0 Diagram](./figure01-openbadges-2.0-diagram.png)

The proposed Verifiable Credentials structure offers the same information with this structure:
A Verifiable Credential identifies its recipient with a `credentialSubject` relationship to a subject class that is identified by an identifier. It identifies its issuer with an `issuer` relationship to an Issuer. The Credential claims the subject has met the criteria of a specific BadgeClass (also known by its CLR alias as an `Achievement`) with a `hasCredential` relationship to that defined achievement. It identifies its verification information with a `proof` relationship to an instance of a proof that follows a standardized schema.
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

__Can depend on VC ecosystem for cryptographic signature suites and other VC functionality__

Verifiable credentials and presentations can be used for any type of claim. Members of the community include security and cryptography experts who are issuing verifiable credentials about health records such as vaccination passports, shipping containers, government IDs, as well as education and occupational credentials. This allows IMS to use best of breed solutions that arise from the VC ecosystem and focus on the needs of the education ecosystem.

 __Solve a long-standing issue in Open Badges: creators of badges are not always the Issuers__

Verifiable Credential place issuer profile information at the assertion level rather than the claim level to align with the cryptographic proof methods. This creates the potential to add a creator property to the BadgeClass. This could also include a property that defines the relationship between the creator and the issuer to provide deeper understanding to relying third-parties.

KL: EXPAND

 __Open Badges are more than micro-credentials__

The CLR contains a property, achievementType, that when included in the BadgeClass will explain the context of an Open Badge and clarify the misunderstanding that all Open Badges are micro-credentials. This will increase the perceived significance and usage of Open Badges to deliver single achievements such as degrees, licenses, courses, etc.

KL: USE CASE EXAMPLES

__Result Descriptions__

NATE, can you please describe?

__Skill Assertions__

NATE, can you please describe?


### Changes to the data model

####Changes to Assertion

Verifiable Credentials have properties to describe an assertion of a claim and the instructions for cryptographic proof of the claim. As seen in the examples below, these properties will replace the assertion Object as it has been used in 2.0. For example, issuanceDate will be replaced by issuedOn, expires by expirationDate, verification by proof.

Issuer will move from the badgeclass to the VC assertion. Recipient will move into the credentialSubject ID property. Badge will no longer be called in the assertion but be described in the credentialSubject hasCredential property. [Evidence](https://www.w3.org/TR/vc-data-model/#evidence) in Verifiable Credentials supports the cryptographic integrity/proof of the verifiable credential. Evidence of Achievement should be associated with the credentialSubject.id (learner). ResultDescriptions may also be added...

Baked badge images will no longer be required (are they required now?)

Additions to the BadgeClass include AchievementType. Badge images can be optional. With Verifiable Credentials images aren't required although some issuers and wallets may find them just as useful as they were in 2.0


KL - discuss Verifiable Skills - Reference:  Nate's Lucid Chart.


KL: Add table of properties


### Changes to the Validator

(Let folks know I added this section because it seems critical)

This proposal will incur modifications to the validator and considerations as to how the validator handles prior versions of Open Badges and VC Open Badges. The working group can discuss topics such as whether validators should remain separate and if validated VC Open Badges should return VCs as receipts upon validation.

KL: expand

### Changes to the API

As with the validator, the BadgeConnect API will require adjustments to accommodate property changes.

KL: EXPAND

### Considerations

<aside class="note">Platforms that adopt this will still be able to display Open Badges as HTML. Issuers will need to adopt cryptographic signature strategies as recommended by the VC community.</aside>

KL: Add to this

### Examples

<figure class="example">
  <pre>
    {

    }
  </pre>
  <figcaption><span>Example of Open Badge as a Verifiable Credential</span></figcaption>
</figure>

<figure class="example">
  <pre>
    {

    }
  </pre>
  <figcaption><span>Example of Open Badge as a Verifiable Credential in a Verifiable Presentation</span></figcaption>
</figure>

<figure class="example">
  <pre>
    {

    }
  </pre>
  <figcaption><span>Example of Two Open Badges as Verifiable Credentials in a Verifiable Presentation</span></figcaption>
</figure>

<figure class="example">
  <pre>
    {

    }
  </pre>
  <figcaption><span>Example of skill assertion</span></figcaption>
</figure>


### Example Admonitions

KL/NATE: (Do we need this?)

<aside class="note">Example of text content of note aside</aside>
<aside class="warning">Example of text content of warning aside</aside>
<aside class="issue">Example of text content of issue aside</aside>


`;
