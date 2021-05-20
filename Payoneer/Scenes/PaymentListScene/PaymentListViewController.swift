//
//  PaymentListViewController.swift
//  Payoneer
//
//  Created Gungor Basa on 5/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class PaymentListViewController: UIViewController {
  private let tableView = UITableView()

  var presenter: PaymentListPresenterProtocol!

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }

  private func setup() {

  }
}

extension PaymentListViewController: PaymentListViewProtocol {

  func handleOutput(_ output: PaymentListPresenterOutput) {

  }
}
