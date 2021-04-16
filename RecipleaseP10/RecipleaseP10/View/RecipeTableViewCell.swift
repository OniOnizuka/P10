//
//  RecipeTableViewCell.swift
//  RecipleaseP10
//
//  Created by Alexandre NYS on 16/04/2021.
// Copyright © 2020 Alexandre NYS. All rights reserved.

import UIKit

// Custom table view cell for the recipe list

class RecipeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeIngredients: UILabel!
    @IBOutlet weak var cookingTimeLabel: UILabel!
    @IBOutlet weak var yieldLabel: UILabel!
    
    // overriding this func so we don't have previous image in cell during loading
    override func prepareForReuse() {
        super .prepareForReuse()
        recipeImageView.image = nil
        recipeImageView.backgroundColor = .black
    }
    // func that will alow us to configure the cell 
    func configure(title: String, ingredients: String, time: Int, yield: Int) {
        recipeTitle.text = title
        recipeIngredients.text = ingredients
        cookingTimeLabel.text = time == 0 ? "N/A" : String(time)
        yieldLabel.text = yield == 0 ? "N/A" : String(yield)
    }
}
