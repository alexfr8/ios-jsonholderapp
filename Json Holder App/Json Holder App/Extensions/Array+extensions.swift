//
//  Array+extensions.swift
//  Json Holder App
//
//  Created by Alejandro Fernández Ruiz on 24/11/2019.
//  Copyright © 2019 Alejandro Fernández Ruiz. All rights reserved.
//

import Foundation


extension Array {
    func getElement(_ index: Int) -> Element? {
        guard index >= 0, index < self.count else {
            return nil
        }
        return self[index]
    }
}
