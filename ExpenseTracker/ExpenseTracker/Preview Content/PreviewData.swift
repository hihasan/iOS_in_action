//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Hasan Al Mamun on 20/5/23.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date: "20/05/2023", institution: "AppNap", account: "Visa", merchant: "Apple", amount: 11.29, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEditable: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
