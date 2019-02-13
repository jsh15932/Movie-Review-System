<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>영화 리뷰 웹 사이트</title>
	<!-- 부트스트랩 css 추가 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- 커스텀 css 추가 -->
	<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">영화 리뷰 웹 사이트</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
				<span class="navbar-toggler-icon"></span>
			</button>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="index.jsp">메인</a>
				</li>
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">회원 메뉴</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item" href="userJoin.jsp">회원가입</a>
						<a class="dropdown-item" href="uesrLogin.jsp">로그인</a>
						<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
						<a class="dropdown-item" href="#">회원탈퇴</a>
					</div>	
				</ul>
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요." aria-label="search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
				</form>
		</div>
	</nav>
	<section class="container">
		<form method="get" action="./index.jsp" class="form-inine mt-3">
			<select name="CountryDivide" calss="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="국내영화">국내영화</option>
				<option value="외국영화">외국영화</option>
			</select>
			<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요.">
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">글쓰기</a>
			<a class="btn btn-danger mx-1 mt-2" data-toggle="modal" href="#deleteModal">삭제</a>
		</form>		
	<div class="card bg-light mt-3">
		<div class="card-header bg-light">
			<div class="row">
				<div class="col-8 text-Left">극한직업&nbsp;<small>국내영화</small></div>
				<div class="col-4 text-right">
					<label>별점</label>
						<p class="star_rating">
					    <a href="#" class="on">★</a>
				        <a href="#" class="on">★</a>
			            <a href="#" class="on">★</a>
		                <a href="#" class="on">★</a>
	                   	<a href="#">★</a>
	                   </p>
	             </div>
             </div>
         </div>
         <div class="card-body">
         	<h5 class="card-title">
         		가족들끼리 보시는 것을 추천합니다. 
         	</h5>
         	<p class="card-text">이번 설에 차례를 지내고 온 가족이 함께 보았습니다. 배우들이 연기도 너무 잘하고 스토리도 신선해서 재밌게 봤어요!</p>
         	<div class="row">
         		<div class="col-9 text-left">
         			조회수<span style="color:red;">234</span>
         			댓글<span style="color:red;">15</span>
         			<span style="color:green">(추천:37)</span>
         		</div>
         		<div class="col-3 text-right">
         			<a oneclick="return conrfirm('추천하시겠습니까?')" href="./likeAction.jsp?movieID=">추천</a>
         			<a oneclick="return conrfirm('삭제하시겠습니까?')" href="./deleteAction.jsp?movieID=">삭제</a>
         		</div>
         	</div>
         </div>
    </div>
    <div class="card bg-light mt-3">
		<div class="card-header bg-light">
			<div class="row">
				<div class="col-8 text-Left">그린 북&nbsp;<small>외국영화</small></div>
				<div class="col-4 text-right">
					<label>별점</label>
						<p class="star_rating">
					    <a href="#" class="on">★</a>
				        <a href="#" class="on">★</a>
			            <a href="#" class="on">★</a>
		                <a href="#">★</a>
	                   	<a href="#">★</a>
	                   </p>
	             </div>
             </div>
         </div>
         <div class="card-body">
         	<h5 class="card-title">
         		감동적인 영화입니다. 
         	</h5>
         	<p class="card-text">오랜만에 감동적인 명작이 개봉했네요. 보고나서 여운이 많이 남는 영화입니다. 추천합니다.</p>
         	<div class="row">
         		<div class="col-9 text-left">
         			조회수<span style="color:red;">521</span>
         			댓글<span style="color:red;">30</span>
         			<span style="color:green">(추천:50)</span>
         		</div>
         		<div class="col-3 text-right">
         			<a oneclick="return conrfirm('추천하시겠습니까?')" href="./likeAction.jsp?movieID=">추천</a>
         			<a oneclick="return conrfirm('삭제하시겠습니까?')" href="./deleteAction.jsp?movieID=">삭제</a>
         		</div>
         	</div>
         </div>
    </div>
    </section>
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">리뷰 등록</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./reviewRegisterAction.jsp" method="post">
						<div class="form-row">
							<div class="form group col-sm-6">
								<label>영화 제목</label>
								<input type="text" name="moiveTitle" class="form-control" maxlength="60">
							</div>
							<div class="form-group col-sm-4">
								<label>분류</label>
								<select name="moiveCountry" class="form-control">
									<option value="국내영화" selected>국내영화</option>
									<option value="외국영화">외국영화</option>
								</select>
							</div>
						</div>
						<div class="form-row">
							<div class="form group col-sm-6">
								<label>리뷰 제목</label>
								<input type="text" name="reviewTitle" class="form-control" maxlength="60">
							</div>
							<div class="form group col-sm-6">
								<label>별점</label>
								<p class="star_rating">
							    <a href="#" class="on">★</a>
						        <a href="#" class="on">★</a>
					            <a href="#" class="on">★</a>
				                <a href="#">★</a>
			                    <a href="#">★</a>
			                    </p>
							</div>
						</div>
						<div class="form-row">
							<label>내용</label>
							<textarea name="reviewContent" class="form-control" maxlength="2048" style="height:180px;"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">등록하기</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">나가기</button>				
				</div>
			</div>
		</div>
	</div>	
	<footer class="bg-dark mt-4 p-5 text-center" style="color:#FFFFFF;">
	Copyright &copy; 2019 장승훈 ALL RIGHTS RESERVED.
	</footer>
	<!-- jquery 자바스크립트 추가 -->
	<script src="./js/jquery.min.js"></script>
	<!-- popper 자바스크립트 추가 -->
	<script src="./js/popper.min.js"></script>
	<!-- bootstrap 자바스크립트 추가 -->
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>