//
//  ViewController.swift
//  TestH
//
//  Created by sherbakova on 10.08.2024.
//

import UIKit

protocol HoroscopeViewControllerProtocol {}

final class HoroscopeViewController: UIViewController {

    private let presenter: HoroscopePresenterProtocol
    private let coordinator: AppCoordinator
    private let zodiac: ZodiacType
    
    private var horoscope: Horoscope?
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let zodiacImageView = UIImageView()
    private let zodiacNameLabel = UILabel()
    private let horoscopeLabel = UILabel()
    
    init(presenter: HoroscopePresenterProtocol,
         coordinator: AppCoordinator,
         zodiac: ZodiacType) {
        self.presenter = presenter
        self.coordinator = coordinator
        self.zodiac = zodiac
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented. Use init(presenter:coordinator:zodiac:) instead.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.requestHoroscope()
        configureNavBar()
        configureLayout()
        configureView()
        horoscopeLabel.text = "Гороскоп на сегодня" // TODO: make from api
        zodiacImageView.image = zodiac.model.image
        zodiacNameLabel.text = zodiac.model.name
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Создание и настройка градиентного слоя
               let gradientLayer = CAGradientLayer()
               gradientLayer.frame = view.bounds
               
               // Параметры градиента (цвета)
               gradientLayer.colors = [
                UIColor(hex: "#0e1010")?.cgColor,
                UIColor(hex: "#12221e")?.cgColor,
                UIColor(hex: "#181b13")?.cgColor
               ]
               
               gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
               gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
               
               view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension HoroscopeViewController: HoroscopeViewControllerProtocol {}

private extension HoroscopeViewController {
    
    func configureView() {
        view.backgroundColor = .black
        zodiacImageView.contentMode = .scaleAspectFit
        zodiacNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        horoscopeLabel.font = UIFont.systemFont(ofSize: 16)
        horoscopeLabel.numberOfLines = 0
        
        zodiacNameLabel.textColor = .lightGray
        horoscopeLabel.textColor = .lightGray
        
        zodiacNameLabel.textAlignment = .center
    }
    
    func configureLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        zodiacImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(zodiacImageView)
        
        zodiacNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(zodiacNameLabel)
        horoscopeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(horoscopeLabel)
        
        NSLayoutConstraint.activate([
            zodiacNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            zodiacNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            zodiacNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            zodiacImageView.topAnchor.constraint(equalTo: zodiacNameLabel.bottomAnchor, constant: 60),
            zodiacImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            zodiacImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            zodiacImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
        
            horoscopeLabel.topAnchor.constraint(equalTo: zodiacImageView.bottomAnchor, constant: 60),
            horoscopeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            horoscopeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            horoscopeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    func configureNavBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.backgroundColor = .clear
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
    }
}
