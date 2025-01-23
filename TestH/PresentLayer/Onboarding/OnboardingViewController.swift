//
//  OnboardingViewController.swift
//  TestH
//
//  Created by sherbakova on 25.08.2024.
//

import UIKit

protocol OnboardingViewControllerProtocol: AnyObject {}

final class OnboardingViewController: UIViewController, OnboardingViewControllerProtocol {

    private let coordinator: AppCoordinator
    private let zodiacList: [ZodiacType] = ZodiacType.allCases

    private var selectedSign: ZodiacType?

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ZodiacListCell.self, forCellWithReuseIdentifier: "ZodiacListCell")
        return collectionView
    }()
    
    private let selectSignLabel = UILabel()
    private let nextButton = UIButton()
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        selectSignLabel.text = "Выберите знак"
        selectSignLabel.textColor = .white
        nextButton.setTitle("Далее", for: .normal)
        collectionView.backgroundColor = .black
        nextButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        configureLayout()
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return zodiacList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZodiacListCell", for: indexPath) as! ZodiacListCell
        let list = zodiacList[indexPath.row]
        let isSelected = list == selectedSign
        cell.update(image: list.model.icon, name: list.model.name, period: list.model.period, isSelected: isSelected)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = zodiacList[indexPath.row]
        selectedSign = item
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 32
        return CGSize(width: width, height: 80)
    }
}

private extension OnboardingViewController {
    
    func configureLayout() {
        view.addSubview(selectSignLabel)
        view.addSubview(collectionView)
        view.addSubview(nextButton)
        
        selectSignLabel.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            selectSignLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectSignLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            selectSignLabel.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -20),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -20),
            
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func buttonTapped() {
        guard let selectedSign = selectedSign else {
            return
        }
        UserDefaultsManager.setValue(value: selectedSign.rawValue, for: .userZodiacType)
        coordinator.createMainModule()
        UserDefaultsManager.isOnboardingPassed = true
    }
}
