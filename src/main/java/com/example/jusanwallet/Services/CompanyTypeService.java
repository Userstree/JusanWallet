package com.example.jusanwallet.Services;

import com.example.jusanwallet.Entities.CompanyType;
import com.example.jusanwallet.Repositories.CompanyTypeRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CompanyTypeService {
    private final CompanyTypeRepository companyTypeRepository;
    private int last = 2;

    public CompanyTypeService(CompanyTypeRepository companyTypeRepository) {
        this.companyTypeRepository = companyTypeRepository;
    }
    @Transactional
    public List<CompanyType> findAll() {
        return (List<CompanyType>) companyTypeRepository.findAll();
    }
    @Transactional
    public CompanyType findById(int companyTypeID) {
        return companyTypeRepository.findById(companyTypeID).orElse(null);
    }
    @Transactional
    public void save(CompanyType companyType) {
        CompanyType companyType1 = companyTypeRepository.findByName(companyType.getName());
        if(companyType1 == null){
            companyType.setId(last);
            last++;
        } else {
            companyType.setId(companyType1.getId());
        }
        companyTypeRepository.save(companyType);
    }
}
