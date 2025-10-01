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
    
    init(title: String = "", content: String) {
        self.id = UUID()
        self.title = title
        self.createdAt = Date()
        self.content = content
    }
}
