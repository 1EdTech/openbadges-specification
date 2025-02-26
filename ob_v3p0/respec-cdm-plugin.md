# Respec CDM Plugin Usage

You can use the CDM (Common Data Model) plugin to:

- Generate normative data model definitons
- Generate (valid) JSON class examples
- Validate custom JSON class examples against JSON Schema

## Configuration

Add the CDM configuration object to the `respecConfig` object on your document:

```js
var respecConfig = {
    cdm: {
        apiKey: "xxxxx",
        serverUrl: "https://datamodels-staging.imsglobal.org",
        source: "CORE"
    }
}
```

| key | type | description | required |
| --- | --- | --- | --- |
| `apiKey` | string | The API_KEY you have been issued to access the CDM API. **DO NOT** store this value in a GitHub repo unless it is encrypted with something like git-crypt. | required |
| `serverUrl` | string | The URL of the CDM server that has your models. | required |
| `source` | string | This is the source of the model. Must be "SANDBOX" or "CORE". Defaults to "CORE". | optional |

### Protecting the API_KEY

The API_KEY value must not be stored as clear text in any repository. It is recommended you store the configuration in a separate file, and then either add the file to .gitignore or use [git-crypt](https://github.com/AGWA/git-crypt) to convert the file into an encrypted binary file in the repository. For example,

cdm-config.js

```js
const _cdm = {
  apiKey: "xxxxxx",
  serverUrl: "https://datamodels-staging.imsglobal.org",
  source: "SANDBOX"
}
```

spec.html

```html

<!-- Load the CDM configuration -->
<script class="remove" src="cdm-config.js"></script>
var respecConfig = {
    cdm: _cdm
}
```

.gitignore

```text
cdm-config.js
```

## Generate Normative Data Model Definitions

Add a `<section>` with the `data-model` attribute. The value of the `data-model` attribute must be the CDM id for the model. An `<h2>` header will be inserted with the model name. If you include a `title` attribute, it will be used as the header value.

```html
<!-- Start a data model section -->
<section data-model="org.1edtech.ob.v2p1.model" title="My Data Model">
    <p>This text should describe this section.</p>
</section>
```

By default the data model will be retrieved from the `source` property specified in the configuration. If you want to override the source for a specific model, add the `data-source` attribute to the `<section>`.

```html
<!-- Start a data model section -->
<section data-model="org.1edtech.ob.v2p1.model" data-source="CORE">
    <p>This model will be retrieved from the CORE data models even if the configuration specifies SANDBOX.</p>
</section>
```

## Add Normative Class Definitions

By default all of the classes in the data model will be automatically generated. If you want to add any custom content to a class definition, add a `<section>` within the `data model` section with the `data-class` attribute. The value of the `data-class` attribute must be the CDM id for the class. The class must be a member of the data model. An `<h3>` header will be inserted with the class name followed by the description, and then a table of properties. You can override the header text with a `title` attribute. Any custom content you include will appear after the properties table. The generated class definitions will appear after all of the customized `data-class` sections.

```html
<!-- Start a data model section -->
<section data-model="org.1edtech.ob.v2p1.model" title="My Data Model">
    <p>This text should describe this section.</p>
    <!-- Render a class section with a custom title and custom content -->
    <section data-class="org.1edtech.ob.v2p1.assertion.class" title="My Assertion Class">
        <p>This text will be inserted after the properties table.</p>
    </section>
    <!-- The generated class sections will appear here -->
</section>
```

## Filtered Class Definitions

By default all of the classes in a Data Model will appear within each `data-model` section. Sometimes you may want to split the classes up into multiple sections or even multiple documents. For example, "Data Model", "Primitive Types", and "Derived Types". You can do that by inserting a `data-model` section for each breakout and applying a filter so they don't all display the same complete set of classes.

The `data-package` filter limits a `data-model` section to only the classes that have a matching Package name.

For example, if your Data Model has three packages named "DataModelPackage", "PrimitiveTypesPackage", and "DerivedTypesPackage"; you can split them into three separate sections:

```html
<!-- Start a data model section -->
<section data-model="org.1edtech.ob.v2p1.model" data-package="DataModelPackage"></section>
<section data-model="org.1edtech.ob.v2p1.model" data-package="PrimitiveTypesPackage" class="appendix"></section>
<section data-model="org.1edtech.ob.v2p1.model" data-package="DerivedTypesPackage" class="appendix">
    <p>
        Note that you can also use the normal Respec attributes on the `section` element.
        For example, this section will appear as an appendix.
    </p>
</section>
```

## Generate Class JSON Examples

Add an `<aside>` anywhere in the document with the `data-sample` attribute. The value of the `data-sample` attribute must be the CDM id for the class. The example will be inserted inside the `<aside>`.

```html
<!-- Start a data model section -->
<section data-model="org.1edtech.ob.v2p1.model">
    <p>This text will be inserted after the model description.</p>
    <!-- Start a class section -->
    <section data-class="org.1edtech.ob.v2p1.assertion.class">
        <aside data-sample="org.1edtech.ob.v2p1.assertion.class" 
               class="example" title="Sample Assertion (Generated)"></aside>
    </section>
</section>
```

By default the generated sample will not include optional properties. If you want the sample to include optional properties, add the `data-include-optional-fields="true"` attribute to the `<aside>`.

```html
<!-- Start a data model section -->
<section data-model="org.1edtech.ob.v2p1.model">
    <p>This text will be inserted after the model description.</p>
    <!-- Start a class section -->
    <section data-class="org.1edtech.ob.v2p1.assertion.class">
        <aside data-sample="org.1edtech.ob.v2p1.assertion.class" 
               data-include-optional-fields="true"
               class="example" title="Sample Assertion (Generated)"></aside>
    </section>
</section>
```

## Validate Custom JSON Examples

First enable schema validation by loading the [ajv2019](https://cdnjs.com/libraries/ajv) library:

```html
  <!-- Load ajv2019 (Another JSON Schema Validator) if you want your examples validated -->
  <script class="remove" src="https://cdnjs.cloudflare.com/ajax/libs/ajv/8.11.0/ajv2019.bundle.min.js" 
          integrity="sha512-C+5LzjYlC8qhPFniPXiod8efyXJ3fDRCUS87L8o8z5CGt/1LHflMozW6py7s16Z+TJy52C9teuDUq6iq2Nft7A==" 
          crossorigin="anonymous" referrerpolicy="no-referrer"></script>
```

Then add the `data-schema` attribute to any `<pre>` element in your document that want validated. The value of the `data-schema` attribute must be the CDM id for the class. If any errors are found, a Respec error will be recorded and an admonition will be added to the example with a list of the errors.

```html
<aside class="example" title="Sample assertion">
    <pre class="json" data-schema="org.1edtech.ob.v2p1.assertion.class">
    {
        "id": "https://example.org/assertions/123",
        "type": "Assertion",
        "recipient": {
            "type": "email",
            "identity": "alice@example.org"
        },
        "issuedOn": "2016-12-31T23:59:59+00:00",
        "verification": {
            "type": "hosted"
        },
        "badge": {
            "type": "BadgeClass",
            "id": "https://example.org/badges/5",
            "name": "3-D Printmaster",
            "description": "This badge is awarded for passing the 3-D printing knowledge and safety test.",
            "image": "https://example.org/badges/5/image",
            "criteria": {
                "narrative": "Students are tested on knowledge and safety, both through a paper test and a supervised performance evaluation on live equipment"
            },
        }
        "issuer": {
            "id": "https://example.org/issuer",
            "type": "Profile",
            "name": "Example Maker Society",
            "url": "https://example.org",
            "email": "contact@example.org",
            "verification": {
                "allowedOrigins": "example.org"
            }
        }
    }
    </pre>
</aside>
```
