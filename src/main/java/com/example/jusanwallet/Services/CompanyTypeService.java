package com.example.jusanwallet.Services;

import com.example.jusanwallet.Entities.CompanyType;
import com.example.jusanwallet.Repositories.CompanyTypeRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CompanyTypeService {
    private final CompanyTypeRepository companyTypeRepository;

    public CompanyTypeService(CompanyTypeRepository companyTypeRepository) {
        this.companyTypeRepository = companyTypeRepository;
    }
    @Transactional
    public List<CompanyType> findAll() {
        return (List<CompanyType>) companyTypeRepository.findAll();
    }
}
