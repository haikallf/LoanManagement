//
//  HomeViewModel.swift
//  LoanManagement
//
//  Created by Haikal Lazuardi Fadil on 23/02/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var loans: [Loan]
    
    init() {
        loans = Loan.generateDummy()
    }
}
