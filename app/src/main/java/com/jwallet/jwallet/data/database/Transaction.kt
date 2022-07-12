package com.jwallet.jwallet.data.database

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "transaction_table")
data class Transaction(
    @PrimaryKey(autoGenerate = true)
    val id: Long,
    val category: String,
    val title: String,
    val message: String,
    val price: Double,
    val date: String
)