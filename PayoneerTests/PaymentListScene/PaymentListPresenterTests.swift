//
//  PaymentListPresenterTests.swift
//  PayoneerTests
//
//  Created by Gungor Basa on 5/20/21.
//
import XCTest
@testable import Payoneer

final class PaymentListPresenterTests: XCTestCase {
  private var view: MockPaymentListView!
  private var interactor: MockPaymentListInteractor!

  private let dataFactory = MockPaymentListTableViewDataFactory(result: [])
  private let router = MockPaymentListRouter()

  override func setUpWithError() throws {
    view = MockPaymentListView()
    interactor = MockPaymentListInteractor()
  }

  func testOnViewDidLoad() {
    let presenter = PaymentListPresenter(
      view,
      interactor: interactor,
      dataFactory: dataFactory,
      router: router
    )
    presenter.onViewDidLoad()
    XCTAssertTrue(interactor.isFetched, "Should call interactor fetch method")
  }

  func testDisplayPaymentList() {
    let presenter = PaymentListPresenter(
      view,
      interactor: interactor,
      dataFactory: dataFactory,
      router: router
    )

    let paymentList = PaymentList(networks: Networks(applicable: []))
    let result: PaymentListInteractorOutput = .payments(paymentList)

    presenter.handleOutput(result)

    let expectation = self.expectation(description: "DispatchQueu.main.testDisplayPaymentList")
    // Call is being made in main thread
    DispatchQueue.main.async {
      expectation.fulfill()
    }

    waitForExpectations(timeout: 1, handler: nil)
    switch view.output {
    case .showPaymentMethods(let payments):
      XCTAssertTrue(
        payments.count == paymentList.networks.applicable.count,
        "Displayed cell count should be same with model data count"
      )
    default:
      XCTFail("Should call showPaymentMethods")
    }
  }

  func testDisplayError() {
    let presenter = PaymentListPresenter(
      view,
      interactor: interactor,
      dataFactory: dataFactory,
      router: router
    )

    let result: PaymentListInteractorOutput = .error(NSError(domain: "", code: 0) as Error)

    presenter.handleOutput(result)

    let expectation = self.expectation(description: "DispatchQueu.main.testDisplayError")
    // Call is being made in main thread
    DispatchQueue.main.async {
      expectation.fulfill()
    }

    waitForExpectations(timeout: 1, handler: nil)
    switch
      router.to {
    case .showMessage(let message) where message == "Encountered an error. Please, try again!":
      break
    default:
      XCTFail("Should show correct error message with alert view")
    }
  }
}
