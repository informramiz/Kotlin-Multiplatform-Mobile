//
//  RocketLaunchRow.swift
//  KmmiosApp
//
//  Created by Ramiz Raja on 12/01/2021.
//  Copyright © 2021 orgName. All rights reserved.
//

import SwiftUI
import shared

struct RocketLaunchRow: View {
    var rocketLaunch: RocketLaunch
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Launch name: \(rocketLaunch.missionName)")
                Text("Launch status: \(launchText)").foregroundColor(launchColor)
                Text("Launch year: \(rocketLaunch.launchYear)")
                Text("Launch Details: \(rocketLaunch.details ?? "")")
            }
        }
    }
}

extension RocketLaunchRow {
    private var launchText: String {
        if let isSuccess = rocketLaunch.launchSuccess {
            return isSuccess.boolValue ? "Successful" : "Unsuccessful"
        } else {
            return "No Data"
        }
    }
    
    private var launchColor : Color {
        if let isSuccess = rocketLaunch.launchSuccess {
            return isSuccess.boolValue ? Color.green : Color.red
        } else {
            return Color.gray
        }
    }
}

struct RocketLaunchRow_Previews: PreviewProvider {
    static var previews: some View {
        RocketLaunchRow(rocketLaunch: RocketLaunch(flightNumber: 1, missionName: "Moon Mission", launchYear: 1, launchDateUTC: "utc", rocket: Rocket_(id: "Id", name: "Falcon Heavy", type: "Block 8"), details: "Launch details", launchSuccess: true, links: Links(missionPatchUrl: "mission patch", articleUrl: "article_url")))
    }
}
