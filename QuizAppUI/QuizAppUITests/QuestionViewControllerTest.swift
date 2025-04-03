//
//  QuestionViewControllerTest.swift
//  QuizAppUITests
//
//  Created by Nikolas Gianoglou Coelho on 10/03/25.
//

import Foundation
import XCTest
@testable import QuizAppUI

class QuestionViewControllerTest: XCTestCase {
    func test_viewDidLoad_rendersQuestionHeaderText() {
        let sut = makeSUT(question: "Q1")

        XCTAssertEqual(sut.headerLabel.text, "Q1")
    }

    func test_viewDidLoad_withNoOptions_rendersZeroOptions() {
        let sut = makeSUT(options: [])

        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }

    func test_viewDidLoad_withOneOption_rendersOneOption() {
        let sut = makeSUT(options: ["A1"])

        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }

    func test_viewDidLoad_withOneOption_rendersOneOptionText() {
        let sut = makeSUT(options: ["A1"])

        let cellText = sut.tableView.title(at: 0)

        XCTAssertEqual(cellText, "A1")
    }

    func test_optionSelected_notifiesDelegate() {
        var receivedAnswer = [String]()
        let sut = makeSUT(options: ["A1"]) {
            receivedAnswer = $0
        }

        sut.tableView.select(row: 0)

        XCTAssertEqual(receivedAnswer, ["A1"])
    }

    func test_optionSelected_withTwoOptions_notifiesDelegateWithLastSelection() {
        var receivedAnswer = [String]()
        let sut = makeSUT(options: ["A1", "A2"]) {
            receivedAnswer = $0
        }

        sut.tableView.select(row: 0)

        XCTAssertEqual(receivedAnswer, ["A1"])

        sut.tableView.select(row: 1)

        XCTAssertEqual(receivedAnswer, ["A2"])
    }

    func test_optionSelected_withMultipleOptionsSelected_notifiesDelegateSelection() {
        var receivedAnswer = [String]()
        let sut = makeSUT(options: ["A1", "A2"]) { receivedAnswer = $0 }
        sut.tableView.allowsMultipleSelection = true

        sut.tableView.select(row: 0)

        XCTAssertEqual(receivedAnswer, ["A1"])

        sut.tableView.select(row: 1)

        XCTAssertEqual(receivedAnswer, ["A1", "A2"])
    }

    //MARK: - Helpers
    func makeSUT(question: String = "",
                 options: [String] = [],
                 selection: @escaping ([String]) -> Void = { _ in }) -> QuestionViewController {
        let sut = QuestionViewController(question: question, options: options, selection: selection)
        _ = sut.view
        return sut
    }
}

private extension UITableView {
    func cell(at row: Int) -> UITableViewCell? {
        return dataSource?.tableView(self, cellForRowAt: IndexPath(row: row, section: 0))
    }

    func title(at row: Int) -> String? {
        return cell(at: row)?.textLabel?.text
    }

    func select(row: Int) {
        let indexPath = IndexPath(row: row, section: 0)
        selectRow(at: indexPath, animated: false, scrollPosition: .none)
        delegate?.tableView?(self, didSelectRowAt: IndexPath(row: row, section: 0))
    }
}
