//
//  ReusableButton.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 12.02.2025.
//

import UIKit

class ReusableButton: UIButton {
    private var title: String!
    private var cornerRad: CGFloat
    private var bgColor: UIColor
    private var titleColor: UIColor
    private var titleSize: CGFloat
    private var titleFont: String
    private var onAction: (() -> Void)
    private var borderColor: UIColor
    private var borderWidth: CGFloat
    
    init(title: String!, onAction: (@escaping () -> Void), cornerRad: CGFloat = 12, bgColor: UIColor = .gray, titleColor: UIColor = .white, titleSize: CGFloat = 16, titleFont: String = "Futura", borderColor: UIColor = .clear, borderWidth: CGFloat = 0) {
        self.title = title
        self.onAction = onAction
        self.bgColor = bgColor
        self.cornerRad = cornerRad
        self.titleColor = titleColor
        self.titleSize = titleSize
        self.titleFont = titleFont
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        super.init(frame: .zero)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton() {
        if let font = UIFont(name: titleFont, size: titleSize) {
            let attributedTitle = NSAttributedString(string: title, attributes: [.font: font])
            setAttributedTitle(attributedTitle, for: .normal)
        } else {
            print("Warning: Font '\(titleFont)' not found. Using system font instead.")
            let fallbackFont = UIFont.systemFont(ofSize: titleSize)
            let attributedTitle = NSAttributedString(string: title, attributes: [.font: fallbackFont])
            setAttributedTitle(attributedTitle, for: .normal)
        }

        setTitleColor(titleColor, for: .normal)
        backgroundColor = bgColor
        layer.cornerRadius = cornerRad
        titleLabel?.textAlignment = .center
        layer.masksToBounds = true
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
       
    @objc private func buttonTapped() {
        onAction()
    }
}
