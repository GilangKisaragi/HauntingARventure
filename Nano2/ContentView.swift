//
//  ContentView.swift
//  Nano2
//
//  Created by Gilang Kisaragi on 15/05/24.
//

import SwiftUI
import RealityKit
import ARKit
import SceneKit

struct ContentView : View {
    @State private var showButton = false
    @Environment(\.horizontalSizeClass) var sizeClass
    var body: some View {
        if sizeClass == .compact {
            // Layout for iPhone
            ZStack {
                ARViewContainer()
                    .edgesIgnoringSafeArea(.all)
                
                Color.blue900.opacity(0.4)
                    .ignoresSafeArea()
                
                HStack {
                    VStack {
                        NavigationLink (destination: EndScreenView()) {
                            HStack {
                                Image("buttonendiP")
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 0)
                            .padding(.vertical, 24)
                        }
                        
                        Spacer()
                    }
                
                    VStack {
                        NavigationLink (destination: SecondView()) {
                            HStack {
                                if showButton {
                                    Image("buttonsceneiP")
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.horizontal, 0)
                            .padding(.vertical, 24)
                        }
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                                withAnimation {
                                    self.showButton = true
                                }
                            }
                        }
                        Spacer()
                    }
                }
            }
            .navigationBarHidden(true)
        } else {
            // Layout for iPad
            ZStack {
                ARViewContainer()
                    .edgesIgnoringSafeArea(.all)
                
                Color.blue900.opacity(0.4)
                    .ignoresSafeArea()
                
                HStack {
                    VStack {
                        NavigationLink (destination: EndScreenView()) {
                            HStack {
                                Image("buttonsuren")
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 24)
                        }
                        
                        Spacer()
                    }
                
                    VStack {
                        NavigationLink (destination: SecondView()) {
                            HStack {
                                if showButton {
                                    Image("buttonscene")
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 24)
                        }
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                                withAnimation {
                                    self.showButton = true
                                }
                            }
                        }
                        Spacer()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        arView.addCoaching()
        
        //Load cube model
        let anchor = try!Haunting.loadScene()
        // Add the horizontal plane anchor to the scene
        arView.scene.anchors.append(anchor)
        
        

        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#Preview {
    ContentView()
}
