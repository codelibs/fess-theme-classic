<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<la:form action="/search" method="get" styleId="searchForm"
	role="search">
	${fe:facetForm()}${fe:geoForm()}
	<header>
		<nav>
			<div id="content" class="container-fluid p-2">
				<div class="row align-items-center mx-0">
					<la:link styleClass="d-inline-flex" href="/">
						<img src="${fe:url('/images/classic/logo-head.png')}"
							alt="<la:message key="labels.header_brand_name" />"
							class="align-items-center" />
					</la:link>
					<c:if test="${!chatPage}">
					<div class="col-12 col-sm-7 col-md-6 col-lg-5">
						<div>
							<ul class="ps-1 mb-1">
								<li>
									<la:link href="/search/advance?q=${f:u(q)}${fe:pagingQuery(null)}">
										<la:message key="labels.advance" />
									</la:link>
								</li>
								<li>
									<a href="/help" role="help"><la:message key="labels.index_help" /></a>
								</li>
								<c:if test="${chatEnabled && !chatPage}">
								<li>
									<la:link href="/chat">
										<i class="fa fa-robot" aria-hidden="true"></i>
										<la:message key="labels.chat_ai_mode" />
									</la:link>
								</li>
								</c:if>
							</ul>
						</div>
						<div class="input-group" role="search">
							<la:text property="q" maxlength="1000" styleId="query"
								styleClass="form-control form-control-sm" autocomplete="off" />
							<button type="submit" name="search" id="searchButton"
								class="btn btn-sm btn-secondary">
								<la:message key="labels.index_form_search_btn" />
							</button>
						</div>
					</div>
					</c:if>
					<c:if test="${chatPage}">
					<div class="col-12 col-sm-7 col-md-6 col-lg-5">
						<div>
							<ul class="ps-1 mb-1">
								<li>
									<la:link href="/">
										<i class="fa fa-search" aria-hidden="true"></i>
										<la:message key="labels.search" />
									</la:link>
								</li>
								<li>
									<a href="/help" role="help"><la:message key="labels.index_help" /></a>
								</li>
							</ul>
						</div>
					</div>
					</c:if>
				</div>
			</div>
		</nav>
	</header>
</la:form>
