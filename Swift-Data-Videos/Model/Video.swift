//
//  Video.swift
//  Swift-Data-Videos
//
//  Created by Carlos Morgado on 16/4/24.
//

import Foundation
import SwiftData

@Model // Converts a Swift class into a stored model that's managed by SwiftData
class Video {
    @Attribute(.unique) var id: UUID
    var title: String
    
    var numberOfLikes: Int {title.count}
    
    @Relationship(deleteRule: .cascade) var metadada: Metadata
    
    @Transient init(id: UUID, title: String, metadata: Metadata) {
        self.id = id
        self.title = title
        self.metadada = metadata
    }
}

@Model
class Metadata {
    var isFavorite: Bool
    
    init(isFavorite: Bool) {
        self.isFavorite = isFavorite
    }
}
