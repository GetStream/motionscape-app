//
//  ContentView.swift
//  MotionScape
//
//  Created by Stefan Blos on 07.03.22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = AnimationsViewModel()
    @State private var id = 0
    
    var body: some View {
        NavigationView {
            // Sidebar with the selectable items
            SidebarView(viewModel: viewModel)
                .frame(minWidth: .MIN_WIDTH_SIDEBAR)
            
            // Default view when nothing is selected
            // (not shown if we have a default option set in the SidebarView
            ControlContainerView(viewModel: viewModel)
                .frame(minWidth: .MIN_WIDTH_CONTROL_VIEW, maxWidth: .infinity)
            
            // Pane number 3, if we don't want that we can simply not provide a third view here
            AnimationsContainerView(viewModel: viewModel)
                .frame(minWidth: .MIN_WIDTH_ANIMATION_VIEW, maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
