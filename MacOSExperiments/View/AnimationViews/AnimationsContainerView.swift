//
//  AnimationsContainerView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 18.03.22.
//

import SwiftUI

struct AnimationsContainerView: View {
    
    @ObservedObject var viewModel: CirclesViewModel
    
    @StateObject var exampleViewModel = AnimationsExampleViewModel()
    @State private var id = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Picker("Animation:", selection: $exampleViewModel.selectedAnimationExample) {
                ForEach(AnimationExample.allCases) { animation in
                    Text(animation.rawValue.capitalized)
                }
            }
            .padding([.top, .horizontal])
            
            Divider()
            
            Spacer()
            
            switch exampleViewModel.selectedAnimationExample {
            case .circles:
                CirclesView(viewModel: viewModel)
                    .id(id)
            case .reactions:
                Text("Reactions")
            }
            
            Spacer()
            
            Divider()
            
            Button(action: {
                viewModel.copyAnimationCodeToClipboard()
            }, label: {
                Label("Copy animation code", systemImage: "doc.on.doc.fill")
                    .padding(20)
            })
                .padding()
        }
        .onChange(of: viewModel.selectedAnimation) { _ in
            id += 1
        }
        .onChange(of: viewModel.interpolatingSpring) { _ in
            id += 1
        }
        .onChange(of: viewModel.interactiveSpring) { _ in
            id += 1
        }
        .onChange(of: viewModel.spring) { _ in
            id += 1
        }
        .onChange(of: viewModel.linear) { _ in
            id += 1
        }
        .onChange(of: viewModel.easeIn) { _ in
            id += 1
        }
        .onChange(of: viewModel.easeOut) { _ in
            id += 1
        }
        .onChange(of: viewModel.easeInOut) { _ in
            id += 1
        }
    }
}

struct AnimationsContainerView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationsContainerView(viewModel: CirclesViewModel())
    }
}
