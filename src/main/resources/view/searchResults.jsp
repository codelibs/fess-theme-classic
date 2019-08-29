<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%-- query matched some document --%>
<div class="row justify-content-end mt-1 px-2 px-sm-4">
	<small>
		<c:if test="${sort=='last_modified.desc'}">
			<la:message key="labels.search_result_sort_last_modified_desc" />
		</c:if>
		<c:if test="${sort!='last_modified.desc'}">
			<a id="sort-last-modified" href="/search?q=${f:u(fe:replace(q, '\\s?sort:\\S*', ''))}&sdh=${f:u(fe:sdh(sdh))}
				&sort=last_modified.desc${fe:replace(fe:pagingQuery(null), '&sort=[^&]*', '')}${fe:facetQuery()}${fe:geoQuery()}">
				<la:message key="labels.search_result_sort_last_modified_desc" />
			</a>
		</c:if>
		/
		<c:if test="${empty sort or sort=='score.desc'}">
			<la:message key="labels.search_result_sort_score_desc" />
		</c:if>
		<c:if test="${not empty sort and sort!='score.desc'}">
			<a id="sort-score" href="/search?q=${f:u(fe:replace(q, '\\s?sort:\\S*', ''))}&sdh=${f:u(fe:sdh(sdh))}
				&sort=score.desc${fe:replace(fe:pagingQuery(null), '&sort=[^&]*', '')}${fe:facetQuery()}${fe:geoQuery()}">
				<la:message key="labels.search_result_sort_score_desc" />
			</a>
		</c:if>
	</small>
</div>
<c:if test="${partialResults}">
	<div class="alert">
		<p>
			<la:message key="labels.process_time_is_exceeded" />
		</p>
	</div>
</c:if>
<div id="result" class="row px-1 px-sm-4 px-md-5">
	<input type="hidden" id="queryId" value="${f:u(queryId)}" /> <input
		type="hidden" id="rt" value="${f:u(requestedTime)}" />
	<ol class="list-unstyled col col-md-11 col-lg-8 px-1 pl-sm-3 pr-md-3 my-1">
		<c:forEach var="doc" varStatus="s" items="${documentItems}">
			<li id="result${s.index}">
				<h3 class="title mb-1">
					<a class="link" href="${doc.url_link}" data-uri="${doc.url_link}"
						data-id="${doc.doc_id}" data-order="${s.index}">${doc.content_title}</a>
				</h3>
				<div class="body">
					<c:if test="${thumbnailSupport && !empty doc.thumbnail}">
						<a class="link mr-3 d-none d-sm-flex" href="${doc.url_link}" data-uri="${doc.url_link}" data-id="${doc.doc_id}"
							data-order="${s.index}"
						> <img src="${fe:url('/images/classic/blank.png')}"
							data-src="${fe:url('/thumbnail/')}?docId=${f:u(doc.doc_id)}&queryId=${f:u(queryId)}" class="thumbnail"
						>
						</a>
					</c:if>
					<div class="description">${doc.content_description}</div>
				</div>
				<div>
					<small>
						<cite class="site">${f:h(doc.site_path)}</cite>
						<div class="d-sm-none"></div>
						<cite>
							<c:choose>
								<c:when test="${doc.last_modified!=null && doc.last_modified!=''}">
									<c:set var="hasInfo" value="true" />
									<span class="d-none d-sm-inline">-</span>
									<fmt:formatDate value="${fe:parseDate(doc.last_modified)}" pattern="yyyy-MM-dd" />
								</c:when>
								<c:when test="${doc.created!=null && doc.created!=''}">
									<c:set var="hasInfo" value="true" />
									<span class="d-none d-sm-inline">-</span>
									<fmt:formatDate value="${fe:parseDate(doc.created)}" pattern="yyyy-MM-dd" />
								</c:when>
							</c:choose>
							<c:if test="${doc.content_length!=null && doc.content_length!=''}">
								<span class="${hasInfo ? 'd-sm-inline' : 'd-none d-sm-inline'}">-</span>
								<c:set var="hasInfo" value="true" />
								<la:message key="labels.search_result_size" arg0="${fe:formatNumber(doc.content_length)}" />
							</c:if>
						</cite>
					</small>
				</div>
			</li>
		</c:forEach>
	</ol>
</div>
<div class="row justify-content-center mb-4">
	<nav class="col-auto px-0">
		<ul class="px-1">
			<small class="d-none d-sm-inline">
				<li>
					<la:message key="labels.pageNumber" />
				</li>
			</small>
			<c:if test="${existPrevPage}">
				<li><la:link aria-label="Previous"
						href="/search/prev?q=${f:u(q)}&pn=${f:u(currentPageNumber)}&num=${f:u(pageSize)}&sdh=${f:u(fe:sdh(sdh))}${fe:pagingQuery(null)}${fe:facetQuery()}${fe:geoQuery()}">
						<b><la:message key="labels.prev_page" /></b>
					</la:link></li>
			</c:if>
			<c:forEach var="pageNumber" varStatus="s" items="${pageNumberList}">
				<c:if test="${pageNumber == currentPageNumber}">
					<li id="currentPage">
						${pageNumber}
					</li>
				</c:if>
				<c:if test="${pageNumber != currentPageNumber}">
					<li
					<c:choose>
						<c:when test="${pageNumber < currentPageNumber - 3 || pageNumber > currentPageNumber + 3}">class="d-none d-sm-inline"</c:when>
						<c:otherwise>class="d-inline"</c:otherwise>
					</c:choose>>
					<la:link
						href="/search/move?q=${f:u(q)}&pn=${f:u(pageNumber)}&num=${f:u(pageSize)}&sdh=${f:u(fe:sdh(sdh))}${fe:pagingQuery(null)}${fe:facetQuery()}${fe:geoQuery()}">${f:h(pageNumber)}</la:link>
					</li>
				</c:if>
			</c:forEach>
			<c:if test="${existNextPage}">
				<li><la:link aria-label="Next"
						href="/search/next?q=${f:u(q)}&pn=${f:u(currentPageNumber)}&num=${f:u(pageSize)}&sdh=${f:u(fe:sdh(sdh))}${fe:pagingQuery(null)}${fe:facetQuery()}${fe:geoQuery()}">
						<b><la:message key="labels.next_page" /></b>
					</la:link></li>
			</c:if>
		</ul>
	</nav>
</div>
<div id="subfooter" class="row justify-content-center">
	<div class="col-10 col-sm-8 col-lg-6 my-4 px-1">
		<la:form action="/search" method="get" styleId="searchForm" role="search">
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
		</la:form>
	</div>
</div>
