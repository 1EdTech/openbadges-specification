var terms = `

## Terms

<div class="ednote">
   @@ TBD @@
</div>

The following terms are used throughout this document.

- <dfn>Candidate platform</dfn>: A platform implementing the Open Badges specification with the intent to obtain certification from 1EdTech. They may be in the process to obtain certification.

- <dfn data-lt="RESTful API">REST API</dfn>: A style of web API (Application Programming Interface) loosely based on HTTP methods (DELETE, GET, POST, and PUT) to access resources (e.g. CLRs) via a URL.

- <dfn data-lt="Consumer">Service Consumer</dfn>: In a [=REST API=], the Service Consumer is the actor that initiates the DELETE, GET, or POST request. Also called a Consumer in the [[[SEC-11]]].

- <dfn data-lt="Provider">Service Provider</dfn>: In a [=REST API=], the Service Provider is the actor that responds to a DELETE, GET, or POST request. Also called a Platform in the [[[SEC-11]]].

- <dfn data-lt="VC">Verifiable Credential</dfn> (VC): A tamper-evident credential whose issuer can be cryptographically verified. See [[vc-data-model]].

- <dfn data-lt="VP">Verifiable Presentation</dfn> (VP): A tamper-evident presentation of one or more Verifiable Credentials of which cryptographic verification can be used to determine the trustworthiness of the authorship of the data. [[vc-data-model]]

- <dfn data-lt="Verifiable">Verification</dfn>: The evaluation of whether a [=verifiable credential=] or [=verifiable presentation=] is an authentic and timely statement of the issuer or presenter, respectively. This includes checking that: the credential (or presentation) conforms to the specification; the proof method is satisfied; and, if present, the status check succeeds.

- <dfn>Verifier</dfn>: The entity that receives a [=verifiable credential=] or [=verifiable presentation=] and verifies the credential or presentation has not been tampered with.

`;