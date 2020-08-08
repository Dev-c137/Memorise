//
//  Array+Identifiable.swift
//  Memories
//
//  Created by Devang Pawar on 08/08/20.
//  Copyright © 2020 Devang Pawar. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func index(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
