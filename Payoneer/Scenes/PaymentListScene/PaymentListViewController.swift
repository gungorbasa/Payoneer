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
    tableView.dataSource = self
    tableView.pinToSafeArea()
  }
}

extension PaymentListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 0 }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    UITableViewCell()
  }
}

extension PaymentListViewController: PaymentListViewProtocol {

  func handleOutput(_ output: PaymentListPresenterOutput) {

  }
}
