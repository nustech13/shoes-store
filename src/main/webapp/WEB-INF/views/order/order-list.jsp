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
						<th scope="col" class="text-center">NAME</th>
						<th scope="col" class="text-center">PHONE</th>
						<th scope="col" class="text-center">ADDRESS</th>
						<th scope="col" class="text-center">SUM PRICE</th>
						<th scope="col" class="text-center">STATUS</th>
						<th scope="col" class="text-center">VIEW</th>
						<th scope="col" class="text-center">DELETE</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${orders}"  varStatus="loop" >
							<tr data-id="${order.id}">
								<th scope="row">${loop.index +1}</th>
								<td>${order.user.name}</td>
								<td>${order.user.phone}</td>
								<td>${order.address}</td>
								<td><fmt:setLocale value="vn"/><fmt:formatNumber value="${order.sumPrice}"/> VNĐ</td>
								<c:choose>
         							<c:when test = "${order.status==0}">
         								<td id="td1" data-id="${order.id}"><button type="button" id="pendding"class="status-pendding btn btn-warning">Pendding</button> </td>
         							</c:when>
         							<c:when test = "${order.status==1}">
         								<td id="td2" data-id="${order.id}"><button type="button" class="status-success btn btn-success">Success</button></td>
         					    </c:when>
         						</c:choose>
         						<td>
         							<a href="<c:url value="/order/view/${order.id}" />" class="btn btn-primary" role="button"><i class="far fa-eye"></i></a>
         						</td>
         						<td class="text-center" data-id="${order.id}">
									<a href="<c:url value="/order/delete/${order.id}"/>" class="btn btn-danger delete" role="button"><i class="far fa-trash-alt"></i></a>
								</td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
<div class="row justify-content-center">
  	<nav aria-label="Page navigation example justify-content-center">
	  <ul class="pagination justify-content-center">
	  <c:choose>
		    <c:when test="${paging.indexPage >1}">
		        <li class="page-item ">
	      			<a class="page-link" href="<c:url value="/order/list/${paging.indexPage-1 }" />" tabindex="-1">Previous</a>
	    		</li> 
		    </c:when>    
		    <c:otherwise>
		        <li class="page-item disabled ">
	      			<a class="page-link" href="#" tabindex="-1">Previous</a>
	    		</li> 
		    </c:otherwise>
		</c:choose>
	  
	    <c:forEach var = "i" begin = "1" end ="${paging.getTotalPages() }">
         <c:choose>
		    <c:when test="${paging.indexPage== i}">
		        <li class="page-item active disabled"><a class="page-link active" href="<c:url value="/order/list/${i }" />">${i }</a></li>
		    </c:when>    
		    <c:otherwise>
		        <li class="page-item"><a class="page-link" href="<c:url value="/order/list/${i }" />">${i }</a></li>
		    </c:otherwise>
		</c:choose>
         
      </c:forEach>
      <c:choose>
		    <c:when test="${paging.indexPage <paging.getTotalPages()}">
		        <li class="page-item ">
	      			<a class="page-link" href="<c:url value="/order/list/${paging.indexPage +1}" />">Next</a>
	    		</li> 
		    </c:when>    
		    <c:otherwise>
		        <li class="page-item disabled ">
	      			<a class="page-link" href="#">Next</a>
	    		</li> 
		    </c:otherwise>
		</c:choose>
	  </ul>
	</nav>
  </div>
		</div>
	</div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
 <script src="<c:url value="resources/assets/js/slick.min.js" />" ></script>
 <script type="text/javascript">
$(document).ready(function(){
	 $(".status-pendding").click(function(){
		 var id = $(this).closest("td").attr("data-id"); 
		 var url = "/shoes_store/order/status/"+id;
		 $.ajax({
				url:url,
				type: "GET",
				success: function( response ){
					
				}
		});
		 $(this).closest("button").remove();
		 var btn = '<button type="button" class="status-success btn btn-success">Success</button>';
		 $('#td1').append(btn);
	});
	 
	 $(".delete").click(function(){
		 var id = $(this).closest("td").attr("data-id"); 
		 var url = "/shoes_store/order/delete/"+id;
		 $.ajax({
				url:url,
				type: "GET",
				success: function( response ){
					window.location.href="/shoes_store/order/list";
				}
		});
		 $(this).closest("tr").remove();
	 });	 
});
</script>
   