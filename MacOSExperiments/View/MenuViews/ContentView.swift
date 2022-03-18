//
//  ContentView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 07.03.22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = CirclesViewModel()
    @State private var id = 0
    
    var body: some View {
        NavigationView {
            // Sidebar with the selectable items
            SidebarView(viewModel: viewModel)
                .frame(minWidth: 200)
            
            // Default view when nothing is selected
            // (not shown if we have a default option set in the SidebarView
            ControlContainerView(viewModel: viewModel)
                .frame(minWidth: 500)
            
            // Pane number 3, if we don't want that we can simply not provide a third view here
            AnimationsContainerView(viewModel: viewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
