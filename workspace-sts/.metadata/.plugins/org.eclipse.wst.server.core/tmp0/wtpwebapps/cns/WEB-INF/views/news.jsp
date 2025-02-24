<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
<link href="/resources/css/ij-css.css" rel="stylesheet">
<title>QuadCore News</title>

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top"
		style="background-color: #A566FF">
		<!-- bg-dark  -->
		<div class="container">
			<a class="navbar-brand" href="../.do">QuadCore News</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="../.do">Home</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							카테고리 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item " href="politics.do">정치</a> <a
								class="dropdown-item" href="economy.do">경제</a> <a
								class="dropdown-item" href="society.do">사회</a> <a
								class="dropdown-item" href="living.do">생활문화</a> <a
								class="dropdown-item" href="itScience.do">IT과학</a>
						</div></li>
						<li class="nav-item"><a class="nav-link" href="../tag.do">태그</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							신문사 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="../company/chosun.do">조선일보</a> <a
								class="dropdown-item" href="../company/joongang.do">중앙일보</a> <a
								class="dropdown-item" href="../company/donga.do">동아일보</a> <a
								class="dropdown-item" href="../company/hankyoreh.do">한겨례</a> <a
								class="dropdown-item" href="../company/yonhap.do">연합뉴스</a>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<!-- <img style="float: right"
			src="https://mimgnews.pstatic.net/image/upload/office_logo/003/2018/01/24/logo_003_38_20180124113224.png"
			alt="신문사로고"> -->
		<h2 class="mt-4 mb-3">
			<b><c:out value="${news.news_title}"/></b> <br />
		</h2>

		<ol class="breadcrumb">
 		<li class="p-2 bd-highlight">기사입력 : <c:out value="${news.date_of_news}"/></li>
  		<li id='scrap' class="ml-auto p-2 bd-highlight"><a href="<c:out value='${news.news_id}'/>">스크랩</a></li>
		</ol>

		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-8">

				<!-- Blog Post -->
				<div class="card mb-4">
					<img class="card-img-top"
						src='<c:out value="${news.image}"/>'>
					<p style="margin: 5px 10px 20px 20px">
						<small>【요약뉴스】<c:out value="${news.summarize}"/></small>
					</p>
					<div class="card-body">
						<br>
						<p class="card-text" >
						<pre style="white-space: pre-wrap;"> <c:out value="${news.news_content}"/> </pre>
						</p>
					</div>
				</div>
				
<!-- 			<ul class="pagination justify-content-left mb-4">
			<li class="page-item">
             <a href="#" class="btn btn-primary">스크랩</a>
            </li>
         	</ul> -->
				
			</div>

			<!-- Sidebar Widgets Column -->
			<div class="col-md-4">
		

				<!-- Side Widget -->
				<div class="card my-4">
					<h5 class="card-header">태그 Tags</h5>
					<div class="card-body" id="move" >
					<c:forEach items="${tags}" var="tag">
						<a  href="<c:out value='${tag.tag_id}'/>"  title="<c:out value='${tag.tag_content}'/>" class="btn btn-primary">${tag.tag_content}</a>
						</c:forEach>
					</div>
				</div>
				
				<div class="card my-4">
					<h5 class="card-header">연관태그 Tags</h5>
					<div id="move" class="card-body">
					<c:forEach items="${astags}" var="tag">
						<c:if test="${not empty tag.tag2}">
							<a href="<c:out value='${tag.tag_id}'/>"  title="<c:out value='${tag.tag2}'/>" class="btn btn-primary">${tag.tag2}</a>
						</c:if>
						<c:if test="${not empty tag.tag3}">
							<a href="<c:out value='${tag.tag_id}'/>" title="<c:out value='${tag.tag3}'/>"  class="btn btn-primary">${tag.tag3}</a>
						</c:if>
						</c:forEach>
					</div>
				</div>

			</div>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
	
	<form id='actionForm' action="/tag" method='get'> </form>

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var actionForm = $("#actionForm");
						$("#move a").on("click",function(e) {
							e.preventDefault();
							actionForm.empty();
							actionForm.append("<input type='hidden' name='tag_id' value='"+ $(this).attr("href")+ "'>");
							actionForm.append("<input type='hidden' name='tag_content' value='"+ $(this).attr("title")+ "'>");
							actionForm.attr("action","/tag");
							actionForm.attr("method","post");
							actionForm.submit();
							});
						
						$("#scrap a").on("click",function(e) {
							e.preventDefault();
							actionForm.append("<input type='hidden' name='news_id' value='"+ $(this).attr("href")+ "'>");
							actionForm.attr("action","/scrap");
							actionForm.attr("method","post");
							actionForm.submit();
							});
						
						
					});
</script>

</html>
