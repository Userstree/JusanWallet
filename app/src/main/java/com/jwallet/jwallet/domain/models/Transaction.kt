package com.jwallet.jwallet.domain.models

data class Transaction(
    val id: Long,
    val avatar: Int,
    val title: String,
    val message: String,
    val price: Double,
    val date: String
)