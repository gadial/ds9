---
layout: home
---
![The Search Part I]({{ site.baseurl}}/assets/img/general/search_part_1_title.jpg){:class="screenshot"}
<form action="{{ site.baseurl }}/search.html" method="get">
  <label for="search-box">Search</label>
  <input type="text" id="search-box" name="query">
  <input type="submit" value="search">
</form>

<ul id="search-results"></ul>

<script>
  window.store = {
    {% for post in site.reviews %}
      "{{ post.url | slugify }}": {
        "title": "{{ post.title | xml_escape }}",
        "content": {{ post.content | strip_html | strip_newlines | jsonify }},
        "url": "{{site.baseurl}}/{{ post.permalink }}"
      }
      {% unless forloop.last %},{% endunless %}
    {% endfor %}
  };
</script>
<script src="https://unpkg.com/lunr/lunr.js"></script>
<script src="{{ site.baseurl }}/assets/js/search.js"></script>