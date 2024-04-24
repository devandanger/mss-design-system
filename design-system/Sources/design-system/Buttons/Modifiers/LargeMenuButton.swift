//
//  LargeMenuButton.swift
//  design-system
//
//  Created by Evan Anger on 4/20/23.
//

import SwiftUI

struct LargeMenuStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
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
    }
}

struct LargeMenuButton: View {
    let title: String
    let description: String
    let buttonTitle: String
    var body: some View {
        Button {
            
        } label: {
            HStack {
                Image(systemName: "lock")
                    .font(.system(size: 50))
                    .padding(20)
                VStack(alignment: .leading) {
                    Text(title)
                        .title()
                    Text(description)
                        .title3()
                    Button {
                        
                    } label: {
                        Text(buttonTitle)
                    }
                    .buttonStyle(PrimaryButton(sizing: .fitScreen))
                }
            }
        }
        .buttonStyle(LargeMenuStyle())

        
    }
}

struct LargeMenuLink: View {
    var body: some View {
        Text("Hello, World!")
    }
}


struct LargeMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            LargeMenuButton(
                title: "Title",
                description: "Description",
                buttonTitle: "Let's go"
            )
            .padding(10)
            LargeMenuButton(
                title: "Title",
                description: "Description",
                buttonTitle: "LET'S GO!"
            )
            .padding(10)
            Spacer()
        }
        .padding([.top], 10)
        .navigationTitle("Menu Preview")
    }
}
