(function() {
  var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
templates['distributorList.hbs'] = template({"1":function(container,depth0,helpers,partials,data) {
    var stack1, helper, alias1=depth0 != null ? depth0 : {}, alias2=helpers.helperMissing, alias3="function", alias4=container.escapeExpression;

  return "<li class=\"list-item\">\r\n	<h2 class=\"title clear\"><span class=\"pull-l disname\">"
    + alias4(((helper = (helper = helpers.name || (depth0 != null ? depth0.name : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"name","hash":{},"data":data}) : helper)))
    + "</span><span class=\"pull-r disLevel\">"
    + ((stack1 = helpers["if"].call(alias1,(depth0 != null ? depth0.level : depth0),{"name":"if","hash":{},"fn":container.program(2, data, 0),"inverse":container.noop,"data":data})) != null ? stack1 : "")
    + "</span></h2>\r\n	<p class=\"text-r clear\">\r\n		<span class=\"pull-l phone\">"
    + alias4(((helper = (helper = helpers.phone || (depth0 != null ? depth0.phone : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"phone","hash":{},"data":data}) : helper)))
    + "</span>\r\n		<span class=\"pull-r payWay\">"
    + alias4(((helper = (helper = helpers.payWay || (depth0 != null ? depth0.payWay : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"payWay","hash":{},"data":data}) : helper)))
    + "</span>\r\n	</p>\r\n	<div class=\"mui-row\">\r\n		<div class=\"mui-col-xs-6\">\r\n			<p class=\"gray\">近30天采购:<em>"
    + alias4(((helper = (helper = helpers.buyNum || (depth0 != null ? depth0.buyNum : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"buyNum","hash":{},"data":data}) : helper)))
    + "</em></p>\r\n			<p class=\"gray\"><em>"
    + alias4(((helper = (helper = helpers.rate || (depth0 != null ? depth0.rate : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"rate","hash":{},"data":data}) : helper)))
    + "</em>%上升</p>\r\n		</div>\r\n		<div class=\"mui-col-xs-6\">\r\n			<a href=\"#editLevel\" type=\"button\" class=\"mui-btn pull-r btn trigger-edit\" disId=\""
    + alias4(((helper = (helper = helpers.disId || (depth0 != null ? depth0.disId : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"disId","hash":{},"data":data}) : helper)))
    + "\">编辑</a>\r\n		</div>\r\n	</div>\r\n</li>\r\n";
},"2":function(container,depth0,helpers,partials,data) {
    var helper;

  return container.escapeExpression(((helper = (helper = helpers.level || (depth0 != null ? depth0.level : depth0)) != null ? helper : helpers.helperMissing),(typeof helper === "function" ? helper.call(depth0 != null ? depth0 : {},{"name":"level","hash":{},"data":data}) : helper)))
    + "级";
},"compiler":[7,">= 4.0.0"],"main":function(container,depth0,helpers,partials,data) {
    var stack1;

  return ((stack1 = helpers.each.call(depth0 != null ? depth0 : {},(depth0 != null ? depth0.list : depth0),{"name":"each","hash":{},"fn":container.program(1, data, 0),"inverse":container.noop,"data":data})) != null ? stack1 : "");
},"useData":true});
})();