//
//  Meme.swift
//  MemePrediction
//
//  Created by Иван Семикин on 19/07/2025.
//

import Foundation

struct APIResponse {
    let succes: Bool
    let data: [Meme]
}

struct Meme {
    let id: String
    let name: String
    let url: String
    let width: Int
    let height: Int
    let boxCount: Int
    let captions: Int
    
    enum CodingKeys: String, CodingKey {
        case boxCount = "box_count"
    }
}
