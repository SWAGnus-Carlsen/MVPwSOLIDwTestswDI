//
//  ModuleBuilder.swift
//  HighQualityMVP
//
//  Created by Vitaliy Halai on 10.06.24.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createDetailModule(comment: Comment?) -> UIViewController
}

final class ModuleBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let networkService = NetworkService()
        let view = MainViewController()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createDetailModule(comment: Comment?) -> UIViewController {
        let networkService = NetworkService()
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, networkService: networkService, comment: comment)
        view.presenter = presenter
        return view
    }
}
