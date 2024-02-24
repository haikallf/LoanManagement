//
//  DocumentView.swift
//  LoanManagement
//
//  Created by Haikal Lazuardi Fadil on 23/02/24.
//


import SwiftUI

struct DocumentView: View {
    @ObservedObject var viewModel: DocumentViewModel
    
    var body: some View {
        if let endpoint = viewModel.url, let url = URL(string: LoanAPI.baseURL + endpoint) {
            AsyncImage(url: url) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .aspectRatio(contentMode: .fit)
        } else {
            Text("Document cannot bet retrieved")
        }
    }
}

#Preview {
    DocumentView(viewModel: DocumentViewModel(url: Loan.generateDummy().first?.documents.first?.url))
}
