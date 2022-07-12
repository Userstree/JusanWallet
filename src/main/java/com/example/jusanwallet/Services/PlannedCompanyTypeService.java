package com.example.jusanwallet.Services;

import com.example.jusanwallet.Entities.PlannedCompanyType;
import com.example.jusanwallet.Repositories.PlannedCompanyTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PlannedCompanyTypeService {
    private int last = 1;
    @Autowired
    private PlannedCompanyTypeRepository plannedCompanyTypeRepository;
    @Transactional
    public void save(PlannedCompanyType plannedCompanyType) {
        PlannedCompanyType plannedCompanyType1 = plannedCompanyTypeRepository.findByClient_IdAndCompanyType_Id(plannedCompanyType.getClient().getId(), plannedCompanyType.getCompanyType().getId());
        if(plannedCompanyType1 == null) {
            plannedCompanyType.setId(last);
            last++;
        } else {
            plannedCompanyType.setId(plannedCompanyType1.getId());
        }
        plannedCompanyTypeRepository.save(plannedCompanyType);
    }
    @Transactional
    public List<PlannedCompanyType> findByClientId(int clientID) {
        return plannedCompanyTypeRepository.findByClient_Id(clientID);
    }
}
