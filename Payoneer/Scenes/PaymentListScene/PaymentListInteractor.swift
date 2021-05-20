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
    service.fetch { result in
      switch result {
      case .success(let paymentList):
        print("Payment List: \(paymentList)")
      case .failure(let error):
        print("Show error! \(error.localizedDescription)")
      }
    }
  }
}
