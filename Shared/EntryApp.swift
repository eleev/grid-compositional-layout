//
//  EntryApp.swift
//  Shared
//
//  Created by Astemir Eleev on 24.06.2020.
//  Copyright © 2020 Astemir Eleev, Inc. All rights reserved.
//

import SwiftUI
import GridCompositionalLayout

@main
struct EntryApp: App {
    
    // MARK: - Properties
    
    @StateObject private var comicsManager = ComicsManager()
    let interItemSpacing: CGFloat = 16
    
    // MARK: - Conformance to App protocol
    
    var body: some Scene {
        WindowGroup {
            GeometryReader { proxy in
                NavigationView {
                    List {
                        Section {
                            NavigationLink("Pyramid", destination:
                                            gridCompositionalViewFactory(navigationTitle: "Pyramid",
                                                                         columns: [
                                                                            [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 2),
                                                                            [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 3),
                                                                            [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 4),
                                                                            [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 5),
                                                                         ]
                                            )
                            )
                            
                            NavigationLink("Pyramid Reversed", destination:
                                            gridCompositionalViewFactory(navigationTitle: "Pyramid Reversed",
                                                                         columns: [
                                                                            [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 5),
                                                                            [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 4),
                                                                            [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 3),
                                                                            [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 2)
                                                                         ]
                                            )
                            )
                        }
                        
                        
                        NavigationLink("Detail", destination:
                                        gridCompositionalViewFactory(navigationTitle: "Detail",
                                                                     columns: [
                                                                        [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 2),
                                                                        [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 6),
                                                                        [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 6)
                                                                     ]
                                        )
                        )
                        
                        NavigationLink("Showcase", destination:
                                        gridCompositionalViewFactory(navigationTitle: "Showcase",
                                                                     columns: [
                                                                        [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 2),
                                                                        [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 1),
                                                                     ]
                                        )
                        )
                        
                        Section {
                            NavigationLink("Divisable Grid", destination:
                                            gridCompositionalViewFactory(navigationTitle: "Divisable Grid",
                                                                         columns: [
                                                                            [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 4),
                                                                            [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 2),
                                                                         ]
                                            )
                            )
                            
                            NavigationLink("Divisable Pyramid", destination:
                                            gridCompositionalViewFactory(navigationTitle: "Divisable Pyramid",
                                                                         columns: [
                                                                            [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 2),
                                                                            [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 4),
                                                                            [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 6),
                                                                         ]
                                            )
                            )
                            
                            NavigationLink("Divisable Pyramid Reversed", destination:
                                            gridCompositionalViewFactory(navigationTitle: "Divisable Pyramid Reversed",
                                                                         columns: [
                                                                            [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 6),
                                                                            [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 4),
                                                                            [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 2),
                                                                         ]
                                            )
                            )
                        }
                        
                        
                        NavigationLink("Tiles", destination:
                                        gridCompositionalViewFactory(navigationTitle: "Tiles",
                                                                     columns: [
                                                                        [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 4),
                                                                        [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 12),
                                                                     ]
                                        )
                        )
                        
                        NavigationLink("Explorer", destination:
                                        gridCompositionalViewFactory(navigationTitle: "Explorer",
                                                                     columns: [
                                                                        [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 3),
                                                                        [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 9),
                                                                        [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 9),
                                                                        [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 9),
                                                                     ]
                                        )
                        )
                    }
                    .navigationTitle("Layouts")
                }
                .listStyle(SidebarListStyle())
            }
        }
    }
    
    // MARK: - Helper Private Methods
    
    private func gridCompositionalViewFactory(navigationTitle: String, columns: [[GridItem]]) -> some View {
        GridCompositionalView(navigationTitle: navigationTitle,
                              items: comicsManager.comics.count,
                              columns: columns) { (index) -> AnyView in
            gridCellView(for: index)
        }
    }
    
    private func gridCellView(for index: Int) -> AnyView {
        AnyView(
            Image(comicsManager.comics[index].imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(6)
                .shadow(radius: 10)
        )
    }
}
