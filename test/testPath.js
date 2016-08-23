var path = require('path');
var Freemarker = require('freemarker.js');

var fm = new Freemarker({
	viewRoot:path.join(__dirname, '../'),
	options:{}
});

var html = fm.renderSync('src/tpls/base/base.ftl', {'title':'lpf'});

console.log(html);