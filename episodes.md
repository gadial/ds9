---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
---
<h1>רשימת הסקירות</h1>

<ul class="image-list-small">
    {%- for post in site.reviews -%}
    <li>
    <a href="{{ site.baseurl }}{{ post.permalink }}" style="background-image: url('{{ site.baseurl }}/assets/img/reviews/{{ post.permalink | episode_identifier}}/Header.jpg');"></a>
    <div class="details">
        <h3><a href="#">{{ post.name }}</a></h3>
        <p class="image-author">{{ post.permalink | episode_identifier}}</p>
      </div>
    </li>
    {%- endfor -%}
</ul>