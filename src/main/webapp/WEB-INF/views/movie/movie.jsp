<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/resources/css/movie.css" rel='stylesheet' />



<div class="content">
	<div class="container">
		<div class="row">
			<div class="col">
				<ul class="nav nav-tabs">
					<li class="nav-item" style="width: 200px"><a
						class="nav-link active" href="#">전체 영화</a></li>
				</ul><br><br>
			</div>
		</div>
	</div>
	
	<div class="list">
		<ul>
			<c:forEach items="${movieDto}" var="list" varStatus="status">
				<li class="movie_list"><img src="${list.poster_img}" class="poster_img">
					
					<br><br>
					<div style="text-align: center;" class="movie_title">
						<img src="/resources/img/movie_ages/txt-age-${list.age_group}.png">${list.title}</div>
						
						
						<br>
					<button type="button" class="btn btn-outline-primary">예매하기</button>
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='/movie/detail?movieID=${list.movieID}'">상세보기</button>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
