package com.example.jusanwallet.Repositories;

import com.example.jusanwallet.Entities.PlannedCompanyType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PlannedCompanyTypeRepository extends JpaRepository<PlannedCompanyType, Integer> {

    List<PlannedCompanyType> findByClient_Id(int clientID);

    PlannedCompanyType findByClient_IdAndCompanyType_Id(int id, int id1);
}
