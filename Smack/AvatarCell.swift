//
//  AvatarCell.swift
//  Smack
//
//  Created by Sanjay Vekariya on 8/20/17.
//  Copyright © 2017 Sanjay Vekariya. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    func setUpView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
    }
    
}
