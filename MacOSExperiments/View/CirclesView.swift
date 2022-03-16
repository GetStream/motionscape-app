//
//  CirclesView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 10.03.22.
//

import SwiftUI

struct CirclesView: View {
    
    @ObservedObject var viewModel: CirclesViewModel
    
    @State private var moving = false
    
    let yUpper: CGFloat = 100
    let yLower: CGFloat = -120
    
    var body: some View {
        ZStack{
            ForEach (0 ..< 8, id: \.self) { i in
                Circle()
                    .stroke(lineWidth: 5)
                    .frame(width: CGFloat(20 + (i * 30)), height: CGFloat(20 + (i * 30)))
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: moving ? yUpper : yLower)
                    .animation(
                        .create(from: viewModel)
                            .repeatForever(autoreverses: true)
                            .delay(Double(i) * 0.05),
                        value: moving
                    )
            }
            
            VStack {
                Spacer()
                
                Button(action: {
                    viewModel.copyAnimationCodeToClipboard()
                }, label: {
                    Label("Copy code", systemImage: "doc.on.doc.fill")
                        .padding(20)
                })
            }
            .padding()
        }
        .onAppear {
            moving.toggle()
        }
    }
}

struct CirclesView_Previews: PreviewProvider {
    static var previews: some View {
        CirclesView(viewModel: CirclesViewModel())
    }
}
