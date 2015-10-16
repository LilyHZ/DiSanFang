//
//  QuoteCell.swift
//  DiSanFangKu
//
//  Created by xly on 15/9/24.
//  Copyright (c) 2015年 Lily. All rights reserved.
//

import UIKit

class QuoteCell: UITableViewCell {

    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var actAndSceneLabel: UILabel!
    @IBOutlet weak var quotationTextView: UITextView!
    
    var quotation: Quotation!
    
    var longPressRecognizer: UILongPressGestureRecognizer?
    
    // 设置语录
    func setTheQuotation(newQuotation: Quotation) {
        
        quotation = newQuotation
        
        self.characterLabel.text = quotation.character
        self.actAndSceneLabel.text = "Act \(quotation.act), Scene \(quotation.scene)"
        self.quotationTextView.text = quotation.quotation
    }
    
    // 长按手势判定
    func setTheLongPressRecognizer(newLongPressRecognizer: UILongPressGestureRecognizer?) {
        
        if longPressRecognizer != nil {
            self.removeGestureRecognizer(longPressRecognizer!)
        }
        
        if newLongPressRecognizer != nil {
            self.addGestureRecognizer(newLongPressRecognizer!)
        }
        
        longPressRecognizer = newLongPressRecognizer
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
