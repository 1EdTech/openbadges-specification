# Original Creator Extension

_Author: [Antti Koskinen](https://github.com/ajk)_

This extension provides a way to track the origin of a badge when one organisation creates it for another.

For example, presume we have organisations X, Y and Z. A badge is created by X and they grant Y and Z the right to issue it.
IssuerClass of X is stored as the OriginalCreator in the BadgeClass and either Y or Z becomes the issuer.

## Open Badges 2.0

| Property     | Type           | Value Description                                                                                                     |
| ------------ | -------------- | --------------------------------------------------------------------------------------------------------------------- |
| **@context** | context IRI    | [https://openbadgespec.org/extensions/originalCreatorExtension/context.json](./originalCreatorExtension/context.json) |
| **type**     | type IRI array | `['Extension', 'extensions:OriginalCreator']`                                                                         |
| **url**      | string, uri    | Valid url pointing to the Issuer document of the issuer that originally defined this BadgeClass                       |

**Extendable Badge Objects:**
BadgeClass

**Example implementation:**

```json
{
    "extensions:OriginalCreator": {
        "@context": "https://openbadgespec.org/extensions/originalCreatorExtension/context.json",
        "type": ["Extension", "extensions:OriginalCreator"],
        "url": "https://example.org/creator-organisation.json"
    }
}
```

## Open Badges 3.0

As the new version of the specs defines the `source` property of an
`AchievementSubject` for, this extension is, therefore, deprecated.
New versions of the specs also defines the `creator` property of an
`Achievement`. Section 2.4.1 Differentiating Issuers and Achievement
Creators of the Open Badges 3.0 Implementation Guide details this
behaviour.
