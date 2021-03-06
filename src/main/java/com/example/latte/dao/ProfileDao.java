package com.example.latte.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.Profile;

@Mapper
@Transactional
public interface ProfileDao {

	void insertProfile(Profile profile);
	void modifyProfile(Profile profile);
	void deleteProfile(int no);
	Profile getProfileByMiniHomeNo(int miniHomeNo);
}
