//
//  UpdateView.swift
//  Swift-Data-Videos
//
//  Created by Carlos Morgado on 17/4/24.
//

import SwiftUI

struct UpdateView: View {
    @Bindable var video: Video
    
    var body: some View {
        Form {
            TextField("Edit next video", text: $video.title)
            Toggle("Favorite Video", isOn: $video.metadada.isFavorite)
        }
    }
}


