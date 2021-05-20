//
//  PaymentListPresenter.swift
//  Payoneer
//
//  Created Gungor Basa on 5/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class PaymentListPresenter: PaymentListPresenterProtocol {

  private unowned let view: PaymentListViewProtocol

  private let interactor: PaymentListInteractorProtocol
  private let router: PaymentListRouterProtocol

  init(_ view: PaymentListViewProtocol, interactor: PaymentListInteractorProtocol, router: PaymentListRouterProtocol) {
    self.view = view
    self.interactor = interactor
    self.router = router
    self.interactor.delegate = self
  }

  func onViewDidLoad() {
    interactor.fetchPaymentList()
  }
}

extension PaymentListPresenter: PaymentListInteractorDelegate {

  func handleOutput(_ output: PaymentListInteractorOutput) {

  }
}
