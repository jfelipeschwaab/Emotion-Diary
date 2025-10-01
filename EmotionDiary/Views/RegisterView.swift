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
