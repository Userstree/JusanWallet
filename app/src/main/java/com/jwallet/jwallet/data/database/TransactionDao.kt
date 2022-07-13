package com.jwallet.jwallet.data.database

import androidx.lifecycle.LiveData
import androidx.room.*
import androidx.room.OnConflictStrategy.REPLACE

@Dao
interface TransactionDao {

    @Insert(onConflict = REPLACE)
    suspend fun add(transaction: Transaction)

    @Insert(onConflict = REPLACE)
    suspend fun addAll(transaction: Transaction)

    @Update
    suspend fun update(transaction: Transaction)

    @Delete
    suspend fun delete(transaction: Transaction)

    @Query("SELECT * FROM transaction_table WHERE id = :transactionId")
    fun get(transactionId: Int): LiveData<Transaction>

    @Query("SELECT * FROM TRANSACTION_TABLE ORDER BY id")
    fun getAll(): LiveData<List<Transaction>>
}