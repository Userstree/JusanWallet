package com.example.jusanwallet.Controllers;

import com.example.jusanwallet.Entities.CompanyType;
import com.example.jusanwallet.Services.ClientService;
import com.example.jusanwallet.Services.CompanyService;
import com.example.jusanwallet.Services.CompanyTypeService;
import com.example.jusanwallet.Services.TransactionService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/home")
@AllArgsConstructor
public class HomeController {
    private ClientService clientService;
    private CompanyService companyService;
    private CompanyTypeService companyTypeService;
    private TransactionService transactionService;
    @GetMapping("/{clientID}")
    public Map<String, Double> getAllGroupByType(@PathVariable int clientID){
        Map<String, Double> result = new HashMap<>();
        List<CompanyType> companyTypes = companyTypeService.findAll();
        for(CompanyType companyType : companyTypes) {
            result.put(companyType.getName(), transactionService.sumByCompanyType(clientID, companyType.getId()));
        }
        return result;
    }
}
