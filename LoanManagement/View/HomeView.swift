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
            VStack {
                ForEach(viewModel.loans) { loan in
                    NavigationLink(destination: LoanDetailsView(viewModel: LoanDetailsViewModel(loan: loan))) {
                        LoanCard(loan)
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitle("LoanManagement", displayMode: .large)
    }
}

#Preview {
    HomeView()
}
