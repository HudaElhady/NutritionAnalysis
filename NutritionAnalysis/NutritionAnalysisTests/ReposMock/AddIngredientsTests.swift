//
//  AddIngredientsTests.swift
//  NutritionAnalysisTests
//
//  Created by huda elhady on 04/05/2021.
//

import XCTest
@testable import NutritionAnalysis

class LoginTests: XCTestCase {
    var viewModel: AddIngredientsViewModel!
    var recipeAnalysisRepo: RecipeAnalysisRepoMock!
    
    override func setUpWithError() throws {
        
        recipeAnalysisRepo = RecipeAnalysisRepoMock()
        viewModel = AddIngredientsViewModel(recipeRepo: recipeAnalysisRepo)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        recipeAnalysisRepo = nil
    }
    
    func testAnalyzeFailWithRequestFailedError() {
        //Given
        recipeAnalysisRepo.shouldSuccess = false
        recipeAnalysisRepo.failReponse = .requestFailed
        //When
        viewModel.analyze(ingr: [])
        //Then
        
        XCTAssertEqual(viewModel.errorMessage.value, "Internet connection error")
    }
    
    func testAnalyzeFailWithBadURLError() {
        //Given
        recipeAnalysisRepo.shouldSuccess = false
        recipeAnalysisRepo.failReponse = .badURL
        //When
        viewModel.analyze(ingr: [])
        //Then
        
        XCTAssertEqual(viewModel.errorMessage.value, "Bad URL")
    }
    
    func testAnalyzeFailWithUnknownErrorError() {
        //Given
        recipeAnalysisRepo.shouldSuccess = false
        recipeAnalysisRepo.failReponse = .unknown
        //When
        viewModel.analyze(ingr: [])
        //Then
        XCTAssertEqual(viewModel.errorMessage.value, "Unknown error")
    }
    
    func testAnalyzeSucceeded(){
        //Given
        let ingredients = ["1 fresh ham, about 18 pounds", "7 cloves garlic, minced"]
        let ENERC_KCAL = CA(label: "Energy", quantity: 830.1420759555, unit: "%")
        let FAT = CA(label: "Fat", quantity: 1967.3194314951693, unit: "%")
        var totalDaily = TotalDaily()
        totalDaily.eNERCKCAL = ENERC_KCAL
        totalDaily.fAT = FAT
        
        let recipeAnalysisResponse = RecipeAnalysis(calories: 200, cautions: [], dietLabels: [], healthLabels: [], totalDaily: totalDaily, totalNutrients: nil, totalNutrientsKCal: nil, totalWeight: 200, uri: "", yield: 0)
        
        //When
        recipeAnalysisRepo.shouldSuccess = true
        recipeAnalysisRepo.recipeAnalysisSuccess = recipeAnalysisResponse
        viewModel.analyze(ingr: ingredients)
        //Then
        XCTAssertEqual(viewModel.recipeAnalysis.value.eNERCKCAL?.quantity, totalDaily.eNERCKCAL?.quantity)
        XCTAssertEqual(viewModel.isLoading.value, false)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
