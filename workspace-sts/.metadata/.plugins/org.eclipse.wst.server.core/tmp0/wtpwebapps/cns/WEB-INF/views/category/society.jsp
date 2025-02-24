<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>QuadCore News</title>

<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/modern-business.css" rel="stylesheet">
<link href="/resources/css/ij-css.css" rel="stylesheet">
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
					<li class="nav-item"><a class="nav-link" href="../userTag.do">태그</a></li>
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
		<h1 class="mt-4 mb-3">
			<b>사회</b>
			<!--small>Subheading</small-->
		</h1>

		<!-- <ol class="breadcrumb">
			<li class="breadcrumb-item">타임라인</li>
			<a href="tag.html" class="btn btn-primary">취업</a>
			<a href="tag.html" class="btn btn-primary">북한</a>
			<a href="tag.html" class="btn btn-primary">트럼프</a>
		</ol> -->

		<div class="container" style="margin-top: 50px">
	

	<!-- Project One -->
			<c:forEach items="${newsList}" var="news">
		<div class="row">
			<div class="col-md-4">
				<a href="#"> <img class="img-fluid rounded mb-3 mb-md-0" src="${news.image}" alt=""></a>
			</div>
			<div class="col-md-7">
				<a class='move' href="<c:out value='${news.news_id}'/>", style="color: black"><h4>${news.news_title}</h4></a>
				<p>【요약뉴스】${news.summarize}</p>
			</div>
		</div>
		<hr/>
		</c:forEach>
		<!-- /.row -->

	<div class='pull-right'>
			<ul class="pagination justify-content-center">
						<c:if test="${pageMaker.prev}">
							<li class="page-item">
							<a class="page-link"  href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="page-item">
								<a class="page-link"  href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="page-item"><a class="page-link" 
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>
					</ul>
				</div>
				<!--  end Pagination -->
	</div>
	<form id='actionForm' action="/category/society" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	</form>
	<!-- /.container -->
	</div>
		<!-- Footer -->
		<footer class="py-5 bg-dark">
			<div class="container">
				<p class="m-0 text-center text-white">Copyright &copy; YourWebsite 2018</p>
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
						$(".page-item a").on("click",function(e) {
								e.preventDefault();
								console.log('click');
								actionForm.find("input[name='pageNum']").val($(this).attr("href"));
								//actionForm.find("input[name='offset']").val($(this).attr("href"));
								actionForm.submit();
								});

						$(".move").on("click",function(e) {
							e.preventDefault();
							actionForm.append("<input type='hidden' name='news_id' value='"+ $(this).attr("href")+ "'>");
							actionForm.attr("action","/news");
							actionForm.submit();
							});
					});
</script>
</html>
