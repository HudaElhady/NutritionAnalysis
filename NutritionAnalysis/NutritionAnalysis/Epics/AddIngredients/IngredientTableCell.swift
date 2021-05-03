//
//  IngredientTableCell.swift
//  NutritionAnalysis
//
//  Created by huda elhady on 02/05/2021.
//

import UIKit

class IngredientTableCell: UITableViewCell {

    @IBOutlet weak var ingredientLabel: UILabel!
    
    static let identifier = "IngredientTableCell"

    func configure(ingredient: String) {
        ingredientLabel.text = ingredient
    }
}
