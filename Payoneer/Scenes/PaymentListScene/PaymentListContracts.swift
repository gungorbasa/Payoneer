//
//  PaymentListContracts.swift
//  Payoneer
//
//  Created Gungor Basa on 5/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - Interactor
protocol PaymentListInteractorProtocol: class {

    var delegate: PaymentListInteractorDelegate? { get set }
}

enum PaymentListInteractorOutput {

}

protocol PaymentListInteractorDelegate: class {

    func handleOutput(_ output: PaymentListInteractorOutput)
}

// MARK: - Presenter
protocol PaymentListPresenterProtocol: class {

}

enum PaymentListPresenterOutput: Equatable {

}

// MARK: - View
protocol PaymentListViewProtocol: class {

    func handleOutput(_ output: PaymentListPresenterOutput)
}

// MARK: - Router
enum PaymentListRoute: Equatable {

}

protocol PaymentListRouterProtocol: class {

    func navigate(to route: PaymentListRoute)
}
