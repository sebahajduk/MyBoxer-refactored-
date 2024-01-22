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

class AlertViewController: UIViewController {
    
    private let alertView = AlertView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    convenience init(title: String, message: String) {
        self.init()
        
        alertView.alertTitle.text = title
        alertView.alertMessage.text = message
    }
    
    private func setupView() {
        view = alertView
        alertView.button.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
    }
    
    @objc
    func dismissAlert() {
        self.dismiss(animated: true)
    }
}
