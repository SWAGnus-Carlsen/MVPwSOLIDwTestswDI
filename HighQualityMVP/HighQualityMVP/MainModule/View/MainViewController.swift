//
//  MainViewController.swift
//  HighQualityMVP
//
//  Created by Vitaliy Halai on 10.06.24.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: IBOutlet
    
    @IBOutlet weak var myTableView: UITableView!
    
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let comment = presenter.comments?[indexPath.row]
        
        cell.textLabel?.text = comment?.body
        return cell
    }
    
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let comment = presenter.comments?[indexPath.row]
        presenter.tapOnComment(comment: comment)
    }
    
}

extension MainViewController: MainViewProtocol {
    func success() {
        myTableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
