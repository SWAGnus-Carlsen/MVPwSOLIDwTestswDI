//
//  MainViewController.swift
//  HighQualityMVP
//
//  Created by Vitaliy Halai on 10.06.24.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet weak var greetingLabel: UILabel!
    
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }

    //MARK: IBAction
    @IBAction func didTapButton(_ sender: Any) {
        presenter.showGreeting()
    }

}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        greetingLabel.text = greeting
    }
    
    
}
