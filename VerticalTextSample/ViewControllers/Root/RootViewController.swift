//
//  RootViewController.swift
//  VerticalText
//
//  Created by Yuji Tada on 2023/08/07.
//

import UIKit

final class RootViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapTextKit2Button(_ sender: Any) {
        navigationController?.pushViewController(TextKit2ViewController(), animated: true)
    }

    @IBAction func tapStackViewButton(_ sender: Any) {
        navigationController?.pushViewController(StackViewViewController(), animated: true)
    }
    
    @IBAction func tapNezenButton(_ sender: Any) {
        navigationController?.pushViewController(NezenViewController(), animated: true)
    }
}
