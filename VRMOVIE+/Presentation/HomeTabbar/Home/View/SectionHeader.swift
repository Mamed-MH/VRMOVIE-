//
//  SectionHeader.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 14.02.2025.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var gradientLayer: CAGradientLayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer?.frame = bounds
    }
    
    private func setupUI() {
        
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.systemPink.withAlphaComponent(0.2).cgColor,
            UIColor.clear.cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        layer.insertSublayer(gradient, at: 0)
        gradientLayer = gradient
        
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configure(with title: String, isActive: Bool = false) {
        titleLabel.text = title
        
       
        let startColor = isActive ? UIColor.systemPink.withAlphaComponent(0.4) : UIColor.systemPink.withAlphaComponent(0.2)
        gradientLayer?.colors = [
            startColor.cgColor,
            UIColor.clear.cgColor
        ]
    }
} 
