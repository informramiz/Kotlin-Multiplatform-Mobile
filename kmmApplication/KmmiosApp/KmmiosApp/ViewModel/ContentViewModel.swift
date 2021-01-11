//
//  ContentViewModel.swift
//  KmmiosApp
//
//  Created by Ramiz Raja on 12/01/2021.
//  Copyright © 2021 orgName. All rights reserved.
//

import Foundation
import shared

extension ContentView {
    enum LoadableLaunches {
        case loading
        case result([RocketLaunch])
        case error(String)
    }
    
    class ContentViewModel : ObservableObject {
        private let sdk: SpaceXSDK
        @Published var launches = LoadableLaunches.loading
        
        init(sdk: SpaceXSDK) {
            self.sdk = sdk
            self.loadLaunches(forceReload: false)
        }
        
        func loadLaunches(forceReload: Bool) {
            self.launches = LoadableLaunches.loading
            sdk.getLaunches(forceReload: forceReload) { launches, error in
                if let launches = launches {
                    self.launches = .result(launches)
                } else {
                    self.launches = .error(error?.localizedDescription ?? "Unknown error")
                }
            }
        }
    }
}
