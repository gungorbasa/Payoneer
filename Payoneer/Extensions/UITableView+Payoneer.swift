//
//  UITableView+Payoneer.swift
//  Payoneer
//
//  Created by Gungor Basa on 5/20/21.
//

import UIKit

extension UITableView {
  /// Register given cell type
  func register<T: UITableViewCell>(cell: T.Type) {
    register(cell, forCellReuseIdentifier: T.identifier)
  }
  
  /// Register given header/footer view
  func register<T: UITableViewHeaderFooterView>(headerFooterView: T.Type) {
    register(headerFooterView, forHeaderFooterViewReuseIdentifier: String(describing: headerFooterView))
  }
  
  /// Dequeue reusable cell
  func dequeueReusableCell<T: UITableViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
      return T()
    }
    return cell
  }
  
  /// Dequeue reusable header/footer view
  func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ view: T.Type) -> T {
    guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as? T else {
      return T()
    }
    return view
  }
  
  func layoutHeaderIfNeeded() {
    guard let headerView = tableHeaderView else {
      return
    }
    
    let sizeToFit = CGSize(width: frame.width,
                           height: CGFloat.greatestFiniteMagnitude)
    headerView.frame.size = headerView.systemLayoutSizeFitting(sizeToFit)
    headerView.layoutIfNeeded()
    tableHeaderView = headerView
  }
}

