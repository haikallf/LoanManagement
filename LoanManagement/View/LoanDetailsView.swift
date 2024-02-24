//
//  LoanDetailsView.swift
//  LoanManagement
//
//  Created by Haikal Lazuardi Fadil on 23/02/24.
//

import SwiftUI

struct LoanDetailsView: View {
    @ObservedObject var viewModel: LoanDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                // MARK: - User Data
                VStack(alignment: .leading) {
                    Text(viewModel.loan.borrower.name)
                        .font(.title)
                    Text(viewModel.loan.borrower.email)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // MARK: - Credit Score
                Text("Credit Score")
                    .padding(.top, 72)
                    .font(.title)
                
                Text(String(viewModel.loan.borrower.creditScore))
                    .font(.system(size: 96, weight: .bold))
                
                // MARK: - Collateral Section
                VStack(alignment: .leading) {
                    Text("Collateral")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("Type: \(viewModel.loan.collateral.type)")
                    Text("Value: \(viewModel.loan.collateral.value)")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
                
                VStack(alignment: .leading) {
                    Text("Documents")
                        .font(.title2)
                        .fontWeight(.semibold)
                    ForEach(viewModel.loan.documents, id: \.self) { doc in
                        NavigationLink(destination: DocumentView(viewModel: DocumentViewModel(url: doc.url))) {
                            HStack {
                                Text("•")
                                VStack(alignment: .leading) {
                                    Text(doc.type)
                                    Text(Helpers.getFileName(from: doc.url) ?? "unknown file")
                                }
                            }
                            .padding(.bottom)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
                
                
                Spacer()
            }
            .padding()
        }
    }
}


#Preview {
    LoanDetailsView(viewModel: LoanDetailsViewModel(loan: Loan.generateDummy().first!))
}
