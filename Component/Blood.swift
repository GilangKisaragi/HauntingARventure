//
//  Blood.swift
//  Nano2
//
//  Created by Gilang Kisaragi on 19/05/24.
//

import SwiftUI

struct Blood: View {
    @State private var imageOpacity: Double = 0.0
    
    var body: some View {
        Image("Blood")
            .resizable()
            .frame(width: 120, height: 50)
            .opacity(imageOpacity)
            .onAppear {
                fadeInImage()
            }
    }
    
    func fadeInImage() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { // Delay of 1 second
            withAnimation(.easeIn(duration: 0.5)) {
                imageOpacity = 1.0
            }
        }
    }
}

#Preview {
    Blood()
}
