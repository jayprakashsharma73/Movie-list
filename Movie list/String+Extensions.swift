//
//  String+Extensions.swift
//  Movie list
//
//  Created by Jay Prakash Sharma on 08/04/22.
//

import Foundation

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
