//
//  HomeVC.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 21/09/2022.
//

import UIKit

final class HomeViewController: UIViewController {
    private var homeView = HomeView()

    var presenter: ViewToPresenterHomeModuleCommunicator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupButtonTargets()

        presenter?.viewLoaded()
    }

    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
    }
}

// MARK: - Configuring Views
private extension HomeViewController {
    private func setupView() {
        view = homeView
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "line.3.horizontal"),
            style: .plain,
            target: self,
            action: #selector(detailButtonTapped))
    }

    private func setupButtonTargets() {
        homeView.trainingButton.addTarget(self, action: #selector(trainingButtonTapped), for: .touchUpInside)
        homeView.fightButton.addTarget(self, action: #selector(opponentsButtonTapped), for: .touchUpInside)
        homeView.shopButton.addTarget(self, action: #selector(shopButtonTapped), for: .touchUpInside)
        homeView.teamButton.addTarget(self, action: #selector(teamButtonTapped), for: .touchUpInside)
        homeView.rankButton.addTarget(self, action: #selector(rankButtonTapped), for: .touchUpInside)
    }
}

extension HomeViewController: PresenterToViewHomeModuleCommunicator {
    func updateTimeLabelAndProgressBar(with value: String, progress: Float) {
        homeView.timeLeftLabel.text = value
        homeView.timeProgress.setProgress(progress, animated: true)
    }
    
    func updateCoinValueTo(_ value: Int) {
        homeView.updateCoinValueTo(value)
    }

    func updateProgressBarsFill(
        _ fillPercent: (
            health: Float,
            stamina: Float,
            experience: Float
        )
    ) {
        homeView.updateProgressBarsFill(
            (
                health: fillPercent.health,
                stamina: fillPercent.stamina,
                experience: fillPercent.experience
            )
        )
    }

    func updateProgressBarsValue<T>(
        _ value: (
            health: T,
            stamina: T,
            experience: T
        )
    ) where T : Numeric {
        homeView.updateProgressBarsValue(
            (
                health: value.health,
                stamina: value.stamina,
                experience: value.experience
            )
        )
    }
}

@objc
extension HomeViewController {
    func rankButtonTapped() {
        guard let navigationController else { return }

        presenter?.rankButtonTapped(navigationController)
    }

    func detailButtonTapped() {
        guard let navigationController else { return }

        presenter?.detailsButtonTapped(navigationController)
    }

    func trainingButtonTapped() {
        guard let navigationController else { return }

        presenter?.trainingButtonTapped(navigationController)
    }

    func opponentsButtonTapped() {
        guard let navigationController else { return }

        presenter?.opponentsButtonTapped(navigationController)
    }

    func shopButtonTapped() {
        guard let navigationController else { return }

        presenter?.shopButtonTapped(navigationController)
    }

    func teamButtonTapped() {
        guard let navigationController else { return }

        presenter?.teamButtonTapped(navigationController)
    }
}
