//
//  PaymentListBuilder.swift
//  Payoneer
//
//  Created Gungor Basa on 5/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class PaymentListBuilder {

  static func make() -> PaymentListViewController {
    let view = PaymentListViewController()
    let router = PaymentListRouter(view)
    let service = PaymentListService(networking: NativeNetwork(decoder: JSONDecoder()))
    let interactor = PaymentListInteractor(service: service)
    
    let dataFactory = PaymentListTableViewDataFactory(factory: PaymentListCellViewModelFactory())
    let presenter = PaymentListPresenter(view, interactor: interactor, dataFactory: dataFactory, router: router)
    view.presenter = presenter

    return view
  }
}
