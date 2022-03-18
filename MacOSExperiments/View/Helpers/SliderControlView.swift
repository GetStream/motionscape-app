//
//  SliderControlView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 14.03.22.
//

import SwiftUI

struct SliderControlView: View {
    
    @Binding var value: Double
    var parameter: AnimationParameter
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 40) {
                Text(parameter.name)
                
                Spacer()
                
                Text(value.stringWith(places: 2))
                    .font(.title)
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            }
            
            Slider(value: $value, in: parameter.range)
            
            ParameterDescriptionView(parameter: parameter)
        }
        .padding()
    }
}

struct SliderControlView_Previews: PreviewProvider {
    static var previews: some View {
        SliderControlView(value: .constant(4), parameter: InterpolatingSpring.stiffnessParamter)
    }
}
