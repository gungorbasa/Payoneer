//
//  MockPaymentListRouter.swift
//  PayoneerTests
//
//  Created by Gungor Basa on 5/20/21.
//

import Foundation
@testable import Payoneer

class MockPaymentListRouter: PaymentListRouterProtocol {
  var to: PaymentListRoute?

  func navigate(to route: PaymentListRoute) {
    self.to = route
  }
}
