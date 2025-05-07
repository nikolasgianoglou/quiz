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
        let sut = makeSUT(answers: [makeAnswer(isCorrect: true)])

        let cell = sut.tableView.cell(at: 0) as? CorrectAnswerCell

        XCTAssertNotNil(cell)
    }

    func test_viewDidLoad_withCorrectAnswer_rendersQuestionText() {
        let answer = makeAnswer(question: "Q1", isCorrect: true)
        let sut = makeSUT(answers: [answer])

        let cell = sut.tableView.cell(at: 0) as! CorrectAnswerCell

        XCTAssertEqual(cell.questionLabel.text, "Q1")
    }

    func test_viewDidLoad_withCorrectAnswer_rendersAnswerText() {
        let answer = makeAnswer(answer: "A1", isCorrect: true)
        let sut = makeSUT(answers: [answer])

        let cell = sut.tableView.cell(at: 0) as? CorrectAnswerCell
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.answerLabel.text, "A1")
    }

    func test_viewDidLoad_withWrongAnswer_renderWrongAnswerCell() {
        let sut = makeSUT(answers: [makeAnswer(isCorrect: false)])

        let cell = sut.tableView.cell(at: 0) as? WrongAnswerCell

        XCTAssertNotNil(cell)
    }

    func test_viewDidLoad_withWrongAnswer_configuresCell() {
        let answer = makeAnswer(question: "Q1", answer: "A1", wrongAnswer: "wrong", isCorrect: false)
        let sut = makeSUT(answers: [answer])

        let cell = sut.tableView.cell(at: 0) as? WrongAnswerCell
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.questionLabel.text, "Q1")
        XCTAssertEqual(cell?.correctAnswerLabel.text, "A1")
        XCTAssertEqual(cell?.wrongAnswerLabel.text, "wrong")
    }

    func makeSUT(summary: String = "", answers: [PresentableAnswer] = []) -> ResultsViewController {
        let sut = ResultsViewController(summary: summary, answers: answers)
        _ = sut.view
        return sut
    }

    func makeDummyAnswer() -> PresentableAnswer {
        return makeAnswer(isCorrect: false)
    }

    func makeAnswer(question: String = "", answer: String = "", wrongAnswer: String? = nil, isCorrect: Bool) -> PresentableAnswer {
        return PresentableAnswer(question: question, answer: answer, wrongAnswer: wrongAnswer, isCorrect: isCorrect)
    }
}
