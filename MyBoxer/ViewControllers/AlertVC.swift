//
//  AlertVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 11/11/2022.
//

import UIKit

enum AlertType {
    static let youWin: String  = "Congratulations, you won the fight"
    static let youLose: String = "You lose, maybe try train more"
    static let youExhausted: String = "Give your boxer time to rest."
    static let notEnoughMoney: String = "Win some fight to get more cash."
    static let trainingInProgress: String = "You need to finish your training first."
}

class AlertVC: UIViewController {
    
    let container = ContainerView(frame: .zero)
    
    let alertTitle = MBLabel(size: 20)
    let alertMessage = MBLabel(size: 15)
    
    let button = UIButton(type: .roundedRect)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)

        configure()
    }
    
    convenience init(title: String, message: String) {
        self.init()
        
        alertTitle.text = title
        alertMessage.text = message
    }
    
    private func configure() {
        view.addSubviews([container, alertTitle, alertMessage, button])
        
        alertTitle.textAlignment = .center
        alertMessage.textAlignment = .center
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .systemGray3
        button.tintColor = .systemBackground
        button.setTitle("OK", for: .normal)
        button.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        button.layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
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
    
    @objc func dismissAlert() {
        self.dismiss(animated: true)
    }

}
