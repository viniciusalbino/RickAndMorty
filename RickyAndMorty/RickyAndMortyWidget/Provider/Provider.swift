//
//  Provider.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 23/01/23.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), favorites: [])
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let favorites = FavoritesPersister().getFavorites()
        let objects = Array(favorites.prefix(5))
        let entry = SimpleEntry(date: .now, favorites: objects)
        print("Debug output dsalknda")
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        let favorites = FavoritesPersister().getFavorites()
        let objects = Array(favorites.prefix(5))
        let entry = SimpleEntry(date: .now, favorites: objects)
        let timeline = Timeline(entries: [entry], policy: .after(.now.addingTimeInterval(60 * 60 * 30)))
        print("Debug output")
        completion(timeline)
    }
}
