//
//  AvatarCell.swift
//  Smack
//
//  Created by Ken Krippeler on 25.08.17.
//  Copyright © 2017 Lichtverbunden. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell
{
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView()
    {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
}
