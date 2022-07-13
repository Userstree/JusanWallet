package com.jwallet.jwallet.data.database

import androidx.lifecycle.LiveData
import androidx.room.*
import androidx.room.OnConflictStrategy.REPLACE

@Dao
interface CategoryDao {

    @Insert(onConflict = REPLACE)
    suspend fun add(category: Category)

    @Insert(onConflict = REPLACE)
    suspend fun addAll(categories: List<Category>)

    @Update
    suspend fun update(category: Category)

    @Delete
    suspend fun delete(category: Category)

    @Query("SELECT * FROM category_table WHERE name = :categoryName")
    fun get(categoryName: String) : LiveData<Category>

    @Query("SELECT * FROM category_table ORDER BY name")
    fun getAll() : LiveData<List<Category>>

    @Query("SELECT * FROM category_table WHERE type = :type")
    fun getCategoriesByType(type: String): LiveData<List<Category>>
}