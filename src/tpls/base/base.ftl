<#include "particle.ftl">
<!DOCTYPE html>
<#macro head title>
	<html lang="ZH">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<title>${title}</title>
		<link rel="stylesheet" type="text/css" href="${static_path}/lib/mui/css/mui.min.css">
		<link rel="stylesheet" type="text/css" href="${static_path}/style/default/css/base.css">
		<#nested>
	</head>
</#macro>


<#macro body>
	<body>
	<#nested>
	<script type="text/javascript" src="${static_path}/lib/mui/js/mui.min.js"></script>
	<script type="text/javascript" src="${static_path}/js/base.js"></script>
	
	</body>
</#macro>

<#macro foot>
	</html>
	<#nested>
</#macro>
