//
//  QHSMainTableViewCell.swift
//  QHSTableViewPractice
//
//  Created by david on 2017/3/24.
//  Copyright © 2017年 Charles. All rights reserved.
//

import UIKit

class QHSMainTableViewCell: UITableViewCell {

    typealias funcBlock = () -> ()

    var blkExpand: funcBlock?
    
    @IBAction func actionExpand(_ sender: Any) {
        if blkExpand != nil {
            blkExpand!()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
