package com.example.latte.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.example.latte.vo.Relationship;

@Mapper
public interface RelationshipDao {

	void insertRelationship(Relationship re);
	void updateRelationship(Relationship re);
	Relationship getRelationshipByNums(Map<String, Integer> nums);
	List<Relationship> getMyFriendList(int userNo);
}
