//
//  MainPresenter.swift
//  HighQualityMVP
//
//  Created by Vitaliy Halai on 10.06.24.
//

import Foundation

///Output
protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

/// Input
protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getComments()
    var comments: [Comment]? { get set }
    func tapOnComment(comment: Comment?)
}

final class MainPresenter: MainViewPresenterProtocol {
    
    
    weak var view: (MainViewProtocol)?
    let router: RouterProtocol
    let networkService: NetworkServiceProtocol
    var comments: [Comment]?
    
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getComments()
    }
    
    func tapOnComment(comment: Comment?) {
        router.showDetail(comment: comment)
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
