//
//  StoryBoardsIDs.swift
//  NutritionAnalysis
//
//  Created by huda elhady on 03/05/2021.
//

import Foundation

enum StoryBoardsIDs: String {
    case main = "Main"
    
    var id: String {
        return self.rawValue
    }
}

enum ViewControllersIDs: String {
    case NutritionAnalysisVC = "NutritionAnalysisViewController"
    
    var id: String {
        return self.rawValue
    }
}
