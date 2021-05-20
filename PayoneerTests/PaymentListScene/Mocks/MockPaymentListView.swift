//
//  MockPaymentListView.swift
//  PayoneerTests
//
//  Created by Gungor Basa on 5/20/21.
//

import Foundation
@testable import Payoneer

class MockPaymentListView: PaymentListViewProtocol {
  var output: PaymentListPresenterOutput?

  func handleOutput(_ output: PaymentListPresenterOutput) {
    self.output = output
  }
}
