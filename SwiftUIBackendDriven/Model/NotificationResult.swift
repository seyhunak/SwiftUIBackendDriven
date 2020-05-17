//
//  NotificationResult.swift
//  SwiftUIBackend
//
//  Created by SEYHUN AKYÜREK on 16.05.2020.
//  Copyright © 2020 seyhunak. All rights reserved.
//

import Foundation

struct NotificationResult: Codable {
    let id: String
    let message: String
    let actionText: String
}
