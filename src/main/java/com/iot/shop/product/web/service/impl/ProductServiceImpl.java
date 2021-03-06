package com.iot.shop.product.web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iot.shop.order.domain.OrderVO;
import com.iot.shop.product.domain.ProductVO;
import com.iot.shop.product.web.dao.ProductDAO;
import com.iot.shop.product.web.service.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;

	@Override
	public List<ProductVO> productList(ProductVO vo) {
		
		return productDAO.productList(vo);
	}

	@Override
	public int productInsert(ProductVO vo, MultipartFile file) { 
		
		String sourceFileName = file.getOriginalFilename();
		File destinationFile;
		if(sourceFileName==null || sourceFileName.length()==0) {
			vo.setImage("ready.gif");
		}else {
			vo.setImage(sourceFileName);
			destinationFile = new File(vo.getPath()+sourceFileName);
			destinationFile.getParentFile().mkdirs();
			try {
				file.transferTo(destinationFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				
			}	
			
			}
	
	
		return productDAO.productInsert(vo); 
		
	}

	@Override
	public int updateProduct(ProductVO vo, MultipartFile file) {
		
		String sourceFileName = file.getOriginalFilename();
		File destinationFile;
		if(sourceFileName==null || sourceFileName.length()==0) {
			vo.setImage("ready.gif");
		}else {
			vo.setImage(sourceFileName);
			destinationFile = new File(vo.getPath()+sourceFileName);
			destinationFile.getParentFile().mkdirs();
			try {
				file.transferTo(destinationFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();			
			}	
			}
		
		return productDAO.updateProduct(vo);
	}

	@Override
	public int productDelete(ProductVO vo) {
		
		return productDAO.productDelete(vo);
	}

	@Override
	public void updateStock(Hashtable<Integer, OrderVO> hCartList) {
		
		//?????? ????????? ???????????? ??? ?????? ???????????? ????????? 
		//?????? ????????? ???????????? ????????? ????????????????????? ???????????? ??????  
		Set<Integer> keys = hCartList.keySet();
		List<OrderVO> list = new ArrayList<OrderVO>(keys.size());
		Iterator<Integer> iterKeys = keys.iterator();
		//??????????????? ?????? ?????? ????????? ????????? ???????????? ??????
		while(iterKeys.hasNext()) {
			list.add(hCartList.get(iterKeys.next()));
		}
		productDAO.updateStock(list);
	}
}
