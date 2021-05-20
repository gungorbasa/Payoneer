//
//  MockPaymentListPresenter.swift
//  PayoneerTests
//
//  Created by Gungor Basa on 5/20/21.
//

import Foundation
@testable import Payoneer

class MockPaymentListPresenter: PaymentListPresenterProtocol {
  var isViewDidLoad = false

  func onViewDidLoad() {
    isViewDidLoad = true
  }
}
