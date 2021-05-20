//
//  PaymentListContracts.swift
//  Payoneer
//
//  Created Gungor Basa on 5/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - Interactor
protocol PaymentListInteractorProtocol: AnyObject {

    var delegate: PaymentListInteractorDelegate? { get set }
}

enum PaymentListInteractorOutput {

}

protocol PaymentListInteractorDelegate: AnyObject {

    func handleOutput(_ output: PaymentListInteractorOutput)
}

// MARK: - Presenter
protocol PaymentListPresenterProtocol: AnyObject {

}

enum PaymentListPresenterOutput: Equatable {

}

// MARK: - View
protocol PaymentListViewProtocol: AnyObject {

    func handleOutput(_ output: PaymentListPresenterOutput)
}

// MARK: - Router
enum PaymentListRoute: Equatable {

}

protocol PaymentListRouterProtocol: AnyObject {

    func navigate(to route: PaymentListRoute)
}
