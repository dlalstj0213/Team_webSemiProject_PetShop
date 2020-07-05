package main.register.model;

import web.domain.Member;

public class RegisterService {


	private RegisterDAO dao;
	private static final RegisterService instance = new RegisterService();
	private RegisterService() {
		dao= new RegisterDAO();
	}
	
	public static RegisterService getInstance() {
		return instance;
	}
	public int checkMember(Member member) {
		return dao.getMember(member);
		
		/*if (m == null) {
			return MemberShipSet.overlap_EMAIL;
		}else if {
			return MemberShipSet.MemberShip_false;
		}else {
			return MemberShipSet.MemberShip_true;
		}*/
	}
		
}
