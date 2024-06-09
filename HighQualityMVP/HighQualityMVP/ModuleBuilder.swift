//
//  ModuleBuilder.swift
//  HighQualityMVP
//
//  Created by Vitaliy Halai on 10.06.24.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

final class ModuleBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let model = Person(firstName: "Erling", lastName: "Haaland")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        return view
    }
}
