//
//  NetworkManager.swift
//  CGAssessment
//
//  Created by Yogesh Ingole on 01/08/24.
//

import Foundation
import Alamofire

//MARK: - Custom errors
enum ErrorType: Error {
    case ServerError
    case NoDataFound
    case DecodingError
    case NoNetwork
    
    var localizedDescription: String {
        switch  self {
        case .ServerError:
            return "Server error"
        case .DecodingError:
            return "Data parsing error"
        case .NoDataFound:
            return "No Data Found"
        case .NoNetwork:
            return "No Internet Connection"
        }
    }
}

//MARK: - NetworkManagerProtocol methods
protocol NetworkManagerProtocol {
    func getRequest<T: Decodable>(url: URL, type: T.Type, completionHandler: @escaping (_ data: T?, _ error: ErrorType?) -> Void)
}

//MARK: - NetworkManager class for making API calls and class conforms to NetworkManagerProtocol.
class NetworkManager: NetworkManagerProtocol {
    func getRequest<T>(url: URL, type: T.Type, completionHandler: @escaping (T?, ErrorType?) -> Void) where T : Decodable {
        
        if Connectivity.isConnectedToInternet() {
            AF.request(url).response { response in
                if response.response?.statusCode == 200 {
                    guard let data = response.data else {
                        return completionHandler(nil, .NoDataFound)
                    }
                    do {
                        let decoder = JSONDecoder()
                        let jsonData = try decoder.decode(type.self, from: data)
                        completionHandler(jsonData, nil)
                    } catch {
                        completionHandler(nil, .DecodingError)
                    }
                } else {
                    completionHandler(nil, .ServerError)
                }
            }
        } else {
            completionHandler(nil, .NoNetwork)
        }
    }
}

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
