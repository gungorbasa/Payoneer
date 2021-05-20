//
//  PaymentListPresenterTests.swift
//  PayoneerTests
//
//  Created by Gungor Basa on 5/20/21.
//
import XCTest
@testable import Payoneer

final class PaymentListViewTests: XCTestCase {
  private var view: PaymentListViewController!
  private var presenter: MockPaymentListPresenter!

  override func setUpWithError() throws {
    view = PaymentListViewController()
    presenter = MockPaymentListPresenter()
    view.presenter = presenter
  }

  func testViewDidLoad() {
    view.loadViewIfNeeded()
    view.viewDidLoad()

    XCTAssertTrue(presenter.isViewDidLoad, "Should call presenter onViewDidLoad")
  }
}
