//
//  PaymentListService.swift
//  Payoneer
//
//  Created by Gungor Basa on 5/20/21.
//

import Combine
import Foundation

protocol PaymentListServing {}

final class PaymentListService: PaymentListServing {
  private let networking: Networking

  init(networking: Networking) {
    self.networking = networking
  }

  func fetch() -> AnyPublisher<PaymentList, Error> { networking.run(PaymentRoutes.paymentList) }
}
