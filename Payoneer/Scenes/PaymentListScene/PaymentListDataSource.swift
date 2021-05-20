//
//  PaymentListDataSource.swift
//  Payoneer
//
//  Created by Gungor Basa on 5/20/21.
//

import UIKit

protocol PaymentListDataSourcing {
  func applySnapshot(with elements: [PaymentListCellViewModel])
}

final class PaymentListDataSource {
  enum PaymentListSection: Hashable {
    case main
  }

  typealias DataSource = UITableViewDiffableDataSource<PaymentListSection, PaymentListCellViewModel>
  typealias Snapshot = NSDiffableDataSourceSnapshot<PaymentListSection, PaymentListCellViewModel>

  private let tableView: UITableView
  private var dataSource: DataSource?

  init(tableView: UITableView) {
    self.tableView = tableView
    tableView.register(cell: PaymentListCell.self)
    makeDataSource()
  }

  private func makeDataSource() {
    let cellRegistration: (UITableView, IndexPath, PaymentListCellViewModel) -> UITableViewCell? = {
      tableView, indexPath, element -> UITableViewCell? in
      let cell = tableView.dequeueReusableCell(PaymentListCell.self, for: indexPath)
      cell.configure(with: element)
      return cell
    }

    dataSource = DataSource(tableView: tableView, cellProvider: cellRegistration)
  }

  func applySnapshot(with elements: [PaymentListCellViewModel]) {
    var snapshot = Snapshot()
    snapshot.appendSections([.main])
    snapshot.appendItems(elements, toSection: .main)
    dataSource?.apply(snapshot, animatingDifferences: false)
  }
}
