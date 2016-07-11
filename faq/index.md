---
title: A Companion to the Open Badges Specification
subtitle: Examples of 1.1 Open Badge objects
show_sidebar: true
layout: page
---
# {{ page.title }}

This guide was written for non-technical audiences as a companion to the Open Badges Technical Specification version 1.1. 

## **What are the differences of BadgeClass vs. Assertion vs. Evidence?**

There are three core data classes defined by the Open Badges Specification, and three main types of external metadata URLs. 

### Badge Objects
The [BadgeClass](https://openbadgespec.org/#BadgeClass) describes a particular defined achievement and points to the Issuer who defined it with its issuer property.

An [Assertion](http://openbadgespec.org/#Assertion) contains information about a single Recipient’s achievement of a BadgeClass and similarly points to the BadgeClass’s identifying ID with the “badge” property.

The [Issuer](https://openbadgespec.org/#Issuer) is uniquely identified by a Linked Data ID (which takes the form of an Internationalized Resource Identifier, specifically a URI). 

### External Metadata URLs
[Evidence](https://openbadgespec.org/#evidence) is linked as a URL from an Assertion. It is assumed to be human-readable, meaning that a person must view and interpret the response from the evidence URL.

[Criteria](https://openbadgespec.org/#criteria) is linked as a URL from a BadgeClass. It is the human-readable record of what must be done to earn the badge. Machines are assumed to be unable to fully interpret the response from the criteria URL.

An [Alignment URL](https://openbadgespec.org/#Alignment) is the canonical identifier for an objective targeted by a BadgeClass, such as an element of an educational standard, or a competency definition used by multiple organizations. The response from this URL is not assumed to be machine-interpretable.

Insert image

## Baking 

https://openbadgespec.org/#badge-baking

### How/when does the information in a baked badge get extracted?

The metadata is extracted during the verification process when:

+ A badge is uploaded to a backpack; or 
+ Recipients present earned badges to Consumers/Displayers using a software platform that showcases the data, which can be parsed. 

How the badge data is stored in an image varies by file format. SVG is an XML-based format, so the Assertion is added to the image using a custom XML tag, which is the typical way to add information to XML documents. PNG is a file format that uses “chunks” to organize different types of data within the image. Open Badges uses an “iTXt” type chunk, which is a type dedicated to adding textual content to an image. This textual content is not displayed by normal PNG rendering.

### When I see a badge image, how can I tell whether it’s a baked Open Badge or not an Open Badge?

Using the [Open Badges bakery service](http://bakery.openbadges.org/) from your browser, you can “unbake” the baked image and extract the data. If unsuccessful, the badge isn’t a baked Open Badge.

On a local machine, to extract the Assertion data from an existing baked badge, you can use the [Open Badges image baking library](https://github.com/mozilla/openbadges-bakery) command line. 

The Open Badges community is looking into more easily-accessible options to ensure that badge inspectors know when they are encountering Open Badges and have quick access to the functions that open badges afford.

### What does Verification measure? What doesn't it measure?

https://openbadgespec.org/#hosted-verification

Verifying Open Badges Assertions involves checking the JSON structure to ensure that the data conforms to the Open Badges Specification, that it was issued by the expected entity and awarded to the expected entity, that you have the most up-to-date representation of the metadata, and that it hasn’t been revoked. There are two main branches of verification techniques outlined in the specification: hosted and signed verification.

Current weaknesses with verification systems and the spec vary by verifying application, but include:

+ Not checking to ensure Assertion, BadgeClass, and Issuer were published by the same entity.
+ For signed Assertions, the spec doesn’t currently allow Issuers to declare a public key in the most meaningful location. Currently, the location of the public key is in the signed Assertion. A goal for the next release of the spec is to make the public key a property of the Issuer Profile. 

The Badge Alliance Standard Working Group is working to improve the specification to strengthen signed Assertions.

### What's the difference between Hosted and Signed badges?

https://openbadgespec.org/#hosted-badges-a-idhostedbadgea

**Hosted badges**
+ A full version of the badge resides on the web (hosting a JSON version). 
+ The Issuer doesn’t need to maintain records of each issuance of the badge. The Assertion can be verified at the stated URL. Awarding badges are instances of the BadgeClass:
 + Issuer profile = one URL
 + BadgeClass = one URL
 + Assertion file = one URL (specific to the Recipient)
+ The majority of badges being issued are hosted Assertions, which don't require key management and are generally considered safer.
+ Security concerns with hosting: 
 + Portable references to files (instances) don’t take "source of truth" with it, but instead carry a link to it.

**Signed badges**
+ The Issuer profile is hosted (indicating Issuer ownership) = one URL
+ The BadgeClass is also hosted = one URL
+ The Assertion class isn’t hosted. Need to do key management:
 + The Assertion is baked into a portable image file with a digital signature that has a public key. Data is verified with a private key.
 + Assertion is the source of truth. The Recipient possesses the Assertion.
+ Portable even if the server goes down and is more resilient to servers failing.
+ Very few Issuers are using signed Assertions. Sometimes used when awarding a significant number of badges if the Issuer knows it won’t need to revoke them. To check that a badge hasn’t been revoked, use the revocation list.
+ Security issues:
 + Need to check to see if the badge is original and not tampered with.
 + Concerns if the Issuers' key is compromised.

The verification quality and strength are equal for hosted and signed badges, unless the Issuer's key is compromised. You need to clearly identify what attack vectors you're targeting, as attacks are possible for both. Reviewing the benefits, complexities, and costs for both options is recommended.

### Why Salt and Hash? 

https://openbadgespec.org/#a-ididentityobjectaidentityobject

Add salt to protect against a hash attack. Always salt hashes for protecting against some attacks.

Salt for hashing the Recipient’s email address allows backpack services to confirm the Recipient without exposing his/her email address in the JSON file, but also allows this information to be public on evidence pages attached to badge instances so Consumers/Displayers can verify badge Recipients.

By salting hashes, the information is more secure and less susceptible to hacking. Salt helps randomize the hashed text even more. 

### What's the difference between data added using an Extension and data added without using the Extension system?

It’s the same type of information but with [Extensions](https://openbadgespec.org/extensions/#), display platforms are more confident that they know how to handle the question because the Extension system adds context about what expected values are, and which fields are required to be present. A developer who adds Extension processing to a display platform will likely only need to add that data once.

### What’s the benefit of an Issuer publishing an extension to openbadgespec.org instead of publishing it on their own site.

https://openbadgespec.org/extensions/

For convenience. It’s a free service for discoverability. Commitment to long-term hosting provided by the Badge Alliance.

### What's a JSON-LD Context?

https://openbadgespec.org/#Assertion

https://openbadgespec.org/#a-idbadgeclassabadgeclass-exampleexamplesbadgeclass

https://openbadgespec.org/#a-idissueraissuerorganization-exampleexamplesissuer

https://openbadgespec.org/#Extension

https://openbadgespec.org/#primitives

JSON-LD is designed around the concept of a "context" to provide additional mappings from JSON to a Resource Description Framework (RDF) model. The context links object properties in a JSON document to concepts in an [ontology](https://en.wikipedia.org/wiki/Ontology_(information_science)). In order to map the JSON-LD syntax to RDF, JSON-LD allows values to be coerced to a specified type or to be tagged with a language. A context can be embedded directly in a JSON-LD document or put into a separate file and referenced from different documents (from traditional JSON documents via an HTTP Link header).

### What’s the format of a Signed Badge? 

With a signed badge, the BadgeClass and Issuer organization are stored in hosted files, but the Assertion is represented by a JSON Web Signature (JWS) with 3 strings.  

Here’s what a JSON Web Signature looks like:

https://openbadgespec.org/#SignedBadge

https://openbadgespec.org/examples/#SignedBadge

https://openbadgespec.org/#signed-verification

To verify a badge Assertion delivered with signed verification, you need to decode it and unpack the JWS Payload (a Base64 encoded representation of the Assertion) in order to get to the badge Assertion structure. It’s what’s signed. 

### Why embed the endorsed object in the Endorsement extension?

The [endorsement extension](https://openbadgespec.org/extensions/#a-nameendorsementaendorsement) helps ensure that consumers can tell when an object has been changed from the version that was endorsed. 

Examples:

+ When the Issuer stops hosting it.
+ Is hacked or modified to mean something different than what was endorsed.
+ Small updates to spellings or metadata that don’t change the overall meaning.

### What does the Status Code mean for revoking hosted badges?

https://openbadgespec.org/#revoking

The Open Badges Specification tells Issuers to provide a specific HTTP response for revoked badges. Assertions may be revoked by removing the hosted Assertion, but best practices indicate they should replace it with a revocation record confirming that there once was a valid assertion but it had been revoked.

To revoke a hosted badge, Issuers make the URL respond with an HTTP Status of 410 GONE. This indicates a revoked badge Assertion resource.

### What’s the difference between a TypeValidation and FrameValidation?

For Extensions, there are two methods an extension author can use to help a validator extract the appropriate section of the extended badge object to test against the extension’s defined JSON-schema. 

+ TypeValidation instructs a validator to locate the section of the badge marked with the type indicated. 
+ FrameValidation provides a JSON-LD frame, which when applied to the incoming badge object, returns a specific subset of the input data in the expected format. See the [JSON-LD Framing](http://json-ld.org/spec/latest/json-ld-framing/) specification.

TypeValidation is generally considered to be easier for a new extension author to understand, but FrameValidation may be easier to get predictable results.

### How does one contribute to the spec? A pull request? What's that?

Join the [Badge Alliance Standard Working Group](https://groups.google.com/forum/#!forum/openbadges-dev) to participate in the continuing development of the Open Badges Technical Specification. 

Official proposals are made by contributing a pull request on GitHub. Pull requests let you tell others about changes you've pushed to a GitHub repository. 

Go to the [Open Badges spec repository](https://github.com/openbadges/openbadges-specification), then fork the code, modify it, and save it back to your forked repository. Submit a pull request to the origin repository master branch to initiate a review of the proposed changes.

Once a pull request is sent, interested parties can review the set of changes and discuss potential modifications before deciding whether and how to integrate them. 

[More info on Contributing to Open Source on GitHub](https://guides.github.com/activities/contributing-to-open-source/)

© IMS Global and Badge Alliance. Released under a Creative Commons Attribution (CC-BY) 4.0 International License.
