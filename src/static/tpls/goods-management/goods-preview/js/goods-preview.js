(function() {
  var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
templates['goods-preview.hbs'] = template({"1":function(container,depth0,helpers,partials,data) {
    var alias1=container.lambda, alias2=container.escapeExpression;

  return "<li>\r\n	<ul class=\"prev-list\">\r\n		<li class=\"clear\">\r\n			<span class=\"prev-l pull-l\">\r\n				<i class=\"icon icon-brand\"></i>名称\r\n			</span>\r\n			<input class=\"prev-r pull-r\" name=\"goodsName[]\" value=\""
    + alias2(alias1((depth0 != null ? depth0["0"] : depth0), depth0))
    + "\"/>\r\n		</li>\r\n		<li class=\"clear\">\r\n			<span class=\"prev-l pull-l\">\r\n				<i class=\"icon icon-sku\"></i>编码\r\n			</span>\r\n			<input class=\"prev-r pull-r\" name=\"sku[]\" value=\""
    + alias2(alias1((depth0 != null ? depth0["1"] : depth0), depth0))
    + "\"/>\r\n		</li>\r\n		<li class=\"clear\">\r\n			<span class=\"prev-l pull-l\">\r\n				<i class=\"icon icon-attr\"></i>属性\r\n			</span>\r\n			<input class=\"prev-r pull-r\" name=\"attr[]\" value=\""
    + alias2(alias1((depth0 != null ? depth0["2"] : depth0), depth0))
    + "\">\r\n		</li>\r\n	</ul>\r\n</li>\r\n";
},"compiler":[7,">= 4.0.0"],"main":function(container,depth0,helpers,partials,data) {
    var stack1;

  return ((stack1 = helpers.each.call(depth0 != null ? depth0 : {},(depth0 != null ? depth0.list : depth0),{"name":"each","hash":{},"fn":container.program(1, data, 0),"inverse":container.noop,"data":data})) != null ? stack1 : "");
},"useData":true});
})();