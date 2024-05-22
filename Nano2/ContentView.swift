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
    @State private var hasSceneEnded = false
    
    var body: some View {
        
        ZStack {
            if !hasSceneEnded {
                ARViewContainer(hasSceneEnded: $hasSceneEnded)
                .edgesIgnoringSafeArea(.all)
            } else {
                EndScreenView()
            }
            
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
    @Binding var hasSceneEnded: Bool
    let arView = ARView(frame: .zero)
    let sessionDelegate = SessionDelegate()
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        arView.addCoaching()
        
        
        //Load cube model
        let anchor = try!Haunting.loadScene()

        // Add the horizontal plane anchor to the scene
        arView.scene.anchors.append(anchor)
        
        // Listen for the "End" notification
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(sessionDelegate.sceneDidEnd),
            name: Notification.Name("End"),
            object: nil
        )
        arView.session.delegate = sessionDelegate
        return arView
        
    }
    
    func handleTap(_ sender: UITapGestureRecognizer) {
        // Send the "End" notification to end the AR session
        NotificationCenter.default.post(name: Notification.Name("End"), object: nil)
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if hasSceneEnded {
            let endScreenView = EndScreenView()
            let hostingController = UIHostingController(rootView: endScreenView)
            hostingController.modalPresentationStyle = .fullScreen
            UIApplication.shared.windows.first?.rootViewController?.present(hostingController, animated: true, completion: nil)
        }
    }
}

class SessionDelegate: NSObject, ARSessionDelegate {
    @objc func session(_ session: ARSession, didFailWithError error: Error) {
        print("Session failed with error: \(error.localizedDescription)")
    }

    @objc func sessionWasInterrupted(_ session: ARSession) {
        print("Session was interrupted")
    }

    @objc func sessionInterruptionEnded(_ session: ARSession) {
        print("Session interruption ended")
    }

    @objc func sceneDidEnd() {
        print("Scene ended")
    }
}

#Preview {
    ContentView()
}
