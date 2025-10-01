//
//  RegisterModel.swift
//  EmotionDiary
//
//  Created by Lizandra Malta on 01/10/25.
//

import Foundation

struct Register: Identifiable, Hashable {
    
    var id: UUID
    var title: String
    var createdAt: Date
    var content: String
    var frequentEmotion: String
    
    init(title: String = "Novo registro", content: String, frequentEmotion: String) {
        self.id = UUID()
        self.title = title
        self.createdAt = Date()
        self.content = content
        self.frequentEmotion = frequentEmotion
    }
}
