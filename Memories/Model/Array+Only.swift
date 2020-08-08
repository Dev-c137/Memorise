//
//  Array+Only.swift
//  Memories
//
//  Created by Devang Pawar on 08/08/20.
//  Copyright © 2020 Devang Pawar. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
