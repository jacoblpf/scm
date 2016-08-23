<#include "/base/base.ftl">
<@head title=title>
</@head>

<@body>
	<@page_head data=page_head_info />
	<@scroll>
	<div class="publish-top">
		<img src="${publish_top_img}"/>
		<h2>恭喜，您已成功录入了${goods_num}款商品<br/>您还可以</h2>
	</div>
	<div class="scm-btn-group">
		<a href="${goods_list}" class="mui-btn mui-btn-block newLink">查看商品</a>
		<a href="${goods_add}" class="mui-btn mui-btn-block darkgreen newLink">继续录入</a>
	</div>
	</@scroll>
</@body>

<@foot>

</@foot>