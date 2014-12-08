---
title: Open Badges Extensions
subtitle: Community-developed additions to the Open Badges Standard
show_sidebar: true
layout: page
---

## {{ page.title }}
Extensions are community developed contributions to the Open Badges Standard. Any issuer may define and publish them to include new types of metadata in badges. Any other issuer may use the same extensions to publish similar information in a mutually recognizable way.

### Open Badges Community Extensions
Submit your published extensions to this page with a pull request on [GitHub](https://github.com/openbadges/openbadges/specification/extensions/index.md), following the existing format of the page.


# Contributed Extensions:

### <a name="ExampleExtension">Example Extension Name</a> 
Example explanation of the extension. What badge objects can it extend? e.g. "It may be applied to Badge Classes only.""
{% highlight json %}
{ 
  "extension:ExampleExtension": {
    "@context":"https://standard.openbadges.org/extensions/example/context.json",
    "exampleProperty": "I'm a property, short and sweet."
  }
}
{% endhighlight %}