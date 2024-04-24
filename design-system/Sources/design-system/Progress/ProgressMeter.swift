//
//  ProgressMeter.swift
//  design-system
//
//  Created by Evan Anger on 4/19/23.
//

import Foundation
import SwiftUI

struct ProgressMeter: View {
    @Binding var progress: CGFloat
    public init(initialProgress: Binding<CGFloat>) {
        self._progress = initialProgress
    }
    var body: some View {
        
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color("Accent", bundle: .module))
                    .frame(width: min(geo.size.width, geo.size.width * progress),
                    height: 10)
                    .animation(.linear)
            }.cornerRadius(45.0)
        }
        .padding([.leading, .trailing], 10)
    }
}

struct ProgressMeterSpec: View {
    @State var progress: CGFloat = 0.5
    var body: some View {
        VStack {
            ProgressMeter(initialProgress: $progress)
            Spacer()
            Button("Reset") {
                progress = 0.0
            }
            .buttonStyle(PrimaryButton(sizing: .fitScreen))
            .padding(10)
            Button("Go") {
                start()
            }
            .buttonStyle(PrimaryButton(sizing: .fitScreen))
            .padding(10)
        }
    }
    func start() {
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) {
            timer in
            self.progress += 0.1
        }
    }
}


struct ProgressMeter_Previews: PreviewProvider {
    static var previews: some View {
        ProgressMeterSpec()
    }
}
