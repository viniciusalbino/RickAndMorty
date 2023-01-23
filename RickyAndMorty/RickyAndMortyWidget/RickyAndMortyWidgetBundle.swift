//
//  RickyAndMortyWidgetBundle.swift
//  RickyAndMortyWidget
//
//  Created by Vinicius Albino on 23/01/23.
//

import WidgetKit
import SwiftUI

@main
struct RickyAndMortyWidgetBundle: WidgetBundle {
    var body: some Widget {
        RickyAndMortyWidget()
        RickyAndMortyWidgetLiveActivity()
    }
}
