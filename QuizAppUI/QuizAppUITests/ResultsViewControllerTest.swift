//
//  ResultsViewControllerTest.swift
//  QuizAppUITests
//
//  Created by Nikolas Gianoglou Coelho on 05/05/25.
//

import Foundation
import XCTest
@testable import QuizAppUI

class ResultsViewControllerTest: XCTestCase {

    func test_viewDidLoad_renderSummary() {
        XCTAssertEqual(makeSUT(summary: "a summary").headerLabel.text, "a summary")
    }

    func test_viewDidLoad_renderAnswers() {
        XCTAssertEqual(makeSUT(answers: []).tableView.numberOfRows(inSection: 0), 0)
        let sut = makeSUT(answers: [makeDummyAnswer()])
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }

    func test_viewDidLoad_withCorrectAnswer_renderCorrectAnswerCell() {
        let sut = makeSUT(answers: [PresentableAnswer(isCorrect: true)])

        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView.cell(at: 0) as? CorrectAnswerCell

        XCTAssertNotNil(cell)
    }

    func test_viewDidLoad_withWrongAnswer_renderWrongAnswerCell() {
        let sut = makeSUT(answers: [PresentableAnswer(isCorrect: false)])

        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView.cell(at: 0) as? WrongAnswerCell

        XCTAssertNotNil(cell)
    }

    func makeSUT(summary: String = "", answers: [PresentableAnswer] = []) -> ResultsViewController {
        let sut = ResultsViewController(summary: summary, answers: answers)
        _ = sut.view
        return sut
    }

    func makeDummyAnswer() -> PresentableAnswer {
        return PresentableAnswer(isCorrect: false)
    }
}
