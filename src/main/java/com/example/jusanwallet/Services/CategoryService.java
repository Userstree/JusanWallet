package com.example.jusanwallet.Services;

import com.example.jusanwallet.Entities.Category;
import com.example.jusanwallet.Repositories.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;
    private int last = 2;
    @Transactional
    public List<Category> findAll() {
        return (List<Category>) categoryRepository.findAll();
    }
    @Transactional
    public void save(Category category) {
        Category category1 = categoryRepository.findByName(category.getName());
        if(category1 == null) {
            category.setId(last);
            last++;
        } else {
            return;
        }
        categoryRepository.save(category);
    }
    @Transactional
    public Category findById(int categoryID) {
        return categoryRepository.findById(categoryID).orElse(null);
    }
}
