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



}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        textLabel.text = comment?.body
    }
    
    
}
