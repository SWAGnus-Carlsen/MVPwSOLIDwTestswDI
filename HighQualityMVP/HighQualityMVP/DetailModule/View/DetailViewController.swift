//
//  DetailViewController.swift
//  HighQualityMVP
//
//  Created by Vitaliy Halai on 10.06.24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()
        
    }
    
    @IBAction func tapAction(_ sender: Any) {
        presenter.tapOnPop()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        textLabel.text = comment?.body
    }
    
    
}
