package com.jwallet.jwallet.data.database

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase

@Database(
    entities = [Transaction::class, Category::class],
    version = 1,
    exportSchema = true
)
abstract class TransactionDatabase : RoomDatabase() {
    abstract val transactionDao: TransactionDao
    abstract val categoryDao: CategoryDao

    companion object {
        @Volatile
        private lateinit var INSTANCE: TransactionDatabase

        fun getInstance(context: Context): TransactionDatabase {
            synchronized(this) {
                if (!::INSTANCE.isInitialized) {
                    INSTANCE = Room.databaseBuilder(
                        context.applicationContext,
                        TransactionDatabase::class.java,
                        "transaction_database"
                    ).build()
                }
            }
            return INSTANCE
        }
    }
}