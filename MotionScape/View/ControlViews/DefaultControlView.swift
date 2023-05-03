//
//  DefaultControlView.swift
//  MotionScape
//
//  Created by Stefan Blos on 29.03.22.
//

import SwiftUI

struct DefaultControlView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    @State private var selectedOption: AnimationControlOption = .parameters
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HeadlineView(
                    headline: NSLocalizedString("Default",comment: ""),
                    description: NSLocalizedString("Default Description",comment: ""),
                    timingCurve: TimingCurve(x0: 0.25, y0: 0.1, x1: 0.25, y1: 1.0)
                )
                
                Picker("", selection: $selectedOption) {
                    ForEach(AnimationControlOption.allCases) { option in
                        Text(NSLocalizedString(option.rawValue.capitalized,comment: ""))
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                switch selectedOption {
                case .parameters:
                    Text("Default Parameter Description")
                        .padding()
                    
                case .options:
                    AnimationOptionsView(animationOptions: $viewModel.animations.defaultAnimation.animationOptions)
                }
                
                HStack {
                    Spacer()
                    
                    Button {
                        // Let's see about that
                        viewModel.resetCurrentAnimation()
                    } label: {
                        Text("Reset to default")
                    }
                    
                    Spacer()
                }
                .padding(.bottom)
            }
        }
    }
}

struct DefaultControlView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultControlView(viewModel: AnimationsViewModel())
    }
}
