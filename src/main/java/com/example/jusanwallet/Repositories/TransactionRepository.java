package com.example.jusanwallet.Repositories;

import com.example.jusanwallet.Entities.Transaction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, Integer> {
    List<Transaction> findAllByClient_IdAndCompany_CompanyType_IdAndDateBetween(int clientID, int id, Date from, Date to);
    List<Transaction> findAllByClient_IdAndCompany_CompanyType_Id(int clientID, int id);
    List<Transaction> findAllByClient_IdAndCategory_IdAndDateBetween(int clientID, int id, Date from, Date to);
    List<Transaction> findAllByClient_IdAndCategory_Id(int clientID, int id);
}
