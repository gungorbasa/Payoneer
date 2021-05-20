//
//  MockPaymentListCellViewModelFactory.swift
//  PayoneerTests
//
//  Created by Gungor Basa on 5/20/21.
//

import Foundation
@testable import Payoneer

struct MockPaymentListCellViewModelFactory: PaymentListCellViewModelFactoring {
  let id: String
  let url: URL?
  let title: String

  func make(from network: Network) -> PaymentListCellViewModel {
    PaymentListCellViewModel(id: id, imageURL: url, title: title)
  }
}
