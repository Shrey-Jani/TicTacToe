//
//  Item.swift
//  TicTacToe
//
//  Created by Shrey Jani on 2025-01-01.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
