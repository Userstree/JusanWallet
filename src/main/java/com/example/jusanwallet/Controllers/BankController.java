package com.example.jusanwallet.Controllers;

import com.example.jusanwallet.Controllers.Requests.RequestCategory;
import com.example.jusanwallet.Controllers.Requests.RequestCompany;
import com.example.jusanwallet.Controllers.Requests.RequestCompanyType;
import com.example.jusanwallet.Controllers.Requests.RequestTransaction;
import com.example.jusanwallet.Entities.*;
import com.example.jusanwallet.Services.*;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/bank")
@AllArgsConstructor
public class BankController {
    private ClientService clientService;
    private CompanyService companyService;
    private CompanyTypeService companyTypeService;
    private TransactionService transactionService;
    private PlannedCompanyTypeService plannedCompanyTypeService;
    private CategoryService categoryService;
    @PostMapping("/create/category")
    public void createCategory(@RequestBody RequestCategory requestCategory){
        Category category = new Category();
        category.setName(requestCategory.getName());
        categoryService.save(category);
    }
    @PostMapping("/create/companytype")
    public void createCompanyType(@RequestBody RequestCompanyType requestCompanyType){
        CompanyType companyType = new CompanyType();
        companyType.setName(requestCompanyType.getName());
        companyType.setPercent(requestCompanyType.getPercent());
        companyTypeService.save(companyType);
    }
    @PostMapping("/create/transaction")
    public void createTransaction(@RequestBody RequestTransaction requestTransaction){
        Transaction transaction = new Transaction();
        transaction.setBonus(requestTransaction.getBonus());
        transaction.setMonetary(requestTransaction.getMonetary());
        transaction.setDate(requestTransaction.getDate());
        Client client = clientService.findById(requestTransaction.getClientID());
        transaction.setClient(client);
        Company company = companyService.findById(requestTransaction.getCompanyID());
        transaction.setCompany(company);
        Category category = categoryService.findById(requestTransaction.getCategoryID());
        transaction.setCategory(category);
        transactionService.save(transaction);
    }
    @PostMapping("/create/company")
    public void createCompany(@RequestBody RequestCompany requestCompany){
        Company company = new Company();
        CompanyType companyType = companyTypeService.findById(requestCompany.getCompanyTypeID());
        company.setCompanyType(companyType);
        company.setName(requestCompany.getName());
        companyService.save(company);
    }
}
