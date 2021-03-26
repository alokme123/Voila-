//
//  ViewController.swift
//  Voila!
//
//  Created by Alok N on 26/03/21.
//

import UIKit

class ViewController: UIViewController {

    //TableView Data
    var recipeDict = [
        "dosa":["South Indian Dosa","That simple dish you'll be a star at!"],
        "burger":["Mountain Burger","The best burger!"],
        "eggbir":["Egg Biriyani","Simple yet Tasty Egg Biriyani"],
        "kerala":["Homely Meals","The smell of home"],
        "northindian":["Aloo Paratha","Traditional North Indian Spicy Parathas"],
        "prawns":["Prawns de La Qure","Some interesting name, huh?"]
    ]
    
    //UI Elements
    @IBOutlet weak var recipeView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeView.delegate = self
        recipeView.dataSource = self
        recipeView.separatorStyle = .none
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recipeView.dequeueReusableCell(withIdentifier: "customCell") as! MyCustomCell
        let recipe = [String](recipeDict.keys)[indexPath.row]
        cell.recipeTitle.text = recipeDict[recipe]![0]
        cell.recipeDescription.text = recipeDict[recipe]![1]
        cell.recipeImg.image = UIImage(named:recipe)
        cell.recipeRating.text = "4.2"
        return cell
    }
    
}
