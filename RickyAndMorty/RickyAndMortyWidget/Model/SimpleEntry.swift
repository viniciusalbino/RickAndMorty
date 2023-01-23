//
//  SimpleEntry.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 23/01/23.
//

import Foundation
import WidgetKit
import SwiftUI

struct SimpleEntry: TimelineEntry {
    let date: Date
    let favorites: [CharacterModel]
}
