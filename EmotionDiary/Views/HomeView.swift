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
    @State var showSaveAlert: Bool = false
    @State var tempTranscript: String? = nil
    @State var selectedRegister: Register? = nil
    @State var tempFrequentEmotion: String? = nil
    
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
                RecordingView { transcript, mostFrequentEmotion in
                    tempTranscript = transcript
                    tempFrequentEmotion = mostFrequentEmotion
                    showSaveAlert = true
                }
                .presentationDetents([.fraction(0.2)])
            }
            .alert("Salvar relato?", isPresented: $showSaveAlert) {
                Button("Descartar", role: .cancel) {
                    tempTranscript = nil
                    isPresented = false
                }
                Button("Salvar") {
                    if let text = tempTranscript {
                        let novoRegistro = Register(content: text, frequentEmotion: tempFrequentEmotion!)
                        registers.append(novoRegistro)
                        selectedRegister = novoRegistro
                    }
                    tempTranscript = nil
                    tempFrequentEmotion = nil
                    isPresented = false
                }
            } message: {
                if let text = tempTranscript {
                    Text("\"\(text.prefix(80))...\"")
                }
            }

            .navigationDestination(item: $selectedRegister) { register in
                RegisterView(register: register)
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
