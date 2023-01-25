## Conformance and Certification

The [[OB-CERT-30]] covers the specific requirements that implementers must cover
in order to achieve certification for a successful implementation of Open Badges
3.0. An accompanying CLR 2.0 guide is forthcoming. Here is a quick summary of
the types of services that can be certified.

### Certified Roles in Open Badges

Services implementing Open Badges fall into one or more ecosystem roles,
depending on their relationship to issued credentials. These roles are named
"Issuer", "Host", and "Displayer". Issuer services may also add on API support
as an additional optional certification level, whereas API support is required
for the other two roles. This recognizes that some issuers deliver signed
credentials directly to holders via file downloads or potential integrations
with wallet

-   Issuer: A product that issues Open Badges and transmits them to learners.
    Certification as an issuer covers whether a well-formed signed
    `OpenBadgeCredential` is produced by the tested product.
    -   Optional API support: Issuers can achieve an additional level of
        certification for Issuer API support if they can demonstrate successful
        registration with the reference Host system, authorization code grant
        flow execution for a test user, and transmission of signed Open Badge(s)
        to the reference Host system by posting them to the Host API.
-   Host: A product implementing the server side of the Open Badges API that
    holds badges on behalf of data subjects or holders and controls API access
    to them. The Resource Server responds to automatic registration requests,
    authorization grant flow initiations, and authenticated resource requests
    via the API endpoints.
-   Displayer: A product that implements the client side of the Open Badges API.
    Certification is granted that the product can demonstrate successful
    registration with the reference Host system, authorization code grant flow
    execution for a test user, and transmission of signed Open Badge(s) from the
    reference Host system by making a request for credentials held by a user who
    completed the authorization flow.

### Certified Roles in CLR

Certified CLR 2.0 services require use of the API in the same roles as Open
Badges, except that the credentials transmitted over the API must be
`ClrCredential`s meeting the requirements displayed by the test system.
Issuer-only certification without API support is not listed as an option for
CLR.

### Conformance Testing Process

Follow the conformance and certification guide listed in the specification for
detailed instructions on conformance. A 1EdTech member organization wishing to
submit their product for conformance certification will undergo a semi-automated
process, following onscreen instructions to run the tests. Then they submit
their test results for review by 1EdTech, and if they successfully meet the
requirements, the product will appear in the TrustEd Apps Directory, where
consumers may find it under filters for each of the implementation roles they
are looking for a product to serve.
