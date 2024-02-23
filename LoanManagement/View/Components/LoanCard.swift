//
//  LoanCard.swift
//  LoanManagement
//
//  Created by Haikal Lazuardi Fadil on 23/02/24.
//

import SwiftUI

struct LoanCard: View {
    let loan: Loan
    let onTap: () -> Void
    
    init(_ loan: Loan, action: @escaping () -> Void) {
        self.loan = loan
        self.onTap = action
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(loan.borrower.name)
                    Text("USD \(loan.amount)")
                        .font(.title)
                        .fontWeight(.semibold)
                    Text(loan.purpose)
                        .font(.caption)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(loan.riskRating)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Rate: \(loan.interestRate, specifier: "%.2f")")
                    Text("Term: \(loan.term)mo")
                }
            }
        }
        .padding(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray, lineWidth: 1)
        )
        .onTapGesture {
            onTap()
        }
    }
}

#Preview {
    LoanCard(Loan.generateDummy().first!, action: {})
}
