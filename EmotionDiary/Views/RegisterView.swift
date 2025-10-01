//
//  TextView.swift
//  EmotionDiary
//
//  Created by Nicole Dias on 30/09/25.
//

import SwiftUI

struct RegisterView: View {
    let register: Register
    
    private var emotionDetails: (color: Color, name: String) {
        let emotionName = register.frequentEmotion
        
        switch emotionName {
        case "Happy":
            return (color: Color("emotionHappy"), name: "Alegria")
        case "Sad":
            return (color: Color("emotionSad"), name: "Tristeza")
        case "Angry":
            return (color: Color("emotionAngry"), name: "Raiva")
        case "Neutral":
            return (color: Color("emotionNone"), name: "Neutro")
        default:
            return (color: Color("emotionNone"), name: "Neutro")
        }
    }
    
    var body: some View {
        VStack {
            HStack{
                Text("Sua emoção predominante foi: ")
                    .font(.title3)
                Text(emotionDetails.name)
                    .font(.title3)
                    .foregroundStyle(emotionDetails.color)
            }
            Text(register.content)
                           .font(.body)
                           .multilineTextAlignment(.leading)
                           .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .padding(16)
        .navigationTitle(register.title)
    }
}


#Preview {
    RegisterView(register: mockRegisters[0])
}
