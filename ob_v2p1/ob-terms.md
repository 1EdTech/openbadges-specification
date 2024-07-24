var terms = `

### Terminology
The following terms are used throughout this document.

- **Assertion**: A representation of an awarded badge, used to share information about a badge belonging to one recipient.
- **Backpack**: A term originally used to describe Open Badges services that provide importing, aggregation, and hosting features for recipients. These services match most closely with the role we now define as an Open Badge “Host” application. May also refer to the Mozilla Backpack.
- **BadgeClass**: A collection of information about the accomplishment recognized by the Open Badge. Many assertions may be created corresponding to one BadgeClass.
- **Badge Connect&reg; API**: Name of the RESTful web service for transfering assertions and profiles between systems.
- **Badge Issuer**: A service that allows for the creation of BadgeClasses and the subsequent issuing of Assertions to recipients that conform to the Open Badges specification. Beginning with Open Badges 2.0, the candidate platform must issue a valid baked badge and demonstrate how the badge is retrieved by the recipient.
- **Badge Displayer**: An application that displays verified badges to viewers. Beginning with Open Badges 2.0, the candidate platform must display a minimum set of badge metadata and support viewer-initiated verification of a badge.
- **Badge Host**: An application that can import, aggregate, and publicly host Assertions for recipients. It also supports export of badges at user request. Beginning with Open Badges 2.0, the candidate platform must be able to import all formats of Open Badges as well as prove that badge metadata is not lost upon export of the badge.
- **Baked badge**: Badge Assertions may be “baked” into image files as portable credentials.
- **Candidate platform**: A platform implementing the Open Badges specification with the intent to obtain certification from IMS. They may be in the process to obtain certification.
- **Criteria**: Detailed information about what must be done in order to be recognized with an assertion of a particular BadgeClass. Potential recipients may use criteria to understand what they must do; consumers may use criteria to understand what recipients did in order to earn the badge.
- **Evidence**: Links to and descriptions of evidence related to the issuance of an Assertion, such as portfolio items or narratives that describe a badge recipient's work.
- **Extensions**: Extensions are a means for issuers to add additional functionality through the use of metadata on Badge Objects beyond what the standard specifies itself.
- **Validation and verification (of badge assertions)**: Data validation is a procedure that ensures a cluster of data objects that form an Open Badge are appropriately formatted, published, and linked and that each data object conforms to requirements for its class. Validation of all data class instances used in an Open Badge is a part of badge verification. Verification is the process of ensuring the data that makes up an Open Badge is correct. It includes a number of data validation checks as well as procedures to ensure the badge is trustworthy. Verification is distinct from compliance certification for applications and services that implement the specification, though verification is typically a component of certification programs. See <a href="OB-SPEC-21#Verification">Verification</a> in the current specification.

<div></div>
`;
