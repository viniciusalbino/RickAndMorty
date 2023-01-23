//
//  RickyAndMortyWidget.swift
//  RickyAndMortyWidget
//
//  Created by Vinicius Albino on 23/01/23.
//

import WidgetKit
import SwiftUI
import Intents

struct RickyAndMortyWidget: Widget {
    let kind: String = "RickyAndMortyWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            RickyAndMortyWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Ricky And Morty Widget")
        .description("This shows all your favorites characters")
        .supportedFamilies([.systemLarge, .systemMedium])
    }
}

struct RickyAndMortyWidget_Previews: PreviewProvider {
    static var previews: some View {
        RickyAndMortyWidgetEntryView(entry: SimpleEntry(date: .now, favorites: [CharacterModel(id: 1, name: "Genital Washer", status: "Alive", species: "Human", type: "", gender: "Male", origin: CharacterOrigin(name: "", url: "") , location: CharacterLocation(name: "", url: ""), image: "https://rickandmortyapi.com/api/character/avatar/140.jpeg", episode: ["dsa"], url: "dsa", created: "dsa"),
            CharacterModel(id: 1, name: "Genital Washer", status: "Alive", species: "Human", type: "", gender: "Male", origin: CharacterOrigin(name: "", url: "") , location: CharacterLocation(name: "", url: ""), image: "https://rickandmortyapi.com/api/character/avatar/140.jpeg", episode: ["dsa"], url: "dsa", created: "dsa")]))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
