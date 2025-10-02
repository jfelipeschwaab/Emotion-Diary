//
//  TextView.swift
//  EmotionDiary
//
//  Created by Nicole Dias on 30/09/25.
//

import SwiftUI

struct RegisterView: View {
    @Binding var register: Register
    
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
        VStack(spacing: 32) {
            VStack(spacing: 2) {
                TextField("", text: $register.title)
                               .font(.title.bold())
                               .textFieldStyle(.plain)
                               .submitLabel(.done)
                               .padding(.vertical, 4)
                HStack {
                    Text("Sua emoção predominante foi ")
                        .font(.subheadline)
                        .bold()
                    + Text(emotionDetails.name.lowercased())
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(emotionDetails.color)
                    
                    Spacer()
                }
                
                Divider()
            }

            Text(register.content)
                .font(.body)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .padding(16)
    }
}
