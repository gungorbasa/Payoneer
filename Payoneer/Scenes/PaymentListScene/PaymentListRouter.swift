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
    switch route {
    case .showMessage(let message):
      present(message: message)
    }
  }
}


private extension PaymentListRouter {
  func present(message: String) {
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    view.present(alert, animated: true)
  }
}
