//
//  ZodiacListViewController.swift
//  TestH
//
//  Created by sherbakova on 15.08.2024.
//

import UIKit

protocol ZodiacListViewControllerProtocol {}

final class ZodiacListViewController: UIViewController {
    
    private let coordinator: AppCoordinator
    private let presenter: ZodiacListPresenterProtocol

    private let zodiacList: [ZodiacType] = ZodiacType.allCases
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "numerology")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    private let logoContainerView = UIView()
    
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
    
    init(coordinator: AppCoordinator,
         presenter: ZodiacListPresenterProtocol) {
        self.coordinator = coordinator
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        collectionView.backgroundColor = .black
        configureLayout()
        
        if let tabBarHeight = (self.tabBarController as? TabBarController)?.tabBarView.frame.height {
            collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: tabBarHeight, right: 0)
        }
    }
}

extension ZodiacListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        zodiacList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZodiacListCell", for: indexPath) as! ZodiacListCell
        let list = zodiacList[indexPath.row]
        cell.update(image: list.model.icon, name: list.model.name, period: list.model.period, isSelected: false)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = zodiacList[indexPath.row]
        coordinator.showHoroscope(zodiac: item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 32
        return CGSize(width: width, height: 80)
    }
}

extension ZodiacListViewController: ZodiacListViewControllerProtocol {}

private extension ZodiacListViewController {
    
    func configureLayout() {
        view.addSubview(logoContainerView)
        logoContainerView.translatesAutoresizingMaskIntoConstraints = false
        logoContainerView.addSubview(logoImageView)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            logoContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logoContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            logoContainerView.heightAnchor.constraint(equalToConstant: 80),
            
            logoImageView.centerXAnchor.constraint(equalTo: logoContainerView.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: logoContainerView.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalTo: logoContainerView.widthAnchor, multiplier: 0.2),
            logoImageView.heightAnchor.constraint(equalTo: logoContainerView.heightAnchor, multiplier: 0.6),
        
            collectionView.topAnchor.constraint(equalTo: logoContainerView.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
