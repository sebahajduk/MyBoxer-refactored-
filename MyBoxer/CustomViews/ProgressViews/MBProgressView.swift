//
//  MBProgressView.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 21/09/2022.
//

import UIKit

enum MBProgressType {
    case hp
    case stamina
    case experience
    case time
}

class MBProgressView: UIProgressView {
    
    let title = MBLabel(size: 14)
    let showTitle: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(for type: MBProgressType, showTitle: Bool = true) {
        self.init()
        configure(type: type, showTitle: showTitle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(type: MBProgressType, showTitle: Bool) {
        progressViewStyle = .default
        trackTintColor = .secondarySystemBackground
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        switch type {
        case .hp:
            progressTintColor = .systemRed
            if showTitle {
                title.text = "Health"
            }
        case .stamina:
            progressTintColor = .systemMint
            if showTitle {
                title.text = "Stamina"
            }
        case .experience:
            progressTintColor = .systemCyan
            if showTitle {
                title.text = "Experience"
            }
        case .time:
            progressTintColor = .systemGreen
            if showTitle {
                title.text = "Time"
            }
        }
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            title.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
    
}
