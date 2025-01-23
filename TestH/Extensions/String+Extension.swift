//
//  String+Extension.swift
//  TestH
//
//  Created by sherbakova on 18.08.2024.
//

import Foundation

extension String {
    
    func localized() -> String {
        NSLocalizedString(self, comment: self)
    }
}
