//
//  LargeView.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 23/01/23.
//

import Foundation
import WidgetKit
import SwiftUI

struct LargeView: View {
    var entry: SimpleEntry
    var body: some View {
        VStack {
            ForEach(entry.favorites) { item in
                HStack {
                    ZStack {
                        AsyncImage(url: URL(string: item.image), content: { image in
                            image.resizable()
                        }, placeholder: {
                            ProgressView()
                        })
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        .scaledToFit()
                    }
                    Text(item.name).font(.title2)
                }
                Divider()
            }
        }
    }
}
