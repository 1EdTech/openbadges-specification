---
title: Open Badges 2.0 Conformance and Certification Guide
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
<td>Date Issued</td>
<td>12 April 2018</td>
</tr>
<tr>
<td>Status</td>
<td>IMS Final Release</td>
</tr>
<tr>
<td>Latest version:</td>
<td><a href="https://www.imsglobal.org/spec/ob/v2p0/cert/">https://www.imsglobal.org/spec/ob/v2p0/cert/</a></td>
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
 * [1. Introduction](#intro)
 * [2. The Conformance Process](#conf)
 * [3. Open Badges 2.0 Issuer Service Conformance](#issuer)
 * [4. Open Badges 2.0 Displayer Service Conformance](#displayer)   
 * [5. Open Badges 2.0 Host Service Conformance](#host)
 * [6. List of Contributors](#contrib)

</div>

## <a id="intro"></a>1. Introduction

The goal of IMS certification for Open Badges is to ensure interoperable implementations of badging systems that generate and issue digital badges as well as those that host and display badges.

IMS certification for Open Badges 2.0 demands features and capabilities beyond those that are strictly required by the specification. These additional features are defined in this document. The specification is intentionally left very flexible to allow it to be used for many purposes. Gaining this certification is expected to be more difficult than simply meeting the minimum requirements for producing a valid Open Badge.

Certification may be achieved in one or more of the following services:

* Open Badges Issuer
* Open Badges Displayer
* Open Badges Host

The service types and associated certification tests are defined in sections 3, 4 and 5 below.

## <a id="conf"></a>2. The Conformance Process

The process for conformance testing service implementations of Open Badges 2.0 includes the following:

* Go to the [IMS Conformance Test Suite for Open Badges 2.0](https://www.imsglobal.org/open-badges-certification-suite) and follow the instructions to create and submit an application for conformance certification.

To pass certification, you must take the following steps:

* You must be an IMS Digital Credentials and Badges Alliance Member, an IMS Affiliate Member, or IMS Contributing Member. 
* You must pass all the tests associated with the service type you are applying for using the certification suite hosted on the IMS website. For definitions of service types and associated tests, see sections 3, 4 and 5 below. 
* The tests must be completed by a designated representative of the IMS member organization, and you must agree that there is no misrepresentation or manipulation of results in the submitted information.

After IMS reviews your submitted information and notifies you that your application is approved, you can claim certification to Open Badges and display the IMS certified logo on your website and in your software. The [IMS Global conformance chart](https://www.imsglobal.org/cc/statuschart.cfm) will list your conformance details.

## <a id="issuer"></a>3. Open Badges 2.0 Issuer Service Conformance

<p>
	A <em>Open Badges <strong>Issuer</strong></em> is an application that
	allows for the creation of <em>BadgeClasses</em> and the subsequent
	delivery of <em>Assertions</em> to recipients that conform to the Open
	Badges Specification. Beginning with Open Badges 2.0, the candidate
	platform must issue a valid baked badge and demonstrate how the badge
	is retrieved by the recipient.
</p>

<p>
	<strong>Test</strong>
</p>
<ol>
	<li>Create a valid baked 2.0 badge and issue it to the recipient 
		<code>conformance@imsglobal.org</code>.</li>
				
	<li>Demonstrate through video the candidate platform's methodology
		for a recipient to retrieve their badge.</li>

</ol>

## <a id="displayer"></a>4. Open Badges 2.0 Displayer Service Conformance

<p>
	An <em>Open Badges <strong>Displayer</strong></em> is an application
	that displays verified badges to viewers. Beginning with Open Badges
	2.0, the candidate platform must display a minimum set of badge
	metadata and support viewer-initiated verification of a badge.
</p>

<p>
	<strong>Test</strong>
</p>
<ol>
	<li>
		<p>Demonstrate through separate videos that the platform allows viewers of
			badges to see the following data in three different badges. (Note
			that IMS is not supplying these badges; you will have to supply them
			yourself.)</p>
		<p>
			<strong>Badge 1</strong>
		</p>
		<ol type='a'>
			<li>BadgeClass image, name, description, issuer name, issuedOn
				date</li>
			<li><b>Neither expired nor revoked</b></li>
		</ol>
		<p>
			<strong>Badge 2</strong>
		</p>
		<ol type='a'>

			<li>BadgeClass image, name, description, issuer name, issuedOn
				date</li>
			<li><b>Expired status</b> (display of date optional)</li>
			<li>Not revoked</li>
		</ol>
		<p>
			<strong>Badge 3</strong>
		</p>
		<ol type='a'>

			<li>BadgeClass image, name, description, issuer name, issuedOn
				date</li>
			<li>Not expired</li>
			<li><b>Revoked status</b> (display of reason optional)</li>
		</ol>
	</li>
	<li>
		<p>Demonstrate through video that the platform allows viewers of badges to do one or both
			of the following:</p>
		<ol type='a'>
			<li>Trigger verification of the badge and retrieve results
				verifying that the badge assertion is not expired, and not revoked.</li>
			<li>Consume pre-existing verification information that includes
				the results and timestamp of latest verification.</li>
		</ol>
	</li>
</ol>

## <a id="host"></a>5. Open Badges 2.0 Host Service Conformance

<p>
	An <em>Open Badges <strong>Host</strong></em> is an application that
	can aggregate and publicly host Assertions for recipients. It also
	supports export of badges at user request. Beginning with Open Badges
	2.0, the candidate platform must be able to import all formats of Open
	Badges as well as prove that badge metadata is not lost upon export of
	the badge.
</p>

<p>
	<strong>Test</strong>
</p>
<ol>
	<li>Using the artifacts provided below, demonstrate through video
		the ability to import each of the provided artifacts (baked PNG badge,
		baked SVG badge, and Assertion URL). Note that the applicant may be
		required to create a fake account in the candidate platform.</li>

	<li>Using one of the badge formats provided below, demonstrate
		through video the full process of importing the badge into your
		platform, exporting it out of your platform, and then submitting that
		badge to IMS for diff comparison with the original.</li>
</ol>

<p><em>Note - the recipient identity in these badges is <code>conformance@imsglobal.org</code></em>.</p>

<table class="data">
	<tr>
		<th>Required Badge Format</th>
		<th>Use this resource for the demonstrations</th>
	</tr>
	<tr>
		<td>Baked badge (PNG) format</td>
		<td>https://openbadgesvalidator.imsglobal.org/SampleResources/OB20-assertion1-conformance.png</td>
	</tr>
	<tr>
		<td>Baked badge (SVG) format</td>
		<td>https://openbadgesvalidator.imsglobal.org/SampleResources/OB20-assertion-conformance-servicelearning.svg</td>
	</tr>
	<tr>
		<td>Assertion URL</td>
		<td>https://badges.imsglobal.org/public/assertions/1geQXkWnQnW0BkWcO3jSPA.json?v=2_0</td>
	</tr>
</table>



## <a id="contrib"></a>6. List of Contributors

The following individuals contributed to the development of this document:

| Name | Organization |
| ------------- | ------------- |
| Jeff Bohrer | [IMS Global](https://www.imsglobal.org) |
| Timothy F. Cook | [LRNG](https://www.lrng.org) |
| Steve Gance | [Washington State Board for Community and Technical Colleges](https://www.sbctc.edu/) |
| Markus Gylling | [IMS Global](https://www.imsglobal.org) |
| Viktor Haag | [D2L](https://www.d2l.com) |
| Alex Hripak | [Credly](https://www.credly.com) |
| Nate Otto | [Concentric Sky](https://www.concentricsky.com/) |
| Justin Pitcher | [Chalk & Wire](http://www.chalkandwire.com/) |

