//
//  MyCustomCell.swift
//  Voila!
//
//  Created by Alok N on 26/03/21.
//

import UIKit

class MyCustomCell: UITableViewCell {

    
    @IBOutlet weak var cardView: UIView!{
        didSet{
            cardView.backgroundColor = UIColor.clear
            cardView.layer.shadowOpacity = 1
            cardView.layer.shadowRadius = 2
            cardView.layer.shadowOffset = CGSize(width:3, height:3)
        }
    }
    @IBOutlet weak var recipeView: UIView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeDescription: UILabel!
    @IBOutlet weak var recipeRating: UILabel!
    @IBOutlet weak var recipeImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
