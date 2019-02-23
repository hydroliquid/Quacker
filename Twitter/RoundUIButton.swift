//
//  RoundUIButton.swift
//  Quacker
//
//  Created by MICHAEL BENTON on 2/14/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

@IBDesignable
class RoundUIButton: UIButton
{
    @IBInspectable var cornerRadius: CGFloat = 3.0
    {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView()
    {
        self.layer.cornerRadius = cornerRadius
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
