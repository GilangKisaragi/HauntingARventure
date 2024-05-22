//
//  Scary.swift
//  Nano2
//
//  Created by Gilang Kisaragi on 19/05/24.
//

import SwiftUI

struct Scary: View {
    @State private var imageOpacity: Double = 0.0
    var body: some View {
        Text("Scary")
            .font(Font.custom("ScaryDanceDemo", size: 64))
            .foregroundColor(.red500)
            .opacity(imageOpacity)
            .onAppear {
                fadeInImage()
            }
    }
    func fadeInImage() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) { // Delay of 1 second
                withAnimation(.easeIn(duration: 2.0)) {
                    imageOpacity = 1.0
                }
            }
        }
}

#Preview {
    Scary()
}
