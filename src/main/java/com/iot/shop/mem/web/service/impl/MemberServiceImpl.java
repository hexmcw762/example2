package com.iot.shop.mem.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot.shop.mem.domain.MemberVO;
import com.iot.shop.mem.web.dao.MemberDAO;
import com.iot.shop.mem.web.service.MemberService;

@Service(value="memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public int idCheck(MemberVO vo) {
		int cnt =memberDAO.idCheck(vo);
		return cnt;
	}

	@Override
	public int registerProc(MemberVO vo) {
		
		return memberDAO.registProc(vo);
		
	}

	@Override
	public MemberVO loginProc(MemberVO vo) {
		
		return memberDAO.loginProc(vo);
	}

	@Override
	public List<MemberVO> memberList(MemberVO vo) {
		
		return memberDAO.memberList(vo);
	}

	@Override
	public int updateProc(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.updateProc(vo);
	}

}
