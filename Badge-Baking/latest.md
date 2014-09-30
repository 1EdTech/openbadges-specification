# Open Badges Baking Specification

## Introduction

The metadata describing an Open Badge awarded to an earner is an [assertion](../Assertion/latest.md). A baked badge is a badge image with the assertion data embedded into it. The assertion for a badge can be used to verify its authenticity - to prove whether or not it was awarded by the issuer to the earner claiming it.

Badge Baking is the process of taking an assertion and embedding it into the badge image. When a user displays a baked badge on a page, software can extract that assertion data - then perform verification checks on it. Baking the data into the badge image makes it more portable, allowing the earner to display it wherever they choose.

Baked badges are either [PNGs](#png-badges) or [SVGs](#svg-badges). This document outlines the technical implementation for baked badges of both types.

## Table of Contents

* [Conventions Used in this Document](#conventions-used-in-this-document)
* [Intended Audience](#intended-audience)
* [Concepts](#concepts)
* [Terminology](#terminology)
* [PNG Badges](#png-badges)
 * [Baking](#baking-pngs)
 * [Extracting](#extracting-pngs)
* [SVG Badges](#svg-badges)
 * [Baking](#baking-svgs)
 * [Extracting](#extracting-svgs)

## Conventions Used in this Document

> The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED",  "MAY", and "OPTIONAL" in this document are to be interpreted as described in RFC 2119.

## Intended Audience

This document is intended for the following audiences:

* implementers of badge issuing applications
* implementers of badge displaying applications

The primary audience is expected to be software developers.

The Open Badges Baking specification relies on structures using JSON syntax - see [RFC 4627](http://www.ietf.org/rfc/rfc4627.txt) and [JSON.org](http://www.json.org/).

## Concepts

Implementing badge baking within the OBI involves understanding a range of concepts which refer to well-known real-world objects and activities, but which have specific meanings within the Open Badges ecosystem.

An Open Badge is a digital representation of a skill or achievement, communicated via an image plus JSON data structures. An awarded badge is defined using a ___Badge Assertion___, which can be represented as a JSON file or a JSON Web Signature (JWS).

People who are awarded Open Badges are referred to as ___Earners___. The people and organizations who award Open Badges are referred to as ___Issuers___. Issuing is the technical act of awarding a badge, the implementation of which is creating a ___Badge Assertion___.

___Displayers___ of Open Badges are implementers of systems in which awarded badges are presented in digital contexts. ___Displayers___ therefore deal with the data in ___Badge Assertions___, which is created by ___Issuers___. 

___Issuers___ can create ___Baked Badges___ by embedding ___Badge Assertions___ into badge images. This means that the data for the awarded badge is all contained in/ linked from a single image file.

For Open Badges to comprise valuable representations of achievement, they must facilitate verification processes. ___Issuers___ are responsible for including the information necessary for this verification, while ___Displayers___ are responsible for using it to check that a badge was awarded by an ___Issuer___, to an ___Earner___. In order to verify a ___Baked Badge___, ___Displayers___ must first extract the assertion data from the badge image.

## Terminology

The Open Badges Baking specification uses the following terms as defined:

<a name="term-badge-assertion"><a>
__Badge Assertion__

A JSON-structured representation of a badge awarded to an Earner. An Assertion describes the badge [Earner](#term-earner), what the badge represents and the [Issuer](#term-issuer). The data items within an Assertion include: a unique ID; the Earner (recipient) identity; details of the Badge Class (what the award represents); verification data; the date the badge was issued. Assertions can additionally include a range of optional data items and can be [___hosted___](#term-hosted-badge) or [___signed___](#term-signed-badge).

<a name="term-award"></a>
__Award__

In the Open Badges ecosystem, the terms "issue" and "award" are synonymous. To award a badge is to [issue](#term-issue) it - this involves the badge [Issuer](#term-issuer) creating a [Badge Assertion](#term-badge-assertion) to describe the award.

<a name="term-badge"></a>
__Badge__

In the context of the OBI, a badge is loosely described as a digital representation of a skill, learning achievement or experience. A badge is represented in digital contexts as an image and some metadata. For the badge to exist within the OBI, this metadata __must__ conform to the [Assertion specification](../Assertion/latest.md).

<a name="term-bake"></a>
__Bake, Baking, Baked Badge__

A baked badge is a badge image file with the data for an [Assertion](#term-badge-assertion) embedded into it. The image __must__ be either a PNG or SVG file. Baked badges are more portable, allowing [Earners](#term-earner) to communicate and display them wherever they choose. Software can extract the Assertion data from a baked badge to access the metadata describing the award.

<a name="term-displayer"></a>
__Displayer__

A badge Displayer presents information about public badge awards in a digital context. Badge [Earners](#term-earner) can add their awarded badges to public collections, which Displayer implementations can query, typically presenting the information about the badge award alongside its image. Badge Displayers require an understanding of the Assertion structure and Baking process in order to extract and display the relevant data within their applications. Badge Displayers __should__ [verify](#term-verify) Assertions prior to displaying them to ensure that a particular badge was in fact awarded to the Earner claiming it.

<a name="term-earner"></a>
__Earner__

An Earner is someone who has been awarded one or more Open Badges. When an [Issuer](#term-issuer) awards a badge, they build information about the Earner identity into a new [Badge Assertion](#term-badge-assertion), which links to information about what the badge represents.

<a name="term-hosted-badge"></a>
__Hosted Badge__

A ___hosted___ badge is one whose Assertion data is represented using the badge image and three JSON files hosted at stable locations. The component parts of a ___hosted___ badge are: the [Badge Assertion](#term-badge-assertion); the Badge Class; the Issuer Organization. The Badge Assertion includes a [verification](#term-verify) field in which either a ___hosted___ or [___signed___](#term-signed-badge) type is specified.

<a name="term-issue"></a>
__Issue__

Issuing is the act of awarding a badge to an [Earner](#term-earner). Badge [Issuers](#term-issuer) create badges and decide who to award them to. In order to issue a badge within the OBI, an Issuer __must__ create a [Badge Assertion](#term-badge-assertion), which __may__ be [___hosted___](#term-hosted-badge) or [___signed___](#term-signed-badge). The Issuer may optionally [bake](#term-bake) the Assertion into the badge image.

<a name="term-issuer"></a>
__Issuer__

An Issuer is a person or organization (or department within an organization) who awards Open Badges to [Earners](#term-earner). Typically the Issuer is responsible for designing and creating the badge as well as awarding it. 

<a name="term-metadata"></a>
__Metadata__

In the OBI, metadata is information about badges, badge awards and badge Issuers. OBI metadata is defined in JSON as part of the [Assertion specification](../Assertion/latest.md). The Assertion metadata structures are designed for interoperability.

<a name="term-obi"></a>
__Open Badge Infrastructure (OBI)__

The OBI is a set of software tools and specifications to support Open Badge systems. These tools provide a framework for issuing, displaying and earning Open Badges within an open ecosystem.

<a name="term-signed-badge"></a>
__Signed Badge__

A ___signed___ badge has its Assertion data included in a JSON Web Signature (JWS). Typically a ___signed___ badge still uses hosted JSON files for the Badge Class and Issuer Organization, but the [Badge Assertion](#term-badge-assertion) JSON is itself packaged as a signature. The Badge Assertion includes a [verification](#term-verify) field in which either a [___hosted___](#term-hosted) or ___signed___ type is specified.

<a name="term-validate"></a>
__Validate, Validation, Validator__

Validation is the act of checking a [Badge Assertion](#term-badge-assertion) for structural validity. This includes verifying well-formedness and correctness of data types, as well as ensuring that any linked resources are available.

<a name="term-verify"></a>
__Verify, Verification__

Verification is the act of checking that a badge was awarded by the [Issuer](#term-issuer) to the [Earner](#term-earner). Badge [Displayers](#term-displayer) __should__ carry out verification on badges before displaying them. Badge Issuers __should__ include the information necessary for this verification to be implemented in [Badge Assertions](#term-badge-assertion). Verification is tailored to whether a Badge Assertion is [___signed___](#term-signed-badge) or [___hosted___](#term-hosted-badge).

## PNG Badges

<a name="baking-pngs"></a>
### Baking

An <a href="http://www.w3.org/TR/PNG/#11iTXt">`iTXt` chunk</a> __must__ be inserted into the PNG with the ___keyword___ `openbadges`. The text __must__ either be a ___signed badge assertion (JWS)___ or the ___raw JSON for the Open Badges assertion data___. Compression __must not__ be used. 

At the moment, _language tag_ and _translated keyword_ have no semantics related to badge baking.

An example of creating a chunk (assuming an `iTXt` constructor) follows:

```js
var chunk = new iTXt({
  keyword: 'openbadges',
  compression: 0,
  compressionMethod: 0,
  languageTag: '',
  translatedKeyword: '',
  text: signature || JSON.stringify(assertion)
})
```

* An `iTXt` chunk with the keyword `openbadges` __must not appear in a PNG more than once__. 
* When baking a badge that already contains Open Badges data, the implementor may choose whether to _pass the user an error or overwrite the existing chunk_.

<a name="extracting-pngs"></a>
### Extracting

To extract the assertion data from a baked badge, implementors __should__ parse the PNG datastream until the ___first___ <a href="http://www.w3.org/TR/PNG/#11iTXt">`iTXt` chunk</a> is found with the keyword `openbadges`. The rest of the stream can be safely discarded. The text portion of the `iTXt` will either be the JSON representation of an Open Badges assertion or a JSON Web Signature.

## SVG Badges

<a name="baking-svgs"></a>
### Baking 

To create a baked badge using an SVG image, implementors should:

* Add an `xmlns:openbadges` attribute to the opening `<svg>` tag with the value `http://openbadges.org`. 
* Directly after the opening `<svg>` tag (as the `svg` element's first child), add an `<openbadges:assertion>` element with a `verify` attribute. 
 * The value of `verify` __must__ either be a ___signed Open Badges assertion (JWS)___ __or__ the ___URL of the hosted badge assertion___ (from the `verify.url` field in the badge assertion).

__If a JSON Web Signature is being baked__: no tag body is necessary and the tag should be self-closing.

__If a JSON assertion is being baked__: the JSON should go into the body of the tag, wrapped in `<![CDATA[...]]>` tags.

An example of a well-baked SVG with a hosted assertion follows:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg"
     xmlns:openbadges="http://openbadges.org"
     viewBox="0 0 512 512">
  <openbadges:assertion verify="https://example.org/assertion.json">
    <![CDATA[
       {
         "uid": "abcdef12345",
         "identity": {
           "recipient": "sha256$cbb08ce07dd7345341b9358abb810d29eb790fed",
           "type": "email",
           "hashed": true
         }
         "verify": {
           "type": "hosted",
           "url":"https://example.org/assertion.json"
         }
         "issuedOn": "2013-11-05",
         "badge": "https://example.org/badge.json"
       }
    ]]>
  </openbadges:assertion>

  <...rest of document...>
</svg>
```

There __must__ be ___only one___ `<openbadges:assertion>` element in a baked SVG. When baking a badge that already contains Open Badges data, the implementor __may__ choose whether to _pass the user an error or overwrite the existing element_.

<a name="extracting-svgs"></a>
### Extracting

To extract the assertion data from a baked SVG bage, implementors __should__:
* Parse the SVG until the ___first___ `<openbadges:assertion>` tag is reached. 
 * The rest of the SVG data can safely be discarded.

The data within the `<openbadges:assertion>` element will either be in the body or in an attribute, depending on whether the badge is signed or hosted.

* ___If the element has no body___: the `verify` attribute will contain the signature of the badge.
* ___If the element has a body___: it will contain the JSON representation of the badge assertion.
