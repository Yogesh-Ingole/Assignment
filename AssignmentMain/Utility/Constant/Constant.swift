//
//  Constant.swift
//
//  Created by Yogesh Ingole on 01/08/24.
//

import Foundation
import UIKit


enum TableViewCell : String{
    case UniversityCell = "UniversityCell"
}
enum StoryBoardID: String {
    case Main = "Main"
}
enum ViewControllerID: String {
    case ListVC = "ListVC"
    case DetailVC = "DetailVC"
}

struct APIUrl {
    static var listUrl = "http://universities.hipolabs.com/search?country=United%20Arab%20Emirates"
}

struct AlertMsg{
    static let Title_MESSAGE = "MESSAGE"
    static let Title_ERROR = "ERROR"


    static let Action_YES = "YES"
    static let Action_CANCEL = "CANCEL"
    static let Action_NO = "NO"
    static let Action_OK = "OK"
}


struct Utility{
    // MARK: - UIStoryboard
    static func getViewController(storyboard: StoryBoardID, identifier: ViewControllerID) -> UIViewController {
        let storyboard = Utility.storyboard(storyboardID: storyboard)
        return storyboard.instantiateViewController(withIdentifier: identifier.rawValue)
    }
    
    private static func storyboard(storyboardID: StoryBoardID) -> UIStoryboard {
        let storyboard = UIStoryboard(name: storyboardID.rawValue, bundle: Bundle.main)
        return storyboard
    }
}
