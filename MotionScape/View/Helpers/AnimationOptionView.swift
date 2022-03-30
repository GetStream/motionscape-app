//
//  AnimationOptionView.swift
//  MotionScape
//
//  Created by Stefan Blos on 25.03.22.
//

import SwiftUI

struct AnimationOptionView: View {
    
    @Binding var option: AnimationOption
    @State private var numberPopoverShowing = false
    
    var body: some View {
        HStack(spacing: 40) {
            Toggle(isOn: $option.active) {
                Text(option.name)
                    .frame(minWidth: 60)
            }
                .toggleStyle(.checkbox)
            
            Group {
                
                Slider(value: $option.value, in: 0...10) {
                    Text(option.value.stringWith(places: 2))
                        .valueLabel()
                        .opacity(option.active ? 1.0 : 0.3)
                        .padding(.trailing)
                        .popover(isPresented: $numberPopoverShowing) {
                            VStack(alignment: .leading, spacing: 20) {
                                HStack(spacing: 20) {
                                    Text("Set value:")
                                        .font(.headline)
                                        .foregroundColor(.secondary)
                                        .layoutPriority(1)
                                    
                                    Spacer()
                                    
                                    TextField(
                                        "Value",
                                        value: $option.value,
                                        format: .number
                                    )
                                    .textFieldStyle(.roundedBorder)
                                }
                                
                                switch option.type {
                                case .speed:
                                    (
                                        Text(Image(systemName: "info.circle"))
                                        +
                                        Text(" Values lower than 1 will slow down and larger than 1 speed up the animation.")
                                    )
                                    .frame(height: 40)
                                case .delay:
                                    (
                                        Text(Image(systemName: "info.circle"))
                                        +
                                        Text(" Specifies the delay in seconds before your animation starts initially.")
                                    )
                                    .frame(height: 40)
                                }
                                    
                                
                                HStack {
                                    Spacer()
                                    
                                    Button("Ok") {
                                        numberPopoverShowing = false
                                    }
                                }
                            }
                            .padding()
                            .frame(maxWidth: 300)
                        }
                } minimumValueLabel: {
                    Text("0")
                        .foregroundColor(.secondary)
                        .font(.callout)
                        .opacity(option.active ? 1.0 : 0.3)
                } maximumValueLabel: {
                    Text("10")
                        .foregroundColor(.secondary)
                        .font(.callout)
                        .opacity(option.active ? 1.0 : 0.3)
                }
                
                EditValueButton()
                    .disabled(!option.active)
                    .opacity(option.active ? 1.0 : 0.3)
                    .onTapGesture {
                        numberPopoverShowing = true
                    }
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
