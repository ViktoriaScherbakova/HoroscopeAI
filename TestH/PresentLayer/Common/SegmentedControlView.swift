//
//  SegmentedControlView.swift
//  TestH
//
//  Created by sherbakova on 29.08.2024.
//

import UIKit

final class SegmentedControlCustomView: UIView {

    private var buttons: [UIButton] = []
    private var selectorView: UIView!
    private var selectedIndex: Int = 0
    
    var buttonTitles: [String] = [] {
        didSet {
            updateView()
        }
    }
    var buttonSelected: ((Int) -> Void)?
    
    init(titles: [String]) {
        self.buttonTitles = titles
        super.init(frame: .zero)
        updateView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateView()
    }
    
    private func updateView() {
        buttons.forEach { $0.removeFromSuperview() }
        buttons.removeAll()
        
        for (index, buttonTitle) in buttonTitles.enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            button.tag = index
            buttons.append(button)
        }
        
        configureSelectorView()
        setupStackView()
        updateUI()
    }
    
    private func configureSelectorView() {
        selectorView = UIView()
        selectorView.backgroundColor = .white
        addSubview(selectorView)
    }
    
    private func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func updateUI() {
        for (index, button) in buttons.enumerated() {
            let titleColor: UIColor = (index == selectedIndex) ? .white : .lightGray
            button.setTitleColor(titleColor, for: .normal)
        }
        
        layoutIfNeeded()
        
        selectorView.frame = CGRect(
            x: buttons[selectedIndex].frame.origin.x,
            y: buttons[selectedIndex].frame.height,
            width: buttons[selectedIndex].frame.width,
            height: 2
        )
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        selectedIndex = sender.tag
        buttonSelected?(selectedIndex)
        updateUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateUI()
    }
}

