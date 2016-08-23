<#include "/base/base.ftl">
<@head title=title>
</@head>

<@body>

	<@page_head data=page_head_info />
	<nav class="mui-bar mui-bar-tab scm-bar-green">
		<a class="mui-tab-item mui-active newLink" href="${add_path}">
			<span class="mui-tab-label">+ 新增商品</span>
		</a>
	</nav>
	<@scroll>
		<div class="scm-search">
			<button class="label-l mui-icon mui-icon-search" type="button" id="search-btn"></button>
			<a href="#search_box" class="label-r">筛选<i class="mui-icon mui-icon-arrowdown"></i></a>
		    <input type="search" class="" placeholder="搜索" name="keyWord" id="search">  
		</div> 
		
		<div class="scm-list  no-margin" id="list_content">
			<ul class="" id="goods-list">
				<#list goods_list_data as i>
					<li class="list-item">
						<a class="goods clear newLink" href="${i.link}">
							<img src="${i.imgPath!default_img}">
							<h2 class="title">${i.goodsName}</h2>
							<p class="price">￥${i.startPrice}
								<#if i.endPrice??>- ￥${i.endPrice}</#if>
							</p>
							<p class="status clear"><span>${i.spec}种规格</span> <span><#if i.status==1>已上架<#else>未上架</#if></span></p>
						</a>
					</li>
				</#list>
			</ul>
		</div>
		
	</@scroll>
	<div id="search_box" class="mui-popover scm-popover">
		<ul class="mui-table-view">
			<#list search_item as i>
		   		<li class="mui-table-view-cell"><a href="javascript:void(0)" class="search-item" data-value="${i.value}">${i.text}</a></li>
		   	</#list>
		</ul>
	</div>
	
</@body>

<@foot>
<script src="${static_path}/lib/handlebars/handlebars.runtime.js"></script>
<script src="${static_path}/lib/jquery/jquery.min.js"></script>
<script src="${static_path}/scm/goods-management/goods-list/goods-list.js"></script>

<script>
	(function(){
			var current = 2;
			var template = Handlebars.templates['goods-list.hbs'];
			var keyWord = 'all';

			mui.init({
			  pullRefresh : {
			    container:'.mui-content',
			    up : {
			      height:20,
			      contentrefresh : "正在加载...",
			      contentnomore:'没有更多数据了',
			      callback :function(){loadMore.call(this, this)}
			    }
			  }
			});

			function loadMore(o){
	   			jQuery.ajax({
	   				url:'${load_path}',
	   				type:'post',
	   				data:{page:current,keyWord:keyWord},
	   				success:function(data){
	   					var html = template(data);
	   					
	   					jQuery("#goods-list").append(html);
	   								   			
			   			if(data.length !== 0){
			   				o.endPullupToRefresh(false);
			   				current++;
			   			}else {
			   				o.endPullupToRefresh(true);
			   			}
			  			
	   				}
	   			})
	   			

			};

			function search(){

				jQuery.ajax({
	   				url:'${load_path}',
	   				type:'post',
	   				data:{"keyWord":keyWord,"page":current},
	   				success:function(data){
	   					var html = template(data);
			   			jQuery("#goods-list").html(html);
			   			current++;
			   			mui('#search_box').popover('hide');
	   				}
	   			})

			}

			jQuery('.search-item').click(function(){
			
				current = 1;
				keyWord = this.getAttribute('data-value');
				search();
			});

			jQuery('#search-btn').click(function(){
				current = 1;
				keyWord = jQuery('#search').val();
				search();
			});

			

		})();

</script>
</@foot>