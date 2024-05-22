//
//  OnboardingView.swift
//  Nano2
//
//  Created by Gilang Kisaragi on 19/05/24.
//

import SwiftUI
import AVFoundation

struct OnboardingView: View {
    @State private var imageOpacity: Double = 0.0
    @State private var audioPlayer: AVAudioPlayer?
    @State private var navigateToHomePageView = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black).ignoresSafeArea()
                
                VStack(spacing: 24) {
                    ZStack {
                        
                        TypingAnimationView()
                        
                        Scary()
                            .offset(x: -175, y:-60)
                        
                        Blood()
                            .offset(x: -175)
                    }
                    
                    Image("Headset")
                        .shadow(color: Color(red: 0.86, green: 0.69, blue: 0.69), radius: 12, x: 0, y: 0)
                        .opacity(imageOpacity)
                        .onAppear {
                            fadeInImage()
                        }
                }
            }
            .onAppear {
//                playSound()
                // Navigate to `DestinationView` after 10 seconds.
                DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
                    navigateToHomePageView = true
                }
            }
            .onDisappear {
                audioPlayer?.stop()
            }
            
            NavigationLink(destination: HomePageView(), isActive: $navigateToHomePageView) {
                EmptyView()
            }
        }
    }
    
    func fadeInImage() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { // Delay of 1 second
            withAnimation(.easeIn(duration: 2.0)) {
                imageOpacity = 1.0
            }
        }
    }
    
    func playSound() {
        if let path = Bundle.main.path(forResource: "Scary Wind", ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.numberOfLoops = -1 // Loop indefinitely
                audioPlayer?.play()
            } catch {
                print("Error loading audio file: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    OnboardingView()
}
