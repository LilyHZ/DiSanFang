//
//  UserInfoTableViewCell.swift
//  SideMenuFromGitHub
//
//  Created by Nirvana on 5/5/15.
//  Copyright (c) 2015 Nirvana. All rights reserved.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var UserPhotoPicture: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var InfoA: UILabel!
    @IBOutlet weak var InfoB: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
