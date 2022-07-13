package com.example.jusanwallet.Controllers;

import com.example.jusanwallet.Controllers.Requests.RequestPeriod;
import com.example.jusanwallet.Controllers.Responses.ResponseCategory;
import com.example.jusanwallet.Controllers.Responses.ResponseMoney;
import com.example.jusanwallet.Entities.Category;
import com.example.jusanwallet.Entities.Transaction;
import com.example.jusanwallet.Services.*;
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
    private CategoryService categoryService;
    @GetMapping("/{clientID}")
    public List<ResponseCategory> getAllGroupByCategory(@PathVariable int clientID){
        List<ResponseCategory> result = new ArrayList<>();
        List<Category> categories = categoryService.findAll();
        for(Category category : categories) {
            ResponseMoney responseMoney = transactionService.sumByCategory(clientID, category.getId());
            ResponseCategory responseCategory = new ResponseCategory(category.getName(), responseMoney.getSum(), responseMoney.getBonuses());
            result.add(responseCategory);
        }
        return result;
    }
    @PostMapping({"/{clientID}"})
    public List<ResponseCategory> getAllByTimeGroupByCategory(@PathVariable int clientID, @RequestBody RequestPeriod request){
        List<ResponseCategory> result = new ArrayList<>();
        List<Category> categories = categoryService.findAll();
        for(Category category : categories) {
            ResponseMoney responseMoney = transactionService.sumByCategoryByPeriod(clientID, category.getId(), request.getFrom(), request.getTo());
            ResponseCategory responseCategory = new ResponseCategory(category.getName(), responseMoney.getSum(), responseMoney.getBonuses());
            result.add(responseCategory);
        }
        return result;
    }
    @GetMapping("/{clientID}/allspend")
    public ResponseMoney getAllSpend(@PathVariable int clientID){
        List<Transaction> transactions = transactionService.findAll();
        double sum = 0;
        double bonuses = 0;
        for(Transaction transaction: transactions) {
            sum += transaction.getMonetary();
            bonuses += transaction.getBonus();
        }
        return new ResponseMoney(sum, bonuses);
    }
}
