package com.iot.shop.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.iot.shop.mem.domain.MemberVO;
import com.iot.shop.product.domain.ProductVO;
import com.iot.shop.product.web.service.ProductService;

@Controller
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	@Value("${resources.location}")
	String resourcesLocation;
	
	@RequestMapping("productList")
	public String productList(HttpServletRequest request, HttpServletResponse response, Model model, ProductVO vo) {
	
		List<ProductVO> pList = productService.productList(vo);
		model.addAttribute("pList",pList);
		return "productList";
	}
	
	@RequestMapping("productMgr")
	public String productMgr(HttpServletRequest request, HttpServletResponse response, Model model, ProductVO vo) {
	
		List<ProductVO> pList = productService.productList(vo);
		model.addAttribute("pList",pList);
			
		return "admin/productMgr";
	}
	
	@RequestMapping("productInsert")
	public String productInsert(HttpServletRequest request, HttpServletResponse response, Model model, ProductVO vo) {
	
		return "admin/productInsert";
	}
	
	
	@RequestMapping("productMgrProc")
	public String productMgrProc(HttpServletRequest request, @RequestParam("image2") MultipartFile file, HttpServletResponse response, Model model, ProductVO vo) {
	
		HttpSession session = request.getSession();
		MemberVO admin = (MemberVO) session.getAttribute("admin");
		String url = "productMgr";
		String msg = null;
		int r;
		String flag = request.getParameter("flag");
		logger.info("->"+(admin!= null)+":::"+flag);
		
		if(flag.equals("insert")) {
			logger.info(vo.toString());
			vo.setPath(resourcesLocation);
			r = productService.productInsert(vo,file);
			
			if(r>0) {
				msg = "상품등록성공";
			}else {
				msg = "상품등록실패";
			}
		}else if(flag.equals("update")) {
			vo.setPath(resourcesLocation);
			r = productService.updateProduct(vo,file);
			if(r>0) {
				msg="업데이트 성공";
			}else {
				msg="업데이트 실패";
			}
		}
		session.setAttribute("admin", admin);
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "MsgPage";
	}
	
	@RequestMapping("productDetail")
	public String productDetail(HttpServletRequest request, HttpServletResponse response, Model model, ProductVO vo) {
		
		ProductVO svo = productService.productList(vo).get(0);
		
		HttpSession session = request.getSession();
		MemberVO mvo = null;
		if(session.getAttribute("admin")!=null) {
			mvo = (MemberVO)session.getAttribute("admin"); 
		}else if(session.getAttribute("custom")!=null) {
			mvo = (MemberVO)session.getAttribute("custom"); 
		}
		
		model.addAttribute("pvo",svo);
		if(mvo!=null && mvo.getM_role().equals("admin")) {
			return "admin/productDetail";
		}else {
			return "productDetail";
		}
	}
	
	@RequestMapping("productUpdate")
	public String productUpdate(HttpServletRequest request, HttpServletResponse response, Model model, ProductVO vo) {
		
		ProductVO svo = productService.productList(vo).get(0);
	
		model.addAttribute("pvo",svo);
		return "admin/productUpdate";
	}
	
	@RequestMapping("productDelete")
	public String productDelete(HttpServletRequest request, HttpServletResponse response, Model model, ProductVO vo) {
		
		String msg = null;
		String url ="productMgr";
		HttpSession session = request.getSession();
		MemberVO admin = (MemberVO) session.getAttribute("admin");
		
		int r =0;
		try {
			r = productService.productDelete(vo);
			if(r>0) {
				msg="삭제 성공";	
			}else {
				msg="삭제 실패";
			}
		}catch(Exception e) {
			r = 0;
			msg = "삭제 불가 주문 남아있음";
		}
		
		session.setAttribute("admin", admin);
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "MsgPage";
	}
}
