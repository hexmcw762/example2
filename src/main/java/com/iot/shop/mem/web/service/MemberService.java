package com.iot.shop.mem.web.service;

import java.util.List;

import com.iot.shop.mem.domain.MemberVO;

public interface MemberService {

	public int idCheck(MemberVO vo);

	public int registerProc(MemberVO vo);

	public MemberVO loginProc(MemberVO vo);

	public List<MemberVO> memberList(MemberVO vo);

	public int updateProc(MemberVO vo);
}
