//
//  RecipeAnalysisRequest.swift
//  NutritionAnalysis
//
//  Created by huda elhady on 02/05/2021.
//

import Foundation

struct RecipeAnalysisRequest : Encodable {

    let ingr : [String]?
    let prep : String?
    let title : String?
    let yield : String?

}
