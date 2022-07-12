package com.example.jusanwallet.Controllers;

import com.example.jusanwallet.Entities.CompanyType;
import com.example.jusanwallet.Services.ClientService;
import com.example.jusanwallet.Services.CompanyService;
import com.example.jusanwallet.Services.CompanyTypeService;
import com.example.jusanwallet.Services.TransactionService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/home")
@AllArgsConstructor
public class HomeController {
    private ClientService clientService;
    private CompanyService companyService;
    private CompanyTypeService companyTypeService;
    private TransactionService transactionService;
    @GetMapping("/{clientID}")
    public List<Response> getAllGroupByType(@PathVariable int clientID){
        List<Response> result = new ArrayList<>();
        List<CompanyType> companyTypes = companyTypeService.findAll();
        for(CompanyType companyType : companyTypes) {
            ResponseMoney responseMoney = transactionService.sumByCompanyType(clientID, companyType.getId());
            Response response = new Response(companyType, responseMoney.getSum(), responseMoney.getBonuses());
            result.add(response);
        }
        return result;
    }
    @PostMapping({"/{clientID}"})
    public List<Response> getAllByTimeGroupByType(@PathVariable int clientID, @RequestBody RequestPeriod request){
        List<Response> result = new ArrayList<>();
        List<CompanyType> companyTypes = companyTypeService.findAll();
        for(CompanyType companyType : companyTypes) {
            ResponseMoney responseMoney = transactionService.sumByCompanyTypeByPeriod(clientID, companyType.getId(), request.getFrom(), request.getTo());
            Response response = new Response(companyType, responseMoney.getSum(), responseMoney.getBonuses());
            result.add(response);
        }
        return result;
    }
}
