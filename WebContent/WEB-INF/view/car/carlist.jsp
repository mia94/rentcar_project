<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

</style>

<div id="list_wrap">
	<a href="index.jsp?section=/car/carlist.do">자동차 추가하기</a>
	
	<c:forEach var="item" items="">
		<article data-index='i'>
			<p>${item.name }</p>
			<p>${item.brand }</p>
			<p>${item.color }</p>
		</article>
	</c:forEach>
</div>