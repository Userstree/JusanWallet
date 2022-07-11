package com.example.jusanwallet.Repositories;

import com.example.jusanwallet.Entities.Transaction;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, Integer> {
    @Query("SELECT * FROM TRANSACTION T JOIN COMPANY C on T.COMPANY_ID = C.ID WHERE COMPANY_TYPE_ID = ?2 and CLIENT_ID = ?1")
    List<Transaction> findAllByCompany_CompanyType_IdAndClient_Id(int clientID, int id);
}
