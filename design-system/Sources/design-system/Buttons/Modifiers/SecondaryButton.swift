//
//  SecondaryButton.swift
//  design-system
//
//  Created by Evan Anger on 4/11/23.
//

import SwiftUI

struct SecondaryButton: ButtonStyle {
    let sizing: Sizing
    
    init(sizing: Sizing = .fitText) {
        self.sizing = sizing
    }
    func makeBody(configuration: Configuration) -> some View {
        if self.sizing == .fitText {
            configuration
                .label
                .padding()
                .background(Color("Primary", bundle: .module))
                .foregroundColor(Color("Accent", bundle: .module))
                .font(.custom("OpenDyslexic-Bold", size: 24))
            
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("Accent", bundle: .module), lineWidth: 4)
                )
                .cornerRadius(15)
                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
            
        } else {
            configuration
                .label
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("Primary", bundle: .module))
                .foregroundColor(Color("Accent", bundle: .module))
                .font(.custom("OpenDyslexic-Bold", size: 24))
            
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("Accent", bundle: .module), lineWidth: 4)
                )
                .cornerRadius(15)
                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
                
        }
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button {
                
            } label: {
                Text("Fit to Text")
            }
            .buttonStyle(SecondaryButton())
            Button("Fit to Screen") {
                
            }
            .buttonStyle(SecondaryButton(sizing: .fitScreen))
            Spacer()
        }
        .padding([.leading, .trailing], 10)
    }
}
