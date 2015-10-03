---
title: Open Badges xAPI Vocabulary
subtitle: Transporting badges with the Experience API
show_sidebar: true
layout: page
---

## {{ page.title }}
The [Experience API](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI.md) (xAPI, formerly known as Tin Can API) provides a method of transporting statements of experience for storage in a Learning Record Store (LRS). 

### Status of this document
This is an exploratory prototype draft. It has not been approved for use by the Badge Alliance or the xAPI specification authors. Use for testing only. 

## Earning Vocabulary
This section defines the identifiers and extensions used for OB Earning. 
This section is copied from [this recipe](https://github.com/ht2/BadgesCoP/tree/master/earning).

### Identifiers
*Use the IRIs hyperlinked to the text in the identifiers column, rather than the words themselves.*

{::options parse_block_html="true" /}
<div class="table-wrapper">

xAPI Property | Identifier | Description | Required
--- | --- | --- | ---
verb.id | [Earned](https://openbadgespec.org/xapi/verbs/earned) | States the `actor` earned the `object`. | Required
context.contextActivities.category.N.id | [OB Recipe](https://openbadgespec.org/xapi/recipe/base/0_0_2) | States the `statement` uses the OB recipe. | Required
attachments.usageType | [OB Attachment](https://openbadgespec.org/xapi/attachment/badge) | States that the `attachment` is an OB image. | Required
object.definition.type | [OB Object](http://activitystrea.ms/schema/1.0/badge) | States that the `object` is an OB. | Required

</div>

### Extensions
*Use the IRIs hyperlinked to the text in the extension column, rather than the words themselves.*

{::options parse_block_html="true" /}
<div class="table-wrapper">

xAPI Property | Extension | Description | Required
--- | --- | --- | ---
result.extensions | [OB Assertion](https://openbadgespec.org/xapi/extensions/badgeassertion) | Contains an xAPI OB Assertion Object. | Required
object.definition.extensions | [OB Class](https://openbadgespec.org/xapi/extensions/badgeclass) | Contains an xAPI OB Class Object. | Required

</div>

#### [OB Assertion](https://openbadgespec.org/xapi/extensions/badgeassertion) Properties

{::options parse_block_html="true" /}
<div class="table-wrapper">

Property | Type | Description | Required
--- | --- | --- | ---
@id | IRI | Link to the OB assertion. | Required

</div>

#### [OB Class](https://openbadgespec.org/xapi/extensions/badgeclass) Properties

{::options parse_block_html="true" /}
<div class="table-wrapper">

Property | Type | Description | Required
--- | --- | --- | ---
@id | IRI | Link to the OB class. | Required
image | IRI | Link to the OB image. | Recommended
criteria | IRI | Link to the OB criteria. | Recommended
issuer | IRI | Link to the OB issuer. | Recommended

</div>

##Earning Example xAPI Statment
{% highlight json %}
{
  "verb": {
    "id": "https://openbadgespec.org/xapi/verbs/earned",
    "display": {
      "en-US": "earned"
    }
  },
  "result": {
    "extensions": {
      "https://openbadgespec.org/xapi/extensions/badgeassertion": {
        "@id": "http://www.example.com/assertion/1"
      }
    }
  },
  "context": {
    "contextActivities": {
      "category": [{
        "id": "https://openbadgespec.org/xapi/recipe/base/0_0_2",
        "definition": {
          "type": "http://id.tincanapi.com/activitytype/recipe"
        },
        "objectType": "Activity"
      }]
    }
  },
  "attachments": [{
    "usageType": "https://openbadgespec.org/xapi/attachment/badge",
    "display": {
      "en-US": "Name of the badge"
    },
    "contentType": "image/png",
    "length": 48826,
    "sha2": "42a33cb2af34603730577c2e5ddd78858feb34860c4e5bf0f473fa7456d3994a"
  }],
  "object": {
    "id": "www.example.com/badge/1",
    "definition": {
      "extensions": {
        "https://openbadgespec.org/xapi/extensions/badgeclass": {
          "@id": "http://www.example.com/badgeclass/1",
          "image": "http://www.example.com/badgeimage/1.png",
          "criteria": "http://www.example.com/criteria/1",
          "issuer": "http://www.example.com/issuer/1"
        }
      },
      "name": {
        "en-US": "Name of the badge"
      },
      "description": {
        "en-US": "Description of the badge."
      },
      "type": "http://activitystrea.ms/schema/1.0/badge"
    },
    "objectType": "Activity"
  }
}
{% endhighlight %}
