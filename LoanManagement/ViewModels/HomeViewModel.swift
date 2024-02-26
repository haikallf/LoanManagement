//
//  HomeViewModel.swift
//  LoanManagement
//
//  Created by Haikal Lazuardi Fadil on 23/02/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var loans: [Loan] = []
    @Published var loansTemp: [Loan] = []
    
    @Published var riskRatingFilter: [String] = []
    var riskRatingFilterTemp: [String] = []
    @Published var riskRatings = ["A", "B", "C", "D"]
    
    @Published var termFilter: [Int] = []
    var termFilterTemp: [Int] = []
    @Published var terms = [30, 60, 90, 120]
    
    init() {
        fetchLoans()
    }
    
    func fetchLoans() {
        LoanAPI.getLoans { [weak self] result in
            switch result {
            case .success(let response):
                self?.loans = response
                self?.loansTemp = response
            case .failure(let error):
                print("Request Failed: \(error.localizedDescription)")
                self?.loans = []
                self?.loansTemp = []
            }
        }
    }
    
    func riskRatingCheckbox(id: String, isMarked: Bool) {
        if isMarked {
            riskRatingFilter.append(id)
        } else {
            riskRatingFilter.removeAll { $0 == id }
        }
    }
    
    func termCheckbox(id: String, isMarked: Bool) {
        guard let termId = Int(id) else { return }
        if isMarked {
            termFilter.append(termId)
        } else {
            termFilter.removeAll { $0 == termId }
        }
    }
    
    func submitFilter() {
        riskRatingFilterTemp = riskRatingFilter
        termFilterTemp = termFilter
        
        loansTemp = loans.filter { loan in
            (riskRatingFilter.isEmpty || riskRatingFilter.contains(loan.riskRating)) &&
            (termFilter.isEmpty || termFilter.contains(loan.term))
        }
    }
    
    func revertFilter() {
        riskRatingFilter = riskRatingFilterTemp
        termFilter = termFilterTemp
        submitFilter()
    }
    
    func resetFilter() {
        riskRatingFilter = []
        riskRatingFilterTemp = []
        termFilter = []
        termFilterTemp = []
        loansTemp = loans
    }
}
