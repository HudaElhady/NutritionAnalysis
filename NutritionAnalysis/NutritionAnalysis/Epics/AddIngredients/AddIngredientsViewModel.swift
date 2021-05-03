//
//  AddIngredientsViewModel.swift
//  NutritionAnalysis
//
//  Created by huda elhady on 02/05/2021.
//

import Foundation

class AddIngredientsViewModel: BaseViewModel {

    private var recipeRepo: RecipeAnalysisRepo
    var recipeAnalysis:Dynamic<TotalDaily> = Dynamic(TotalDaily())
    var errorMessage: Dynamic<String> = Dynamic("")
    
    init(recipeRepo: RecipeAnalysisRepo = RecipeAnalysisRepoImpl()) {
        self.recipeRepo = recipeRepo
        super.init(isLoading: false)
    }

    func analyze(ingr: [String]) {
        startLoading()
        let recipeRequest = RecipeAnalysisRequest(ingr: ingr, prep: "", title: "", yield: "")
        recipeRepo.analyzeRecipe(recipeRequest: recipeRequest) { [weak self] (result) in
            self?.stopLoading()
            switch result {
            case .success(let response):
                if let dailyTotal = response.totalDaily {
                    self?.recipeAnalysis.value = dailyTotal
                } else {
                    self?.errorMessage.value = "Something went wrong"
                }
                
            case .failure(let error):
                self?.errorMessage.value = error.errorMessage
            }
        }
    }
    
    func convertToDailyNutritionArray(from dailyNutrition: TotalDaily) -> [CA] {
        var result = [CA]()
        Mirror(reflecting: dailyNutrition).children.forEach { child in
            if let property = child.value as? CA {
            result.append(property)
            }
        }
        return result
    }

}
