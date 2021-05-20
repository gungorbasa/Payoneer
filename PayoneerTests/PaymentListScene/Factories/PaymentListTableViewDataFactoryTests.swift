//
//  PaymentListTableViewDataFactoryTests.swift
//  PayoneerTests
//
//  Created by Gungor Basa on 5/20/21.
//

import XCTest
@testable import Payoneer

final class PaymentListTableViewDataFactoryTests: XCTestCase {
  private let mockFactory = MockPaymentListCellViewModelFactory(id: "ID", url: nil, title: "Title")
  private lazy var factory = PaymentListTableViewDataFactory(factory: mockFactory)

  func testPaymentListData() throws {
    let link = PaymentLink(logo: "https://www.google.com")
    let network = Network(code: "VISA", label: "VISA LABEL", links: link)
    let networks = [network, network, network]

    let result = factory.make(from: networks)

    XCTAssertTrue(result.count == networks.count, "#of results and #of networks should be same")
    result.forEach {
      XCTAssertTrue($0.id == "ID", "id should be ID")
      XCTAssertTrue($0.title == "Title", "Title should be ID")
      XCTAssertTrue($0.imageURL == nil, "URL should be nil")
    }
  }
}
