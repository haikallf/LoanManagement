//
//  LoanDetailsViewModel.swift
//  LoanManagement
//
//  Created by Haikal Lazuardi Fadil on 23/02/24.
//

import Foundation

class LoanDetailsViewModel: ObservableObject {
    @Published var loan: Loan
    
    init(loan: Loan) {
        self.loan = loan
    }
}
