package com.iot.shop.mem.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iot.shop.index.web.IndexController;
import com.iot.shop.mem.domain.MemberVO;
import com.iot.shop.mem.web.service.MemberService;
import com.iot.shop.order.domain.OrderVO;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("register")
	private String register(HttpServletRequest request, HttpServletResponse response, Model model,MemberVO vo) {
		
		return "Register";
	}
	
	@RequestMapping("idCheck")
	@ResponseBody
	private int idCheck(HttpServletRequest request, HttpServletResponse response, Model model,MemberVO vo) {
		int cnt = memberService.idCheck(vo);
		
		return cnt;
	}
	
	@RequestMapping("registerProc")
	private String registerProc(HttpServletRequest request, HttpServletResponse response, Model model,MemberVO vo) {
		vo.setM_role("custom");
		int r =memberService.registerProc(vo);
		String msg,url;
		if(r>0) {
			msg="성공";
			url="/";
		}else {
			msg="실패";
			url="register";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "MsgPage";
	}
	
	@RequestMapping("login")
	private String login(HttpServletRequest request, HttpServletResponse response, Model model,MemberVO vo) {
		
		return "Login";
	}
	
	@RequestMapping("loginProc")
	private String loginProc(HttpServletRequest request, HttpServletResponse response, Model model,MemberVO vo) {
		
		//세션으로 권한별 사용
		HttpSession session = request.getSession();
		String url="/";
		MemberVO svo = memberService.loginProc(vo);
		String msg = null;
		if(svo != null) {
			if(svo.getM_role().equals("custom")) {
				session.setAttribute("custom", svo);
				
			}else if(svo.getM_role().equals("admin")) {
				session.setAttribute("admin", svo);
				url="/admin";	
			}
		}else {
			msg = "id나 pw가 틀림";
		}
		
		session.setAttribute("msg", msg);
		return "redirect:"+url;
	}
	
	@RequestMapping("logout")
	private String logout(HttpServletRequest request, HttpServletResponse response, Model model,MemberVO vo) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("custom")!=null) {
			session.removeAttribute("custom");
		}else if(session.getAttribute("admin")!=null) {
			session.removeAttribute("admin");
		}
		session.removeAttribute("msg");
		session.invalidate();
		return "redirect:/";
	}
	
	
	@RequestMapping("/pwCheck")
		private String pwCheck(HttpServletRequest request,Model model) {
			/*
			 * HttpSession session = request.getSession(); MemberVO vo = null; if((MemberVO)
			 * session.getAttribute("admin")!=null) { vo = (MemberVO)
			 * session.getAttribute("admin"); }else if((MemberVO)
			 * session.getAttribute("custom")!=null){ vo = (MemberVO)
			 * session.getAttribute("custom"); } model.addAttribute("mvo",vo);
			 */
		return "pwCheck";
	}
	
	@RequestMapping("/memberUpdate")
	private String memberUpdate(HttpServletRequest request, HttpServletResponse response, Model model) {

	HttpSession session = request.getSession();
	MemberVO vo = null;
	if((MemberVO) session.getAttribute("admin")!=null) {
		vo = (MemberVO) session.getAttribute("admin");
		session.setAttribute("admin", vo);
	}else if((MemberVO) session.getAttribute("custom")!=null){
		vo = (MemberVO) session.getAttribute("custom");
		session.setAttribute("custom", vo);
	}
	
		return "updateForm";
	}
	
	@RequestMapping("/updateProc")
	private String updateProc(HttpServletRequest request, HttpServletResponse response, Model model,MemberVO vo) {
		
		HttpSession session = request.getSession();
		
		String msg = null;
		
		int r = memberService.updateProc(vo);
		if(r>0) {
			msg="정보수정완료 다시 로그인 하시오.";
		}else {
			msg="정보수정실패";
		}
		String url="/";
		
		session.setAttribute("msg",msg);
		session.setAttribute("url",url);
		//model.addAttribute("msg",msg);
		//model.addAttribute("url",url);
		return "MsgPage";
	}
	
	//관리자 권한
	
	@RequestMapping("memberMgr")
	private String memberMgr(HttpServletRequest request, HttpServletResponse response, Model model,MemberVO vo) {
		
		HttpSession session = request.getSession();
		MemberVO admin = (MemberVO) session.getAttribute("admin");
		
		List<MemberVO> mList = memberService.memberList(vo);
		model.addAttribute("mList",mList);
		session.setAttribute("admin", admin);
		return "admin/memberMgr";
	}
	
	@RequestMapping("memberDetail")
	private String memberDetail(HttpServletRequest request, HttpServletResponse response, Model model,MemberVO vo) {
		
		HttpSession session = request.getSession();
		MemberVO admin = (MemberVO) session.getAttribute("admin");
		
		List<MemberVO> mList = memberService.memberList(vo);
		model.addAttribute("mvo",mList.get(0));
		session.setAttribute("admin", admin);
		
		return "admin/memberDetail";
	}
}
