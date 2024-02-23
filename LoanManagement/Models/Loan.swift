//
//  Loan.swift
//  LoanManagement
//
//  Created by Haikal Lazuardi Fadil on 23/02/24.
//

import Foundation

struct Loan: Codable, Identifiable {
    let id: String
    let amount: Int
    let interestRate: Double
    let term: Int
    let purpose: String
    let riskRating: String
    let borrower: Borrower
    let collateral: Collateral
    let documents: [Document]
    let repaymentSchedule: RepaymentSchedule
}

extension Loan {
    static func generateDummy() -> [Loan] {
        return [
            Loan(id: "658539b43f5498ccae79105b", 
                 amount: 5000,
                 interestRate: 0.8,
                 term: 120, 
                 purpose: "Business Expansion",
                 riskRating: "C",
                 borrower: Borrower(id: "658539b489fdaab6eae418f3", 
                                    name: "Shelly Valenzuela",
                                    email: "shellyvalenzuela@orbaxter.com", 
                                    creditScore: 650),
                 collateral: Collateral(type: "Real Estate", 
                                        value: 100000),
                 documents: [
                    Document(type: "Income Statement", 
                             url: "/loans/documents/income_statement/slip-gaji-karyawan-pertamina.jpeg")
                 ],
                 repaymentSchedule: RepaymentSchedule(installments: [
                    Installment(dueDate: "2023-01-15", amountDue: 500),
                    Installment(dueDate: "2023-02-15", amountDue: 500),
                 ])),
            Loan(id: "658539b444a7f21ba8fd4b71",
                 amount: 5000,
                 interestRate: 0.8,
                 term: 90,
                 purpose: "Others",
                 riskRating: "B",
                 borrower: Borrower(id: "658539b4c1436318233a0238",
                                    name: "Warren Carlson",
                                    email: "warrencarlson@orbaxter.com",
                                    creditScore: 600),
                 collateral: Collateral(type: "Real Estate",
                                        value: 100000),
                 documents: [
                    Document(type: "Income Statement",
                             url: "/loans/documents/income_statement/slip-gaji-karyawan-pertamina.jpeg")
                 ],
                 repaymentSchedule: RepaymentSchedule(installments: [
                    Installment(dueDate: "2023-01-15", amountDue: 500),
                    Installment(dueDate: "2023-02-15", amountDue: 500),
                 ]))
        ]
    }
}
