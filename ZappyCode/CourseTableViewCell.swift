//
//  CourseTableViewCellController.swift
//  ZappyCode
//
//  Created by Leandro Farias Lourenco on 07/03/23.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var courseImageView: UIImageView!
    
    @IBOutlet weak var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
