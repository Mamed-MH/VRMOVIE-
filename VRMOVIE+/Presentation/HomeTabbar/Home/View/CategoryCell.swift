//
//  CategoryCell.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 16.02.2025.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let sectionColors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemCyan
    ]
    
    private var sectionIndex: Int = 0
    
    private var sectionColor: UIColor = .systemPink
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                contentView.backgroundColor = sectionColor.withAlphaComponent(0.3)
                contentView.layer.borderWidth = 1.5
                contentView.layer.borderColor = sectionColor.cgColor
                titleLabel.textColor = sectionColor
                titleLabel.font = .systemFont(ofSize: 14, weight: .bold)
            } else {
                contentView.backgroundColor = .clear
                contentView.layer.borderWidth = 1
                contentView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
                titleLabel.textColor = .white
                titleLabel.font = .systemFont(ofSize: 14, weight: .regular)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.layer.cornerRadius = 15
        contentView.clipsToBounds = true
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    func configure(with title: String, isSelected: Bool, sectionColor: UIColor) {
        titleLabel.text = title
        self.sectionColor = sectionColor
        self.isSelected = isSelected
    }
} 
