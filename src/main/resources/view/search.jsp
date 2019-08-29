<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head profile="http://a9.com/-/spec/opensearch/1.1/">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>${f:h(displayQuery)}-<la:message
		key="labels.search_title" /></title>
<c:if test="${osddLink}">
	<link rel="search" type="application/opensearchdescription+xml"
		href="${fe:url('/osdd')}"
		title="<la:message key="labels.index_osdd_title" />" />
</c:if>
<link href="${fe:url('/css/classic/bootstrap.min.css')}" rel="stylesheet"
	type="text/css" />
<link href="${fe:url('/css/classic/style.css')}" rel="stylesheet" type="text/css" />
<link href="${fe:url('/css/classic/font-awesome.min.css')}" rel="stylesheet"
	type="text/css" />
</head>
<body class="search">
	<jsp:include page="header.jsp" />
	<main id="content" class="container-fluid">
		<div id="subheader" class="row justify-content-between">
			<div class="col-auto ml-2 mr-1 px-1 px-sm-3">
				<la:message key="labels.search_result_status"
					arg0="${f:h(displayQuery)}" arg1="${f:h(allRecordCount)}"
					arg2="${f:h(currentStartRecordNumber)}"
					arg3="${f:h(currentEndRecordNumber)}" />
			</div>
		</div>
		<c:choose>
			<c:when test="${f:h(allRecordCount) != 0}">
				<jsp:include page="searchResults.jsp" />
			</c:when>
			<c:otherwise>
				<jsp:include page="searchNoResult.jsp" />
			</c:otherwise>
		</c:choose>
	</main>
	<jsp:include page="footer.jsp" />
	<input type="hidden" id="contextPath" value="${contextPath}" />
	<script type="text/javascript"
		src="${fe:url('/js/classic/jquery-3.3.1.min.js')}"></script>
	<script type="text/javascript" src="${fe:url('/js/classic/bootstrap.min.js')}"></script>
	<script type="text/javascript" src="${fe:url('/js/classic/suggestor.js')}"></script>
	<script type="text/javascript" src="${fe:url('/js/classic/search.js')}"></script>
</body>
</html>
