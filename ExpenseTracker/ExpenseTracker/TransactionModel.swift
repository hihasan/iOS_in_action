//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Hasan Al Mamun on 20/5/23.
//

import Foundation

struct Transaction : Identifiable, Decodable{
    
    let id : Int
    let date : String
    let institution : String
    let account : String
    let merchant : String
    let amount : Double
    let type : TransactionType.RawValue
    var categoryId : Int
    let category : String
    let isPending : Bool
    var isTransfer : Bool
    var isExpense : Bool
    var isEditable : Bool
    
    var dateParsed : Date{
        date.dateParsed()
    }
    
    var signedAmount : Double{
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
}

enum TransactionType : String{
    case debit = "debit"
    case credit = "credit"
}
