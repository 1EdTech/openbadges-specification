var serialization=`

## Serialization

The data model as described in Appendix [[[#datamodels]]] is the canonical structural representation of an Open Badges [=verifiable credential=] ([AchievementCredential](#org.1edtech.ob.v3p0.achievementcredential.class)). All serializations are representations of that data model in a specific format. This section specifies how the data model is realized in JSON-LD and plain JSON.

### JSON

The data model can be encoded in Javascript Object Notation (JSON) [[RFC8259]] by mapping property types in the Data Model to JSON types as follows:

- Numeric values representable as [[IEEE-754]] MUST be represented as a JSON Number.
- Boolean values MUST be represented as a JSON Boolean.
- Sequence values MUST be represented as an JSON Array, NOT as a single value.
- Unordered sets (i.e. \`0..*\` and \`1..*\` multiplicities) of values MUST be represented as an JSON Array, NOT as a single value.
- Complex types (i.e. not primitive types or derived types) MUST be represented as an JSON Object, NOT as a URI.
- Other values MUST be represented as a JSON String.
- Null values and empty arrays MUST be ommitted from the serialized JSON. This includes empty Arrays.

### JSON-LD

[[JSON-LD]] is a JSON-based format used to serialize Linked Data. The syntax is designed to easily integrate into deployed systems already using JSON, and provides a smooth upgrade path from JSON to [[JSON-LD]]. It is primarily intended to be a way to use Linked Data in Web-based programming environments, to build interoperable Web services, and to store Linked Data in JSON-based storage engines.

Instances of the data model are encoded in [[JSON-LD]] in the same way they are encoded in JSON (Section [[[#json]]]), with the addition of the \`@context\` property. The JSON-LD context is described in detail in the [[JSON-LD]] specification and its use is elaborated on in Section [[[#extending]]].

Multiple contexts MAY be used or combined to express any arbitrary information about verifiable credentials in idiomatic JSON. The JSON-LD context for all [=verifiable credentials=], available at \`https://www.w3.org/2018/credentials/v1\`, is a static document that is never updated and can therefore be downloaded and cached client side. The associated vocabulary document for the Verifiable Credentials Data Model is available at \`https://www.w3.org/2018/credentials\`. The JSON-LD context for Open Badges [=verifiable credentials=] is available at \`https://purl.imsglobal.org/spec/ob/v3p0/context/ob_v3p0.jsonld\`. The associated vocabulary document for the Open Badges Data Model is available at \`https://purl.imsglobal.org/spec/ob/v3p0/context/ob_v3p0.html\`. Open Badges [=verifiable credentials=] MUST be serialized with both JSON-LD contexts.

<div class="note">
  Though this specification requires that a \`@context\` property be present, it is not required that the value of the \`@context\` property be processed using JSON-LD. This is to support processing using plain JSON libraries, such as those that might be used when the verifiable credential is encoded as a JWT. All libraries or processors MUST ensure that the order of the values in the \`@context\` property is what is expected for the specific application. Libraries or processors that support JSON-LD can process the \`@context\` property using full JSON-LD processing as expected.
</div>

<pre class="example" title="JSON-LD @context serialization">
  "@context": [
    "https://www.w3.org/2018/credentials/v1",
    "https://purl.imsglobal.org/spec/ob/v3p0/context/ob_v3p0.jsonld"
  ]
</pre>
`;
