//
//  EndScreenView.swift
//  Nano2
//
//  Created by Gilang Kisaragi on 22/05/24.
//

import SwiftUI

struct EndScreenView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    var body: some View {
        if sizeClass == .compact {
            // Layout for iPhone
            ZStack {
                Color(.black)
                
                VStack (spacing: 0) {
                    Text("You Survived")
                        .font(Font.custom("BebasNeue", size: 140))
                    .foregroundColor(.blue50)
                    
                    HStack {
                        NavigationLink (destination: HomePageView()) {
                            Image("buttonexitiP")
                                .shadow(color: Color(red: 0.86, green: 0.69, blue: 0.69), radius: 12, x: 0, y: 0)
                        }
                        
                        NavigationLink (destination: ContentView()) {
                            Image("buttonplayagainiP")
                                .shadow(color: Color(red: 0.86, green: 0.69, blue: 0.69), radius: 12, x: 0, y: 0)
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
        } else {
            // Layout for iPad
            ZStack {
                Color(.black)
                
                VStack (spacing: 8) {
                    Text("You Survived")
                        .font(Font.custom("BebasNeue", size: 220))
                    .foregroundColor(.blue50)
                    
                    HStack {
                        NavigationLink (destination: HomePageView()) {
                            Image("buttonexit")
                                .shadow(color: Color(red: 0.86, green: 0.69, blue: 0.69), radius: 12, x: 0, y: 0)
                        }
                        
                        NavigationLink (destination: ContentView()) {
                            Image("buttonplayagain")
                                .shadow(color: Color(red: 0.86, green: 0.69, blue: 0.69), radius: 12, x: 0, y: 0)
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    EndScreenView()
}
