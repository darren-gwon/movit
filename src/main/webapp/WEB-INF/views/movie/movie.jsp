<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/resources/css/movie.css" rel='stylesheet' />

<div class="content">
	<h3>전체영화</h3>
	<div class="list">
		<ul>
			<c:forEach items="${movieDto}" var="list" varStatus="status">
				<li class="movie_list"><img src="${list.poster_img}" class="poster_img">
					<div class="movie_title">
						<img src="/resources/img/movie_ages/txt-age-${list.age_group}.png">${list.title}</div>
					<button type="button" class="btn btn-outline-primary">예매하기</button>
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='/movie/detail?movieID=${list.movieID}'">상세보기</button>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
