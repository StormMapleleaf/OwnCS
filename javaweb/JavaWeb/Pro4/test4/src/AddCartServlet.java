response.setCharacterEncoding("UTF-8");
response.setHeader("Content-type", "text/html;charset=UTF-8");

String gid = request.getParameter("gid");
String gcount = request.getParameter("gcount");

if (gid != null && gcount != null) {
    Goods goods = new Goods();
    GoodsDao goodsdao = new GoodsDao();
    // 通过GoodsDao获取商品信息，并封装成一个商品对象
    goods = goodsdao.setGoods(Integer.parseInt(gid));
    goods.setGcount(Integer.parseInt(gcount));

    HttpSession session = request.getSession();
    Cart cart = (Cart) session.getAttribute("cart"); // 读取 HttpSession 中 cart 属性值

    if (cart != null) { // 如果 cart 属性值不为空，则不是第一次添加，直接调用 cart 对象的 addGoods() 方法
        cart.addGoods(goods);
    } else {
        // 如果为空，表示当前是第一次添加商品，应先新建一个购物车对象再添加商品
        cart = new Cart();
        cart.addGoods(goods);
    }

    session.setAttribute("cart", cart);
    response.getWriter().println("添加成功");
    response.getWriter().println("<a href='cart.jsp'>查看购物车</a>");
    response.getWriter().println("<a href='javascript:history.back(-1)'>返回上一页</a>");
} else {
    response.getWriter().println("参数不正确");
    response.getWriter().println("<a href='javascript:history.back(-1)'>返回上一页</a>");
}
