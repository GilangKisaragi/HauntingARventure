//
//  TypingAnimationiPView.swift
//  HauntingAR
//
//  Created by Gilang Kisaragi on 24/05/24.
//

import SwiftUI

struct TypingAnimationiPView: View {
    let fullText: String = "For more better experience use your headset"
    @State private var displayedText: String = ""
    @State private var charIndex: Int = 0
    @State private var timer: Timer? = nil
    
    var body: some View {
        Text(displayedText)
            .font(Font.custom("BebasNeue", size: 40))
            .foregroundColor(.blue50)
            .shadow(color: Color(red: 0.86, green: 0.69, blue: 0.69), radius: 12, x: 0, y: 0)
            .onAppear {
                startTypingAnimation()
            }
            .onDisappear {
                stopTypingAnimation()
            }
    }
    
    func startTypingAnimation() {
        stopTypingAnimation() // Ensure no timer is running
        displayedText = ""
        charIndex = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if charIndex < fullText.count {
                let index = fullText.index(fullText.startIndex, offsetBy: charIndex)
                displayedText.append(fullText[index])
                charIndex += 1
            } else {
                stopTypingAnimation()
            }
        }
    }
    
    func stopTypingAnimation() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    TypingAnimationiPView()
}
