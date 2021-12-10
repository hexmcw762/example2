package com.iot.shop.product.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import com.iot.shop.order.domain.OrderVO;
import com.iot.shop.product.domain.ProductVO;

@Mapper
public interface ProductDAO {

	List<ProductVO> productList(ProductVO vo);

	int productInsert(ProductVO vo);

	int updateProduct(ProductVO vo);

	int productDelete(ProductVO vo);

	void updateStock(List<OrderVO> list);

}
