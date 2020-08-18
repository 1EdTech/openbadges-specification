
# Roadmap

This document outlines the steps we believe are required to gain acceptance of DIDs in Open Badges along with usecases that align with the roadmap.


## Tasks

Tasks define tangible work items that accomplish use cases and progress the timeline.

 Task             | Notes          | Status   | 
|-----------------|----------------|----------|
| Document "What is a DID" | Present in [did-in-badges](dids-in-badges.md) | Draft |
| Document "How to get a DID" | Present in [did-in-badges](dids-in-badges.md) | Draft |
| Document DIDs in Badges Value Proposition | Present in [did-in-badges](dids-in-badges.md) | Draft |
| Document Spec Changes | Present in [did-in-badges](dids-in-badges.md) | Draft |
| Pilot Program Proposal | Propose a pilot program with a pilot roadmap, check-ins with IMS staff and workgroup, identified low-risk high-reward items, and piloting principles | TODO |
| Extension Example | Example Extension/Additional Properties Approach AND Example next version “pure OB 2.2” of what this could look like. | TODO |


## Use Cases

The use cases listed below are what we believe to be the enumeration of problems to be solved in adding DIDs to Open Badges. The order reflect current prioritization and is subject to change.

 Capability       | Complexity     | Potential Value   | Priority |
|-----------------|----------------|-------------------|----------|
| Prove ownership of a DID as a potential recipient | lg | lg | 1 |
| Provide a proof that a particular host account is held by the holder of a particular DID | lg | lg | 1 |
| Determine if a DID-based issuer identity is a trustworthy representation of a real-world (“meatspace”) organization | lg | lg | 1 |
| Award a badge to a DID-based recipient | sm | md | 2 |
| Claim a DID as a recipient and present it to issuer & host | med | med | 2 |
| Include DID-based profile identification in Badge Connect APIs | med | med | 3 |
| Use a DID as an issuer identifier, tied to signing keys for assertions | med | lg | 3 |
| Describe a Badge Connect service (SIOP?) that I use in my DID document | med | med | 3 |

## Timeline

The timeline proposed is broken into three stages of three month intervals. The timeline is subject to changes.

### Stage 1

**August 2020 - October 2020**

- Recipient brings a DID to an Issuer platform. Issuer platform verifies their control of DID
- Alternatively an Issuer can generate DID for a Recipient
- Consumer trusts Issuer validation for a Recipient’s control of DID
- Create first draft of the specification
- Create supporting documentation for working with DIDs
- Create working sample as an OB Extension

### Stage 2

**October 2020 - December 2020**

- Look to standardize on technical standard (e.g. OIDC SIOP) for Issuers to validate Recipient control of DID
- Support DIDs in Badge Connect
- Look for two Badge Platforms to trial use of DIDs
- Refine supported DIDs based on experiences from Stage 1
- Update draft specification

### Stage 3

**December 2020 - February 2021**

- Look to standardize on technical standard for Open Badge stakeholders (Backpacks, Displayers, Consumers) to validate Recipient control of DID
- Finalize specification
- Create compliance tooling
- Make it into OB v.Next
