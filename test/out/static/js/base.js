(function(){
	//mui A标签跳转
	mui("body").on('tap', '.newLink', function(){	
		if (this.href !== null){	
			mui.openWindow({url: this.href})
		}
	});

	//商品录入页面切换底部按钮
	mui("body").on('tap', '.open-nav', function(){	
		mui('.close-nav').each(function(){
			var className = this.getAttribute('class').replace('mui-active','');
			this.setAttribute('class', className);
		});	

		if (this.getAttribute('data-toggle') !== null){
			mui(this.getAttribute('data-toggle'))[0].style.display='block';
		}
	});

	mui("body").on('tap', '.close-nav', function(){	
	
		mui('.navs').each(function(){
			this.style.display='none';
		})
	});

	//上传图片按钮
	mui('body').on('tap', '.trigger-btn', function(){
		var child = this.parentNode.children;
		for (var i = 0, l = child.length; i < l; i++){
			var className = child[i].getAttribute('class');
			if (className !== null && className.indexOf('upfile') !== -1){
				mui.trigger(child[i], 'click');
				return ;
			}
		}
	})


})();