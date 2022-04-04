//
//  SidebarView.swift
//  MotionScape
//
//  Created by Stefan Blos on 07.03.22.
//

import SwiftUI

struct SidebarView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    
    @State private var isInfoScreenShown = false
    
    var body: some View {
        List {
            Text("Spring animations")
                .foregroundColor(.secondary)
            
            Group {
                NavigationLink(tag: AnimationType.interpolatingSpring, selection: $viewModel.selectedAnimation, destination: {
                    InterpolatingSpringControlView(viewModel: viewModel)
                        .frame(minWidth: .MIN_WIDTH_CONTROL_VIEW, maxWidth: .infinity)
                }, label: {
                    Label("Interpolating Spring", systemImage: "1.circle")
                })
                
                NavigationLink(tag: AnimationType.interactiveSpring, selection: $viewModel.selectedAnimation, destination: {
                    InteractiveSpringControlView(viewModel: viewModel)
                        .frame(minWidth: .MIN_WIDTH_CONTROL_VIEW, maxWidth: .infinity)
                }, label: {
                    Label("Interactive Spring", systemImage: "2.circle")
                })
                
                NavigationLink(tag: AnimationType.spring, selection: $viewModel.selectedAnimation, destination: {
                    SpringControlView(viewModel: viewModel)
                        .frame(minWidth: .MIN_WIDTH_CONTROL_VIEW, maxWidth: .infinity)
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
                        .frame(minWidth: .MIN_WIDTH_CONTROL_VIEW, maxWidth: .infinity)
                }, label: {
                    Label("Linear", systemImage: "1.circle")
                })
            }
            
            Text("Easing animations")
                .foregroundColor(.secondary)
                .padding(.top)
            
            Group{
                
                NavigationLink(tag: AnimationType.defaultAnimation, selection: $viewModel.selectedAnimation, destination: {
                    DefaultControlView(viewModel: viewModel)
                        .frame(minWidth: .MIN_WIDTH_CONTROL_VIEW, maxWidth: .infinity)
                }, label: {
                    Label("Default", systemImage: "1.circle")
                })
                
                NavigationLink(tag: AnimationType.easeIn, selection: $viewModel.selectedAnimation, destination: {
                    EaseInControlView(viewModel: viewModel)
                        .frame(minWidth: .MIN_WIDTH_CONTROL_VIEW, maxWidth: .infinity)
                }, label: {
                    Label("Ease In", systemImage: "2.circle")
                })
                
                NavigationLink(tag: AnimationType.easeOut, selection: $viewModel.selectedAnimation, destination: {
                    EaseOutControlView(viewModel: viewModel)
                        .frame(minWidth: .MIN_WIDTH_CONTROL_VIEW, maxWidth: .infinity)
                }, label: {
                    Label("Ease Out", systemImage: "3.circle")
                })
                
                NavigationLink(tag: AnimationType.easeInOut, selection: $viewModel.selectedAnimation, destination: {
                    EaseInOutControlView(viewModel: viewModel)
                        .frame(minWidth: .MIN_WIDTH_CONTROL_VIEW, maxWidth: .infinity)
                }, label: {
                    Label("Ease In Out", systemImage: "4.circle")
                })
            }
            
            Text("Timing curves")
                .foregroundColor(.secondary)
                .padding(.top)
            
            Group {
                NavigationLink(tag: AnimationType.timingCurve, selection: $viewModel.selectedAnimation, destination: {
                    TimingCurveControlView(viewModel: viewModel)
                        .frame(minWidth: 500, maxWidth: .infinity)
                }, label: {
                    Label("Custom Timing Curve", systemImage: "1.circle")
                })
            }
        }
        .listStyle(SidebarListStyle())
        .toolbar {
            Button(action: toggleSidebar) {
                Image(systemName: "sidebar.left")
                    .help("Toggle Sidebar")
            }
            
            Button(action: showInfo) {
                Image(systemName: "info.circle")
                    .help("Show Info View")
            }
            .popover(isPresented: $isInfoScreenShown, content: {
                InfoView()
            })
        }
    }
    
    func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?
                .tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
    
    func showInfo() {
        isInfoScreenShown = true
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView(viewModel: AnimationsViewModel())
    }
}
