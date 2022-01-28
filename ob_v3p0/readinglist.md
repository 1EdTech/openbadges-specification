# Reading List

This reading list is not part of the specification.

## VC

- [Verifiable Credentials Use Cases](https://www.w3.org/TR/vc-use-cases/), W3C Working Group Note
  > A verifiable claim is a qualification, achievement, quality, or piece of information about an entity's background such as a name, government ID, payment provider, home address, or university degree. Such a claim describes a quality or qualities, property or properties of an entity which establish its existence and uniqueness. The use cases outlined here are provided in order to make progress toward possible future standardization and interoperability of both low- and high-stakes claims with the goals of storing, transmitting, and receiving digitally verifiable proof of attributes such as qualifications and achievements. The use cases in this document focus on concrete scenarios that the technology defined by the group should address.
- [Verifiable Credentials Data Model 1.0](https://www.w3.org/TR/vc-data-model/), W3C Recommendation
  > Credentials are a part of our daily lives; driver's licenses are used to assert that we are capable of operating a motor vehicle, university degrees can be used to assert our level of education, and government-issued passports enable us to travel between countries. This specification provides a mechanism to express these sorts of credentials on the Web in a way that is cryptographically secure, privacy respecting, and machine-verifiable.
- [Verifiable Credentials Implementation Guidelines 1.0](https://www.w3.org/TR/vc-imp-guide/), W3C Working Group Note
  > This document provides implementation guidance for Verifiable Credentials.

### Proofs

VC proofs are discussed in both the Data Model and Implementation Guide above.

- [Data Integrity 1.0](https://w3c-ccg.github.io/data-integrity-spec/), W3C Community Group Draft Report
  > This specification describes a mechanism for ensuring the authenticity and integrity of structured digital documents using cryptography, such as digital signatures and other digital mathematical proofs.
- [JWT vs Linked Data Proofs: comparing Verifiable Credentials](https://medium.com/mattr-global/jwt-vs-linked-data-proofs-comparing-vc-assertion-formats-a2a4e6671d57), Medium article
- [Linked Data Proofs vs JOSE: Why not both?](https://medium.com/transmute-techtalk/linked-data-proofs-vs-jose-why-not-both-1594393418cc), Medium article
- [JSON-LD Signatures](https://github.com/digitalbazaar/jsonld-signatures), GitHub repo
  > An implementation of the Linked Data Signatures specification for JSON-LD, for Node.js and browsers.
- [Linked Data Signatures WG Charter](https://lists.w3.org/Archives/Public/public-credentials/2021May/att-0082/2021-Linked-Data-Security-WG-Charter.pdf), PDF presentation
- [Linked Data Cryptographic Suite Registry](https://w3c-ccg.github.io/ld-cryptosuite-registry/), W3C Community Group Draft Report
  > This document serves as an informative registry for all known Linked Data Key descriptions and their associated specifications.

#### Additional Signature Suites

The [Suite Registry](https://w3c-ccg.github.io/ld-cryptosuite-registry/) appears to be out-of-date. Here are some other Linked Data Cryptographic Suites.

- [Ed25519 Signature 2020](https://w3c-ccg.github.io/lds-ed25519-2020/), W3C Community Group Draft Report
  > This specification describes an Ed25519 Signature Suite created in 2020 for the Linked Data Proof specification. The Signature Suite utilizes Ed25519 EdDSA signatures and multibase.
