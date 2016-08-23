(function() {
  var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
templates['goods-list.hbs'] = template({"1":function(container,depth0,helpers,partials,data) {
    var stack1, helper, alias1=depth0 != null ? depth0 : {}, alias2=helpers.helperMissing, alias3="function", alias4=container.escapeExpression;

  return "<li class=\"list-item\">\r\n	<a class=\"goods clear newLink\" href=\""
    + alias4(((helper = (helper = helpers.link || (depth0 != null ? depth0.link : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"link","hash":{},"data":data}) : helper)))
    + "\">\r\n		<img src=\""
    + alias4(((helper = (helper = helpers.img || (depth0 != null ? depth0.img : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"img","hash":{},"data":data}) : helper)))
    + "\">\r\n		<h2 class=\"title\">"
    + alias4(((helper = (helper = helpers.goodsName || (depth0 != null ? depth0.goodsName : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"goodsName","hash":{},"data":data}) : helper)))
    + "</h2>\r\n		<p class=\"price\">￥"
    + alias4(((helper = (helper = helpers.startPrice || (depth0 != null ? depth0.startPrice : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"startPrice","hash":{},"data":data}) : helper)))
    + ((stack1 = helpers["if"].call(alias1,(depth0 != null ? depth0.endPrice : depth0),{"name":"if","hash":{},"fn":container.program(2, data, 0),"inverse":container.noop,"data":data})) != null ? stack1 : "")
    + "</p>\r\n		<p class=\"status clear\"><span>"
    + alias4(((helper = (helper = helpers.spec || (depth0 != null ? depth0.spec : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"spec","hash":{},"data":data}) : helper)))
    + "种规格</span> <span>"
    + ((stack1 = helpers["if"].call(alias1,(depth0 != null ? depth0.status : depth0),{"name":"if","hash":{},"fn":container.program(4, data, 0),"inverse":container.program(6, data, 0),"data":data})) != null ? stack1 : "")
    + "</span></p>\r\n	</a>\r\n</li>\r\n";
},"2":function(container,depth0,helpers,partials,data) {
    var helper;

  return " - ￥"
    + container.escapeExpression(((helper = (helper = helpers.endPrice || (depth0 != null ? depth0.endPrice : depth0)) != null ? helper : helpers.helperMissing),(typeof helper === "function" ? helper.call(depth0 != null ? depth0 : {},{"name":"endPrice","hash":{},"data":data}) : helper)));
},"4":function(container,depth0,helpers,partials,data) {
    return "已上架";
},"6":function(container,depth0,helpers,partials,data) {
    return "未上架";
},"compiler":[7,">= 4.0.0"],"main":function(container,depth0,helpers,partials,data) {
    var stack1;

  return ((stack1 = helpers.each.call(depth0 != null ? depth0 : {},(depth0 != null ? depth0.list : depth0),{"name":"each","hash":{},"fn":container.program(1, data, 0),"inverse":container.noop,"data":data})) != null ? stack1 : "");
},"useData":true});
})();