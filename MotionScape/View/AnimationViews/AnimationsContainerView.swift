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
    @State private var copyTextOpacity: CGFloat = 0.0
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                
                Picker("", selection: $selectedPreview) {
                    ForEach(PreviewType.allCases) { previewType in
                        Text(NSLocalizedString(previewType.rawValue.capitalized,comment: ""))
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
                        Text(NSLocalizedString(animation.rawValue.capitalized,comment: ""))
                    }
                }
                .pickerStyle(.radioGroup)
                .padding()
                
                
                Button(action: {
                    viewModel.copyAnimationCodeToClipboard()
                    
                    withAnimation(.easeInOut(duration: 0.5)) {
                        copyTextOpacity = 1
                    }
                    withAnimation(.easeInOut(duration: 0.5).delay(2)) {
                        copyTextOpacity = 0
                    }
                }, label: {
                    Label("Copy animation code", systemImage: "doc.on.doc.fill")
                        .padding(20)
                })
                .overlay {
                    Text("Copied")
                        .foregroundColor(.primary)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 8)
                        .background(Color("copyPopupBackgroundColor"))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 4, style: .continuous)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 4, style: .continuous)
                                .stroke(Color.primary.opacity(0.4), lineWidth: 1)
                        )
                        .offset(y: -30)
                        .frame(width: 60)
                        .opacity(copyTextOpacity)
                        .edgesIgnoringSafeArea(.all)
                }
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
