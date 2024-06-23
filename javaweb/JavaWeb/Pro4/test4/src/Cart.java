package com.test.bean;

import java.util.ArrayList;

public class Cart implements java.io.Serializable {
    private static final long serialVersionUID = -442569050914898900L;
    private ArrayList<Goods> goodslist = new ArrayList<Goods>();

    public ArrayList<Goods> getGoodslist() {
        return goodslist;
    }

    public void setGoodslist(ArrayList<Goods> goodslist) {
        this.goodslist = goodslist;
    }

    public int getGcount() {
        int count = 0;
        for (Goods goods : goodslist) {
            count += goods.getGcount();
        }
        return count;
    }

    public double getTotal() {
        double sum = 0;
        for (Goods goods : goodslist) {
            sum += goods.getGprice() * goods.getGcount();
        }
        return sum;
    }

    public int check(int gid) {
        int index = -1;
        for (int i = 0; i < goodslist.size(); i++) {
            if (goodslist.get(i).getGid() == gid) {
                index = i;
                break;
            }
        }
        return index;
    }

    public void addGoods(Goods goods) {
        int gid = goods.getGid();
        int index = check(gid);
        if (index == -1) {
            goodslist.add(goods);
        } else {
            int num = goodslist.get(index).getGcount() + goods.getGcount();
            goodslist.get(index).setGcount(num);
        }
    }

    // 新增删除商品的方法
    public void removeGoods(int gid) {
        int index = check(gid);
        if (index != -1) {
            goodslist.remove(index);
        }
    }
}
