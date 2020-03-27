//
//  UserCell.swift
//  iOSTest
//
//  Created by abdul on 27/03/20.
//  Copyright © 2020 abdul. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var subtitleText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupDataWith(source:EmployeeData) {
        titleText.text = source.employee_name
        subtitleText.text = "Age - \(source.employee_age ?? "-")"
    }
    
}

extension UserCell : CellIdentifiable {}
