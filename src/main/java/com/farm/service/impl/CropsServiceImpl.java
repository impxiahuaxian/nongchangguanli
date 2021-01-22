package com.farm.service.impl;

import com.farm.dao.CropsDao;
import com.farm.entity.Crops;
import com.farm.entity.CropsExample;
import com.farm.service.CropsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Crops的业务逻辑实现类
 *

 */
@Service
public class CropsServiceImpl implements CropsService {
    @Autowired
    CropsDao cropsDao;

    //查询所有农作物信息
    @Override
    public List<Crops> getAll() {
        return cropsDao.selectByExample(null);
    }

    @Override
    public List<Crops> findByCondition(CropsExample cropsExample) {
        return cropsDao.selectByExample(cropsExample);
    }

    //农作物保存
    @Override
    public void saveCrops(Crops crops) {
        cropsDao.insertSelective(crops);
    }

    //农作物删除
    @Override
    public void deleteCrops(Integer id) {
        cropsDao.deleteByPrimaryKey(id);
    }

    @Override
    public void deleteBatch(List<Integer> ids) {
        CropsExample example = new CropsExample();
        CropsExample.Criteria criteria = example.createCriteria();
        //delete from xxx where id in(1,2,3)
        criteria.andIdIn(ids);
        cropsDao.deleteByExample(example);
    }

    //农作物更新
    @Override
    public void updateCrops(Crops crops) {
        cropsDao.updateByPrimaryKeySelective(crops);
    }

    //根据ID查询农作物
    @Override
    public Crops getCrops(Integer id) {
        Crops crops = cropsDao.selectByPrimaryKey(id);
        return crops;
    }
}
