//
//  RecordingView.swift
//  EmotionDiary
//
//  Created by Nicole Dias on 30/09/25.
//
import SwiftUI
import HumanSpeech
import EmotionClassification

struct RecordingView: View {
    @State var isRecording = false
    @StateObject private var speechRecognizer = SpeechRecognizer()
    @StateObject var audioVM = AudioViewModel()

    
    var onFinishRecording: ((String, String) -> Void)?

    

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
            audioVM.startAnalysis()
        } else {
            speechRecognizer.stopTranscribing()
            audioVM.stopAnalysis()
            onFinishRecording?(speechRecognizer.transcript, audioVM.mostFrequentSoundInSession)
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
