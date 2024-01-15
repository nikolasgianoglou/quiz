//
//  TableViewHeader.swift
//  Quiz
//
//  Created by Nikolas Coelho on 15/01/24.
//

import Foundation
import UIKit

class HeaderView: UIView {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "What's Mike's nationality?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(label)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}
