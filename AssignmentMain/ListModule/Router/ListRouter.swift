//
//  ListRouter.swift
//
//  Created by Yogesh Ingole on 01/08/24.
//

import Foundation
import UIKit

class ListRouter: ListPresenterToListRouterProtocol {
    
    //MARK: - Properties
    weak var presenter: ListRouterToListPresenterProtocol?
    
    static func createModule() -> UIViewController {
        guard let view = Utility.getViewController(storyboard: .Main, identifier: .ListVC) as? ListVC else { return UIViewController () }
        
        let presenter: ListViewToListPresenterProtocol & ListInteractorToListPresenterProtocol & ListRouterToListPresenterProtocol = ListPresenter()
        let interactor: ListPresenterToListInteractorProtocol = ListInteractor()
        let router: ListPresenterToListRouterProtocol = ListRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        router.presenter = presenter
        
        return view
    }
    
    
    
    func pushToViewController(navigationConroller: UINavigationController, with data: Int) {
        guard let view = DetailRouter.createModule() as? DetailVC else { return }
        view.universityIndex = data
        view.delegate = self
        navigationConroller.pushViewController(view, animated: true)
    }
}

extension ListRouter: ListDetailProtocol {
    func refreshListData() {
        presenter?.updateData()
    }
}
