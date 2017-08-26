//
//  ChannelCell.swift
//  Smack
//
//  Created by Sanjay Vekariya on 8/23/17.
//  Copyright © 2017 Sanjay Vekariya. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }

    }

    func configureCell(channel: Channel) {
        let channelName = channel.channelTitle ?? ""
        title.text = "#\(channelName)"
    }

}
