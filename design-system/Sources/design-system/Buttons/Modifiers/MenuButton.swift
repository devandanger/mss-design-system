//
//  MenuButton.swift
//  design-system
//
//  Created by Evan Anger on 4/11/23.
//

import SwiftUI

struct MenuLink<Content>: View where Content: View {
    let label: String
    let destination: () -> Content
    
    init(
        label: String,
        @ViewBuilder destination: @escaping () -> Content
    ) {
        self.label = label
        self.destination = destination
    }
    
    var body: some View {
        NavigationLink(
            destination: destination,
            label: {
                HStack {
                    Text(label)
                    Spacer()
                }
        })
        .buttonStyle(MenuButtonStyle())
    }
}

struct MenuButton: View {
    let label: String
    let action: () -> ()
    init(
        label: String,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.action = action
    }
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(label)
                Spacer()
            }
        }
        .buttonStyle(MenuButtonStyle())
    }
}
struct MenuButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding()
            .title()
            .frame(maxWidth: .infinity)
            .background(Color("Primary", bundle: .module))
            .foregroundColor(Color("Accent", bundle: .module))
            .multilineTextAlignment(.leading)
            .shadow(radius: 1)
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            VStack(spacing: 0) {
                MenuButton(label: "Menu Button") {
                    
                }
                MenuLink(label: "Menu Link") {
                    EmptyView()
                }
                Spacer()
            }
            .padding([.top], 10)
            .navigationTitle("Menu Preview")
        }
    }
}
