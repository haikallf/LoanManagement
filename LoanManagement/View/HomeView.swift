//
//  HomeView.swift
//  LoanManagement
//
//  Created by Haikal Lazuardi Fadil on 23/02/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.loans) { loan in
                LoanCard(loan, action: {
                    print(loan.borrower.name)
                })
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
