//
//  RecordingView.swift
//  EmotionDiary
//
//  Created by Nicole Dias on 30/09/25.
//
import SwiftUI

struct RecordingView: View {
    @State var isRecording = false
    var body: some View {
        NavigationView{
            VStack {
                
                Button{
                    isRecording = true
                } label: {
                    if(isRecording) {
                        HStack{
                            Button {
                                isRecording = false
                            } label: {
                       
                                Image(systemName: "stop.circle.fill")
                                    .foregroundStyle(.purple)
                                    .font(.system(size: 70))
                            }
                           
                   
                        }
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
}

#Preview {
    RecordingView()
}
