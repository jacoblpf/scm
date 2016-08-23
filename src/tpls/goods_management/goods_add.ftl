<#include "/base/base.ftl">
<@head title=title>
</@head>

<@body>
	<@page_head data=page_head_info />
	<nav class="mui-bar mui-bar-tab scm-gd-nav navs">
		<a class="mui-tab-item mui-control-item" href="#entry" id="goadd">
			<span class="mui-tab-label">上一步</span>
		</a>
		
		<a class="mui-tab-item end" id="submit">
			<span class="mui-tab-label" >提交</span>
		</a>
		
	</nav>
	<@scroll >
		<div class="pd-box add  mui-control-content mui-active" id="entry">
				
			<p>请输入商品sku编码，商品名称，商品属性（不同sku用';'隔开，商品属性用'、'隔开）</p>
			<textarea placeholder="例如：SJD133,iphone5,金色、64G;SJD893,iphone5s,金色、64G;" id="goods-info"></textarea>
			<div class="scm-btn-group">
				<a href="#preview" class="mui-btn mui-btn-block darkgreen mui-control-item" id="goprev">提交</a>
			</div>
		</div>
		
		<div class=" mui-control-content" id="preview">
			<form action="${add_path}" method="post" id="addForm">
				<ul class="enter-list">
					
				</ul>
			</form>
		</div>
	</@scroll>
</@body>

<@foot>
<script src="${static_path}/lib/handlebars/handlebars.runtime.js"></script>
<script src="${static_path}/lib/jquery/jquery.min.js"></script>
<script src="${static_path}/scm/goods-management/goods-preview/goods-preview.js"></script>
<script>
	var template = Handlebars.templates['goods-preview.hbs'];
	mui('body').on('tap','#goprev', function(){
		var data = jQuery('#goods-info').val();
		var prevInfo = {
			list:[]
		};
		if(data==""){
			mui.toast("内容不能为空！");
			return false;
		}
		var list = data.split(';');
		
		for (var i =0, l=list.length; i<l; i++){

			if (list[i] != ""){
				var item = list[i].split(',');
				if(item.length !== 3){
					mui.toast('格式不正确！');
					return false;
				}
				var arr = [];
				for (var j=0, len = item.length; j < len; j++){
					
						if (item[j] == ""){
							mui.toast('格式不正确！');
							return false;
						}
						arr.push(item[j]);

					
				}
				prevInfo.list.push(arr);
			}else {
				mui.toast("格式不正确！");
				return false;
			}
		}
		console.log(prevInfo);
		var lists = {
			list : [

		  	["iphone","dada3","金色、64G"],
		  	["iphone6","dad32a3","金色、64G"],
		  	
		  ]
		}
		var html = template(prevInfo);
		jQuery('.enter-list').html(html);
		jQuery('#goadd').removeClass("mui-active");
		jQuery('.scm-gd-nav').show();
	});
	mui('body').on('tap','#goadd', function(){
		jQuery('.scm-gd-nav').hide();
	})
	mui('body').on('tap', '#submit', function(){
		jQuery("#addForm").submit();
	})
</script>
</@foot>