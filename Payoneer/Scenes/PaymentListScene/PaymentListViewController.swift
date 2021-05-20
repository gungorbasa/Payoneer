//
//  PaymentListViewController.swift
//  Payoneer
//
//  Created Gungor Basa on 5/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class PaymentListViewController: UIViewController {
  private let tableView = UITableView.autolayoutView()
  private lazy var dataSource = PaymentListDataSource(tableView: tableView)

  var presenter: PaymentListPresenterProtocol?

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    presenter?.onViewDidLoad()
  }
}

private extension PaymentListViewController {
  func setup() {
    setupTableView()
  }

  func setupTableView() {
    view.addSubview(tableView)
    tableView.pinToSafeArea()
  }
}

extension PaymentListViewController: PaymentListViewProtocol {

  func handleOutput(_ output: PaymentListPresenterOutput) {
    switch output {
    case .showPaymentMethods(let viewModels):
      dataSource.applySnapshot(with: viewModels)
    }
  }
}
