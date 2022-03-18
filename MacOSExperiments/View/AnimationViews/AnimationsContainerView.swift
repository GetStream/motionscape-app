//
//  AnimationsContainerView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 18.03.22.
//

import SwiftUI

struct AnimationsContainerView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    
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
                    .id(viewModel.id)
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
    }
}

struct AnimationsContainerView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationsContainerView(viewModel: AnimationsViewModel())
    }
}
