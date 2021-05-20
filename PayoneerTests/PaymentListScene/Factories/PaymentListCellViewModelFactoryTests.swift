//
//  PaymentListCellViewModelFactoryTests.swift
//  PayoneerTests
//
//  Created by Gungor Basa on 5/20/21.
//

import XCTest
@testable import Payoneer

final class PaymentListCellViewModelFactoryTests: XCTestCase {
  private let factory = PaymentListCellViewModelFactory()

  func testFactoryIdTitleAndImageURL() throws {
    let link = PaymentLink(logo: "https://www.google.com")
    let network = Network(code: "VISA", label: "VISA LABEL", links: link)

    let result = factory.make(from: network)

    XCTAssertTrue(result.id == network.code, "Wrong Id")
    XCTAssertTrue(result.title == network.label, "Wrong title")
    XCTAssertTrue(result.imageURL == URL(string: link.logo), "Wrong Logo url")
  }
}
