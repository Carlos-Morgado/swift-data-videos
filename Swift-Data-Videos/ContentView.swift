//
//  ContentView.swift
//  Swift-Data-Videos
//
//  Created by Carlos Morgado on 16/4/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
//    @Environment(\.modelContext) var modelContext
//    @Query(sort: \Video.title) var videos: [Video]
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.videos) { video  in
                    NavigationLink(value: video) {
                        HStack {
                            Text(video.title)
                            if video.metadada.isFavorite {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Future Videos")
            .navigationDestination(for: Video.self, destination: { video in
                UpdateView(video: video)
            })
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        withAnimation {
                            let newVideo = Video(id: .init(), title: "First Video", metadata: .init(isFavorite: true))
//                            modelContext.insert(newVideo)
                            viewModel.insert(video: newVideo)
                        }
                    }, label: {
                        Label("Add Item", systemImage: "plus")
                    })
                }
                ToolbarItem {
                    Button(action: {
                        withAnimation {
//                            viewModel.videos.forEach {
//                                modelContext.delete($0)
//                            }
//                            try? modelContext.save()
                            viewModel.deleteAllVideos()
                        }
                    }, label: {
                        Label("Remove All", systemImage: "trash")
                    })
                }
            }
            .onAppear {
                viewModel.getVideos()
            }
        }
    }
}

//#Preview {
//    ContentView(videos: [])
//}
