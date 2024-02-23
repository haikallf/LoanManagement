//
//  DocumentViewModel.swift
//  LoanManagement
//
//  Created by Haikal Lazuardi Fadil on 23/02/24.
//

import Foundation

class DocumentViewModel: ObservableObject {
    @Published var url: String?
    
    init(url: String?) {
        self.url = url
    }
}
