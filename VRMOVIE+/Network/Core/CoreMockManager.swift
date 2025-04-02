//
//  MockManager.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 12.03.2025.
//

import Foundation

enum MockError: Error {
    case fileError
}
protocol MockUseCase {
    func loadJson<T:Decodable>(fileName: String, type: T.Type, completion: ((T?, String?) -> Void)) throws
}

final class CoreMockManager: MockUseCase {
    
    func loadJson<T:Decodable>(fileName: String, type: T.Type, completion: ((T?, String?) -> Void)) throws {
        
        guard let file = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw MockError.fileError
        }
        guard let data = try? Data(contentsOf: file) else { return }
        
        do {
            let model = try JSONDecoder().decode(type, from: data)
            completion(model, nil)
        }
        catch {
            completion(nil, error.localizedDescription)
            print("error")
        }
    }
}
