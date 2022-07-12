package com.example.jusanwallet.Services;

import com.example.jusanwallet.Controllers.Responses.ResponseMoney;
import com.example.jusanwallet.Entities.Transaction;
import com.example.jusanwallet.Repositories.TransactionRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class TransactionService {
    private final TransactionRepository transactionRepository;

    public TransactionService(TransactionRepository transactionRepository) {
        this.transactionRepository = transactionRepository;
    }
    @Transactional
    public ResponseMoney sumByCompanyType(int clientID, int id) {
        return sum(transactionRepository.findAllByClient_IdAndCompany_CompanyType_Id(clientID, id));
    }

    private ResponseMoney sum(List<Transaction> allByCompany_companyType_idAndClient_id) {
        double sum = 0;
        double bonuses = 0;
        for(Transaction transaction : allByCompany_companyType_idAndClient_id) {
            sum += transaction.getMonetary();
            bonuses += transaction.getBonus();
        }
        return new ResponseMoney(sum,bonuses);
    }
    @Transactional
    public ResponseMoney sumByCompanyTypeByPeriod(int clientID, int id, Date from, Date to) {
        return sum(transactionRepository.findAllByClient_IdAndCompany_CompanyType_IdAndDateBetween(clientID, id, from, to));
    }
    @Transactional
    public ResponseMoney sumByCategory(int clientID, int id) {
        return sum(transactionRepository.findAllByClient_IdAndCategory_Id(clientID, id));
    }
    @Transactional
    public ResponseMoney sumByCategoryByPeriod(int clientID, int id, Date from, Date to) {
        return sum(transactionRepository.findAllByClient_IdAndCategory_IdAndDateBetween(clientID, id, from, to));
    }
}
