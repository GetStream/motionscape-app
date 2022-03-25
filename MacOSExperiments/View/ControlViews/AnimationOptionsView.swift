//
//  AnimationOptionsView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 25.03.22.
//

import SwiftUI

struct AnimationOptionsView: View {
    
    @Binding var animationOptions: [AnimationOption]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Options")
                .font(.headline)
            
            ForEach($animationOptions) { $option in
                AnimationOptionView(option: $option)
            }
        }
        .padding()
    }
}

struct AnimationOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationOptionsView(animationOptions: .constant([]))
    }
}
