//
//  PaymentListInteractor.swift
//  Payoneer
//
//  Created Gungor Basa on 5/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class PaymentListInteractor: PaymentListInteractorProtocol {

  weak var delegate: PaymentListInteractorDelegate?

  private let service: PaymentListServing

  init(service: PaymentListServing) {
    self.service = service
  }

  func fetchPaymentList() {
    service.fetch { [weak self] result in
      switch result {
      case .success(let paymentList):
        self?.delegate?.handleOutput(.payments(paymentList))
      case .failure(let error):
        self?.delegate?.handleOutput(.error(error))
      }
    }
  }
}
