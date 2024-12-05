package com.devpro.shop16.service;

import com.devpro.shop16.entities.ProductImage;
import org.springframework.stereotype.Service;

@Service
public class ProductImageService extends BaseService<ProductImage>{

	@Override
	protected Class<ProductImage> clazz() {
		// TODO Auto-generated method stub
		return ProductImage.class;
	}

}
