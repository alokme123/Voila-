//
//  ViewController.swift
//  Voila!
//
//  Created by Alok N on 26/03/21.
//

import UIKit

var recipeDict = [
    "dosa":["South Indian Dosa","That simple dish you'll be a star at!","https://www.indianhealthyrecipes.com/dosa-recipe-dosa-batter/","4.5"],
    "burger":["Mountain Burger","The best burger!","https://natashaskitchen.com/perfect-burger-recipe/","3.9"],
    "eggbir":["Egg Biriyani","Simple yet Tasty Egg Biriyani","https://www.indianhealthyrecipes.com/egg-biryani-recipe-how-to-make-easy-egg-biryani/","4.0"],
    "kerala":["Homely Meals","The smell of home","https://www.sharmispassions.com/south-indian-lunch-recipes/","3.8"],
    "northindian":["Aloo Paratha","Traditional North Indian Spicy Parathas","https://www.indianhealthyrecipes.com/aloo-paratha/","4.2"],
    "prawns":["Prawns de La Qure","Some interesting name, huh?","https://www.recipetineats.com/garlic-prawns-shrimp/","4.3"]
]

class ViewController: UIViewController {
    
    var recipe:String = "dosa" // Global Variable to Send Data

    //TableView Data
    var currentDict = recipeDict
    
    //UI Elements
    @IBOutlet weak var recipeView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adding SearchBar
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        //Initializing TableView
        recipeView.delegate = self
        recipeView.dataSource = self
        recipeView.separatorStyle = .none
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource, UISearchResultsUpdating{
    
    //SearchResultsController
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        for (item, itemDetails) in recipeDict{
            if(itemDetails[0].contains(searchText)){
                currentDict = [item: itemDetails]
                DispatchQueue.main.async {
                    self.recipeView.reloadData()
                }
            }
        }
    }
    
    //Adding Recipe Data to Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let chosenRecipe = recipeDict[recipe]
        let destinationVC = segue.destination as! recipeWebViewViewController
        destinationVC.recipe = chosenRecipe
    }
    
    //When Row Selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        recipe = [String](recipeDict.keys)[indexPath.row]//Finding Selected Recipe
        performSegue(withIdentifier: "homeToWeb",sender:nil)//Performing Segue
    }
    
    //Returning No. of Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDict.count
    }
    
    //Populating TableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recipeView.dequeueReusableCell(withIdentifier: "customCell") as! MyCustomCell // Adding MyCustomCell Class
        
        let recipe = [String](currentDict.keys)[indexPath.row]
        cell.recipeTitle.text = recipeDict[recipe]![0]
        cell.recipeDescription.text = recipeDict[recipe]![1]
        cell.recipeImg.image = UIImage(named:recipe)
        cell.recipeRating.text = recipeDict[recipe]![3]
        
        return cell
    }
    
}
