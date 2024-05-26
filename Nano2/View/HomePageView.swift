//
//  HomePageView.swift
//  Nano2
//
//  Created by Gilang Kisaragi on 19/05/24.
//

import SwiftUI
import AVFoundation

struct HomePageView: View {
    
    init(){
        for family in UIFont.familyNames {
            print(family)
            for names in UIFont.fontNames(forFamilyName: family){
                print("== \(names)")
            }
        }
    }
    
    @Environment(\.horizontalSizeClass) var sizeClass
    @State private var audioPlayerA: AVAudioPlayer?
    @State private var audioPlayerB: AVAudioPlayer?
    
    var body: some View {
        if sizeClass == .compact {
            // Layout for iPhone
            NavigationStack {
                ZStack {
                    Image("Backround")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                    VStack(spacing: 16) {
                        ZStack {
                            Text("Haunting").font(Font.custom("WaterBrush-Regular", size: 140))
                                .foregroundColor(.red500)
                                .opacity(0.5)
                            
                            Text("Haunting").font(Font.custom("SreeKrushnadevaraya", size: 100))
                                .foregroundColor(.blue50)
                                .offset(y: -20)
                            
                            Text("ARventure")
                                .font(Font.custom("SreeKrushnadevaraya", size: 100))
                                .foregroundColor(.blue50)
                                .offset(y:60)
                        }
                        
                        NavigationLink(destination: TutorialView()) {
                            Image("ButtonPlayiP")
                            .shadow(color: Color(red: 0.86, green: 0.69, blue: 0.69), radius: 12, x: 0, y: 0)
                        }
                    }
                }
                .onAppear {
                    playSoundA()
                    playSoundB()
                }
                .onDisappear {
                    audioPlayerA?.stop()
                    audioPlayerB?.stop()
            }
            }
            .navigationBarBackButtonHidden()
        } else {
            // Layout for iPad
            NavigationStack {
                ZStack {
                    Image("Backround")
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack(spacing: 40) {
                        ZStack {
                            Text("Haunting").font(Font.custom("WaterBrush-Regular", size: 250))
                                .foregroundColor(.red500)
                                .opacity(0.5)
                            
                            Text("Haunting").font(Font.custom("SreeKrushnadevaraya", size: 180))
                                .foregroundColor(.blue50)
                                .offset(y: -20)
                            
                            Text("ARventure")
                                .font(Font.custom("SreeKrushnadevaraya", size: 180))
                                .foregroundColor(.blue50)
                                .offset(y:110)
                        }
                        
                        NavigationLink(destination: TutorialView()) {
                            Image("ButtonPlay")
                            .shadow(color: Color(red: 0.86, green: 0.69, blue: 0.69), radius: 12, x: 0, y: 0)
                        }
                    }
                }
                .onAppear {
                    playSoundA()
                    playSoundB()
                }
                .onDisappear {
                    audioPlayerA?.stop()
                    audioPlayerB?.stop()
            }
            }
            .navigationBarBackButtonHidden()
        }
    }
    
    func playSoundA() {
        if let path = Bundle.main.path(forResource: "Night Forest 1224", ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayerA = try AVAudioPlayer(contentsOf: url)
                audioPlayerA?.numberOfLoops = -1 // Loop indefinitely
                audioPlayerA?.play()
            } catch {
                print("Error loading audio file: \(error.localizedDescription)")
            }
        }
    }
    
    func playSoundB() {
        if let path = Bundle.main.path(forResource: "Rain Thunderstorm Loop", ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayerB = try AVAudioPlayer(contentsOf: url)
                audioPlayerB?.numberOfLoops = -1 // Loop indefinitely
                audioPlayerB?.play()
            } catch {
                print("Error loading audio file: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    HomePageView()
}
