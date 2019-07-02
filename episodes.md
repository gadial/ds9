---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
---
<h1>רשימת הסקירות</h1>

<ul class="image-list-small">
    {%- for post in site.reviews -%}
    <li>
    <a href="{{ site.baseurl }}/{{ post.permalink }}" style="background-image: url('{{ site.baseurl }}/assets/img/reviews/{{ post.permalink | episode_identifier}}/Header.jpg');"></a>
    <div class="details">
        <h3><a href="#">{{ post.name }}</a></h3>
        <p class="image-author">{{ post.permalink | episode_identifier}}</p>
      </div>
    </li>
    {%- endfor -%}
</ul>
<!-- <div class="gallery"> 
  <div class="column">
    <div>
        <img src="/ds9/assets/img/reviews/S01E01-2/Header.jpg"  />
        <h3>Emissary</h3>
    </div>
    <img src="/ds9/assets/img/reviews/S01E03/Header.jpg"  />
    <img src="/ds9/assets/img/reviews/S01E04/Header.jpg"  />
    <img src="/ds9/assets/img/reviews/S01E05/Header.jpg"  />
  </div>
  <div class="column">
    <img src="/ds9/assets/img/reviews/S01E06/Header.jpg"  />
    <img src="/ds9/assets/img/reviews/S01E07/Header.jpg"  />
    <img src="/ds9/assets/img/reviews/S01E08/Header.jpg"  />
    <img src="/ds9/assets/img/reviews/S01E09/Header.jpg"  />
  </div> 
  <div class="column">
    <img src="/ds9/assets/img/reviews/S01E10/Header.jpg"  />
    <img src="/ds9/assets/img/reviews/S01E11/Header.jpg"  />
    <img src="/ds9/assets/img/reviews/S01E12/Header.jpg"  />
    <img src="/ds9/assets/img/reviews/S01E13/Header.jpg"  />
  </div>
  <div class="column">
    <img src="/ds9/assets/img/reviews/S01E14/Header.jpg"  />
    <img src="/ds9/assets/img/reviews/S01E15/Header.jpg"  />
    <img src="/ds9/assets/img/reviews/S01E16/Header.jpg"  />
    <img src="/ds9/assets/img/reviews/S01E17/Header.jpg"  />
  </div>
</div> -->
