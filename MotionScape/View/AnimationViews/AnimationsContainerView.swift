//
//  AnimationsContainerView.swift
//  MotionScape
//
//  Created by Stefan Blos on 18.03.22.
//

import SwiftUI

struct AnimationsContainerView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    
    @StateObject var exampleViewModel = AnimationsExampleViewModel()
    @State private var id = 0
    @State private var selectedPreview: PreviewType = .animation
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                
                Picker("", selection: $selectedPreview) {
                    ForEach(PreviewType.allCases) { previewType in
                        Text(previewType.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                Spacer()
            }
            
            Spacer()
            
            switch selectedPreview {
            case .animation:
                switch exampleViewModel.selectedAnimationExample {
                case .circles:
                    CirclesView(viewModel: viewModel)
                        .id(viewModel.id)
                case .chains:
                    ChainsView(viewModel: viewModel)
                        .id(viewModel.id)
                case .emojis:
                    EmojisView(viewModel: viewModel)
                        .id(viewModel.id)
                case .gradientCircle:
                    GradientCircleView(viewModel: viewModel)
                        .id(viewModel.id)
                }
            case .code:
                CodePreviewView(code: viewModel.createAnimationCode()) {
                    viewModel.copyAnimationCodeToClipboard()
                }
            }
            
            Spacer()
            
            Divider()
            
            HStack {
                
                Picker("Animation:", selection: $exampleViewModel.selectedAnimationExample) {
                    ForEach(AnimationExample.allCases) { animation in
                        Text(animation.rawValue.capitalized)
                    }
                }
                .pickerStyle(.radioGroup)
                .padding()
                
                
                Button(action: {
                    viewModel.copyAnimationCodeToClipboard()
                }, label: {
                    Label("Copy animation code", systemImage: "doc.on.doc.fill")
                        .padding(20)
                })
                .padding()
            }
        }
    }
}

struct AnimationsContainerView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationsContainerView(viewModel: AnimationsViewModel())
    }
}
