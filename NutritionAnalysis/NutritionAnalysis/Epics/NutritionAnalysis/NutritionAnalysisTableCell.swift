//
//  NutritionAnalysisTableCell.swift
//  NutritionAnalysis
//
//  Created by huda elhady on 03/05/2021.
//

import UIKit

class NutritionAnalysisTableCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    
    static let identifier = "NutritionAnalysisTableCell"

    func configure(details: CA) {
        nameLabel.text = details.label
        quantityLabel.text = "\(details.quantity ?? 0)"
        unitLabel.text = details.unit
    }
}
