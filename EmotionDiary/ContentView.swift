//
//  ContentView.swift
//  EmotionDiary
//
//  Created by João Felipe Schwaab on 30/09/25.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented: Bool = false
    var body: some View {
        NavigationStack{
            VStack {
                
                List{
                    Section{
                        
                        Text ("Meu Aniversário")
                        
                    }
                }
            }
            .navigationTitle(Text("Diário"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        isPresented =  true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.purple)
                    }
                    
                    
                    
                    
                }
            }
            
            .searchable(text: .constant(""))
            
            .sheet(isPresented: $isPresented ){
                RecordingView()
                    .presentationDetents([.fraction(0.2)])
            }
            
        }
    }
}
#Preview {
    ContentView()
}
