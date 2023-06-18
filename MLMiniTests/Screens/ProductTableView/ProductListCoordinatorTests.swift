//
//  ProductListCoordinatorTests.swift
//  MLMiniTests
//
//  Created by Alexis Garcia Carli on 16/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MLMini


class NavigationControllerSpy: UINavigationController, Mock {
    var didCallPushViewController = MockCounter()
    var pushViewControllerParams: (viewController: UIViewController, animated: Bool)?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        didCallPushViewController.wasCalled()
        pushViewControllerParams = (viewController: viewController, animated: animated)
    }
}
