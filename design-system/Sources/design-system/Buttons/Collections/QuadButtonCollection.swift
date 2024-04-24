//
//  QuadButtonCollection.swift
//  design-system
//
//  Created by Evan Anger on 4/18/23.
//

import Foundation
import SwiftUI

struct LabelAnswer: Hashable {
    let label: String
    let answer: String
}

struct LabelAnswerPair: Hashable {
    let selection1: LabelAnswer
    let selection2: LabelAnswer
}



extension Collection where Element == LabelAnswer {
    func pair() -> [LabelAnswerPair] {
        var result: [LabelAnswerPair] = []
        var iterator = self.makeIterator()
        
        while let first = iterator.next(), let second = iterator.next() {
            result.append(LabelAnswerPair(selection1: first, selection2: second))
        }
        
        return result
    }
}

enum ButtonCollectionType {
    case grid
    case list
}

struct ButtonCollection: View {
    let collectionType: ButtonCollectionType
    let labelAnswers: [LabelAnswerPair]
    @Binding var selectedAnswer: String
    init(collectionType: ButtonCollectionType = .grid,
         labelAnswers: [LabelAnswerPair],
         selectedAnswer: Binding<String>) {
        self.collectionType = collectionType
        self.labelAnswers = labelAnswers
        _selectedAnswer = selectedAnswer
    }
    
    var body: some View {
        if collectionType == .grid {
            VStack {
                ForEach(labelAnswers, id: \.self) { pair in
                    HStack {
                        Button {
                            selectedAnswer = pair.selection1.answer
                        } label: {
                            Text(pair.selection1.label)
                        }
                        .buttonStyle(PrimaryButton(sizing: .fitScreen))
                        Button {
                            selectedAnswer = pair.selection2.answer
                        } label: {
                            Text(pair.selection2.label)
                        }
                        .buttonStyle(PrimaryButton(sizing: .fitScreen))
                    }
                }
            }
            .padding(10)
        } else {
            VStack {
                ForEach(labelAnswers, id: \.self) { pair in
                    Button {
                        selectedAnswer = pair.selection1.answer
                    } label: {
                        Text(pair.selection1.label)
                    }
                    .buttonStyle(PrimaryButton(sizing: .fitScreen))
                    Button {
                        selectedAnswer = pair.selection2.answer
                    } label: {
                        Text(pair.selection2.label)
                    }
                    .buttonStyle(PrimaryButton(sizing: .fitScreen))
                }
            }
            .padding(10)
        }
    }
}

struct ButtonCollectionExample: View {
    @State var labelAnswer: String = ""
    var body: some View {
        VStack {
            if labelAnswer.count > 0 {
                Text("Selected answer is \(labelAnswer)")
                    .title()
            }
            Spacer()
            ButtonCollection(collectionType: .list,
                             labelAnswers: [
                LabelAnswer(label: "Yo2", answer: "Yo2"),
                LabelAnswer(label: "Yo3", answer: "Yo3"),
                LabelAnswer(label: "Yo4", answer: "Yo4"),
                LabelAnswer(label: "Yo5", answer: "Yo5"),
            ].pair(), selectedAnswer: $labelAnswer)
            Spacer()
            ButtonCollection(labelAnswers: [
                LabelAnswer(label: "Yo2", answer: "Yo2"),
                LabelAnswer(label: "Yo3", answer: "Yo3"),
                LabelAnswer(label: "Yo4", answer: "Yo4"),
                LabelAnswer(label: "Yo5", answer: "Yo5"),
            ].pair(), selectedAnswer: $labelAnswer)
        }
    }
}


struct QuadButtonCollection_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCollectionExample()
    }
}
