//
//  Item.swift
//  NameTag
//
//  Created by Youngmin Cho on 1/24/26.
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
