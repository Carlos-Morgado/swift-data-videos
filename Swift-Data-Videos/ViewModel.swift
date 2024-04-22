//
//  ViewModel.swift
//  Swift-Data-Videos
//
//  Created by Carlos Morgado on 19/4/24.
//

import Foundation
import SwiftData

@Observable
final class ViewModel: ObservableObject {
    let container = try! ModelContainer(for: Video.self, Metadata.self)
    
    @MainActor
    var modelContext: ModelContext {
        container.mainContext
    }
    
    var videos: [Video] = []
    
    @MainActor
    func getVideos() {
        let fetchDescriptor = FetchDescriptor<Video>(predicate: nil, sortBy: [SortDescriptor<Video>(\.title)])
        videos = try! modelContext.fetch(fetchDescriptor)
        print(videos)
    }

    @MainActor
    func insert(video : Video) {
        modelContext.insert(video)
        videos = []
        getVideos()
    }
    
    @MainActor
    func deleteAllVideos() {
        videos.forEach {
            modelContext.delete($0)
        }
        try? modelContext.save()
        videos = []
        getVideos()
    }
}
