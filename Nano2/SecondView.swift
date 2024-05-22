//
//  SecondView.swift
//  Nano2
//
//  Created by Gilang Kisaragi on 22/05/24.
//

import SwiftUI
import ARKit
import RealityKit

struct SecondView: View {
    var body: some View {
        ZStack {
            ARViewContainer2()
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
            }
            
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

struct ARViewContainer2: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        arView.addCoaching()
        
        //Load cube model
        let anchor = try!Secondscene.loadScene1()
        
        // Add the horizontal plane anchor to the scene
        arView.scene.anchors.append(anchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}


#Preview {
    SecondView()
}
