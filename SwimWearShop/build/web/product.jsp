<%-- 
    Document   : product
    Created on : Sep 29, 2016, 1:31:59 PM
    Author     : Cuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<jsp:useBean id="shop"
             scope="application"
             class="model.MyStaticVariable"/>

<html>
    <head>
    </head>
    <body>
        <div class="col-md-9 product-model-sec">
            <%
                String act = request.getParameter("act");
                if (act == null) {
                    shop.listProduct = shop.fullproducts;
                }
                try {
                    if (shop.listProduct == null) {
                        shop.listProduct = shop.fullproducts;
                    } else if (shop.numProduct == 0) {
                        out.println(shop.warning);
                        shop.warning = "";
                    } else {
                        out.println(shop.searchResult);
                        shop.searchResult = "";
                    }
                    for (int i = 0; i < shop.listProduct.size(); i++) {
            %>
            <a href="single.jsp?proID=<%=shop.listProduct.get(i).getProID()%>"><div class="product-grid">
                    <div class="more-product"><span> </span></div>						
                    <div class="product-img b-link-stripe b-animate-go  thickbox">
                        <img src="images/product/side 1/<%=shop.listProduct.get(i).getImage()%>" class="img-responsive" alt="" style="width: 250px ;height: 250px">
                        <div class="b-wrapper">
                            <h4 class="b-animate b-from-left  b-delay03">							
                                <button> + </button>
                            </h4>
                        </div>
                    </div>
            </a>					
            <div class="product-info simpleCart_shelfItem">
                <div class="product-info-cust prt_name">
                    <h4><%=shop.listProduct.get(i).getProName()%></h4>
                    <h6>Type: <%=shop.listProduct.get(i).getType()%></h6>
                    <h6>Brand: <%=shop.listProduct.get(i).getBrand()%></h6>
                    <span class="item_price">$<%=shop.listProduct.get(i).getFinalPrice()%>.00</span>
                    <div class="ofr">
                        <p class="pric1"><del>Rs $<%=shop.listProduct.get(i).getPrice()%>.00</del></p>
                        <p class="disc">[<%=shop.listProduct.get(i).getDiscount()%>% Off]</p>
                    </div>
                    <form action="${pageContext.request.contextPath}/AddToCart" method="get">
                        <input type="hidden" name="proID" value="<%=shop.listProduct.get(i).getProID()%>"/>
                        <%if (shop.customer != null) {%>
                        <!--<input type="text"  onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="item_quantity" value="1" name="quantity" />-->
                        <input min="1" type="number" class="item_quantity" value="1" name="quantity" onkeypress='return event.charCode >= 48 && event.charCode <= 57' />
                        <input type="submit" class="item_add items" value="+">
                        <%}%>
                    </form>
                    <div class="clearfix"> </div>
                </div>												
            </div>  
        </div>
        <%}
            } catch (Exception e) {
                return;
            }%>      
    </div> 
</body>
</html>
