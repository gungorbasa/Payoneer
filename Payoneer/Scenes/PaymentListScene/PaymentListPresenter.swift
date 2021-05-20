//
//  PaymentListPresenter.swift
//  Payoneer
//
//  Created Gungor Basa on 5/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class PaymentListPresenter: PaymentListPresenterProtocol {

  private weak var view: PaymentListViewProtocol?

  private let interactor: PaymentListInteractorProtocol
  private let router: PaymentListRouterProtocol
  private let dataFactory: PaymentListTableViewDataFactoring

  init(
    _ view: PaymentListViewProtocol,
    interactor: PaymentListInteractorProtocol,
    dataFactory: PaymentListTableViewDataFactoring,
    router: PaymentListRouterProtocol
  ) {
    self.view = view
    self.interactor = interactor
    self.dataFactory = dataFactory
    self.router = router
    self.interactor.delegate = self
  }

  func onViewDidLoad() {
    interactor.fetchPaymentList()
    view?.handleOutput(.setTitle("Payment Methods"))
  }
}

extension PaymentListPresenter: PaymentListInteractorDelegate {

  func handleOutput(_ output: PaymentListInteractorOutput) {
    DispatchQueue.main.async {
      switch output {
      case .payments(let list):
        let viewModels = self.dataFactory.make(from: list.networks.applicable)
        self.view?.handleOutput(.showPaymentMethods(viewModels))
      case .error:
        self.router.navigate(to: .showMessage(message: "Encountered an error. Please, try again!"))
      }
    }
  }
}
