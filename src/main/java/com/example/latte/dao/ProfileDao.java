package com.example.latte.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.Profile;

@Mapper
@Transactional
public interface ProfileDao {

	Profile getProfileByMiniHomeNo(int miniHomeNo);
}
