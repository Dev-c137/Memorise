//
//  Grid.swift
//  Memories
//
//  Created by Devang Pawar on 08/08/20.
//  Copyright © 2020 Devang Pawar. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView

    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }

    var body: some View {
        GeometryReader { geomety in
            self.body(for: GridLayout(itemCount: self.items.count, nearAspectRatio: self.aspectRatio, in: geomety.size))
        }

    }

    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }

    func body(for item: Item, in layout: GridLayout) -> some View {
        let index = items.index(matching: item)!
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }

    // MARK: - drawing constants
    let aspectRatio = 0.80
}
