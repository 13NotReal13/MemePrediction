//
//  APIManager.swift
//  MemePrediction
//
//  Created by Иван Семикин on 19/07/2025.
//

import Foundation
import Combine

final class APIManager: ObservableObject {
    
    func getMemes() throws -> AnyPublisher<[Meme], Error> {
        guard let url = URL(string: "https://api.imgflip.com/get_memes") else {
            throw URLError(.badURL)
        }
        
        let request = URLRequest(url: url)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      200..<300 ~= httpResponse.statusCode else {
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: [Meme].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
