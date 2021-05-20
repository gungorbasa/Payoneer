//
//  MockPaymentListInteractor.swift
//  PayoneerTests
//
//  Created by Gungor Basa on 5/20/21.
//

import Foundation
@testable import Payoneer

class MockPaymentListInteractor: PaymentListInteractorProtocol {
  var delegate: PaymentListInteractorDelegate?

  var isFetched: Bool = false

  func fetchPaymentList() {
    isFetched = true
  }
}
