package com.example.jusanwallet.Controllers;

import com.example.jusanwallet.Entities.Category;
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
    public List<Response> getAllGroupByCategory(@PathVariable int clientID){
        List<Response> result = new ArrayList<>();
        List<Category> categories = categoryService.findAll();
        for(Category category : categories) {
            ResponseMoney responseMoney = transactionService.sumByCategory(clientID, category.getId());
            Response response = new Response(category.getName(), responseMoney.getSum(), responseMoney.getBonuses());
            result.add(response);
        }
        return result;
    }
    @PostMapping({"/{clientID}"})
    public List<Response> getAllByTimeGroupByCategory(@PathVariable int clientID, @RequestBody RequestPeriod request){
        List<Response> result = new ArrayList<>();
        List<Category> categories = categoryService.findAll();
        for(Category category : categories) {
            ResponseMoney responseMoney = transactionService.sumByCategoryByPeriod(clientID, category.getId(), request.getFrom(), request.getTo());
            Response response = new Response(category.getName(), responseMoney.getSum(), responseMoney.getBonuses());
            result.add(response);
        }
        return result;
    }
}
