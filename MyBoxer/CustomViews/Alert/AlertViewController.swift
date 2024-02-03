//
//  AlertVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 11/11/2022.
//

import UIKit

class AlertViewController: UIViewController {
    
    private let alertView = AlertView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    convenience init(alertType: AlertType) {
        self.init()
        
        alertView.alertTitle.text = alertType.title
        alertView.alertMessage.text = alertType.localizedDescription
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
