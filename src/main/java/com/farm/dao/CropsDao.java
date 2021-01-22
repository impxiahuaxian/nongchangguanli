package com.farm.dao;

import java.util.List;

import com.farm.entity.Crops;
import com.farm.entity.CropsExample;
import org.apache.ibatis.annotations.Param;


/**
 * Crops的数据访问接口
 *

 */


public interface CropsDao {
    long countByExample(CropsExample example);

    int deleteByExample(CropsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Crops record);

    int insertSelective(Crops record);

    List<Crops> selectByExample(CropsExample example);

    Crops selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Crops record, @Param("example") CropsExample example);

    int updateByExample(@Param("record") Crops record, @Param("example") CropsExample example);

    int updateByPrimaryKeySelective(Crops record);

    int updateByPrimaryKey(Crops record);
}