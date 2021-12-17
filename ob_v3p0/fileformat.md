var fileformat = `

## Open Badges File Format {#fileformat}

Open Badges can be exchanged as files as defined here, or by using the [API](#api) defined in this specification. The contents of an Open Badge file MUST meet the following criteria:

- The contents of the file MUST represent exactly one [Assertion](#assertion)
- The contents MUST be JSON and JSON-LD (see [Syntaxes](#syntaxes))

<aside class="example" title="Sample Assertion">
    <pre class="json vc" data-schema="org.1edtech.ob.v3p0.assertion.class"
         data-vc-vm="https://example.edu/issuers/565049#key-1">
        {
            "@context": [
                "https://www.w3.org/2018/credentials/v1",
                "https://www.w3.org/2018/credentials/examples/v1"
            ],
            "id": "http://example.edu/credentials/3732",
            "type": ["VerifiableCredential", "OpenBadge"],
            "issuer": {
                "id": "https://example.edu/issuers/565049",
                "type": "IssuerProfile",
                "name": "Example University"
            },
            "issuanceDate": "2010-01-01T00:00:00Z",
            "credentialSubject": {
                "id": "did:example:ebfeb1f712ebc6f1c276e12ec21"
            }
        }
    </pre>
</aside>

`;
