//
//  ServerManager.swift
//  NutritionAnalysis
//
//  Created by huda elhady on 01/05/2021.
//

import Foundation

enum HttpMethod<Body> {
    case get
    case post(Body)
    var method: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
}

extension HttpMethod {
    func map<B>(f: (Body)->B) -> HttpMethod<B> {
        switch self {
        case .get:
            return .get
        case .post (let body):
            return .post(f(body))
        }
    }
}

extension URLSession {
    func load<A>(_ resource: Resource<A>, completion: @escaping (Result<A, NetworkError>) -> Void) {
        dataTask(with: resource.urlRequest) { data, response, error in
            DispatchQueue.main.async {
                print(response)
            if data != nil, let result = data.flatMap(resource.parse) {
                completion(.success(result))
            } else if error != nil {
                completion(.failure(.requestFailed))
            } else {
                completion(.failure(.unknown))
            }
            }
        }.resume()
    }
}
