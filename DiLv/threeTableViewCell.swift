//
//  threeTableViewCell.swift
//  DiLv
//
//  Created by Grandre on 17/5/3.
//  Copyright © 2017年 革码者. All rights reserved.
//

import UIKit

class threeTableViewCell: UITableViewCell {

    @IBOutlet weak var userPhoto: UIButton!
    
    @IBOutlet weak var userName: UIButton!
    @IBOutlet weak var address: UIButton!

    @IBOutlet weak var date: UIButton!
    
    
    @IBOutlet weak var showImageView: UIImageView!
    
    @IBOutlet weak var bigTitle: UILabel!
    
    @IBOutlet weak var smallTitle: UILabel!
    
    @IBOutlet weak var classify: UIButton!
    
    @IBOutlet weak var readNum: UIButton!
    
    @IBOutlet weak var commentNum: UIButton!
    
    @IBOutlet weak var likeNum: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
