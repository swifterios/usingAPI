//
//  PostsTableViewCell.swift
//  usingAPI
//
//  Created by Владислав on 12.07.2021.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textBodyLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
