<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="beans.Cart" %>

<%
    Cart c = new Cart();
    if(session.getAttribute("cart") != null) c = (Cart)session.getAttribute("cart");
    String newProduct = request.getParameter("product");
    c.setProduct(newProduct);
    session.setAttribute("cart", c);
%>

<html>
    <head>
        <title>Cart</title>
        <link rel="stylesheet" type="text/css" href="css/styles.css">
    </head>
    <body>
        <header>
            <table width="100%">
                <tr>
                    <td width="75%">
                        <h1><a href="/ecom/HomePage">Best Deal</a></h1>
                    </td>
                    <td width="25%">
                        <a href="/ecom/CartPage"><img src="img/cart.jpg" alt="cart" width="80" height="80"/></a>
                    </td>
                </tr>
            </table>
        </header>
        <section>
            <table width="100%">
                <tr height="40px">
                    <td width="40%">
                        <ul>
                            <li><a href="#" class="stylish">Home</a></li>
                            <li><a href="#" class="stylish">Weekly Deals</a></li>
                            <li><a href="#" class="stylish">Contact</a></li>
                            <li><a href="#" class="stylish">About us</a></li>
                        </ul>
                    </td>
                    <td width="30%">
                        <input type="text" name="search">
                        <a href="#" class="stylish">Search it</a>
                    </td>
                    <td width="30%">
                        <a href="/ecom/SignInPage" class="normal">Sign In</a>
                        <span> or </span>
                        <a href="/ecom/SignInPage" class="normal">Create an Account</a>
                    </td>
                </tr>
            </table>
        </section>
        <nav>
            <ul>
                <form action="catalog.jsp">
                    <li><input type="submit" name="product" value="Phones"></li>
                    <li><input type="submit" name="product" value="Tablets"></li>
                    <li><input type="submit" name="product" value="Laptop"></li>
                    <li><input type="submit" name="product" value="TV"></li>
                </form>
            </ul>
        </nav>

        <aside>
            <h1 align="center">Cart</h1>
            <%
                for(String p : c.getProducts()){
            %>
            <p><%= p %></p>
            <%
                }
            %>
        </aside>
    </body>
<html>
