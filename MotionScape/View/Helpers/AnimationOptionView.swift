//
//  AnimationOptionView.swift
//  MotionScape
//
//  Created by Stefan Blos on 25.03.22.
//

import SwiftUI

struct AnimationOptionView: View {
    
    @Binding var option: AnimationOption
    
    var body: some View {
        HStack(spacing: 40) {
            Toggle(option.name, isOn: $option.active)
                .toggleStyle(.checkbox)
            
            Group {
            
            Slider(value: $option.value, in: 0...10) {
                Text(option.value.stringWith(places: 2))
                    .valueLabel()
                    .opacity(option.active ? 1.0 : 0.3)
                    .padding(.trailing)
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("10")
            }

            
            TextField(option.value.stringWith(places: 2), value: $option.value, format: .number)
                .textFieldStyle(.roundedBorder)
            }
                .disabled(!option.active)
        }
        
        ParameterDescriptionView(parameter: option)
    }
}

struct AnimationOptionView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationOptionView(option: .constant(AnimationOption(type: .delay, active: false, value: 1.0, description: "", defaultValueDescription: "" , rangeDescription: "")))
    }
}
