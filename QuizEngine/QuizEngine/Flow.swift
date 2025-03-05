//
//  Flow.swift
//  QuizEngine
//
//  Created by Nikolas Gianoglou Coelho on 21/02/25.
//

import Foundation

protocol Router {
    typealias AnswerCallback = (String) -> Void
    func routeTo(question: String, answerCallback: @escaping AnswerCallback)
}

class Flow {
    private let router: Router
    private let questions: [String]

    init(questions: [String], router: Router) {
        self.questions = questions
        self.router = router
    }

    func start() {
        if let firstQuestion = questions.first {
            router.routeTo(question: firstQuestion, answerCallback: routeNext(from: firstQuestion))
        }
    }

    private func routeNext(from question: String) -> Router.AnswerCallback {
        return { [weak self] _ in
            guard let self else { return }
            if let currentQuestionIndex = questions.firstIndex(of: question) {
                if currentQuestionIndex+1 < questions.count {
                    let nextQuestion = questions[currentQuestionIndex+1]
                    router.routeTo(question: nextQuestion, answerCallback: routeNext(from: nextQuestion))
                }
            }
        }
    }
}
