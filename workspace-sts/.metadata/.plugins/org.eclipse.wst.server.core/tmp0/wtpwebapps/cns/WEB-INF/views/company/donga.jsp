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
					<li class="nav-item"><a class="nav-link" href="../userTag.do">Home</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							카테고리 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="../category/politics.do">정치</a> <a
								class="dropdown-item" href="../category/economy.do">경제</a> <a
								class="dropdown-item" href="../category/society.do">사회</a> <a
								class="dropdown-item" href="../category/living.do">생활문화</a> <a
								class="dropdown-item" href="../category/itscience.do">IT과학</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="../tag.do">태그</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							신문사 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="chosun.do">조선일보</a> <a
								class="dropdown-item" href="joongang.do">중앙일보</a> <a
								class="dropdown-item" href="donga.do">동아일보</a> <a
								class="dropdown-item" href="hankyoreh.do">한겨례</a> <a
								class="dropdown-item" href="yonhap.do">연합뉴스</a>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			<b>동아일보</b>
			<!--small>Subheading</small-->
		</h1>

		<ol class="breadcrumb2">
			<!-- <li class="breadcrumb-item">타임라인</li> -->
			<a href="/company/donga" style="text-decoration: none" class="btn2 btn-success">전체</a>
			<a href="정치" style="text-decoration: none" class="btn2 btn-success">정치</a>
			<a href="경제" style="text-decoration: none" class="btn2 btn-success">경제</a>
			<a href="사회" style="text-decoration: none" class="btn2 btn-success">사회</a>
			<a href="생활문화" style="text-decoration: none" class="btn2 btn-success">생활문화</a>
			<a href="IT과학" style="text-decoration: none" class="btn2 btn-success">IT과학</a>
		</ol>

		<!-- Project One -->
		<c:forEach items="${newsList}" var="news">
		<div class="row">
			<div class="col-md-4">
				<a href="#"> <img class="img-fluid rounded mb-3 mb-md-0"
					src="${news.image}"
					alt="">
				</a>
			</div>
			<div class="col-md-7">
				<a class='move' href="<c:out value='${news.news_id}'/>"><h4>${news.news_title}</h4></a>
				<p>【요약뉴스】${news.summarize}</p>
				<!--a class="btn btn-primary" href="#">View Project
            <span class="glyphicon glyphicon-chevron-right"></span>
          </a-->
			</div>
		</div>
		<hr/>
		</c:forEach>
		<!-- /.row -->

		
		<!-- Pagination -->
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
	<form id='actionForm' action="/company/donga" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	</form>
	<!-- /.container -->

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
						
					 /* 	$(".breadcrumb2 a").on("click",function(e) {
					 		e.preventDefault();
					 		actionForm.empty();
							//actionForm.find("input[name='category']").val($(this).attr("href"));
							actionForm.append("<input type='hidden' name='category' value='"+ $(this).attr("href")+ "'>");
							//if( category.equals('정치'))
							//	actionForm.append("<input type='hidden' name='category' value='정치'>");	
							//else if category == "정치"
							//else if category == "정치"
							actionForm.attr("action","/company/chosun");
							actionForm.attr("method","get");
							//actionForm.append("<input type='hidden' name='press' value='"+ $(this).attr("href")+ "'>");
							actionForm.submit();
							});   */
			
					});
</script>
</html>
