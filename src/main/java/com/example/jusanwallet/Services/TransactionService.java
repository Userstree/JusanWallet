package com.example.jusanwallet.Services;

import com.example.jusanwallet.Entities.Transaction;
import com.example.jusanwallet.Repositories.TransactionRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TransactionService {
    private final TransactionRepository transactionRepository;

    public TransactionService(TransactionRepository transactionRepository) {
        this.transactionRepository = transactionRepository;
    }
    @Transactional
    public Double sumByCompanyType(int clientID, int id) {
        return sum(transactionRepository.findAllByCompany_CompanyType_IdAndClient_Id(clientID, id));
    }

    private Double sum(List<Transaction> allByCompany_companyType_idAndClient_id) {
        double result = 0;
        for(Transaction transaction : allByCompany_companyType_idAndClient_id) {
            result += transaction.getMonetary();
        }
        return result;
    }
}
