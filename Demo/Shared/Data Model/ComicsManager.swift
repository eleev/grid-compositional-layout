//
//  ComicsManager.swift
//  Shared
//
//  Created by Astemir Eleev on 24.06.2020.
//  Copyright © 2020 Astemir Eleev, Inc. All rights reserved.
//

import SwiftUI

final class ComicsManager: ObservableObject {
    @Published private(set) var comics: [Comics] = []
    
    init() {
        comics = ComicsLoader.covers(duplicationFactor: 2)
    }
}
