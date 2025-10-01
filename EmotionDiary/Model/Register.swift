//
//  RegisterModel.swift
//  EmotionDiary
//
//  Created by Lizandra Malta on 01/10/25.
//

import Foundation

class Register: Identifiable {
    
    var id: UUID
    var title: String
    var createdAt: Date
    var content: [Word]
    
    init(title: String = "", content: [Word]) {
        self.id = UUID()
        self.title = title
        self.createdAt = Date()
        self.content = content
    }
}
