var links= document. getElementsByClassName("link");
for(var i = 0;i <links. length;i++){ //绑定页面中所有超链接
var gid= links[i]. getAttribute("id"); //获得商品 id
//取消超链接默认行为,改为单击后执行 addtocart(gid)函数
links[i]. href= "javascript:void(0);onClick= addtocart("+ gid+")";}
function addtocart(gid){
//获取当前gid 商品填入的数量
var num = document. getElementsByName(gid)[0]. value;
//页面直接跳转到 AddCartServlet,并传递商品 gid 及数量
window. location. href = "AddCartServlet? gid=" + gid + "&gcount=" + num;
}