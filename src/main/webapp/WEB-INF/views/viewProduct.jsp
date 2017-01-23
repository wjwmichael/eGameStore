<%--
  Created by IntelliJ IDEA.
  User: wjw
  Date: 1/18/17
  Time: 4:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="template/header.jsp"%>

<div class="container-wrapper">
    <div class="container" ng-app="cartApp">
        <div class="page-header">
            <h1>Product Detail</h1>
            <p class="lead">Here comes the product detail</p>
        </div>
        <div class="row">
            <div class="col-md-5">
                <img src="<c:url value="/resources/images/${product.productId}.png"/> " alt="image" style="width: 100%;">
            </div>
            <div class="col-md-5">
                <h3>${product.productName}</h3>
                <p>${product.productDescription}</p>
                <p><strong>Category:</strong>${product.productCategory}</p>
                <p><strong>Condition:</strong>${product.productCondition}</p>
                <p>
                    <strong>Manufacturer:</strong>
                    ${product.productManufacturer}
                </p>
                <p>
                    <strong>Price:</strong>
                    ${product.productPrice}
                </p>
                <c:url var = "role" scope="page" value="${param.role}"/>
                <c:set var="url" scope="page" value="/productList"/>
                <c:if test="${role=='admin'}">
                    <c:set var="url" scope="page" value="/admin/productInventory"/>
                </c:if>

                <p   ng-controller="cartCtrl">
                    <a href="<c:url value="${url}"/>" class="btn btn-default">Back</a>
                    <a href="<spring:url value="/cart"/>" class="btn btn-warning btn-large" ng-click="addToCart(${product.productId})"><span class="glyphicon glyphicon-shopping-cart"></span>Order Now</a>
                    <a href="<spring:url value="/cart"/> " class="btn btn-default"><span class="glyphicon glyphicon-hand-right"></span>View Cart</a>
                </p>
            </div>
        </div>
<%@include file="template/footer.jsp"%>
        <script src="<c:url value="/resources/js/controller.js"/>"></script>