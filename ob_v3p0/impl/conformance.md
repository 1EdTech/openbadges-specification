## Conformance and Certification

Open Badges and CLR enable implementers to choose specific roles their product
fills and receive certification for the capabilities of that role.

### Certified Roles in Open Badges

TODO the Conformance and Certification Guide in this repo lists the roles as
"Issuer", "Displayer", "Host" in one spot, and then Service Consumer (Read),
Service Consumer (Write), Service Provider (Read), Service Provider (Write), and
it hasn't yet incorporated the idea of "issuer only" certification that was
referenced in recent meetings. Follow up and make consistent.

-   Resource Server: A product implementing the server side of the Open Badges
    API that holds badges on behalf of data subjects or holders and controls API
    access to them. The Resource Server responds to automatic registration
    requests, authorization grant flow initiations, and authenticated resource
    requests via the API endpoints. The Resource Serve is also called "Provider"
    in the IMS Global Security Framework.
-   Client: A product implementing the client side of the Open Badges API,
    either to send `OpenBadgeCredential`s to a Resource Server or to request
    them from such a server. The client initiates registration of itself with
    the server, negotiates authorization requests via code-based grant
    redirection flows, and then makes requests to resources (badges) held by the
    Resource Server.
-   Resource Server (read only?): TODO are we doing this one like in 2.1 --
    where is the list of roles?
-   Issuer Only: a product that is capable of signing Verifiable Credentials
    compliant with the Open Badges data model but who does not implement the
    Open Badges API.

### Certified Roles in CLR

-   Resource Server
-   Client
-   Resource Server (read only?)
-   Issuer Only

### Conformance Testing Process

Follow the conformance and certification guide listed in the specification for
detailed instructions on conformance.
