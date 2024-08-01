//
//  DetailVC.swift
//
//  Created by Yogesh Ingole on 01/08/24.
//

import UIKit

protocol ListDetailProtocol: AnyObject {
    func refreshListData()
}

class DetailVC: UIViewController {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var UniversityNamelbl: UILabel!
    @IBOutlet weak var UniversityStatelbl: UILabel!
    @IBOutlet weak var CountryNamelbl: UILabel!
    @IBOutlet weak var CountryCodelbl: UILabel!
    @IBOutlet weak var WebPagelbl: UILabel!
    
    weak var presenter : DetailViewToDetailPresenterProtocol?
    var universityIndex : Int?
    weak var delegate: ListDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let index = universityIndex else {return}
        presenter?.getUniversityDetail(at: index)
    }
    
    @IBAction func reloadListData(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        delegate?.refreshListData()
    }
}

extension DetailVC : DetailPresenterToDetailViewProtocol{
    func showUniversityDetail(data: ListModel) {
        UniversityNamelbl.text = data.name 
        UniversityStatelbl.text = data.stateProvince 
        CountryNamelbl.text = data.country 
        CountryCodelbl.text = data.alphaTwoCode 
        WebPagelbl.text = data.webPages.first
    }
}
