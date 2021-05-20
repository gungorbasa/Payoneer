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
    //        let networkWorker = NetworkWorker(app.networking)
    //        let service = RestaurantListService(networkWorker, database: DbWorker(Database()))
    //        //        MovieListInteractor(app.service)
    let interactor = PaymentListInteractor()
    //        let interactor = PaymentListInteractor(service)
    let presenter = PaymentListPresenter(view, interactor: interactor, router: router)
    view.presenter = presenter
    return view
  }
}
