package com.example.jusanwallet.Services;

import com.example.jusanwallet.Entities.Company;
import com.example.jusanwallet.Repositories.CompanyRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CompanyService {
    private final CompanyRepository companyRepository;
    private int last = 1;

    public CompanyService(CompanyRepository companyRepository) {
        this.companyRepository = companyRepository;
    }
    @Transactional
    public Company findById(int companyID) {
        return companyRepository.findById(companyID).orElse(null);
    }
    @Transactional
    public void save(Company company) {
        Company company1 = companyRepository.findByName(company.getName());
        if(company1 == null) {
            company.setId(last);
            last++;
        }
        companyRepository.save(company);
    }
}
