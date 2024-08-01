//
//  ListVC.swift
//
//  Created by Yogesh Ingole on 01/08/24.
//

import UIKit
import SwiftUI

class ListVC: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var tableBGView : UIView!
    
    var presenter: ListViewToListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableview()
        self.setNeumorphicCircle()
        presenter?.updateListView()
    }
    
}
extension ListVC{
    func setupTableview(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: TableViewCell.UniversityCell.rawValue, bundle: nil), forCellReuseIdentifier: TableViewCell.UniversityCell.rawValue)
    }
    
        func setNeumorphicCircle(){
            let childView = UIHostingController(rootView: NemorphicView())
            childView.view.frame = self.tableBGView.bounds
            self.tableBGView.addSubview(childView.view)
        }
    
    
}

extension ListVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getUniversityListCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.UniversityCell.rawValue, for: indexPath) as? UniversityCell else { return UITableViewCell() }
        let cellData = presenter?.getUniversityData(at: indexPath.row)
        cell.populateDataIntoCell(data: cellData)
        return cell
    }
    
}

extension ListVC : UITableViewDelegate{
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let nav = navigationController{
            presenter?.showViewController(navigationController: nav, with: indexPath.row)
        }
    }
}

extension ListVC: ListPresenterToListViewProtocol {
    func showUniversityList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showErrorMessage(with error: ErrorType?) {
        let alert = UIAlertController(title: AlertMsg.Title_ERROR, message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: AlertMsg.Action_OK, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

