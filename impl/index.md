---
title: Open Badges 2.0 Implementation Guide
show_sidebar: false
layout: page_sub
---
{::options parse_block_html="true" /}

<div id="top">
<a href="http://www.imsglobal.org"><img src="../images/imsglobal-logo.png" alt="IMS Global Logo" id="imslogo" /></a>
</div>

<p class="status">IMS Final Release</p>

<h1 class="infoModelTitle">{{page.title}} <br/> IMS Final Release</h1>

<br>

<table class="versionTable" title="Version/Release Details">
<tr>
<td>Date Issued:</td>
<td>12 April 2018</td>
</tr>
<tr>
<td>Status</td>
<td>IMS Final Release</td>
</tr>
<tr>
<td>Latest version:</td>
<td><a href="https://www.imsglobal.org/spec/ob/v2p0/impl/">https://www.imsglobal.org/spec/ob/v2p0/impl/</a></td>
</tr>
</table>

<br>

<div class="iprDistribution">
	
**IPR and Distribution Notices**

Recipients of this document are requested to submit, with their comments, notification of any relevant patent claims or other intellectual property rights of which they may be aware that might be infringed by any implementation of the specification set forth in this document, and to provide supporting documentation.

IMS takes no position regarding the validity or scope of any intellectual property or other rights that might be claimed to pertain to the implementation or use of the technology described in this document or the extent to which any license under such rights might or might not be available; neither does it represent that it has made any effort to identify any such rights. Information on IMS's procedures with respect to rights in IMS specifications can be found at the IMS Intellectual Property Rights web page: [http://www.imsglobal.org/ipr/imsipr_policyFinal.pdf](http://www.imsglobal.org/ipr/imsipr_policyFinal.pdf).

