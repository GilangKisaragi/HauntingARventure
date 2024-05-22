//
//  TutorialView.swift
//  Nano2
//
//  Created by Gilang Kisaragi on 21/05/24.
//

import SwiftUI

struct TutorialView: View {
    @State private var scale: CGFloat = 1.5
    @State private var offset: CGSize = .init(width: -350, height: 0)
    
    var body: some View {
        ZStack {
            Image("bgtutorial")
                .resizable()
                .scaledToFill()
            
            Image("Bezel")
                .scaleEffect(scale)
                .offset(offset)
                .onAppear {
                    withAnimation(.smooth(duration:2).delay(2)) {
                        self.scale = 0.8
                        self.offset = CGSize(width: 50, height: 50)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        withAnimation(.smooth(duration: 2)) {
                            self.scale = 0.6
                            self.offset = CGSize(width: -50, height: -50)
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation(.smooth(duration: 2).delay(1)) {
                                self.scale = 1.5
                                self.offset = CGSize(width: -350, height: 0)
                            }
                        }
                    }
                }
            
            VStack {
                Spacer()
                VStack (alignment: .center, spacing: 32) {
                    Text("to exterminate the ghosts, move as close to them as possible!")
                        .font(Font.custom("BebasNeue", size: 54))
                        .foregroundColor(.blue50)
                        .shadow(color: Color(red: 0.86, green: 0.69, blue: 0.69), radius: 12, x: 0, y: 0)
                    
                    VStack (alignment: .trailing) {
                        NavigationLink (destination: ContentView()) {
                            Image("buttonNext")
                                .shadow(color: Color(red: 0.86, green: 0.69, blue: 0.69), radius: 12, x: 0, y: 0)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal, 64)
                    
                    
                }
                .padding(64)
                .frame(maxWidth: .infinity, alignment: .top)
                .background(
                LinearGradient(
                stops: [
                Gradient.Stop(color: .black, location: 0.00),
                Gradient.Stop(color: Color(red: 0.19, green: 0.19, blue: 0.19).opacity(0.54), location: 0.77),
                Gradient.Stop(color: Color(red: 0.4, green: 0.4, blue: 0.4).opacity(0), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: 1),
                endPoint: UnitPoint(x: 0.5, y: 0)
                )
            )
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    TutorialView()
}
