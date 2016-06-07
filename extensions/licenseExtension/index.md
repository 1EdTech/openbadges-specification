---
title: Open Badges License Extension Examples
subtitle: Get started applying Creative Commons licenses to your BadgeClasses
show_sidebar: true
layout: page
---

## {{ page.title }}
_Editor: [Nate Otto](http://ottonomy.net)_
Here is a set of examples for applying a Creative Commons Content License to BadgeClasses. Learn more on Creative Commons' [License Examples](https://creativecommons.org/examples/) page beyond the brief descriptions of these licenses provided here. Brief license descriptions adapted from those provided by Creative Commons, licensed under CC-BY.

Go back to [all extensions](../) to [See full details about the License Extension](../#LicenseExtension).

{::options parse_block_html="true" /}
<div class="table-wrapper">

| License         | Name                                                                       | IRI                                                | Legal Code IRI
|-----------------|----------------------------------------------------------------------------|----------------------------------------------------|------------------
| **CC-0**        | Creative Commons Public Domain Dedication 1.0 Universal                    | https://creativecommons.org/publicdomain/zero/1.0/ |  https://creativecommons.org/publicdomain/zero/1.0/legalcode
| **CC-BY**       | Creative Commons Attribution 4.0 International                             | https://creativecommons.org/licenses/by/4.0/       |  https://creativecommons.org/licenses/by/4.0/legalcode
| **CC-BY-SA**    | Creative Commons Attribution-ShareAlike 4.0 International                  | https://creativecommons.org/licenses/by-sa/4.0/    |  https://creativecommons.org/licenses/by-sa/4.0/legalcode
| **CC-BY-NC**    | Creative Commons Attribution-NonCommercial 4.0 International               | https://creativecommons.org/licenses/by-nc/4.0/    |  https://creativecommons.org/licenses/by-nc/4.0/legalcode
| **CC-BY-NC-SA** | Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International    | https://creativecommons.org/licenses/by-nc-sa/4.0/ |  https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode
| **CC-BY-ND**    | Creative Commons Attribution-NoDerivatives 4.0 International               | https://creativecommons.org/licenses/by-nd/4.0/    |  https://creativecommons.org/licenses/by-nd/4.0/legalcode
| **CC-BY-NC-ND** | Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International | https://creativecommons.org/licenses/by-nc-nd/4.0/ |  https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode

</div>

### Creative Commons Public Domain Dedication (CC-0)
By using CC0, you waive all copyright and related rights to a work to the extent possible under the law.
{% highlight json %}
{
  "schema:license": {
    "@context": "https://openbadgespec.org/extensions/licenseExtension/context.json",
    "type": ["Extension", "extensions:LicenseExtension", "cc:License"],
    "id": "CC-0",
    "name": "Creative Commons Public Domain Dedication",
    "legalCode": "https://creativecommons.org/publicdomain/zero/1.0/legalcode"
  }
}
{% endhighlight %}


### Creative Commons Attribution (CC-BY)
This license lets others distribute, remix, tweak, and build upon your work, even commercially, as long as they credit you for the original creation. This is the most accommodating of licenses offered. Recommended for maximum dissemination and use of licensed materials.
{% highlight json %}
{
  "schema:license": {
    "@context": "https://openbadgespec.org/extensions/licenseExtension/context.json",
    "type": ["Extension", "extensions:LicenseExtension", "cc:License"],
    "id": "CC-BY",
    "name": "Creative Commons Attribution",
    "legalCode": "http://creativecommons.org/licenses/by/4.0/legalcode"
  }
}
{% endhighlight %}


### Creative Commons Attribution-ShareAlike (CC-BY-SA)
This license lets others remix, tweak, and build upon your work even for commercial purposes, as long as they credit you and license their new creations under the identical terms. All new works based on yours will carry the same license, so any derivatives will also allow commercial use.
{% highlight json %}
{
  "schema:license": {
    "@context": "https://openbadgespec.org/extensions/licenseExtension/context.json",
    "type": ["Extension", "extensions:LicenseExtension", "cc:License"],
    "id": "CC-BY-SA",
    "name": "Creative Commons Attribution",
    "legalCode": "http://creativecommons.org/licenses/by-sa/4.0/legalcode"
  }
}
{% endhighlight %}


### Creative Commons Attribution-NonCommercial (CC-BY-NC)
This license lets others remix, tweak, and build upon your work non-commercially, and although their new works must also acknowledge you and be non-commercial, they don’t have to license their derivative works on the same terms.
{% highlight json %}
{
  "schema:license": {
    "@context": "https://openbadgespec.org/extensions/licenseExtension/context.json",
    "type": ["Extension", "extensions:LicenseExtension", "cc:License"],
    "id": "CC-BY-NC",
    "name": "Creative Commons Attribution-NonCommercial",
    "legalCode": "http://creativecommons.org/licenses/by-nc/4.0/legalcode"
  }
}
{% endhighlight %}


### Creative Commons Attribution-NonCommercial-ShareAlike (CC-BY-NC-SA)
This license lets others remix, tweak, and build upon your work non-commercially, as long as they credit you and license their new creations under identical terms.
{% highlight json %}
{
  "schema:license": {
    "@context": "https://openbadgespec.org/extensions/licenseExtension/context.json",
    "type": ["Extension", "extensions:LicenseExtension", "cc:License"],
    "id": "CC-BY-NC-SA",
    "name": "Creative Commons Attribution-NonCommercial",
    "legalCode": "http://creativecommons.org/licenses/by-nc-sa/4.0/legalcode"
  }
}
{% endhighlight %}


### Creative Commons Attribution-NoDerivatives (CC-BY-ND)
This license allows for redistribution, commercial and non-commercial, as long as it is passed along unchanged and in whole, with credit to you. While the Badge Alliance includes all of the Creative Commons licenses in this documentation, it acknowledges that the NoDerivs licenses are only suitable for resources other than core OBI data classes, as these data classes are presumed to be distributed between systems as a matter of the proper functioning of the Open Badges Ecosystem.
{% highlight json %}
{
  "schema:license": {
    "@context": "https://openbadgespec.org/extensions/licenseExtension/context.json",
    "type": ["Extension", "extensions:LicenseExtension", "cc:License"],
    "id": "CC-BY-NC",
    "name": "Creative Commons Attribution-NoDerivatives",
    "legalCode": "http://creativecommons.org/licenses/by-nd/4.0/legalcode"
  }
}
{% endhighlight %}


### Creative Commons Attribution-NonCommercial-NoDerivatives (CC-BY-NC-ND)
This license is the most restrictive of Creative Commons' six licenses, only allowing others to download your works and share them with others as long as they credit you, but they can’t change them in any way or use them commercially. While the Badge Alliance includes all of the Creative Commons licenses in this documentation, it acknowledges that the NoDerivs licenses are only suitable for resources other than core OBI data classes, as these data classes are presumed to be distributed between systems as a matter of the proper functioning of the Open Badges Ecosystem. NoDerivatives licenses may be used to indicate that transformative uses are not allowed by the copyright holder, 
{% highlight json %}
{
  "schema:license": {
    "@context": "https://openbadgespec.org/extensions/licenseExtension/context.json",
    "type": ["Extension", "extensions:LicenseExtension", "cc:License"],
    "id": "CC-BY-NC-ND",
    "name": "Creative Commons Attribution-NonCommercial",
    "legalCode": "http://creativecommons.org/licenses/by-nc-nd/4.0/legalcode"
  }
}
{% endhighlight %}

