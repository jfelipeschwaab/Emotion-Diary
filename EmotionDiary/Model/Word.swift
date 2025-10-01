//
//  Word.swift
//  EmotionDiary
//
//  Created by Lizandra Malta on 01/10/25.
//

import Foundation

enum Emotion {
    case happy, sad, angry, none
}

class Word: Identifiable {
    var id: UUID
    var emotion: Emotion
    var word: String
    
    init(emotion: Emotion, word: String) {
        self.id = UUID()
        self.emotion = emotion
        self.word = word
    }
}
