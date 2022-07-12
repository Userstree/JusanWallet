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
    @Transactional
    public List<Category> findAll() {
        return (List<Category>) categoryRepository.findAll();
    }
}
