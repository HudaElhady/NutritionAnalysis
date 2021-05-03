//
//  RecipeAnalysisRepoMock.swift
//  NutritionAnalysisTests
//
//  Created by huda elhady on 03/05/2021.
//

import Foundation

@testable import NutritionAnalysis

class RecipeAnalysisRepoMock: BaseRepoMock, RecipeAnalysisRepo {
    var recipeAnalysisSuccess: RecipeAnalysis!
    
    func analyzeRecipe(recipeRequest: RecipeAnalysisRequest, completionHandler: @escaping (Result<RecipeAnalysis,NetworkError>)->Void) {
        shouldSuccess ? completionHandler(.success(recipeAnalysisSuccess)) : completionHandler(.failure(failReponse))
    }
}
