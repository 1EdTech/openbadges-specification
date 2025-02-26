var bestpractices = `

## Best Practices and Implementation Guide

### Terminology

Some of the terms used in this section:

- <dfn>Credential</dfn>: A set of one or more [=claims=] made by an [=issuer=]. A [=verifiable credential=] is a tamper-evident credential that has authorship that can be cryptographically verified. Verifiable credentials can be used to build [=verifiable presentations=], which can also be cryptographically verified.
- <dfn>DID URL</dfn>: A DID plus any additional syntactic component that conforms to the definition in Section 3.2 DID URL Syntax of [[DID-CORE]]. This includes an optional DID path (with its leading / character), optional DID query (with its leading ? character), and optional DID fragment (with its leading # character).
- <dfn>Linked Data Proof</dfn>: A type of embedded signature proof.
- <dfn>Presentation</dfn>: Data derived from one or more [=verifiable credentials=], issued by one or more [=issuers=], that is shared with a specific [=verifier=]. A [=verifiable presentation=] is a tamper-evident presentation encoded in such a way that authorship of the data can be trusted after a process of cryptographic verification.
- <dfn>Subject</dfn>: A person about which [=claims=] are made.

### Support for Decentralized Identifiers (DIDs)

This specification supports the use of [=DID URLs=] as an identifier for the [=issuer=] and [=subject=] of a [=credential=]. This specification also supports the use of [=DID URLs=] to identify the public key used to verify [=verifiable credentials=] with [=Linked Data Proofs=]. Until the [[[DID-CORE]]] specification is approved by W3C and this specification is updated, conformance will not require DID support.

`;
