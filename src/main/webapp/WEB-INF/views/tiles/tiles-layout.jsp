<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="text/javascript">
	var CONTEXT_PATH = "${CONTEXT_PATH}";
	var RESOURCES_PATH = "${RESOURCES_PATH}";
</script>
<link href="/resources/css/common.css" rel='stylesheet' />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>

<body>
	<div class='wrap'>
		<div class="sidebar_wrap">
			<tiles:insertAttribute name="sidebar" />
		</div>
		<div class="header_wrap fixed-top">
			<tiles:insertAttribute name="header" />
		</div>
		<div class='content_wrap'>
			<tiles:insertAttribute name="content" />
		</div>
		<div class="footer_wrap">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

</body>

</html>