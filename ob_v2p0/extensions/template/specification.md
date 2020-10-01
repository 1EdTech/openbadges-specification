var md=`
## Introduction

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

Duis aute irure dolor in reprehenderit [[ISO8601]]in voluptate velit esse cillum dolore eu fugiat nulla pariatur.

Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

### Admonitions (have to use HTML)
      <aside class="note">Example of text content of note aside</aside>
      <aside class="warning">Example of text content of warning aside</aside>
      <aside class="issue">Example of text content of issue aside</aside>

### Figures (have to use HTML)
<figure class="example"><pre><code>
      {
        "type": "ActivityState",
        "createdTime": new Date().toISOString(),
        "activityId": "unit_1_activity_5",
        "data": {
        "choice": "blue",
        "directionLine": "What color is the sky?",
        "choices": ["blue","red","green"],
        "correct": "blue"
      },
      "profile": "ims.qti_v2p1.choice",
      "extensions": {
      "vnd.vst.timesync_offset": 42000
      }
      }
      </code></pre>
        <figcaption>Example of the ActivityState object.</span>
        </figcaption>
</figure>

`;