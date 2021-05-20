//
//  PaymentListTableViewDataFactory.swift
//  Payoneer
//
//  Created by Gungor Basa on 5/20/21.
//

import Foundation

protocol PaymentListTableViewDataFactoring {
  func make(from networks: [Network]) -> [PaymentListCellViewModel]
}

struct PaymentListTableViewDataFactory: PaymentListTableViewDataFactoring {
  let factory: PaymentListCellViewModelFactoring

  func make(from networks: [Network]) -> [PaymentListCellViewModel] {
    networks.map { factory.make(from: $0) }
  }
}
