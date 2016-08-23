<#include "/base/base.ftl">
<@head title=title>
</@head>

<@body>
	<@page_head data=page_head_info />
	<nav class="mui-bar mui-bar-tab scm-gd-nav">
		<a class="mui-tab-item mui-active newLink" href="${edit_path}">
			<span class="mui-icon mui-icon-compose"></span>
			<span class="mui-tab-label">编辑</span>
		</a>
		<a class="mui-tab-item" id="delete">
			<span class="mui-icon mui-icon-trash"></span>
			<span class="mui-tab-label">删除</span>
		</a>
		<a class="mui-tab-item end" id="remove">
			<span class="mui-tab-label">上架</span>
		</a>
		
	</nav>
	<@scroll>
		<div class="mui-slider">
			
			  <div class="mui-slider-group">
			  	<#if imgs??>
				  	<#list imgs as img>
				    	<div class="mui-slider-item"><a href="#"><img src="${img}" /></a></div>
				   	</#list>
			   	<#else>
			   		<div class="mui-slider-item"><a href="#"><img src="${default_img}" /></a></div>
			   	</#if>
			  </div>
			
		</div>
		<div class="goods goods-dsc">
			<h2 class="title">${name}</h2>
			<p class="price">￥${startPrice}<#if endPrice??> - ￥300</#if></p>
			<p class="status"><span>${sku}</span><span>未上架</span></p>
		</div>
		<div class="goods-info">
			<ul class="mui-table-view"> 
		        <li class="mui-table-view-cell mui-collapse mui-active">
		            <a class="mui-navigate-right" href="#"><i class="icon icon-attr"></i>商品规格</a>
		            <div class="mui-collapse-content">
		                <ul class="mui-table-view">
		                	<#list goods_spec as s>
								<li class="mui-table-view-cell">
									<span>${s.sku!''}</span>
									<span>${s.prop!''}</span>
									<div class="pull-r">
										<span class="gray"><#if s.stock??>库存${s.stock}</#if></span>
										<span class="red"><#if s.price??>￥${s.price}</#if></span>
									</div>
								</li>
							</#list>
						</ul>
		            </div>
		        </li>
		    </ul>
		</div>
		<div class="goods-info">
			<ul class="mui-table-view"> 
		        <li class="mui-table-view-cell mui-collapse mui-active">
		            <a class="mui-navigate-right" href="#"><i class="icon icon-desc"></i>商品描述</a>
		            <div class="mui-collapse-content">
		                <p class="text">
		                	${goods_desc!"该商品还没有添加描述！"}
		                </p>
		            </div>
		        </li>
		    </ul>
		</div>
	</@scroll>

</@body>

<@foot>
<script src="${static_path}/lib/jquery/jquery.min.js"></script>
<script>

	mui('#main').scroll();
	mui('body').on('tap', '#delete', function(){
		mui.confirm('确认删除该商品？','','',function(e){
			if(e.index !== 0){
				jQuery.ajax({
					url:'${delete_path}',
					type:'post',	
					data:{'goods_id':'${goods_id}'},              
					success:function(data){
						if(data.status == "1"){
							mui.toast('商品已删除！');
							mui.later(function(){
								mui.openWindow({url: '${success_path}'});
							},1000);
						}else{
							mui.toast('删除失败，请重试！');
						}
					},
					error:function(data){
						mui.toast('data');
					}
				});
				
			}
		}, 'div')
	});
	mui('body').on('tap', '#remove', function(){
		mui.confirm('确认上架该商品？','','',function(e){
			if(e.index !== 0){
				jQuery.ajax({
					url:'${put_path}',
					type:'post',	   
					data:{'goods_id':'${goods_id}'},           
					success:function(data){
						if(data.status == "1"){
							mui.toast('商品已上架！');
							mui.later(function(){
								mui.openWindow({url: '${success_path}'});
							},1000);
						}else{
							mui.toast('上架失败，请重试！');
						}
					},
					error:function(data){
						mui.toast('data');
					}
				});
			}
		}, 'div')
	});
</script>
</@foot>