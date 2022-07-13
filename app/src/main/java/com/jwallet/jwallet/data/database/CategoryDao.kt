package com.jwallet.jwallet.data.database

import androidx.lifecycle.LiveData
import androidx.room.*

@Dao
interface CategoryDao {

    @Insert
    suspend fun add(category: Category)

    @Update
    suspend fun update(category: Category)

    @Delete
    suspend fun delete(category: Category)

    @Query("SELECT * FROM category_table WHERE name = :categoryName")
    fun get(categoryName: String): LiveData<Category>

    @Query("SELECT * FROM category_table ORDER BY name")
    fun getAll(): LiveData<List<Category>>
}