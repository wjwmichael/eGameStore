<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/template/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1>Cart</h1>

                    <p>All the fantastic products in your shopping cart</p>
                </div>
            </div>
        </section>
        <section class="container" ng-app="cartApp">
            <div ng-controller="cartCtrl" ng-init = "initCartId('${cartId}')">
                <div>
                    <a href="" class="btn btn-danger pull-left" ng-click="clearCart('${cartId}')"> <span class="glyphicon-remove-sign glyphicon">Clear Cart</span></a>
                </div>
                <table class="table table-hover">


                    <tr>
                        <th>Product Name</th>
                        <th>Unit Price</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>Remove Button</th>
                    </tr>
                    <tr ng-repeat="item in cart.map">
                        <td>{{item.product.productName}}</td>
                        <td>{{item.product.productPrice}}</td>
                        <td>{{item.quantity}}</td>
                        <td>{{item.totalPrice}}</td>
                        <td><a href="#" class="label label-danger" ng-click="removeFromCart(item.product.productId)"><span class="glyphicon-remove glyphicon">Remove</a></td>

                    </tr>
                    <tr>
                        <th></th>
                        <th></th>
                        <th>Grand Total</th>
                        <th>{{cart.grandTotal}}</th>
                        <th></th>
                    </tr>
                </table>
                <a href="<c:url value="/productList"/> " class="btn btn-default">Continue Shopping</a>
        </div>
        </section>
    </div>
</div>

<%@include file="/WEB-INF/views/template/footer.jsp" %>

<script src="<c:url value="/resources/js/controller.js"/>"></script>


