//
//  Array+Extension.swift
//  VerticalText
//
//  Created by Yuji Tada on 2023/08/07.
//

import Foundation

extension Array {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