Copyright © 2018 IMS Global Learning Consortium, published under the IMS Global [contributor license agreement](https://www.imsglobal.org/sites/default/files/IMS%20Individual%20Contributor%20License%20Agreement.pdf) and [specification license](https://www.imsglobal.org/speclicense.html). This specification is free for anyone to use or implement.

Permission is granted to all parties to use excerpts from this document as needed in producing requests for proposals.

The limited permissions granted above are perpetual and will not be revoked by IMS or its successors or assigns.

THIS SPECIFICATION IS BEING OFFERED WITHOUT ANY WARRANTY WHATSOEVER, AND IN PARTICULAR, ANY WARRANTY OF NONINFRINGEMENT IS EXPRESSLY DISCLAIMED. ANY USE OF THIS SPECIFICATION SHALL BE MADE ENTIRELY AT THE IMPLEMENTER'S OWN RISK, AND NEITHER THE CONSORTIUM, NOR ANY OF ITS MEMBERS OR SUBMITTERS, SHALL HAVE ANY LIABILITY WHATSOEVER TO ANY IMPLEMENTER OR THIRD PARTY FOR ANY DAMAGES OF ANY NATURE WHATSOEVER, DIRECTLY OR INDIRECTLY, ARISING FROM THE USE OF THIS SPECIFICATION.

Public contributions, comments and questions can be posted here: [https://www.imsglobal.org/forums/ims-glc-public-forums-and-resources/open-badges-community-forum](https://www.imsglobal.org/forums/ims-glc-public-forums-and-resources/open-badges-community-forum).

<p class="endWarranty">The IMS Logo is a trademark of the IMS Global Learning Consortium, Inc. in the United States and/or other countries.</p>

<p class="endWarranty">For more information: [https://www.imsglobal.org/trademarks](https://www.imsglobal.org/trademarks) </p>

_Documents Name: {{page.title}}_

_Revision: 12 April 2018_

</div>

<br/>

<hr/>

<div id="toc">
	
##  Contents
 * [Introduction](#intro)
 * [Use Cases](#usecases)
 * [Recommended Practices](#recpractices)
 * [Definition of Key Terms](#terms)
 * [List of Contributors](#contrib)
  
</div>

## <a id="intro"></a> Introduction
### Scope
The Open Badges 2.0 (OBv2) specification describes a method for packaging information about accomplishments and recognition, embedding it into portable image files as digital badges, and establishing resources for its validation and verification. It includes term definitions for representations of data in Open Badges. These term definitions appear in the current [JSON-LD context (v2.0)](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0/v2/context.json) for the OBv2 specification.

This document aims to provide recommended practices, gathered from real-world implementations and experience, that an implementation of the specification should consider following.



## <a id="context"></a> Context
### Overview
Open Badges put learners in control of how and where they share verifiable evidence of their skills and achievements with people, organizations, and social platforms.

Open Badges enable learner-control of sharing their credentials and communicating their meaning to educational institutions and employers. These credentials show evidence of rigor of the academic achievement through the inclusion of criteria, assessment details, learner's evidence, alignment with external frameworks, accreditation details, and endorsements.

OBv2 introduces features that significantly improve the verifiability, portability, reliability, and discoverability of Open Badges.

<img alt="Open Badges workflow illustration" src="assets/image1.png" style="width: 75%; height:75%"/>


### Related Documents
* [OBv2 Specification](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0/index.html)
* OBv2 Conformance and Certification Guide



## <a id="usecases"></a> Use Cases
The following use cases are supported:
1. Creating a BadgeClass - BadgeClass objects can be created to build a catalog of badges that may be available to earn from the issuer. They may include information about the achievement including how to earn it or learn more about the issuer and achievement itself.
2. Issuing badge Assertions to recipients - With a catalog of badges (BadgeClasses) prepared, you can issue those badges to recipients by creating Assertion objects. The Assertion is the representation of an awarded badge and may include evidence and supporting information on how the recipient became eligible for it.
3. Displaying Open Badges - Typically, when an Open Badge is displayed, the Assertion and related objects are displayed on a screen in human-readable format. Supporting this enables the recipient to showcase their earned achievements and choose to allow others to view those.
4. Importing Open Badges - Badge Hosts must support the function of importing Open Badges. This involves a process by which an Assertion and related objects are validated for format and integrity. Import of Open Badge data normally results in the subsequent display of that data.



## <a id="recpractices"></a> Recommended Practices
These recommended practices are in addition to the information provided in the specification document and certification requirements document. Please refer to each of these resources for comprehensive implementation details.

### Accessibility
- Ensure that the user interfaces of your platform are accessible to people with disabilities by following guidelines provided in [Web Content Accessibility Guidelines (WCAG) 2.0](https://www.w3.org/TR/WCAG20/).

### Badge Issuer
#### Issuing Badges
- Creating Badge Classes
  - Accessibility: Encouraging alt text for images - The Image data object contains a “Caption” property which can be rendered as alt text for images. Badge platforms should consider adding features that prompt users who create badge classes to submit Caption text to be used for this purpose. 
- Delivering badges to recipients
  - Typically, an Open Badge is made available to recipients through an email message or other notification that contains instructions and a mechanism for downloading the badge without signing up for any account. 
- Recipient should be notified
  - Any badge recipient should be notified when a badge is issued to them. Notification should contain details and/or a link to critical information about the badge. Allow for unsubscription of future notifications. Abuse prevention is key here. Allow recipients to opt out of email from your service permanently.
- Claiming badges by recipient
  - Badge earners should have agency in whether they accept the badge issued to them. Give earners the opportunity to choose to receive (“claim”) the badge if they desire. You may designate an issued badge as “not yet claimed” within your service. 
  - Give recipients the choice to accept or reject the badge and options to express their acknowledgement or rejection. Rejection may mean deleting the badge and all associated data with it.
  - Consider implementing a reminder process if a recipient has not claimed their badge. This applies to systems that have account management as a function. Important to respect opt-out choices here.
  - Consider obtaining acceptance from the recipient before publishing a signed assertion which, unlike hosted assertions, cannot be unpublished. 
  - Implement a process that enables the reporting of abusive content.
  - Recipient identifier (email address or phone number) should be confirmed prior to the recipient doing other things with the badge like making it private or public.
- Revoking badge assertions
  - The revocation properties of Open Badges provide a mechanism by which a badge issuer may retract or nullify existing badge assertions. Revocation is an intentional act of a badge issuer and differs from the expiration date of a badge assertion, though both expiration and revocation are ways to communicate that the badge assertion is no longer current. 
- Maintaining hosted resources for badge verification
  - A critical feature of Open Badges is the ability for consumers to verify the badge. Maintain necessary hosted verification resources for the entire useful life of issued badges. This requires services to maintain a high level of availability. 
  - Consider processes to prevent authorized BadgeClass owners from deleting existing BadgeClasses from which assertions have been issued. BadgeClasses are required resources for validating and verifying assertions.

#### Publishing Badges
- Expectations of publishing badges
  - The act of publishing a badge assertion means that the badge becomes a publicly accessible URL. 
- Accessibility: Encouraging alt text for images
  - The Image data object contains a “Caption” property which can be rendered as alt text for images. If a badge contains Caption data, consider using it to populate an image’s alt text field. 

#### Ending Badge Services
- When a badge service provider must close down its operations, there are a number of actions that are recommended to ensure continuity of service for the badge recipients. In order for previously-issued badges to remain valid, steps should be taken to ensure that those hosted resources that are necessary for the validation of the badges remain intact. If a badging service must be shut down, here are a number of actions to consider taking:
  - Move hosted assertions over to a new location and implement redirects.
  - Convert to signed assertions and redeliver to all recipients. (This will result in all previously hosted badges becoming invalid.)
  - Consider reissuing assertions using a different service or verification method that has less onerous persistent hosting requirements.

### Badge Displayer
- General
  - Where possible, include contextual information on how to learn more about the Issuer, the Badge and possibly how to earn it.
- Displaying Images
  - The Caption property of the Image class should be exposed as a caption or alt text on the page.
  - Image should be fully visible, not truncated or distorted. If provided,include caption as caption or alt text.
- Displaying Recipient Name
  - If available and allowed by the badge recipient, the name of the recipient should be displayed. However, privacy considerations must be paramount. Publicly available badge assertions must only display recipients’ names following explicit permission of the recipient. Recipients must be able to change this setting at any time.
  - Recipient name is not part of the Assertion data itself, and the system should not trust name data unless it is also the issuing platform and that data was entered and verified by a trusted source like the issuer itself (alongside data that is served in the Assertion). If name is presented, the system should make clear to the viewer why it trusts this name to be associated with a specific Assertion.
- Displaying Evidence
  - Provide convenient access to evidence. When possible, display multimedia evidence alongside the earned badge.
- Displaying JSON
  - Provide access to the original JSON or full data of the badge.
- Supporting Verification
  - Display the date of last verification.
  - Update system's verification record when viewers request reverification.
  - If the badge is not valid display human-readable error messages as best possible.
  - If the badge data is not available, consider use of “Could not verify” message to account for cases of temporary unavailability (like server outages). 
  - Provide options for retrying verification in the event a resource was missing or otherwise unavailable.
  - Nuanced user-friendly messages in UI are recommended for various types of http responses; e.g. 503 vs 404 vs 410 gone with revocation.
- Updating Assertions - On occasion, an already-issued assertion must be updated (e.g. newly available evidence in a hosted assertion). Consider the following:
  - Updates should be reflected within the user-facing interface.
  - Display the last time the assertion and associated objects were fetched and/or updated.

### Badge Host
#### Hosting Badges
- Certification - Those interested in receiving IMS certification as Host should also strongly consider becoming certified as Displayer.
- Collections - Hosts should allow badge recipients to group badges into collections or pages to present the badges together.
- Extensions - Implement specific display functionality tailored to well-used extensions. 
- JSON availability - Make JSON available to consumers who wish to view it.

#### Importing Badges
- Allow importing of signed assertion strings.
- Helpful errors should be presented to the user in the event the import failed.

#### Sharing Badges
- Provide instructions on how to share your badge.
- Allow sharing to be retracted by the badge recipient.
- Recommended types of sharing options:
  - Download baked badge image file
  - Social media integrations
  - Copy URL to JSON assertion
  - Retrieve HTML to display the badge

### Other
#### Extensions
- Creators of extensions are encouraged to submit extensions to the [public repository](https://github.com/IMSGlobal/openbadges-specification/tree/master/extensions) for review and feedback by the IMS workgroup. (Can also include a link to info on OB extensions and samples.)
#### Emerging Concepts and Concerns
- Versioning
  - Badge Issuer: When a BadgeClass or Assertion is updated, use the version property to number your versions and provide references between them.
  - Badge Host: Implement "version" detection for imported badges and relate between them. 
  - Technical notes: There is much to be discovered about what a successful interaction between Issuer and Host for versioning BadgeClasses or Assertions looks like.


## <a id="terms"></a> Definition of Key Terms
The following terms are used throughout this document. Explanations of many other related terms appear within the [specification document](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0/index.html).
- **Assertion**: A representation of an awarded badge, used to share information about a badge belonging to one recipient.
- **Backpack**: A term originally used to describe Open Badges services that provide importing, aggregation, and hosting features for recipients. These services match most closely with the role we now define as an Open Badge “Host” application. May also refer to the Mozilla Backpack.
- **BadgeClass**: A collection of information about the accomplishment recognized by the Open Badge. Many assertions may be created corresponding to one BadgeClass.
- **Badge Issuer**: A service that allows for the creation of BadgeClasses and the subsequent issuing of Assertions to recipients that conform to the Open Badges specification. Beginning with Open Badges 2.0, the candidate platform must issue a valid baked badge and demonstrate how the badge is retrieved by the recipient.
- **Badge Displayer**: An application that displays verified badges to viewers. Beginning with Open Badges 2.0, the candidate platform must display a minimum set of badge metadata and support viewer-initiated verification of a badge.
- **Badge Host**: An application that can import, aggregate, and publicly host Assertions for recipients. It also supports export of badges at user request. Beginning with Open Badges 2.0, the candidate platform must be able to import all formats of Open Badges as well as prove that badge metadata is not lost upon export of the badge.
- **Baked badge**: Badge Assertions may be “baked” into image files as portable credentials.
- **Candidate platform**: A platform implementing the Open Badges specification with the intent to obtain certification from IMS. They may be in the process to obtain certification.
- **Criteria**: Detailed information about what must be done in order to be recognized with an assertion of a particular BadgeClass. Potential recipients may use criteria to understand what they must do; consumers may use criteria to understand what recipients did in order to earn the badge.
- **Evidence**: Links to and descriptions of evidence related to the issuance of an Assertion, such as portfolio items or narratives that describe a badge recipient's work.
- **Extensions**: Extensions are a means for issuers to add additional functionality through the use of metadata on Badge Objects beyond what the standard specifies itself.
- **Validation and verification (of badge assertions)**: Data validation is a procedure that ensures a cluster of data objects that form an Open Badge are appropriately formatted, published, and linked and that each data object conforms to requirements for its class. Validation of all data class instances used in an Open Badge is a part of badge verification. Verification is the process of ensuring the data that makes up an Open Badge is correct. It includes a number of data validation checks as well as procedures to ensure the badge is trustworthy. Verification is distinct from compliance certification for applications and services that implement the specification, though verification is typically a component of certification programs. See [Verification](https://www.imsglobal.org/sites/default/files/Badges/OBv2p0/index.html#verification) in the current specification.


## <a id="contrib"></a> List of Contributors

The following individuals contributed to the development of this document:
- Jeff Bohrer, IMS Global
- Timothy F. Cook, LRNG
- Steve Gance, Washington State Board for Community and Technical Colleges
- Markus Gylling, IMS Global
- Viktor Haag, D2L
- Alexander Hripak, Credly
- Nate Otto, Concentric Sky
- Justin Pitcher, Chalk & Wire
- Alex Reis, D2L
- Jarin Schmidt, Pearson Acclaim



