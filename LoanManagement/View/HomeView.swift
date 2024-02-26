//
//  HomeView.swift
//  LoanManagement
//
//  Created by Haikal Lazuardi Fadil on 23/02/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State var shouldPresentSheet = false
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.loansTemp) { loan in
                    NavigationLink(destination: LoanDetailsView(viewModel: LoanDetailsViewModel(loan: loan))) {
                        LoanCard(loan)
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitle("LoanManagement", displayMode: .large)
        .navigationBarItems(
            trailing:
                Button("Filter") {
                    shouldPresentSheet.toggle()
                }
        )
        .sheet(isPresented: $shouldPresentSheet) {
            print("Sheet dismissed!")
            viewModel.revertFilter()
        } content: {
            VStack(alignment: .leading) {
                HStack {
                    Text("Filter")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 24))
                        .onTapGesture {
                            shouldPresentSheet = false
                        }
                }
                
                Text("Risk Rating")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                ForEach(viewModel.riskRatings, id: \.self) { rating in
                    CheckboxField(
                        id: rating,
                        label: rating,
                        size: 14,
                        textSize: 14,
                        callback: viewModel.riskRatingCheckbox, 
                        isMarked: viewModel.riskRatingFilter.contains(rating)
                    )
                }
                
                Text("Terms")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                ForEach(viewModel.terms, id: \.self) { term in
                    CheckboxField(
                        id: String(term),
                        label: "\(term)mo",
                        size: 14,
                        textSize: 14,
                        callback: viewModel.termCheckbox,
                        isMarked: viewModel.termFilter.contains(term)
                    )
                }
                
                Spacer()
                
                Button(action: {
                    viewModel.resetFilter()
                    shouldPresentSheet = false
                }, label: {
                    Text("Reset Filter")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .foregroundColor(.blue)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.blue, lineWidth: 1)
                        )
                })
                
                Button(action: {
                    viewModel.submitFilter()
                    shouldPresentSheet = false
                }, label: {
                    Text("Submit")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
            }
            .padding()
            .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    HomeView()
}
