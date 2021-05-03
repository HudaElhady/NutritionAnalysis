//
//  RecipeResource.swift
//  NutritionAnalysis
//
//  Created by huda elhady on 02/05/2021.
//

import Foundation

struct RecipeResource {
    
    static func analyzeRecipeResource(requestBody: RecipeAnalysisRequest) -> Resource<RecipeAnalysis> {
        let urlString = (Constants.baseUrl +  "nutrition-details?app_id=\(Constants.appId)&app_key=\(Constants.appKey)").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return Resource<RecipeAnalysis>(url: URL(string: urlString)!, method: .post(requestBody))
    }
}
