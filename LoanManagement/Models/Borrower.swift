//
//  Borrower.swift
//  LoanManagement
//
//  Created by Haikal Lazuardi Fadil on 23/02/24.
//

import Foundation

struct Borrower: Codable {
    let id: String
    let name: String
    let email: String
    let creditScore: Int
}
