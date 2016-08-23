var express = require('express');
var path = require('path');

var app = express();

app.get('/index', function(req, res){
	res.send("ok");
});
app.post('/server/loadDisList', function(req, res){
	res.send({list:[
		{	
			"name":"江苏代理",
			"phone":"1214324",
			"level":"B",
			"payWay":"即时付款",
			"buyNum":"10w",
			"rate":"7",
			"disId":"213"
		},
		{	
			"name":"南京代理",
			"phone":"1214324",
			"level":"A",
			"payWay":"即时付款",
			"buyNum":"110w",
			"rate":"17",
			"disId":"21312"
		},
		{	
			"name":"北京代理",
			"phone":"1214324",
			"level":"",
			"payWay":"即时付款",
			"buyNum":"10w",
			"rate":"7",
			"disId":"213213"
		},
		{	
			"name":"江苏代理",
			"phone":"1214324",
			"level":"B",
			"payWay":"即时付款",
			"buyNum":"10w",
			"rate":"7",
			"disId":"21312"
		},
		{	
			"name":"江苏代理",
			"phone":"1214324",
			"level":"B",
			"payWay":"即时付款",
			"buyNum":"10w",
			"rate":"7",
			"disId":"21213"
		},
		{	
			"name":"江苏代理",
			"phone":"1214324",
			"level":"B",
			"payWay":"即时付款",
			"buyNum":"10w",
			"rate":"7",
			"disId":"21123"
		},
		{	
			"name":"江苏代理",
			"phone":"1214324",
			"level":"B",
			"payWay":"即时付款",
			"buyNum":"10w",
			"rate":"7",
			"disId":"21893"
		}
	]});
});

app.post('/server/loadGoodsList', function(req, res){
	res.send({
		list : [

		  	{
			"link":"./goods_detail.html",
			"img":"./static/img/3.png",
			"goodsName":"贝婴美婴幼儿奶粉",
			"startPrice":"100",
			"endPrice":"300",
			"spec":"3",
			"status":"1"
			},

		  	{
			"link":"./goods_detail.html",
			"img":"./static/img/3.png",
			"goodsName":"贝婴美婴幼儿奶粉",
			"startPrice":"100",
			"endPrice":"300",
			"spec":"3",
			"status":"1"
			},

		  	{
			"link":"./goods_detail.html",
			"img":"./static/img/3.png",
			"goodsName":"贝婴美婴幼儿奶粉",
			"startPrice":"100",
			"endPrice":"300",
			"spec":"3",
			"status":"1"
			},

		  	{
			"link":"./goods_detail.html",
			"img":"./static/img/3.png",
			"goodsName":"贝婴美婴幼儿奶粉",
			"startPrice":"100",
			"endPrice":"300",
			"spec":"3",
			"status":"1"
			},

		  	{
			"link":"./goods_detail.html",
			"img":"./static/img/3.png",
			"goodsName":"贝婴美婴幼儿奶粉",
			"startPrice":"100",
			"endPrice":"300",
			"spec":"3",
			"status":"1"
			},

		  	{
			"link":"./goods_detail.html",
			"img":"./static/img/3.png",
			"goodsName":"贝婴美婴幼儿奶粉",
			"startPrice":"100",
			"endPrice":"300",
			"spec":"3",
			"status":"1"
			}
			

		  ]
	})
})

app.post('/server/editDis', function(req, res){
	res.send({
		'status':'1',
		'level':'B',
		'payWay':'即时付款'	
	})
});

app.post('/server/delete', function(req, res){
	res.send({
		status:'1'
	})
});

app.post('/server/remove', function(req, res){
	res.send({
		status:'1'
	})
});

app.get('/server/addGoods', function(req, res){
	res.send(JSON.parse(req));
})



var server = app.listen(3000, function(){
	var host = server.address().address;
	var port = server.address().port;

	console.log('Example app listening at http://%s:%s', host, port);
})

app.use(express.static('test'));