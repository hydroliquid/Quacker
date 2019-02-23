//
//  QuackCellTableViewCell.swift
//  Quacker
//
//  Created by MICHAEL BENTON on 2/21/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class QuackCellTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var quackTextContent: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
