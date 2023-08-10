//
//  NezenViewController.swift
//  VerticalText
//
//  Created by Yuji Tada on 2023/08/07.
//

import UIKit

final class NezenViewController: UIViewController {
    @IBOutlet weak var textView: UITextView! {
        didSet {
            let text = textView.text ?? ""
            let attributes: [NSAttributedString.Key : Any] = [
                .foregroundColor: UIColor.black,
//                .verticalGlyphForm: true,
                .font: UIFont(name: "Nezen", size: 24) ?? .systemFont(ofSize: 24)
            ]
            textView.attributedText = NSAttributedString(string: text, attributes: attributes)
            textView.isEditable = false
            textView.isSelectable = false
            textView.isScrollEnabled = false
            textView.isUserInteractionEnabled = false
            textView.transform = .init(rotationAngle: .pi / 2)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
