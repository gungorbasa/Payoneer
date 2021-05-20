//
//  PaymentListCell.swift
//  Payoneer
//
//  Created by Gungor Basa on 5/20/21.
//

import UIKit

final class PaymentListCell: UITableViewCell {
  private let horizontalStack = UIStackView.autolayoutView()
  private let titleLabel = UILabel.autolayoutView()
  private let iconImageView = UIImageView.autolayoutView()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(with viewModel: PaymentListCellViewModel) {
    titleLabel.text = viewModel.title
    guard let imageURL = viewModel.imageURL else { return }
    iconImageView.loadImageUsingCache(withUrl: imageURL.absoluteString)
  }
}

private extension PaymentListCell {
  func setup() {
    setupHorizontalStackView()
    setupIconImageView()
    setupTitleLabel()
  }

  func setupHorizontalStackView() {
    contentView.addSubview(horizontalStack)

    horizontalStack.axis = .horizontal
    horizontalStack.distribution = .fill
    horizontalStack.alignment = .center

    horizontalStack.topAnchor.constraint(
      equalTo: contentView.safeAreaLayoutGuide.topAnchor,
      constant: 8
    ).isActive = true

    horizontalStack.bottomAnchor.constraint(
      equalTo: contentView.safeAreaLayoutGuide.bottomAnchor,
      constant: -8
    ).isActive = true

    horizontalStack.leadingAnchor.constraint(
      equalTo: contentView.safeAreaLayoutGuide.leadingAnchor,
      constant: 16
    ).isActive = true

    horizontalStack.trailingAnchor.constraint(
      equalTo: contentView.safeAreaLayoutGuide.trailingAnchor,
      constant: -16
    ).isActive = true
  }

  func setupIconImageView() {
    horizontalStack.addArrangedSubview(iconImageView)
    iconImageView.widthAnchor.constraint(equalToConstant: 55).isActive = true
    iconImageView.heightAnchor.constraint(equalToConstant: 55).isActive = true
    iconImageView.contentMode = .scaleAspectFit
  }

  func setupTitleLabel() {
    horizontalStack.addArrangedSubview(titleLabel)
  }
}
