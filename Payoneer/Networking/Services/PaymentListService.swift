//
//  PaymentListService.swift
//  Payoneer
//
//  Created by Gungor Basa on 5/20/21.
//

import Combine
import Foundation

protocol PaymentListServing {
  func fetch(completion: @escaping (Result<PaymentList, Error>) -> Void)
}

final class PaymentListService: PaymentListServing {
  private let networking: Networking
  private var cancellable: AnyCancellable?

  init(networking: Networking) {
    self.networking = networking
  }

  func fetch(completion: @escaping (Result<PaymentList, Error>) -> Void) {
    cancellable?.cancel()
    cancellable = networking.run(PaymentRoutes.paymentList)
      .sink(receiveCompletion: { result in
        switch result {
        case .failure(let error):
          completion(.failure(error))
        case .finished:
          break
        }
      }, receiveValue: { (value: PaymentList) in
        completion(.success(value))
      })
  }
}
