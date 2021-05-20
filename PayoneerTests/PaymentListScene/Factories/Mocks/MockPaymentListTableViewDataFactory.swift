//
//  MockPaymentListTableViewDataFactory.swift
//  PayoneerTests
//
//  Created by Gungor Basa on 5/20/21.
//

import Foundation
@testable import Payoneer

struct MockPaymentListTableViewDataFactory: PaymentListTableViewDataFactoring {
  let result: [PaymentListCellViewModel]

  func make(from networks: [Network]) -> [PaymentListCellViewModel] { result }
}
