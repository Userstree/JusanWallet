package com.jwallet.jwallet.data.database

import androidx.room.Entity
import androidx.room.PrimaryKey
import java.util.*

@Entity(tableName = "transaction_table")
data class Transaction(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val category: String,
    val title: String,
    val note: String,
    val price: Double,
    val date: Date,
    val recurring: Boolean
)