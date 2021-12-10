package com.iot.shop.mem.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.iot.shop.mem.domain.MemberVO;

@Mapper
public interface MemberDAO {

	public int idCheck(MemberVO vo);

	public int registProc(MemberVO vo);

	public MemberVO loginProc(MemberVO vo);

	public List<MemberVO> memberList(MemberVO vo);

	public int updateProc(MemberVO vo);
}
