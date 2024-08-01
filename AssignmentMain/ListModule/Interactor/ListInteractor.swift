//
//  ListInteractor.swift
//
//  Created by Yogesh Ingole on 01/08/24.
//

import Foundation
import Alamofire

class ListInteractor: ListPresenterToListInteractorProtocol {
    
    //MARK: - Properties
    weak var presenter: ListInteractorToListPresenterProtocol?
    var universityList: [ListModel]?
    private var networkManager: NetworkManagerProtocol = NetworkManager()
    private let dataStorage = RealmStorageManager.shared

    
    func fetchUniversityList() {
        guard let url = URL(string: APIUrl.listUrl) else {
            return
        }
        self.networkManager.getRequest(url: url, type: [ListModel].self) { [weak self] data, error in
            guard let self = self else { return }
            if error == nil, let data = data, data.count > 0 {
                DispatchQueue.main.async {
                    self.dataStorage.deleteAll(obj: ListModel.self)
                    self.dataStorage.saveData(data: data)
                    self.universityList = data
                    self.presenter?.universityListFetched()
                }
            } else {
                if let _ = dataStorage.fetchData(obj: ListModel.self) {
                    self.universityList = dataStorage.fetchData(obj: ListModel.self)
                    self.presenter?.universityListFetched()
                } else {
                    switch error {
                    case .NoNetwork:
                        self.presenter?.universityListFetchedFailed(with: .NoNetwork)
                    default:
                        self.presenter?.universityListFetchedFailed(with: .NoDataFound)
                    }
                }
            }
        }
    }
}
