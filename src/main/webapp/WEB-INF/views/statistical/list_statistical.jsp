<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container">
	<h1 class="text-center"> STATISTICAL COST </h1>
  <div class="row">
    <div class="col-12">
      <table class="table table-bordered">
        <thead class="text-center">
          <tr>
            <th scope="col">STT</th>
            <th scope="col" class="text-center" >Date</th>
            <th scope="col" class="text-center" >Description</th>
            <th scope="col" class="text-center" >Price</th>
            <th scope="col" class="text-center" >Quantity</th>
          </tr>
        </thead>
        <tbody>
        	<c:forEach var="invoice" items="${list_invoice}" varStatus="loop">
        		<tr>
		            <th scope="row">${loop.index +1}</th>
		            <td>${invoice.date}</td>
		            <td>${invoice.description}</td>
		            <td><fmt:setLocale value="vn"/><fmt:formatNumber value="${invoice.price}"/> VNĐ</td>
		            <td>${invoice.quantity}</td>
          		</tr>
        	</c:forEach>
        	<tr>
		            <th scope="row"></th>
		            <td>SUM</td>
		            <td></td>
		            <td><fmt:setLocale value="vn"/><fmt:formatNumber value="${sum }"/> VNĐ</td>
		            
		            <td></td>
          		</tr>
        </tbody>
      </table>
    </div>
  </div>
</div>