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
    
    @State private var sheetShowing = false
    @State private var numberPopoverShowing = false
    @State private var detailExpanded = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 20) {
                Text(parameter.name)
                
                Slider(value: $value, in: parameter.range)
                
                Text(value.stringWith(places: 2))
                    .font(.title2)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .popover(isPresented: $numberPopoverShowing) {
                        VStack(alignment: .trailing, spacing: 20) {
                            HStack(spacing: 20) {
                                Text("Set value:")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                    .layoutPriority(1)
                                
                                Spacer()
                                
                                TextField(
                                    "Value",
                                    value: $value,
                                    format: .number
                                )
                                .textFieldStyle(.roundedBorder)
                            }
                            
                            HStack(spacing: 20) {
                                Text("Sensitive range:")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                    .layoutPriority(1)
                                
                                Spacer()
                                
                                Text(parameter.range.toString)
                            }
                            
                            Button("Ok") {
                                numberPopoverShowing = false
                            }
                        }
                        .padding()
                        .frame(minWidth: 300)
                    }
                    .onTapGesture {
                        numberPopoverShowing = true
                    }
            }
            
            DisclosureGroup(isExpanded: $detailExpanded) {
                ParameterDescriptionView(parameter: parameter)
                    .padding(.top)
            } label: {
                HStack(spacing: 10) {
                    Text("Show details")
                    
                    Image(systemName: "info.circle")
                }
                .padding(.horizontal)
                .onTapGesture {
                    withAnimation {
                        detailExpanded.toggle()
                    }
                }
            }
            .padding(.top)
        }
        .padding()
    }
}

struct SliderControlView_Previews: PreviewProvider {
    static var previews: some View {
        SliderControlView(value: .constant(4), parameter: InterpolatingSpring.stiffnessParamter)
    }
}
