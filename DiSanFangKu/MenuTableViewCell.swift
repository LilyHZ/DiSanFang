//
//  MenuTableViewCell.swift
//  SideMenuFromGitHub
//
//  Created by Nirvana on 5/5/15.
//  Copyright (c) 2015 Nirvana. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var MenuPicture: UIImageView!
    @IBOutlet weak var MenuLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
