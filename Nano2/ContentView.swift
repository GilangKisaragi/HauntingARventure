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
    
    var body: some View {
        
        ZStack {
            ARViewContainer()
                .edgesIgnoringSafeArea(.all)
            
            Color.blue900.opacity(0.4)
                .ignoresSafeArea()
            
            VStack {
                NavigationLink (destination: HomePageView()) {
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
        .navigationBarHidden(true)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        arView.addCoaching()
        
        //Load cube model
        let anchor = try!Haunting.loadScene()

////        Load the USDZ Model
//        guard let modelEntity = try? ModelEntity.loadModel(named: "Indonesian ghost kuntilanak") else {
//             fatalError("Failed to load the USDZ model")
//         }
//        
//        // Set the custom position of the modelEntity here
//        let position = SIMD3<Double>(x: 0.6, y: 0, z: 0.5) // Set the custom position here
//        let floatPosition = SIMD3<Float>(Float(position.x), Float(position.y), Float(position.z))
//        modelEntity.position = floatPosition
//        
//        // Create horizontal plane anchor for the content
//        modelEntity.setScale(SIMD3(x: 1, y: 1, z: 1), relativeTo: nil)
//        let anchor = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: SIMD2<Float>(0.2, 0.2)))
//        anchor.children.append(modelEntity)
//        
//
        // Add the horizontal plane anchor to the scene
        arView.scene.anchors.append(anchor)
        
//        // Play the animation(s) of the model
//        for anim in modelEntity.availableAnimations {
//            modelEntity.playAnimation(anim.repeat(duration: .infinity),
//                                      transitionDuration: 1.25,
//                                      startsPaused: false)
//        }

        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#Preview {
    ContentView()
}
