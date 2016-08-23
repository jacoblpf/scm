
<#macro scroll>
	<div class="mui-content mui-scroll-wrapper ${content_class!''}" id="main">
		<div class="mui-scroll">
			<#nested>
		</div>
	</div>
</#macro>

<#macro page_head data>
	<#if is_weixin==false>
		<header class="mui-bar mui-bar-nav scm-nav-black">
			<a href="${data.backUrl}" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left newLink">
				<span>返回</span>
			</a>
			<h1 class="mui-title">${data.title}</h1>
		</header>
	</#if>
</#macro>


