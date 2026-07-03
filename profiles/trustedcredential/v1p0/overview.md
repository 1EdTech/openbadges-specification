---
title: "Overview"
docType: "segment"
status: "PublicDraft"
author: "1Edtech Consortium"
lastUpdated: 2026-07-12
description: "Overview for TrustEd Credential 1.0 Profile"
---

## Overview

The TrustEd Credential Profile for Open Badges 3.0 defines a structured and interoperable approach for representing high-quality digital credentials. The profile establishes additional requirements and guidance for the use of existing OB3 properties, including achievementType, criteria, alignment, result, and evidence, to improve consistency, transparency, and interpretability.

The profile introduces conventions for representing credential meaning and achievement using existing Open Badges 3.0 properties, including achievementType, assessment, skills alignment, evidence, criteria, and outcomes. These conventions enable conformant systems to consistently interpret credential meaning and level of achievement without reliance on issuer-specific context.

### What is the problem this solves for?

The proliferation of digital credentials has resulted in significant variability in how achievements are described and communicated. While OB3 provides a flexible data model, inconsistent use of properties such as criteria, alignment, result, and evidence limits the ability of receiving systems to reliably interpret credential meaning.

Key challenges include:
	•	Lack of consistent use of achievementType, resulting in ambiguity between participation, knowledge acquisition, and applied competency.
	•	Incomplete or inconsistent representation of alignment to skills or frameworks, reducing comparability across credentials.
	•	Limited or non-standard use of evidence and result, making it difficult to assess rigor or level of achievement.
	•	Absence of structured expectations for representing assessment methods, such as rubrics or validated assessments.

The TrustEd Credential Profile addresses these challenges by defining required and recommended usage patterns for Open Bages 3.0 properties, enabling consistent, machine-readable representation of credential quality, assessment, and outcomes.

### Benefits and Opportunities

The TrustEd Credential Profile enables improved interoperability and interpretability of digital credentials across issuing and receiving systems.

For learners:
	•	Credentials include structured use of alignment, result, and evidence, enabling clearer communication of demonstrated knowledge and skills.
	•	Credentials can be transferred across systems while preserving meaning and required metadata.

For issuers:
	•	Provides implementation guidance for consistent use of Open Badges 3.0 properties such as criteria, alignment, result, and evidence.
	•	Enables explicit representation of achievement type through controlled use of achievementType.
	•	Supports alignment to external frameworks through standardized use of alignment.

For receiving systems:
	•	Enables reliable parsing and interpretation of credentials based on consistent metadata patterns.
	•	Supports automated or semi-automated evaluation of credentials using result, evidence, and alignment.
	•	Reduces reliance on issuer-specific interpretation or external validation.

For the ecosystem:
	•	Establishes a common profile for representing high-quality credentials within OB3.
	•	Improves interoperability by defining consistent usage of existing properties rather than introducing incompatible extensions.
	•	Strengthens trust in digital credentials as verifiable and comparable representations of learning and achievement.
