//
//  PaymentListRouter.swift
//  Payoneer
//
//  Created Gungor Basa on 5/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class PaymentListRouter: PaymentListRouterProtocol {

    unowned let view: UIViewController

    init(_ view: UIViewController) {
        self.view = view
    }

    func navigate(to route: PaymentListRoute) {

    }
}
