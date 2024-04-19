//
//  Swift_Data_VideosApp.swift
//  Swift-Data-Videos
//
//  Created by Carlos Morgado on 16/4/24.
//

import SwiftUI
import SwiftData

@main
struct Swift_Data_VideosApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(ViewModel())
        }
    }
}
