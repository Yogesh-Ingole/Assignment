//
//  ListModuleProtocol.swift
//
//  Created by Yogesh Ingole on 01/08/24.
//

import Foundation
import UIKit

protocol ListViewToListPresenterProtocol: AnyObject {
    var view: ListPresenterToListViewProtocol? { get set }
    var interactor: ListPresenterToListInteractorProtocol? { get set }
    var router: ListPresenterToListRouterProtocol? { get set }
    
    func updateListView()
    func showViewController(navigationController: UINavigationController, with index: Int)
    func getUniversityListCount() -> Int?
    func getUniversityData(at index: Int) -> ListModel?
}

//MARK:- Presenter to View protocol methods
protocol ListPresenterToListViewProtocol: AnyObject {
    func showUniversityList()
    func showErrorMessage(with error: ErrorType?)
}

//MARK:- Interactor to Presenter protocol methods
protocol ListInteractorToListPresenterProtocol: AnyObject {
    func universityListFetched()
    func universityListFetchedFailed(with errorType: ErrorType?)
}

protocol ListPresenterToListInteractorProtocol: AnyObject {
    var presenter: ListInteractorToListPresenterProtocol? { get set }
    var universityList: [ListModel]? { get }
    func fetchUniversityList()
}



//MARK:- Presenter to Router protocol methods
protocol ListPresenterToListRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func pushToViewController(navigationConroller: UINavigationController, with data: Int)
    var presenter: ListRouterToListPresenterProtocol? { get set }
}

//MARK:- Router to Presenter protocol methods
protocol ListRouterToListPresenterProtocol: AnyObject {
    func updateData()
}
