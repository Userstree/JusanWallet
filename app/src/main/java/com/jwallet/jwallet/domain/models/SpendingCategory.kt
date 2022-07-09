package com.jwallet.jwallet.domain.models

data class SpendingCategory(
    val id: Long,
    var name: String,
    var image: Int,
    var transactions: List<Transaction> = emptyList()
)