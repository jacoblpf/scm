var Freemarker = require("freemarker.js");
var path = require('path');
var fs = require('fs');


var fm = new Freemarker({
	viewRoot:path.join(__dirname, '../src/tpls/'),
	options:{}
});
console.log(fm);
var data = fs.readFileSync("./data/goods/goods_list.tdd", 'utf-8');
console.log(data);
var html = fm.renderSync("goods/goods_list.ftl", JSON.parse(data));
console.log(html);
fs.writeFile("./out/test.html",html,function(e){
    if(e) throw e;
});