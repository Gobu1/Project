package com.iu.home.member;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iu.home.reviews.ReviewsDTO;

@Repository("mydao")
public class MemberDAO
{
	@Autowired
	private SqlSession sqlSession;
	public final String NAMESPACE = "com.iu.home.member.MemberDAO.";

	public MemberDTO getLogin(MemberDTO memberDTO) throws Exception
	{
		return sqlSession.selectOne(NAMESPACE + "getLogin", memberDTO);
	}

	public int setJoin(MemberDTO memberDTO) throws Exception
	{
		return sqlSession.insert(NAMESPACE + "setJoin", memberDTO);
	}

	public MemberDTO getMyPage(MemberDTO memberDTO) throws Exception
	{
		return sqlSession.selectOne(NAMESPACE + "getMyPage", memberDTO);
	}

	public List<MemberDTO> adMyPage(MemberDTO memberDTO) throws Exception
	{
		return sqlSession.selectList(NAMESPACE + "adMyPage", memberDTO);
	}

	public int setUpdate(MemberDTO memberDTO) throws Exception
	{
		return sqlSession.update(NAMESPACE + "setUpdate", memberDTO);
	}

	public int setDelete(MemberDTO memberDTO) throws Exception
	{
		return sqlSession.delete(NAMESPACE + "setDelete", memberDTO);
	}

	public int getCheckId(String id) throws Exception
	{
		return sqlSession.selectOne(NAMESPACE + "getCheckId", id);
	}

	public List<ReviewsDTO> reviewsList(ReviewsDTO reviewsDTO) throws Exception
	{
		return sqlSession.selectList(NAMESPACE + "reviewsList", reviewsDTO);
	}

	public int checkName(String name) throws Exception
	{
		return sqlSession.selectOne(NAMESPACE + "checkName", name);
	}

	public int checkEmail(String email) throws Exception
	{
		return sqlSession.selectOne(NAMESPACE + "checkEmail", email);
	}

	public int checkPhone(String phone) throws Exception
	{
		return sqlSession.selectOne(NAMESPACE + "checkPhone", phone);
	}
}
