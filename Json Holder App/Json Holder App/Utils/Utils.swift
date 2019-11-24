//
//  Utils.swift
//  Json Holder App
//
//  Created by Alejandro Fernández Ruiz on 24/11/2019.
//  Copyright © 2019 Alejandro Fernández Ruiz. All rights reserved.
//

import Foundation


// Execute function on a background thread
func background(_ f: @escaping () -> Void) {
    DispatchQueue.global(qos: .background).async {
        f()
    }
}

// Execute function on UI thread
func ui(_ f: @escaping () -> Void) {
    DispatchQueue.main.async {
        f()
    }
}
