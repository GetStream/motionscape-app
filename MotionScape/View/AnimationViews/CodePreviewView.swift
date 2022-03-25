//
//  CodePreviewView.swift
//  MotionScape
//
//  Created by Stefan Blos on 24.03.22.
//

import SwiftUI

struct CodePreviewView: View {
    
    var code: String
    
    var body: some View {
        Text("```\(code)```")
            .padding(40)
            .background(.tertiary)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .animation(.spring(), value: code)
    }
}

struct CodePreviewView_Previews: PreviewProvider {
    static var previews: some View {
        CodePreviewView(code: "I'm a code preview. Oink, oink")
    }
}
