package com.test.dao;

import com.test.bean.Goods;

public class GoodsDao {

    public Goods setGoods(int gid) {
        Goods goods = new Goods();
        switch (gid) {
            case 1001:
                goods.setGid(1001);
                goods.setGname("小米10");
                goods.setGprice(3999.00);
                break;
            case 1002:
                goods.setGid(1002);
                goods.setGname("红米K30");
                goods.setGprice(1999.00);
                break;
            case 1003:
                goods.setGid(1003);
                goods.setGname("红米 Note8");
                goods.setGprice(999.00);
                break;
            case 1004:
                goods.setGid(1004);
                goods.setGname("华为 Mate30");
                goods.setGprice(3699.00);
                break;
            case 1005:
                goods.setGid(1005);
                goods.setGname("华为P40");
                goods.setGprice(4188.00);
                break;
            case 1006:
                goods.setGid(1006);
                goods.setGname("华为 Nova6");
                goods.setGprice(3499.00);
                break;
        }
        return goods;
    }
}
