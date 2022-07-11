package com.example.jusanwallet.Repositories;

import com.example.jusanwallet.Entities.CompanyType;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CompanyTypeRepository extends CrudRepository<CompanyType, Integer> {
}
