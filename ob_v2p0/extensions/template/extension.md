var md=`

## Introduction

This is a definition of an example extension to [[[OB-20]]]. If it were a real extension, it would describe the purpose of adding it to a badge object. This is the IRI (Internationalized Resource Identifier) to use for implementations of this extension, included below as the compact IRI <code>extensions:ExampleExtension</code>. See the [context](context.json) and [schema](schema.json) files that form the machine-readable core of this extension.

## Extension

Property     | Type        | Value Description
-------------|-------------|---------
**@context** | context IRI | [https://openbadgespec.org/extensions/exampleExtension/context.json](context.json)
**type**    | type IRI array |<code>['Extension', 'extensions:ExampleExtension']</code>
**exampleProperty** | string | Any text the implementer likes.

**Extendable Badge Objects:**
Assertion, BadgeClass, Issuer

<figure class="example">
  <pre>
  {
    "extensions:ExampleExtension": {
      "@context":"https://openbadgespec.org/extensions/exampleExtension/context.json",
      "type": ["Extension", "extensions:ExampleExtension"],
      "exampleProperty": "I'm a property, short and sweet."
    }
  }
  </pre>
  <figcaption>Example Implementation</figcaption>
</figure>

`;