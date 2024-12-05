package com.devpro.shop16.repository;

import com.devpro.shop16.entities.Categories;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoriesProductRepository extends JpaRepository<Categories, Integer>{

}
