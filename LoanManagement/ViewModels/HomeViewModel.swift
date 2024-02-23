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
        self.loans = []
        LoanAPI.getLoans { [weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.loans = response
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.loans = []
                    print("Request Failed: \(error.localizedDescription)")
                }
            }
        }
    }
}
