package com.jwallet.jwallet.data.database

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "category_table")
data class Category(
    @PrimaryKey(autoGenerate = false) var name: String,
    var image: Int
)