//
//  AlertView.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 22/01/2024.
//

import UIKit
import DesignSystem

class AlertView: UIView {
    
    private let container = ContainerView()

    private(set) var alertTitle = MBLabel(size: 20)
    private(set) var alertMessage = MBLabel(size: 15)
    private(set) var button = UIButton(type: .roundedRect)

    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AlertView {
    func setupView() {
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)

        addSubviews([container, alertTitle, alertMessage, button])

        alertTitle.textAlignment = .center
        alertMessage.textAlignment = .center

        button.translatesAutoresizingMaskIntoConstraints = false

        button.backgroundColor = .systemGray3
        button.tintColor = .systemBackground
        button.setTitle("OK", for: .normal)
        button.layer.cornerRadius = 5
    }

    func setupViewConstraints() {
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: centerXAnchor),
            container.centerYAnchor.constraint(equalTo: centerYAnchor),
            container.heightAnchor.constraint(equalToConstant: 150),
            container.widthAnchor.constraint(equalToConstant: 353),

            alertTitle.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            alertTitle.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            alertTitle.heightAnchor.constraint(equalToConstant: 20),
            alertTitle.widthAnchor.constraint(equalToConstant: 300),

            alertMessage.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            alertMessage.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            alertMessage.heightAnchor.constraint(equalToConstant: 20),
            alertMessage.widthAnchor.constraint(equalToConstant: 300),

            button.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10),
            button.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
}
