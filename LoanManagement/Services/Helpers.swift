//
//  Helpers.swift
//  LoanManagement
//
//  Created by Haikal Lazuardi on 24/02/24.
//

import Foundation

struct Helpers {
    static func getFileName(from url: String) -> String? {
        let components = url.split(separator: "/")
        if let lastComponent = components.last {
            return String(lastComponent)
        } else {
            return nil
        }
    }
}
