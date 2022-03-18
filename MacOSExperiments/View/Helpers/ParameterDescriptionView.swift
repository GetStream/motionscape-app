//
//  ParameterDescriptionView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 18.03.22.
//

import SwiftUI

struct ParameterDescriptionView: View {
    
    var parameter: AnimationParameter
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            createElement(with: "Description", text: parameter.description)
            
            createElement(with: "Default value", text: parameter.defaultValue != nil ? "\(parameter.defaultValue!)" : "It has no default value.")
            
            createElement(with: "Range", text: "\(parameter.range)")
        }
    }
    
    func createElement(with title: String, text: String) -> some View {
        VStack(alignment: .leading) {
            Text(title.uppercased())
                .font(.system(.body, design: .monospaced))
                .bold()
                .foregroundColor(.secondary)
            
            HStack(spacing: 0) {
                Color.secondary
                    .frame(width: 4)
                    .padding(.horizontal)
                
                Text(text)
            }
        }
        
    }
}

struct ParameterDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ParameterDescriptionView(parameter: InterpolatingSpring.stiffnessParamter)
    }
}
