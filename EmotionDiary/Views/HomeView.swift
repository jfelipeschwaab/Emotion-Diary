//
//  ContentView.swift
//  EmotionDiary
//
//  Created by João Felipe Schwaab on 30/09/25.
//

import SwiftUI

struct HomeView: View {
    @State var registers: [Register] = mockRegisters
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack {
                List{
                    ForEach(registers) { register in
                        NavigationLink {
                            RegisterView(register: register)
                        } label : {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(register.title)
                                        .font(.headline)
                                    
                                    Text(formatDate(register.createdAt))
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
                                
                            }
                            .contentShape(Rectangle())
                        }
                        
                    }
                }
                .listStyle(.inset)
            }
            .navigationTitle("Diário")
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
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
}
#Preview {
    HomeView()
}
