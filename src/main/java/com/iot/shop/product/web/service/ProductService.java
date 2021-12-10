package com.iot.shop.product.web.service;

import java.util.Hashtable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.iot.shop.order.domain.OrderVO;
import com.iot.shop.product.domain.ProductVO;

public interface ProductService {

	List<ProductVO> productList(ProductVO vo);

	int productInsert(ProductVO vo, MultipartFile file);

	int updateProduct(ProductVO vo, MultipartFile file);

	int productDelete(ProductVO vo);

	void updateStock(Hashtable<Integer, OrderVO> hCartList);

}
