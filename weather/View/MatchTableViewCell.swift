//
//  MatchTableViewCell.swift
//  weather
//
//  Created by Sachin on 03/06/19.
//  Copyright © 2019 Sachin. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {
    @IBOutlet weak var t1Label: UILabel!
    @IBOutlet weak var t2Label: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var viewHomeShadow: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewHomeShadow.dropShadow()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
