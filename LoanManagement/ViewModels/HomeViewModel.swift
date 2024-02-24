//
//  HomeViewModel.swift
//  LoanManagement
//
//  Created by Haikal Lazuardi Fadil on 23/02/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var loans: [Loan]
    @Published var loansTemp: [Loan]
    
    @Published var riskRatingFilter: [String] = []
    @Published var riskRatingFilterTemp: [String] = []
    @Published var riskRatings = ["A", "B", "C", "D"]
    
    @Published var termFilter: [Int] = []
    @Published var termFilterTemp: [Int] = []
    @Published var terms = [30, 60, 90, 120]
    
    init() {
        self.loans = []
        self.loansTemp = []
        
        LoanAPI.getLoans { [weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.loans = response
                    self?.loansTemp = response
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.loans = []
                    self?.loansTemp = []
                    print("Request Failed: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func riskRatingCheckbox(id: String, isMarked: Bool) {
        if isMarked { 
            riskRatingFilter.append(id)
        } else if let index = riskRatingFilter.firstIndex(of: id) {
            riskRatingFilter.remove(at: index)
        }
        print(riskRatingFilter)
    }
    
    func termCheckbox(id: String, isMarked: Bool) {
        if isMarked {
            termFilter.append(Int(id) ?? 0)
        } else if let index = termFilter.firstIndex(of: Int(id) ?? 0) {
            termFilter.remove(at: index)
        }
        print(riskRatingFilter)
    }
    
    func submitFilter() {
        riskRatingFilterTemp = riskRatingFilter
        termFilterTemp = termFilter
        
        loansTemp = riskRatingFilter.isEmpty ? loans : loans.filter { riskRatingFilter.contains($0.riskRating) }
        
        loansTemp = termFilter.isEmpty ? loansTemp : loansTemp.filter { termFilter.contains($0.term) }
    }
    
    func revertFilter() {
        riskRatingFilter = riskRatingFilterTemp
        termFilter = termFilterTemp
    }
    
    func resetFilter() {
        riskRatingFilter.removeAll()
        riskRatingFilterTemp.removeAll()
        
        termFilter.removeAll()
        termFilterTemp.removeAll()
        
        loansTemp = loans
    }
}
