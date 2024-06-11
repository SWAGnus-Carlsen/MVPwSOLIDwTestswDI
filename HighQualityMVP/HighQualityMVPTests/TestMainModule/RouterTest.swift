//
//  RouterTest.swift
//  HighQualityMVPTests
//
//  Created by Vitaliy Halai on 10.06.24.
//

import XCTest
@testable import HighQualityMVP

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

final class RouterTest: XCTestCase {

    var router: RouterProtocol!
    let navigationController =  MockNavigationController()
    let assembly = ModuleBuilder()
    
    override func setUpWithError() throws {
       
        router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
       router = nil
    }

    func testRouter() {
        router.showDetail(comment: nil)
        let detailViewController = navigationController.presentedVC
        XCTAssertTrue(detailViewController is DetailViewController)
    }

}
