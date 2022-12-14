package com.iu.home.party;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iu.home.util.Pager;

@Repository
public class PartyDAO {
	
	//PartyList DAO
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.iu.home.party.PartyDAO.";
	
	public int setPartyUpdate(PartyListDTO partyListDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setPartyUpdate", partyListDTO);
	}
	
	public int setPartyFileAdd(PartyFileDTO partyFileDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setPartyFileAdd", partyFileDTO);
	}
	
	public PartyListDTO getPartyDetail(PartyListDTO partyListDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getPartyDetail", partyListDTO);
	}
	
	public Long getPartyCount(Pager pager)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getPartyCount", pager);
	}
	
	public List<PartyListDTO> getPartyList(Pager pager)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getPartyList", pager);
	}
	
	public int setPartyAdd(PartyListDTO partyListDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setPartyAdd", partyListDTO);
	}
	
	public int setPartyDelete(PartyListDTO partyListDTO)throws Exception{

		return sqlSession.delete(NAMESPACE+"setPartyDelete", partyListDTO);
	}
	//====================================================================
	// Party DAO
	public int setPartyJoin(PartyDTO partyDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setPartyJoin", partyDTO);	
	}
	
	public int setPartyAccept(PartyDTO partyDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setPartyAccept", partyDTO);
	}
	
	
	public int setPartyCancel(PartyDTO partyDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setPartyCancel", partyDTO);
	}
	
	public List<PartyDTO> getPartyRequest(PartyDTO partyDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getPartyRequest", partyDTO);
	}
	
	
}
