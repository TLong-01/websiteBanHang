package com.devpro.shop16.repository;

import com.devpro.shop16.dto.ProductSearchDataModel;
import com.devpro.shop16.entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>{

    @PersistenceContext
    EntityManager entityManager = null;

    @PersistenceContext
    default Class<ProductSearchDataModel> clazz() {
        // TODO Auto-generated method stub
        return ProductSearchDataModel.class;
    }

    @Query(value ="select sum(tp.quantity)  from tbl_products tp ",nativeQuery = true)
    Integer getSumQuantity();

}
