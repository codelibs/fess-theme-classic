<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head profile="http://a9.com/-/spec/opensearch/1.1/">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><la:message key="labels.search_title" /></title>
<c:if test="${osddLink}">
	<link rel="search" type="application/opensearchdescription+xml" href="${fe:url('/osdd')}"
		title="<la:message key="labels.index_osdd_title" />"
	/>
</c:if>
<link href="${fe:url('/css/classic/bootstrap.min.css')}" rel="stylesheet" type="text/css" />
<link href="${fe:url('/css/classic/style.css')}" rel="stylesheet" type="text/css" />
<link href="${fe:url('/css/classic/font-awesome.min.css')}" rel="stylesheet" type="text/css" />
</head>
<body>
	<la:form styleClass="form-stacked" action="/search/" method="get" styleId="searchForm">
		${fe:facetForm()}${fe:geoForm()}
		<header>
			<div id="content" class="container-fluid mb-1 p-2">
				<div class="row align-items-center mx-0">
					<la:link styleClass="d-inline-flex" href="/">
						<img src="${fe:url('/images/classic/logo-head.png')}"
							alt="<la:message key="labels.header_brand_name" />"
							class="align-items-center" />
					</la:link>
				</div>
			</div>
		</header>

		<main id="content" class="container-fluid mt-2 p-2 advance-form">
			<div>
				<la:info id="msg" message="true">
					<div class="alert alert-info">${msg}</div>
				</la:info>
				<la:errors header="errors.front_header" footer="errors.front_footer" prefix="errors.front_prefix"
					suffix="errors.front_suffix"
				/>
			</div>
			<div class="form-group row mx-0 mb-2">
				<label for="as_q" class="col-lg-3 col-md-4 col-sm-5 col-12 col-form-label col-form-label-sm"><la:message
						key="labels.advance_search_must_queries"
					/></label>
				<div class="col-lg-5 col-md-6 col-sm-7 col-xs-6">
					<input class="form-control form-control-sm" type="text" id="as_q" name="as.q" value="${f:h(fe:join(as.q))}">
				</div>
				<div class="col-lg-4 col-md-2 d-none d-md-flex align-items-center">
					<!-- TODO -->
				</div>
			</div>
			<div class="form-group row mx-0 mb-2">
				<label for="as_epq" class="col-lg-3 col-md-4 col-sm-5 col-12 col-form-label col-form-label-sm"><la:message
						key="labels.advance_search_phrase_query"
					/></label>
				<div class="col-lg-5 col-md-6 col-sm-7 col-xs-6">
					<input class="form-control form-control-sm" type="text" id="as_epq" name="as.epq" value="${f:h(fe:join(as.epq))}">
				</div>
				<div class="col-lg-4 col-md-2 d-none d-md-flex align-items-center">
					<!-- TODO -->
				</div>
			</div>
			<div class="form-group row mx-0 mb-2">
				<label for="as_oq" class="col-lg-3 col-md-4 col-sm-5 col-12 col-form-label col-form-label-sm"><la:message
						key="labels.advance_search_should_queries"
					/></label>
				<div class="col-lg-5 col-md-6 col-sm-7 col-xs-6">
					<input class="form-control form-control-sm" type="text" id="as_oq" name="as.oq" value="${f:h(fe:join(as.oq))}">
				</div>
				<div class="col-lg-4 col-md-2 d-none d-md-flex align-items-center">
					<!-- TODO -->
				</div>
			</div>
			<div class="form-group row mx-0 mb-2">
				<label for="as_nq" class="col-lg-3 col-md-4 col-sm-5 col-12 col-form-label col-form-label-sm"><la:message
						key="labels.advance_search_not_queries"
					/></label>
				<div class="col-lg-5 col-md-6 col-sm-7 col-xs-6">
					<input class="form-control form-control-sm" type="text" id="as_nq" name="as.nq" value="${f:h(fe:join(as.nq))}">
				</div>
				<div class="col-lg-4 col-md-2 d-none d-md-flex align-items-center">
					<!-- TODO -->
				</div>
			</div>
			<div class="container-fluid m-0 p-2 advance-form-details">
				<div class="form-group row mx-0 mb-2">
					<label for="contentLang" class="col-lg-3 col-md-4 col-sm-5 col-12 col-form-label col-form-label-sm"><la:message
							key="labels.index_lang"
						/></label>
					<div class="col-lg-5 col-md-6 col-sm-7 col-xs-6">
						<la:select property="lang" styleId="langSearchOption" multiple="true" styleClass="form-control form-control-sm">
							<c:forEach var="item" items="${langItems}">
								<la:option value="${f:u(item.value)}">${f:h(item.label)}</la:option>
							</c:forEach>
						</la:select>
					</div>
					<div class="col-lg-4 col-md-2 d-none d-md-flex align-items-center">
						<!-- TODO -->
					</div>
				</div>
				<div class="form-group row mx-0 mb-2">
					<label for="as_filetype" class="col-lg-3 col-md-4 col-sm-5 col-12 col-form-label col-form-label-sm"><la:message
							key="labels.advance_search_filetype"
						/></label>
					<div class="col-lg-5 col-md-6 col-sm-7 col-xs-6">
						<select id="as_filetype" name="as.filetype" class="form-control form-control-sm">
							<option value=""><la:message key="labels.advance_search_filetype_default" /></option>
							<option value="html" <c:if test="${as.filetype.contains('html')}">selected</c:if>><la:message
									key="labels.advance_search_filetype_html"
								/></option>
							<option value="pdf" <c:if test="${as.filetype.contains('pdf')}">selected</c:if>><la:message
									key="labels.advance_search_filetype_pdf"
								/></option>
							<option value="word" <c:if test="${as.filetype.contains('word')}">selected</c:if>><la:message
									key="labels.advance_search_filetype_word"
								/></option>
							<option value="excel" <c:if test="${as.filetype.contains('excel')}">selected</c:if>><la:message
									key="labels.advance_search_filetype_excel"
								/></option>
							<option value="powerpoint" <c:if test="${as.filetype.contains('powerpoint')}">selected</c:if>><la:message
									key="labels.advance_search_filetype_powerpoint"
								/></option>
						</select>
					</div>
					<div class="col-lg-4 col-md-2 d-none d-md-flex align-items-center">
						<!-- TODO -->
					</div>
				</div>
				<div class="form-group row mx-0 mb-2">
					<label for="as_occt" class="col-lg-3 col-md-4 col-sm-5 col-12 col-form-label col-form-label-sm"><la:message
							key="labels.advance_search_occt"
						/></label>
					<div class="col-lg-5 col-md-6 col-sm-7 col-xs-6">
						<select id="as_occt" name="as.occt" class="form-control form-control-sm">
							<option value=""><la:message key="labels.advance_search_occt_default" /></option>
							<option value="allintitle" <c:if test="${as.occt.contains('allintitle')}">selected</c:if>><la:message
									key="labels.advance_search_occt_allintitle"
								/></option>
							<option value="allinurl" <c:if test="${as.occt.contains('allinurl')}">selected</c:if>><la:message
									key="labels.advance_search_occt_allinurl"
								/></option>
						</select>
					</div>
					<div class="col-lg-4 col-md-2 d-none d-md-flex align-items-center">
						<!-- TODO -->
					</div>
				</div>
				<div class="form-group row mx-0 mb-2">
					<label for="contentSort" class="col-lg-3 col-md-4 col-sm-5 col-12 col-form-label col-form-label-sm"><la:message
							key="labels.index_sort"
						/></label>
					<div class="col-lg-5 col-md-6 col-sm-7 col-xs-6">
						<la:select property="sort" styleId="sortSearchOption" styleClass="form-control form-control-sm">
							<option value="">
								<la:message key="labels.search_result_select_sort" />
							</option>
							<la:option value="score.desc">
								<la:message key="labels.search_result_sort_score_desc" />
							</la:option>
							<la:option value="filename.asc">
								<la:message key="labels.search_result_sort_filename_asc" />
							</la:option>
							<la:option value="filename.desc">
								<la:message key="labels.search_result_sort_filename_desc" />
							</la:option>
							<la:option value="created.asc">
									<la:message key="labels.search_result_sort_created_asc" />
							</la:option>
							<la:option value="created.desc">
								<la:message key="labels.search_result_sort_created_desc" />
							</la:option>
							<la:option value="content_length.asc">
								<la:message key="labels.search_result_sort_content_length_asc" />
							</la:option>
							<la:option value="content_length.desc">
								<la:message key="labels.search_result_sort_content_length_desc" />
							</la:option>
							<la:option value="last_modified.asc">
								<la:message key="labels.search_result_sort_last_modified_asc" />
							</la:option>
							<la:option value="last_modified.desc">
								<la:message key="labels.search_result_sort_last_modified_desc" />
							</la:option>
							<c:if test="${searchLogSupport}">
								<la:option value="click_count.asc">
									<la:message key="labels.search_result_sort_click_count_asc" />
								</la:option>
								<la:option value="click_count.desc">
									<la:message key="labels.search_result_sort_click_count_desc" />
								</la:option>
							</c:if>
							<c:if test="${favoriteSupport}">
								<la:option value="favorite_count.asc">
									<la:message key="labels.search_result_sort_favorite_count_asc" />
								</la:option>
								<la:option value="favorite_count.desc">
									<la:message key="labels.search_result_sort_favorite_count_desc" />
								</la:option>
							</c:if>
						</la:select>
					</div>
					<div class="col-lg-4 col-md-2 d-none d-md-flex align-items-center">
						<!-- TODO -->
					</div>
				</div>
				<div class="form-group row mx-0 mb-2">
					<label for="contentNum" class="col-lg-3 col-md-4 col-sm-5 col-12 col-form-label col-form-label-sm"><la:message
							key="labels.index_num"
						/></label>
					<div class="col-lg-5 col-md-6 col-sm-7 col-xs-6">
						<la:select property="num" styleId="numSearchOption" styleClass="form-control form-control-sm">
							<option value="">
								<la:message key="labels.search_result_select_num" />
							</option>
							<la:option value="10">10</la:option>
							<la:option value="20">20</la:option>
							<la:option value="30">30</la:option>
							<la:option value="40">40</la:option>
							<la:option value="50">50</la:option>
							<la:option value="100">100</la:option>
						</la:select>
					</div>
					<div class="col-lg-4 col-md-2 d-none d-md-flex align-items-center">
						<!-- TODO -->
					</div>
				</div>

				<div class="row">
					<button type="submit" name="search" id="searchButton" class="btn btn-sm btn-secondary mx-auto">
						<la:message key="labels.index_form_search_btn" />
					</button>
				</div>
			</div>
		</main>
		<jsp:include page="footer.jsp" />
	</la:form>
	<input type="hidden" id="contextPath" value="${contextPath}" />
	<script type="text/javascript" src="${fe:url('/js/classic/jquery-3.3.1.min.js')}"></script>
	<script type="text/javascript" src="${fe:url('/js/classic/bootstrap.min.js')}"></script>
	<script type="text/javascript" src="${fe:url('/js/classic/suggestor.js')}"></script>
	<script type="text/javascript" src="${fe:url('/js/classic/advance.js')}"></script>
</body>
</html>
