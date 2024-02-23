//
//  LoanAPI.swift
//  LoanManagement
//
//  Created by Haikal Lazuardi Fadil on 23/02/24.
//

import Foundation
import Alamofire

struct LoanAPI {
    static func getLoans(completion: @escaping (Result<[Loan], Error>) -> Void) {
        let url = "https://raw.githubusercontent.com/andreascandle/p2p_json_test/main/api/json/loans.json"
        AF.request(url,
                       method: .get,
                       parameters: nil,
                       encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: [Loan].self) { response in
                switch response.result {
                case .success(let result):
                    completion(.success(result))
                case .failure(let error):
                    completion(.failure(error))
                    print("Error: \(error.localizedDescription)")
                }
            }
    }
}
