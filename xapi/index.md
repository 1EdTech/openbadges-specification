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

### Verbs

## <a name="verb-earned"></a>Earned
**URI: [{{ site.baseurl }}/xapi/verbs/earned.json]({{ site.baseurl }}/xapi/verbs/earned.json)**

Indicates that the actor has fulfilled the criteria for earning an Open Badge and has been awarded that badge by its Issuer.

**Current Metadata:**
{% highlight json %}
{
    "name": { "en-US": "earned" },
    "description": { "en-US": "Indicates that the actor has been recognized by an Open Badge issuer for an achievement. The actor may claim the badge referenced as the object and use it as a verifiable credential, wherever Open Badges are accepted." }
}
{% endhighlight %}

### Extensions

## <a name="extension-badgeassertion"></a>Badge Assertion
**URI: [{{ site.baseurl }}/xapi/extensions/badgeassetion.json]({{ site.baseurl }}/xapi/extensions/badgeassetion.json)**

A reference to a hosted badge assertion. This is the object of an "earned" statement.

{% highlight json %}
{
    "name": { "en-US": "badge assertion" },
    "description": { "en-US": "IRI of a hosted Open Badge assertion" }
}
{% endhighlight %}

## <a name="extension-signedbadgeassertion"></a>Signed Badge Assertion
**URI: [{{ site.baseurl }}/xapi/extensions/signedbadgeassetion.json]({{ site.baseurl }}/xapi/extensions/signedbadgeassetion.json)**

A string value of the JSON Web Signature token representing a signed assertion.

{% highlight json %}
{
    "name": { "en-US": "signed badge assertion" },
    "description": { "en-US": "JSON Web Signature token containing a signed-verification Open Badge assertion as its payload. The public signing key is linked from the assertions verify.url property." }
}
{% endhighlight %}