//
//  SidebarView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 07.03.22.
//

import SwiftUI

struct SidebarView: View {
    
    @ObservedObject var viewModel: CirclesViewModel
    
    @State private var isDefaultActive = true
    var body: some View {
        List {
            Text("Spring animations")
                .foregroundColor(.secondary)
            
            Group {
                NavigationLink(destination: InterpolatingSpringControlView(viewModel: viewModel), isActive: $isDefaultActive) {
                    Label("Interpolating Spring", systemImage: "1.circle")
                }
                
                NavigationLink(destination: InteractiveSpringControlView(viewModel: viewModel)) {
                    Label("Interactive Spring", systemImage: "2.circle")
                }
            }
        }
        .listStyle(SidebarListStyle())
        .toolbar {
            Button(action: toggleSidebar) {
                Image(systemName: "sidebar.left")
                    .help("Toggle Sidebar")
            }
        }
    }
    
    func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?
                .tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView(viewModel: CirclesViewModel())
    }
}
