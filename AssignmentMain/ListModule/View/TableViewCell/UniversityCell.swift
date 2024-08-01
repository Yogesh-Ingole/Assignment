//
//  UniversityCell.swift
//
//  Created by Yogesh Ingole on 01/08/24.
//

import UIKit
import SwiftUI

class UniversityCell: UITableViewCell {
    
    @IBOutlet weak var universityNameLbl : UILabel!
    @IBOutlet weak var universityStateLbl : UILabel!
    @IBOutlet weak var arrowView : UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setNeumorphicCircle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func populateDataIntoCell(data: ListModel?) {
        self.universityNameLbl.text = data?.name ?? ""
        self.universityStateLbl.text = data?.country ?? ""
    }
}

extension UniversityCell{
    func setNeumorphicCircle(){
        let childView = UIHostingController(rootView: NemorphicCircleView())
        childView.view.frame = self.arrowView.bounds
        self.arrowView.addSubview(childView.view)
    }
}
