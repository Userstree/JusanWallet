package com.example.jusanwallet.Controllers;

import com.example.jusanwallet.Controllers.Requests.RequestPeriod;
import com.example.jusanwallet.Controllers.Requests.RequestPlan;
import com.example.jusanwallet.Controllers.Responses.ResponseCompanyType;
import com.example.jusanwallet.Controllers.Responses.ResponseCompanyTypeMoney;
import com.example.jusanwallet.Controllers.Responses.ResponseMoney;
import com.example.jusanwallet.Controllers.Responses.ResponsePlan;
import com.example.jusanwallet.Entities.Client;
import com.example.jusanwallet.Entities.CompanyType;
import com.example.jusanwallet.Entities.PlannedCompanyType;
import com.example.jusanwallet.Services.*;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/expenses")
@AllArgsConstructor
public class ExpensesController {
    private ClientService clientService;
    private CompanyService companyService;
    private CompanyTypeService companyTypeService;
    private TransactionService transactionService;
    private PlannedCompanyTypeService plannedCompanyTypeService;
    private CategoryService categoryService;
    @GetMapping("/{clientID}")
    public List<ResponseCompanyTypeMoney> getAllGroupByCompanyType(@PathVariable int clientID){
        List<ResponseCompanyTypeMoney> result = new ArrayList<>();
        List<CompanyType> companyTypes = companyTypeService.findAll();
        for(CompanyType companyType : companyTypes) {
            ResponseMoney responseMoney = transactionService.sumByCompanyType(clientID, companyType.getId());
            ResponseCompanyTypeMoney responseCompanyTypeMoney = new ResponseCompanyTypeMoney(companyType, responseMoney.getSum(), responseMoney.getBonuses());
            result.add(responseCompanyTypeMoney);
        }
        return result;
    }
    @PostMapping({"/{clientID}"})
    public List<ResponseCompanyTypeMoney> getAllByTimeGroupByCompanyType(@PathVariable int clientID, @RequestBody RequestPeriod request){
        List<ResponseCompanyTypeMoney> result = new ArrayList<>();
        List<CompanyType> companyTypes = companyTypeService.findAll();
        for(CompanyType companyType : companyTypes) {
            ResponseMoney responseMoney = transactionService.sumByCompanyTypeByPeriod(clientID, companyType.getId(), request.getFrom(), request.getTo());
            ResponseCompanyTypeMoney responseCompanyTypeMoney = new ResponseCompanyTypeMoney(companyType, responseMoney.getSum(), responseMoney.getBonuses());
            result.add(responseCompanyTypeMoney);
        }
        return result;
    }
    @GetMapping("/CompanyTypes")
    public List<ResponseCompanyType> getAllCompanyTypes() {
        List<CompanyType> companyTypes = companyTypeService.findAll();
        List<ResponseCompanyType> result = new ArrayList<>();
        for(CompanyType companyType : companyTypes) {
            result.add(new ResponseCompanyType(companyType.getId(), companyType.getName()));
        }
        return result;
    }
    @PostMapping("/{clientID}/create")
    public void createNewPlan(@RequestBody RequestPlan requestPlan, @PathVariable int clientID){
        CompanyType companyType = companyTypeService.findById(requestPlan.getCompanyTypeID());
        Client client = clientService.findById(clientID);
        PlannedCompanyType plannedCompanyType = new PlannedCompanyType();
        plannedCompanyType.setPlan(requestPlan.getPlan());
        plannedCompanyType.setCompanyType(companyType);
        plannedCompanyType.setClient(client);
        plannedCompanyTypeService.save(plannedCompanyType);
    }
    @GetMapping("/{clientID}/plans")
    public List<ResponsePlan> getPlans(@PathVariable int clientID){
        Client client = clientService.findById(clientID);
        List<PlannedCompanyType> plannedCompanyTypes = plannedCompanyTypeService.findByClientId(clientID);
        List<ResponsePlan> responsePlans = new ArrayList<>();
        for(PlannedCompanyType plannedCompanyType: plannedCompanyTypes) {
            ResponsePlan responsePlan = new ResponsePlan();
            ResponseMoney responseMoney = transactionService.sumByCompanyType(clientID, plannedCompanyType.getCompanyType().getId());
            responsePlan.setPlan(plannedCompanyType.getPlan());
            responsePlan.setSpend(responseMoney.getSum());
            responsePlan.setCompanyType(plannedCompanyType.getCompanyType().getName());
            responsePlans.add(responsePlan);
        }
        return responsePlans;
    }
    @PostMapping("/{clientID}/plans")
    public List<ResponsePlan> getPlansByPeriod(@PathVariable int clientID, @RequestBody RequestPeriod request){
        Client client = clientService.findById(clientID);
        List<PlannedCompanyType> plannedCompanyTypes = plannedCompanyTypeService.findByClientId(clientID);
        List<ResponsePlan> responsePlans = new ArrayList<>();
        for(PlannedCompanyType plannedCompanyType: plannedCompanyTypes) {
            ResponsePlan responsePlan = new ResponsePlan();
            ResponseMoney responseMoney = transactionService.sumByCompanyTypeByPeriod(clientID, plannedCompanyType.getCompanyType().getId(), request.getFrom(), request.getTo());
            responsePlan.setPlan(plannedCompanyType.getPlan());
            responsePlan.setSpend(responseMoney.getSum());
            responsePlan.setCompanyType(plannedCompanyType.getCompanyType().getName());
            responsePlans.add(responsePlan);
        }
        return responsePlans;
    }
}
