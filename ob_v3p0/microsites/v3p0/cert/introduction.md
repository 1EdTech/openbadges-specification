---
title: "Introduction"
docType: "segment"
status: "Final"
author: "1Edtech Consortium"
lastUpdated: 2023-08-10
description: "Introduction for Open Badges 3.0 certification"
---

## Introduction

### Conformance Statements {#conformance}

### Documents

The full set of documents is comprised of the following documents:

- [[OB-30]]
- [[OB-CERT-30]]
- [OpenAPI 3.0 JSON File for Open Badges API](https://purl.imsglobal.org/spec/ob/v3p0/schema/openapi/ob_v3p0_oas.json)
- [OpenAPI 3.0 YAML File for Open Badges API](https://purl.imsglobal.org/spec/ob/v3p0/schema/openapi/ob_v3p0_oas.yaml)
- [Open Badges 3.0 JSON-LD Context File](https://purl.imsglobal.org/spec/ob/v3p0/context-3.0.3.json)

### Terms

The following terms are used throughout this document.

Achievement
: This is the content description of a credential that an assertion references. It contains metadata such as the name of the achievement, description, alignment of skills, etc. An [=Assertion=] asserts a single achievement. A [=CLR=] asserts a collection of assertions, each of which asserts a single achievement.

Assertion
: The core of both Open Badges and CLR is the assertion about achievement(s). Assertion properties are specific to one learner's achievement and specify metadata such as issuer, date of achievement, expiration data, as well as results and evidence that support the assertion. A [=Verifiable Credential=] more broadly asserts a claim about a Credential Subject which can be applied to education and occupational achievements.

Candidate platform
: A platform implementing the Open Badges specification with the intent to obtain certification from 1EdTech. They may be in the process to obtain certification.

Comprehensive Learner Record (CLR){data-lt="CLR|Comprehensive Learner Record|Comprehensive Learner Records"}
: Set of assertions that can be packaged as a verifiable credential.

Defined Achievement Claim
: An [=assertion=] that the learner achieved a specific [=achievement=].

REST API{data-lt="RESTful API"}
: A style of web API (Application Programming Interface) loosely based on HTTP methods (DELETE, GET, POST, and PUT) to access resources (e.g. CLRs) via a URL.

Service Consumer{data-lt="Consumer"}
: In a [=REST API=], the Service Consumer is the actor that initiates the DELETE, GET, or POST request. Also called a Consumer in the [[SEC-11]].

Service Provider{data-lt="Provider"}
: In a [=REST API=], the Service Provider is the actor that responds to a DELETE, GET, or POST request. Also called a Platform in the [[SEC-11]].

Skill
: Measurable or observable knowledge, skill, or ability necessary to successful performance of a person.

Skill Claim
: An [=assertion=] that the learner has the specified [=skill=].

Verifiable Credential{data-lt="VC"}
: A tamper-evident credential whose issuer can be cryptographically verified. See [[vc-data-model-2.0]].

Verifiable Presentation{data-lt="VP"}
: A tamper-evident presentation of one or more Verifiable Credentials of which cryptographic verification can be used to determine the trustworthiness of the authorship of the data. [[vc-data-model-2.0]]

Verification{data-lt="Verifiable"}
: The evaluation of whether a [=verifiable credential=] or [=verifiable presentation=] is an authentic and timely statement of the issuer or presenter, respectively. This includes checking that: the credential (or presentation) conforms to the specification; the proof method is satisfied; and, if present, the status check succeeds.

Verifier
: The entity that receives a [=verifiable credential=] or [=verifiable presentation=] and verifies the credential or presentation has not been tampered with.
