//
//  UIViewController+Extension.swift
//  VerticalText
//
//  Created by Yuji Tada on 2023/08/07.
//

import UIKit

extension UIViewController {
    func wrapNavigationController() -> UINavigationController {
        return StatusBarNavigationController(rootViewController: self)
    }
}

class PresentationNavigationController: UINavigationController {
    // MARK: - Initialize
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        modalPresentationStyle = rootViewController.modalPresentationStyle
        modalTransitionStyle = rootViewController.modalTransitionStyle
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class StatusBarNavigationController: PresentationNavigationController {
    // MARK: - Properties
    override var childForStatusBarStyle: UIViewController? {
        return viewControllers.last
    }
    override var childForStatusBarHidden: UIViewController? {
        return viewControllers.last
    }
    override var childForHomeIndicatorAutoHidden: UIViewController? {
        return viewControllers.last
    }
}
