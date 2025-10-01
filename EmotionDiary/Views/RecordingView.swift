//
//  RecordingView.swift
//  EmotionDiary
//
//  Created by Nicole Dias on 30/09/25.
//
import SwiftUI
import HumanSpeech

struct RecordingView: View {
    @State var isRecording = false
    @StateObject private var speechRecognizer = SpeechRecognizer()
    
    var onFinishRecording: ((String) -> Void)?

    

    var body: some View {
        NavigationView{
            VStack {
                Button{
                    toggleRecording()
                } label: {
                    if(isRecording) {
                        Image(systemName: "stop.circle.fill")
                            .foregroundStyle(.purple)
                            .font(.system(size: 70))
                    } else {
                        Image(systemName: "microphone.circle.fill")
                            .foregroundStyle(.purple)
                            .font(.system(size: 70))
                    }
                    
                }
            }
            .navigationTitle(Text("Grave seu relato"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func toggleRecording() {
        isRecording.toggle()
        
        if isRecording {
            speechRecognizer.startTranscribing()
        } else {
            speechRecognizer.stopTranscribing()
            
            onFinishRecording?(speechRecognizer.transcript)
        }
    }
    
    func reset() {
        speechRecognizer.resetTranscript()
        isRecording = false
    }
}

#Preview {
    RecordingView()
}
