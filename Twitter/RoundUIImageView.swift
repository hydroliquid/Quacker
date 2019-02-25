//
//  RoundUIImageView.swift
//  Twitter
//
//  Created by Js on 2/24/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class RoundUIImageView: UIImageView
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
        self.clipsToBounds = true
    }


}
