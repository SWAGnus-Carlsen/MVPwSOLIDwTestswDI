//
//  DetailPresenter.swift
//  HighQualityMVP
//
//  Created by Vitaliy Halai on 10.06.24.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment?)
    func setComment()
}

final class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol
    var comment: Comment?
    
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
    }
    
    public func setComment() {
        self.view?.setComment(comment: comment)
    }
    
    
    
    
}
