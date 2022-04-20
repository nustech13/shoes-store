<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container">
	<div class="row">
		<div class="col-12">
			<table class="table table-bordered">
				<thead class="text-center">
					<tr>
						<th scope="col">STT</th>
						<th scope="col" class="text-center">QUANTITY</th>
						<th scope="col" class="text-center">SIZE</th>
						<th scope="col" class="text-center">COLOR</th>
						<th scope="col" class="text-center">TOTAL PRICE</th>
						<th scope="col" class="text-center">NAME</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${list}"  varStatus="loop" >
							<tr>
								<th scope="row">${loop.index +1}</th>
								<td>${product.quantity}</td>
								<td>${product.size}</td>
								<td>${product.color}</td>
								<td><fmt:setLocale value="vn"/><fmt:formatNumber value="${product.totalPrice}"/> VNĐ</td>
								<td>${product.product.name}</td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
   