//
//  PrimaryButton.swift
//  design-system
//
//  Created by Evan Anger on 4/11/23.
//

import SwiftUI

enum Sizing {
    case fitText
    case fitScreen
}

struct PrimaryButton: ButtonStyle {
    let sizing: Sizing
    
    init(sizing: Sizing = .fitText) {
        self.sizing = sizing
    }
    func makeBody(configuration: Configuration) -> some View {
        if sizing == .fitText {
            configuration
                .label
                .padding()
                .background(
                    Color("Accent", bundle: .module)
                    .brightness(configuration.isPressed ? -0.15 : 0.0)
                )
                .foregroundColor(.white)
                .cornerRadius(15)
                .font(.custom("OpenDyslexic-Bold", size: 24))
                .shadow(color: .gray, radius: 3, x: 2, y: 2)
        } else {
            configuration
                .label
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("Accent", bundle: .module).brightness(configuration.isPressed ? -0.15 : 0.0))
                .foregroundColor(.white)
                .cornerRadius(15)
                .font(.custom("OpenDyslexic-Bold", size: 24))
                .shadow(color: .gray, radius: 3, x: 2, y: 2)
                
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            VStack {
                Button {
                    
                } label: {
                    Text("Fit to Text")
                }
                .buttonStyle(PrimaryButton())
                Button("Fit to Screen") {
                    
                }
                .buttonStyle(PrimaryButton(sizing: .fitScreen))
                Spacer()
            }
            .navigationTitle("Buttons")
            .padding([.leading, .trailing], 10)
        }
    }
}
