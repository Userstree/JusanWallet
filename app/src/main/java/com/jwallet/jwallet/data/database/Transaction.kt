package com.jwallet.jwallet.data.database

import androidx.room.Entity
import androidx.room.PrimaryKey
import java.util.*

@Entity(tableName = "transaction_table")
data class Transaction(
    @PrimaryKey
    val id: String = UUID.randomUUID().toString(),
    val category: String,
    val title: String,
    val note: String,
    val price: Double,
    val date: Date,
    val categoryType: String,
    val recurring: Boolean
)