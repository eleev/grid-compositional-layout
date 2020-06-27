//
//  IndexManager.swift
//  GridCompositionalLayout
//
//  Created by Astemir Eleev on 24.06.2020.
//  Copyright © 2020 Astemir Eleev, Inc. All rights reserved.
//

import SwiftUI

public final class IndexManager: ObservableObject {
    
    // MARK: - Properties
    
    public private(set) var index: Int = -1
    
    // MARK: - Methods
    
    public func increment(cap: Int) -> Bool {
        guard index < cap - 1 else { return false }
        index += 1
        return true
    }
}
