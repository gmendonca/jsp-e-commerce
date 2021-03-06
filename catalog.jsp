<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="beans.User" %>

<%
    Map<String, String> catalogList = new HashMap<String, String>();
    catalogList.put("Droid MAXX", "Phones");
    catalogList.put("Moto X", "Phones");
    catalogList.put("iPhone 5S", "Phones");
    catalogList.put("iPhone 5C", "Phones");
    catalogList.put("Galaxy S3", "Phones");
    catalogList.put("Galaxy S4", "Phones");

    catalogList.put("Kindle", "Tablets");
    catalogList.put("Nexus", "Tablets");
    catalogList.put("Surface", "Tablets");
    catalogList.put("Galaxy", "Tablets");
    catalogList.put("iPad", "Tablets");

    catalogList.put("MacBook", "Laptop");
    catalogList.put("Asus", "Laptop");
    catalogList.put("Sony", "Laptop");
    catalogList.put("Lenovo", "Laptop");

    catalogList.put("Panasonic", "TV");
    catalogList.put("Samsung", "TV");
    catalogList.put("Sony", "TV");

    request.setAttribute("catalogList", catalogList);

    String title = request.getParameter("product");

%>

<jsp:useBean id="entry" class="beans.StringBean" />
<jsp:setProperty
    name="entry"
    property="product"
    value='<%= request.getParameter("product") %>'/>

<html>
    <head>
        <title><jsp:getProperty name="entry" property="product" /></title>
        <link rel="stylesheet" type="text/css" href="css/styles.css">
    </head>
    <body>
        <header>
            <table width="100%">
                <tr>
                    <td width="75%">
                        <h1><a href="index.jsp">Best Deal</a></h1>
                    </td>
                    <td width="25%">
                        <a href="cart.jsp"><img src="img/cart.jpg" alt="cart" width="80" height="80"/></a>
                    </td>
                </tr>
            </table>
        </header>
        <section>
            <table width="100%">
                <tr height="40px">
                    <td width="40%">
                        <ul>
                            <li><a href="index.jsp" class="stylish">Home</a></li>
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
                        <%
                        User u;
                        if(session.getAttribute("user") != null) {
                            u = (User)session.getAttribute("user");
                        %>
                        <a href="info.jsp" class="normal">Hi, <%= u.getUserID() %></a>
                        <%
                            }else {
                        %>

                        <a href="signin.jsp" class="normal">Sign In</a>
                        <span> or </span>
                        <a href="signin.jsp" class="normal">Create an Account</a>
                        <%
                            }
                        %>
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
            <h1 align="center">Deals</h1>
            <form action="cart.jsp">
            <%
                Set set = catalogList.entrySet();
                Iterator i = set.iterator();
                String prod;
                while(i.hasNext()) {
                   Map.Entry me = (Map.Entry)i.next();
                   String comp = (String)me.getValue();
                   if(title.compareTo(comp) == 0){
                       prod = (String)me.getKey();
            %>
                    <p>Buy: <input type="submit" name="product" value="<%= prod %>"></p>
            <%
                    }
                }
            %>
            </form>
        </aside>
    </body>
<html>
