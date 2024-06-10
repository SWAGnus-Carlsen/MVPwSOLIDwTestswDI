//
//  MainPresenter.swift
//  HighQualityMVP
//
//  Created by Vitaliy Halai on 10.06.24.
//

import Foundation


protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init( view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getComments()
    var comments: [Comment]? { get set }
}

final class MainPresenter: MainViewPresenterProtocol {
    weak var view: (MainViewProtocol)?
    let networkService: NetworkServiceProtocol
    var comments: [Comment]?
    
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getComments()
    }
    
    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    
}
