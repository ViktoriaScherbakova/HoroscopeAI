//
//  ZodiacListCell.swift
//  TestH
//
//  Created by sherbakova on 15.08.2024.
//

import UIKit

final class ZodiacListCell: UICollectionViewCell {

    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let periodLabel = UILabel()
    private let checkmarkImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLayout()
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(image: UIImage?, name: String, period: String, isSelected: Bool) {
        imageView.image = image
        nameLabel.text = name
        periodLabel.text = period
        checkmarkImageView.isHidden = !isSelected
    }

    private func configureView() {
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true

        nameLabel.textColor = .lightGray
        periodLabel.textColor = .lightGray

        checkmarkImageView.image = UIImage(named: "checkmarkInRound")
        checkmarkImageView.tintColor = .white
        checkmarkImageView.isHidden = true
        imageView.tintColor = .black
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 10
    }

    private func configureLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        periodLabel.translatesAutoresizingMaskIntoConstraints = false
        checkmarkImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(periodLabel)
        contentView.addSubview(checkmarkImageView)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50),

            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),

            periodLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            periodLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            checkmarkImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            checkmarkImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkmarkImageView.heightAnchor.constraint(equalToConstant: 20),
            checkmarkImageView.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
}
