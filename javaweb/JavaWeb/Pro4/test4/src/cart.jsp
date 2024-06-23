<% @include file = "header.jsp" %>
<% @page import="com.test.bean.Goods, java.util.ArrayList" %>
<jsp:useBean id="cart" class="com.test.bean.Cart" scope="session"></jsp:useBean>
<% if (cart == null || cart.getGoodslist().size() == 0) {
    out.println("购物车空空如也⋯⋯");
} else {
    ArrayList<Goods> goodslist = cart.getGoodslist(); %>
    当前购物车共有<%= cart.getGcount() %>件物品<br>
    <table>
        <tr>
            <td>序号</td>
            <td>商品名称</td>
            <td>价格</td>
            <td>数量</td>
            <td>小计</td>
            <td>操作</td>
        </tr>
        <% for (int i = 0; i < goodslist.size(); i++) {
            Goods goods = goodslist.get(i); %>
            <tr>
                <td><%= i + 1 %></td>
                <td><%= goods.getGname() %></td>
                <td><%= String.format("%.2f", goods.getGprice()) %></td>
                <td><%= goods.getGcount() %></td>
                <td><%= String.format("%.2f", goods.getGprice() * goods.getGcount()) %></td>
                <td><a href="RemoveGoodsServlet?gid=<%= goods.getGid() %>">删除</a></td>
            </tr>
        <% } %>
        <tr>
            <td>总计:<%= String.format("%.2f", cart.getTotal()) %></td>
        </tr>
    </table>
<% } %>
