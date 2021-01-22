package com.farm.service;


import com.farm.entity.Items;

import java.util.List;

/**
 * Items的业务逻辑接口
 *

 */
public interface ItemsService {
    //查询所有商品信息
    public List<Items> getAll();

    //商品保存
    public void saveItems(Items items);

    //商品删除
    public void deleteItem(Integer id);

    public void deleteBatch(List<Integer> ids);

    //商品更新
    void updateItems(Items items);

    //根据ID查询商品
    Items getItems(Integer id);
}
