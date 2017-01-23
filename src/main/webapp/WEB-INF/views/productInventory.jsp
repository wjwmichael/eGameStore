<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="template/header.jsp"%>



<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Product Inventory</h1>
            <p class="lead">This is the product inventory page</p>
        </div>
        <table class="table table-stripped table-hover">
            <thead>
            <tr class="bg-success">
                <th>Photo Thumb</th>
                <th>Product Name</th>
                <th>Product Category</th>
                <th>Product Condition</th>
                <th>Price</th>
                <th>Product Manufacturer</th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <c:forEach items="${products}" var="product" >
                <tr>
                    <td><img src="<c:url value="/resources/images/${product.productId}.png"/> " alt="image" style="width: 100%;"></td>
                    <td>${product.productName}</td>
                    <td>${product.productCategory}</td>
                    <td>${product.productCondition}</td>
                    <td>${product.productPrice} USD</td>
                    <td>${product.productManufacturer}</td>
                    <td><a href="<spring:url value="/productList/viewProduct/${product.productId}"/>" >
                        <span class="glyphicon glyphicon-info-sign"></span></a></td>
                    <td><a href="<spring:url value="/admin/productInventory/deleteProduct/${product.productId}"/>" >
                        <span class="glyphicon glyphicon-remove"></span></a></td>
                    <td><a href="<spring:url value="/admin/productInventory/editProduct/${product.productId}"/>" >
                        <span class="glyphicon glyphicon-edit"></span></a></td>
                </tr>
            </c:forEach>
        </table>
        <%@include file="template/footer.jsp"%>
