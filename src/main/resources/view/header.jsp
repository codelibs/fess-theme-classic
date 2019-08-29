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
					<div class="col-12 col-sm-7 col-md-6 col-lg-5">
						<div>
							<ul class="pl-1 mb-1">
								<li>
									<la:link href="/search/advance?q=${f:u(q)}${fe:pagingQuery(null)}">
										<la:message key="labels.advance" />
									</la:link>
								</li>
								<li>
									<a href="/help" role="help"><la:message key="labels.index_help" /></a>
								</li>
							</ul>
						</div>
						<div class="input-group" role="search">
							<la:text property="q" maxlength="1000" styleId="query"
								styleClass="form-control form-control-sm" autocomplete="off" />
							<span class="input-group-append">
								<button type="submit" name="search" id="searchButton"
									class="btn btn-sm btn-secondary">
									<la:message key="labels.index_form_search_btn" />
								</button>
							</span>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</header>
</la:form>
