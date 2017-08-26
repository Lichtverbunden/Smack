//
//  CircleImage.swift
//  Smack
//
//  Created by Ken Krippeler on 26.08.17.
//  Copyright © 2017 Lichtverbunden. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView
{
    override func awakeFromNib()
    {
        super.awakeFromNib()
        setupView()
    }

    func setupView()
    {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder()
    {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}
