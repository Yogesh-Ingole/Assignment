//
//  DetailInteractor.swift
//
//  Created by Yogesh Ingole on 01/08/24.
//

import Foundation
import Alamofire

class DetailInteractor : DetailPresenterToDetailInteractorProtocol{
    var presenter: DetailInteractorToDetailPresenterProtocol?
    private let dataStorage = RealmStorageManager.shared
    
    func getUniversityDetail(at index: Int) {
        if let _ = dataStorage.fetchData(obj: ListModel.self) {
            let universityList = dataStorage.fetchData(obj: ListModel.self) as? [ListModel]
            print("List of data", universityList)
            self.presenter?.UnivercityDetailFetched(data: universityList![index])
        } else {
            print("Sorry")
        }
    }
}
