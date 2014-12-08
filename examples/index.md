---
title: Open Badges Examples
subtitle: Examples of Open Badge objects
show_sidebar: true
layout: page
---

## {{ page.title }}
Extensions are community developed contributions to the Open Badges Standard. Any issuer may define and publish them to include new types of metadata in badges. Any other issuer may use the same extensions to publish similar information in a mutually recognizable way.

### Assertion
{% highlight json %}
{ 
  "uid":"fcf20",
  "badge": "https://exampleissuer.org/badge12.json"
}
{% endhighlight %}

### Badge Class
{% highlight json %}
{ 
  "name": "Super cool"
}
{% endhighlight %}

### Issuer
{% highlight json %}
{ 
  "name": "Example Issuer",
  "url": "https://exampleissuer.org"
}
{% endhighlight %}