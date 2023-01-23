//
//  WidgetView.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 23/01/23.
//

import WidgetKit
import SwiftUI

struct RickyAndMortyWidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry

    var body: some View {
        switch widgetFamily {
        case .systemMedium:
            MediumView(entry: entry)
        case .systemLarge:
            LargeView(entry: entry)
        default:
            Text("Not Implemented")
        }
    }
}
