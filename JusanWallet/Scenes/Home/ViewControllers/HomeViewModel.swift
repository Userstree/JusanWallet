//
//  HomeViewModel.swift
//  JusanWallet
//
//  Created by Dossymkhan Zhulamanov on 09.07.2022.
//

import UIKit

typealias DataProvidable =  BalanceStatisticsServiceProvidable & CatalogItemsDataListProvidable

protocol HomeViewModel: DataProvidable {
    var companyCards: [CatalogCard] { get set }
}