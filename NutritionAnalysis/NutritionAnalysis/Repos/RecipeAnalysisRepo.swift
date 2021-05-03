//
//  RecipeAnalysisRepo.swift
//  NutritionAnalysis
//
//  Created by huda elhady on 02/05/2021.
//

import Foundation

protocol RecipeAnalysisRepo {
    func analyzeRecipe(recipeRequest: RecipeAnalysisRequest, completionHandler: @escaping (Result<RecipeAnalysis,NetworkError>)->Void)
}

class RecipeAnalysisRepoImpl: RecipeAnalysisRepo {

    func analyzeRecipe(recipeRequest: RecipeAnalysisRequest, completionHandler: @escaping (Result<RecipeAnalysis,NetworkError>)->Void) {
        URLSession.shared.load(RecipeResource.analyzeRecipeResource(requestBody: recipeRequest)) {response in
                switch response {
                case .success(let docs):
                    completionHandler(.success(docs))
                case .failure(let error):
                    completionHandler(.failure(error))
                }
        }
    }

}
