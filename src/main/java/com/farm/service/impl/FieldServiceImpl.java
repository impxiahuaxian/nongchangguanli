package com.farm.service.impl;

import com.farm.entity.Crops;
import com.farm.service.FieleService;
import com.farm.dao.FieldDao;
import com.farm.entity.Field;
import com.farm.entity.FieldExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Field的业务逻辑实现类
 *

 */
@Service
public class FieldServiceImpl implements FieleService {
    @Autowired
    FieldDao fieldDao;

    //查询所有菜地信息
    @Override
    public List<Field> getAll() {
        fieldDao.synchronize();
        return fieldDao.selectByExample(null);
    }

    //菜地保存
    @Override
    public void saveField(Field field) {
        fieldDao.insertSelective(field);
    }

    //菜地删除
    @Override
    public void deleteField(Integer id) {
        fieldDao.deleteByPrimaryKey(id);
    }

    @Override
    public void deleteBatch(List<Integer> ids) {
        FieldExample example = new FieldExample();
        FieldExample.Criteria criteria = example.createCriteria();
        //delete from xxx where id in(1,2,3)
        criteria.andIdIn(ids);
        fieldDao.deleteByExample(example);
    }

    //菜地更新
    @Override
    public void updateField(Field field) {
        fieldDao.updateByPrimaryKeySelective(field);
    }

    //根据ID查询菜地
    @Override
    public Field getField(Integer id) {
        Field field = fieldDao.selectByPrimaryKey(id);
        return field;
    }
}
