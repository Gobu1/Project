package com.iu.home.party;

public class PartyDTO {
	
	private Long partyNum;
	private String userName;
	private int partyAge;
	private int partyGender;
	private String partyComment;
	
	
	public Long getPartyNum() {
		return partyNum;
	}
	public void setPartyNum(Long partyNum) {
		this.partyNum = partyNum;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getPartyAge() {
		return partyAge;
	}
	public void setPartyAge(int partyAge) {
		this.partyAge = partyAge;
	}
	public int getPartyGender() {
		return partyGender;
	}
	public void setPartyGender(int partyGender) {
		this.partyGender = partyGender;
	}
	public String getPartyComment() {
		return partyComment;
	}
	public void setPartyComment(String partyComment) {
		this.partyComment = partyComment;
	}
	
	

}