//
//  JudulView.swift
//  Nano2
//
//  Created by Gilang Kisaragi on 20/05/24.
//

import SwiftUI

struct JudulView: View {
    var body: some View {
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
    }
}

#Preview {
    JudulView()
}
