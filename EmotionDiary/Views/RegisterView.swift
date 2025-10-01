//
//  TextView.swift
//  EmotionDiary
//
//  Created by Nicole Dias on 30/09/25.
//

import SwiftUI

struct RegisterView: View {
    let register: Register
    
    var body: some View {
        VStack {
            textWithEmotions(from: register.content)
                           .font(.body)
                           .multilineTextAlignment(.leading)
                           .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .padding(16)
        .navigationTitle(register.title)
    }
    
    private func textWithEmotions(from content: [Word]) -> Text {
            content.reduce(Text("")) { partial, word in
                partial + Text(word.word)
                    .foregroundStyle(color(for: word.emotion))
            }
        }
    
    private func color(for emotion: Emotion) -> Color {
            switch emotion {
            case .happy: return .emotionHappy
            case .sad: return .emotionSad
            case .angry: return .emotionAngry
            case .none: return .emotionNone
            }
    }
}


#Preview {
    RegisterView(register: mockRegisters[0])
}
