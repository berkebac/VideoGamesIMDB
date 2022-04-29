//
//  VideoGameTableViewCell.swift
//  VideoGamesIMDB
//
//  Created by Berke Baç on 28.04.2022.
//

import UIKit

class VideoGameTableViewCell: UITableViewCell {

    @IBOutlet weak var gameNameText: UILabel!
    @IBOutlet weak var ratingText: UILabel!
    
    @IBOutlet weak var ImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
