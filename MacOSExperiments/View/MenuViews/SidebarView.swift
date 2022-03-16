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
                NavigationLink(tag: AnimationType.interpolatingSpring, selection: $viewModel.selectedAnimation, destination: {
                    InterpolatingSpringControlView(viewModel: viewModel)
                }, label: {
                    Label("Interpolating Spring", systemImage: "1.circle")
                })
                
                NavigationLink(tag: AnimationType.interactiveSpring, selection: $viewModel.selectedAnimation, destination: {
                    InteractiveSpringControlView(viewModel: viewModel)
                }, label: {
                    Label("Interactive Spring", systemImage: "2.circle")
                })
                
                NavigationLink(tag: AnimationType.spring, selection: $viewModel.selectedAnimation, destination: {
                    SpringControlView(viewModel: viewModel)
                }, label: {
                    Label("Spring", systemImage: "3.circle")
                })
            }
            
            Text("Linear animation")
                .foregroundColor(.secondary)
                .padding(.top)
            
            Group {
                NavigationLink(tag: AnimationType.linear, selection: $viewModel.selectedAnimation, destination: {
                    LinearControlView(viewModel: viewModel)
                }, label: {
                    Label("Linear", systemImage: "1.circle")
                })
            }
            
            Text("Easing animations")
                .foregroundColor(.secondary)
                .padding(.top)
            
            Group{
                NavigationLink(tag: AnimationType.easeIn, selection: $viewModel.selectedAnimation, destination: {
                    EaseInControlView(viewModel: viewModel)
                }, label: {
                    Label("Ease In", systemImage: "1.circle")
                })
                
                NavigationLink(tag: AnimationType.easeOut, selection: $viewModel.selectedAnimation, destination: {
                    EaseOutControlView(viewModel: viewModel)
                }, label: {
                    Label("Ease Out", systemImage: "2.circle")
                })
                
                NavigationLink(tag: AnimationType.easeInOut, selection: $viewModel.selectedAnimation, destination: {
                    EaseInOutControlView(viewModel: viewModel)
                }, label: {
                    Label("Ease In Out", systemImage: "3.circle")
                })
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
