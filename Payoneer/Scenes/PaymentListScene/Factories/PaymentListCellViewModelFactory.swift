//
//  PaymentListCellViewModelFactory.swift
//  Payoneer
//
//  Created by Gungor Basa on 5/20/21.
//

import Foundation

protocol PaymentListCellViewModelFactoring {
  func make(from network: Network) -> PaymentListCellViewModel
}

struct PaymentListCellViewModelFactory: PaymentListCellViewModelFactoring {
  func make(from network: Network) -> PaymentListCellViewModel {
    .init(
      id: network.code,
      imageURL: URL(string: network.links.logo),
      title: network.label
    )
  }
}
