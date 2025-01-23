//
//  TabBar.swift
//  TestH
//
//  Created by sherbakova on 15.08.2024.
//

import UIKit

final class TabBar: UITabBar {
    
    var onItemTapped: ((Int) -> Void)?
    
    // Метод настройки иконок вкладок
    func configureTabsIcons(names: [String]) {
        for (index, name) in names.enumerated() {
            let button = UIButton()
            button.setImage(UIImage(named: name)?.withRenderingMode(.alwaysTemplate), for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            button.layer.masksToBounds = true
            button.imageView?.contentMode = .scaleAspectFit
            button.tintColor = .gray // Установка начального цвета иконок
            
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 30),
                button.widthAnchor.constraint(equalToConstant: 30)
            ])
            
            buttons.append(button)
            stackView.addArrangedSubview(button)
        }
        
        // Выделим первый тап по умолчанию
        if let firstButton = buttons.first {
            highlightButton(firstButton)
        }
    }
    
    private func highlightButton(_ button: UIButton) {
        for btn in buttons {
            btn.tintColor = .gray
        }
        button.tintColor = .white
    }
    
    @objc private func buttonTapped(_ button: UIButton) {
        onItemTapped?(button.tag)
        highlightButton(button)
    }
    
    private let stackView = UIStackView()
    private var buttons: [UIButton] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView() {
        barTintColor = .black
        addSubview(stackView)
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
