//
//  SubtitleRoundedButton.swift
//  Weekendr
//
//  Created by Reqven on 06/09/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import UIKit

class MultipleLabelsRoundedButton: UIButton {

    // MARK: - Properties
    let primaryLabel = UILabel()
    let secondaryLabel = UILabel()
    let stackView = UIStackView()
    
    private var initialBackgroudColor: UIColor?
    
    override open var backgroundColor: UIColor? {
        didSet {
            guard !isHighlighted else { return }
            initialBackgroudColor = backgroundColor
        }
    }
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? initialBackgroudColor?.darker(by: 8) : initialBackgroudColor
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        layer.cornerRadius = 8
        backgroundColor = .systemBlue
        titleLabel?.removeFromSuperview()
        
        primaryLabel.textColor = .white
        primaryLabel.textAlignment = .center
        secondaryLabel.textColor = .white
        secondaryLabel.textAlignment = .center
        
        stackView.axis = .vertical
        stackView.isUserInteractionEnabled = false
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubviews(primaryLabel, secondaryLabel)
        
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        isHighlighted = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        isHighlighted = false
    }
}
