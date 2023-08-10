//
//  String+Extension.swift
//  VerticalText
//
//  Created by Yuji Tada on 2023/08/07.
//

import Foundation

extension String.Element {
    var isMacron: Bool {
        return self == "ー" || self == "〜"
    }
    var isOpenParenthesis: Bool {
        return self == "(" || self == "（"
    }
    var isParenthesis: Bool {
        return self == "(" || self == ")" || self == "（" || self == "）"
    }
}
