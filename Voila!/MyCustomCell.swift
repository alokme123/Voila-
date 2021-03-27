//
//  MyCustomCell.swift
//  Voila!
//
//  Created by Alok N on 26/03/21.
//

import UIKit

class MyCustomCell: UITableViewCell {

    //Making a Card-Like Appearance
    @IBOutlet weak var cardView: UIView!{
        didSet{
            cardView.layer.cornerRadius = 10
            cardView.layer.shadowOpacity = 0.2
            cardView.layer.shadowRadius = 6
            cardView.layer.shadowOffset = CGSize(width:2, height:3)
        }
    }
    
    //Cell Elements
    @IBOutlet weak var recipeView: UIView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeDescription: UILabel!
    @IBOutlet weak var recipeRating: UILabel!
    @IBOutlet weak var recipeImg: UIImageView!

}
