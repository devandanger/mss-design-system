//
//  Input.swift
//  design-system
//
//  Created by Evan Anger on 4/11/23.
//

import SwiftUI

struct PrimaryTextField: View {
    let hint: String
    @Binding var text: String
    @State var isEditing: Bool = false
    
    var body: some View {
        TextField("", text: $text, onEditingChanged: {
            isEditing = $0
        })
        .placeholder(when: text.isEmpty) {
            Text(hint)
                .font(.custom("OpenDyslexic-Regular", size: 18))
                .foregroundColor(Color("LowAccent", bundle: .module))
                .padding()
        }
        .textFieldStyle(PrimaryTextFieldStyle(isEditing: $isEditing))
    }
}

struct PrimaryTextFieldStyle: TextFieldStyle {
    @Binding var isEditing: Bool
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(
                        isEditing ? Color("MidAccent", bundle: .module) : Color("MidAccent", bundle: .module),
                        lineWidth: isEditing ? 5 : 2.5
                    )
            )
            .cornerRadius(15)
            .font(.custom("OpenDyslexic-Regular", size: 18))
            .foregroundColor(isEditing ? Color("MidAccent", bundle: .module) : Color("Accent", bundle: .module))
            .shadow(color: .gray, radius: 10)
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

struct Input_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PrimaryTextField(hint: "Hint", text: .constant("Hello"))
                .padding()
            PrimaryTextField(hint: "Hint", text: .constant(""))
                .padding()
            Spacer()
        }
    }
}
