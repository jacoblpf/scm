<#include "/base/base.ftl">
<@head title=title>
</@head>

<@body>
	<@page_head data=page_head_info />
	
	<nav class="mui-bar mui-bar-tab scm-bar-green">
		<a class="mui-tab-item mui-active newLink" href="${invite_link}">
			<span class="mui-tab-label">+ 邀请分销商</span>
		</a>
	</nav>
	<#if distributor_list??>
	<@scroll>

		<div class="scm-search">
			<button class="label-l mui-icon mui-icon-search" id="search-btn"></button>
			<a href="#search_box" class="label-r">筛选<i class="mui-icon mui-icon-arrowdown"></i></a>
		    <input type="search" class="" placeholder="搜索" name="keyWord" id="search">  
		</div> 
		<div class="scm-list">
			<ul class="" id="dis-list">
				<#list distributor_list as d>
					<li class="list-item">
						<h2 class="title clear">
							<span class="pull-l disname">${d.name}</span>
							<span class="pull-r disLevel">
								<#if d.level!="">${d.level}级</#if>
							</span>
						</h2>
						<p class="text-r clear">
							<span class="pull-l phone">${d.phone!''}</span>
							<span class="pull-r payWay">
								<#if d.payWay=="0">即时付款<#elseif d.payWay=="1">非即时付款</#if>
							</span>
						</p>
						<div class="mui-row">
							<div class="mui-col-xs-6">
								<p class="gray">近30天采购:<em>${d.buyNum}</em></p>
								<p class="gray"><em>${d.rate}</em>%上升</p>
							</div>
							<div class="mui-col-xs-6">
								<a href="#editLevel" type="button" class="mui-btn pull-r btn trigger-edit" disId=${d.disId}>编辑</a>
							</div>
						</div>
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
	<#else>
		<div class="empty-box">
			商品库还没录入商品<br/>现在就去录入
		</div>
	</#if>
	<div id="editLevel" class="mui-popover mui-popover-action mui-popover-bottom">
		<div class="scm-list" >
			<#if hasLevel>
			<#else>
				<div class="no-level">
					<span>您还未设置销售等级</span>
					<a class="btn newLink pull-r" href="${setPath}">去设置</a>
				</div>
			</#if>
			<ul>
				<li class="list-item">
					<h3 class="title">分销商名称</h3>
					<span class="name" id="disName"></span>
				</li>
				<li class="list-item">
					<h3 class="title">手机号码</h3>
					<span class="name" id="disPhone"></span>
				</li>
				<#if hasLevel>
					<li class="list-item">
						<h3 class="title">选择销售等级</h3>
						<ul class="mui-table-view-radio level">
							<#list levelList as item>
							<li class="mui-table-view-cell">
								<a class="mui-navigate-right">${item}级
									<input type="radio" name="level" value="${item}"/>
								</a>
							</li>
							</#list>
						</ul>
					</li>
				</#if>
				<li class="list-item">
					<h3 class="title">选择付款方式</h3>
					<ul class="mui-table-view-radio pay">
						<#list payWay as w>
						<li class="mui-table-view-cell">
							<a class="mui-navigate-right">${w.text}
								<input type="radio" name="payWay" value="${w.value}"/>
							</a>
						</li>
						</#list>
					</ul>
				</li>
				<input type="hidden" name="disId" value="" id="disId"/>
				<li class="list-item end">
					<button type="button" class="scm-btn-lg green close-popover" id="submitEdit">确定</button>
				</li>
			</ul>
			
		</div>
	</div>	
</@body>

<@foot>
<script src="${static_path}/lib/handlebars/handlebars.runtime.js"></script>
<script src="${static_path}/lib/jquery/jquery.min.js"></script>
<script src="${static_path}/scm/distributor-management/distributor-list/distributor-list.js"></script>
<script>
		(function(){
			var current = 2;
			var template = Handlebars.templates['distributor-list.hbs'];
			var keyWord = 'all';
			var isadd = true;
			var currentDis;

			mui.init({
			  pullRefresh : {
			    container:'.mui-content',
			    up : {
			      height:20,
			      contentrefresh : "正在加载...",
			      contentnomore:'没有更多数据了',
			      callback :function(){loadMore.call(this, this, isadd)}
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
	   					
	   					jQuery("#dis-list").append(html);
	   								   			
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
			   			jQuery("#dis-list").html(html);
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

			jQuery('body').on('tap','.trigger-edit', function(){
				currentDis = jQuery(this).parent().parent().parent();

				var name = currentDis.find(".disname").text();
				var phone = currentDis.find(".phone").text();
				var disId = jQuery(this).attr('disId');
				jQuery('#disName').html(name);
				jQuery('#disPhone').html(phone);
				jQuery('#disId').val(disId);
			});

			function disEdit(){
				var level = jQuery("input[name=level]:checked").val();
				var payWay = jQuery("input[name=payWay]:checked").val();
				var disId = jQuery('#disId').val();
				if (level !== undefined || payWay !== undefined){
					jQuery.ajax({
						url:'${edit_path}',
						type:'post',
						data:{
							'level':level,
							'payWay':payWay,
							'disId':disId
						},
						success:function(data){
							if(data.status == '1'){
								currentDis.find('.disLevel').html(data.level+"级");
								currentDis.find('.payWay').html(data.payWay);
								mui('#editLevel').popover('toggle');
							}
							jQuery('#editLevel input[type=radio]').attr('checked', false);
							jQuery('.mui-table-view-radio li').removeClass('mui-selected');
						}
					})
				}else {
					mui('#editLevel').popover('toggle');
				}
			}

			jQuery('#submitEdit').click(function(){
				disEdit();
			})

		})();
	</script>
</@foot>