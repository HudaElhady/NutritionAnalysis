//
//  BaseRepoMock.swift
//  NutritionAnalysisTests
//
//  Created by huda elhady on 03/05/2021.
//

import Foundation

@testable import NutritionAnalysis

class BaseRepoMock {
    var shouldSuccess: Bool = false
    var failReponse: NetworkError!
}
