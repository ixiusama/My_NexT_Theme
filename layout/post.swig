{% extends '_layout.swig' %}
{% import '_macro/post.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}


{% block title %} {{ page.title }} | {{ config.title }} {% endblock %}

{% block page_class %}page-post-detail{% endblock %}


{% block content %}

  <div id="posts" class="posts-expand">
    {{ post_template.render(page) }}

    <div class="post-spread">
      {% if theme.jiathis %}
        {% include '_partials/share/jiathis.swig' %}
      {% elseif theme.baidushare %}
        {% include '_partials/share/baidushare.swig' %}
      {% elseif theme.add_this_id %}
        {% include '_partials/share/add-this.swig' %}
      {% elseif theme.duoshuo_shortname and theme.duoshuo_share %}
        {% include '_partials/share/duoshuo_share.swig' %}
      {% endif %}
    </div>
  </div>

  <div class="post-footer">
      {% if not is_index %}
        <div id="eof" class="print-invisible">
          <hr class="eof">
        </div>
        
        <div class="post-copyright">
           <p><span>本文标题:</span><a href="{{ url_for(page.path) }}">{{ page.title }}</a></p>
           <p><span>文章作者:</span><a href="/" title="访问 {{ theme.author }} 的个人博客">{{ theme.author }}</a></p>
           <p><span>发布时间:</span>{{ page.date.format("YYYY年M月D日 - HH时MM分") }}</p>
           <p><span>最后更新:</span>{{ page.updated.format("YYYY年M月D日 - HH时MM分") }}</p>
		   <p><span>本文字数:</span><span class="page-count">本文一共有{{ wordcount(page.content) }}字</span></p>
           <p><span>原始链接:</span><a href="{{ url_for(page.path) }}" title="{{ page.title }}">{{ page.permalink }}</a></p>
           <p><span>许可协议:</span><i class="fa fa-creative-commons"></i> <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/" title="Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)">Attribution-NonCommercial 4.0</a></p>
           <p><span>转载请保留以上信息。</span></p>
        </div>
      {% endif %}

	  {% if not is_index and (post.prev or post.next) %}
        <div class="post-nav">
          <div class="post-nav-prev post-nav-item">
            {% if post.prev %}
              <a href="{{ url_for(post.prev.path) }}">{{post.prev.title}}</a>
            {% endif %}
          </div>

          <div class="post-nav-next post-nav-item">
            {% if post.next %}
              <a href="{{ url_for(post.next.path) }}">{{post.next.title}}</a>
            {% endif %}
          </div>
        </div>
      {% endif %}

    </div>
  
{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(true) }}
{% endblock %}


{% block script_extra %}
  {% include '_scripts/pages/post-details.swig' %}
{% endblock %}
