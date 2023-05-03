//
//  ParameterDescriptionView.swift
//  MotionScape
//
//  Created by Stefan Blos on 18.03.22.
//

import SwiftUI

struct ParameterDescriptionView: View {
    
    var parameter: Documentable
    
    @State private var detailExpanded = false
    
    var body: some View {
        DisclosureGroup(isExpanded: $detailExpanded) {
            VStack(alignment: .leading, spacing: 10) {
                createElement(with: NSLocalizedString("Description",comment: ""), text: parameter.description)
                
                createElement(with: NSLocalizedString("Default value",comment: ""), text: parameter.defaultValueDescription)
                
                createElement(with: NSLocalizedString("Range",comment: ""), text: parameter.rangeDescription)
            }        .padding(.top)
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
    }
    
    func createElement(with title: String, text: String) -> some View {
        VStack(alignment: .leading) {
            Text(title.uppercased())
                .font(.system(.body, design: .monospaced))
                .bold()
                .foregroundColor(.secondary)
            
            HStack(spacing: 0) {
                Rectangle()
                    .fill(Color.secondary)
                    .frame(minWidth: 4, maxWidth: 4, maxHeight: .infinity)
                    .padding(.horizontal)
                
                Text(text)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        
    }
}

struct ParameterDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ParameterDescriptionView(parameter: InterpolatingSpring.stiffnessParamter)
    }
}
