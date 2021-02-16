//
//  TimeBadgeView.swift
//  HackerNews
//
//  Created by Damian Sznajder on 16/02/2021.
//

import SwiftUI

struct TimeBadgeView: View {
    
    let time: TimeInterval
    let currentDate: Date
    
    private static var formatter = RelativeDateTimeFormatter()
    
    private var relativeTime: String {
        TimeBadgeView.formatter.localizedString(fromTimeInterval: time - currentDate.timeIntervalSince1970)
    }
    
    var body: some View {
        Text(relativeTime)
            .font(.caption)
            .fontWeight(.bold)
            .padding(6)
            .foregroundColor(.white)
            .background(Color.orange)
            .cornerRadius(4)
    }
}

struct TimeBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeBadgeView(time: Date().timeIntervalSince1970 - 1000, currentDate: Date())
    }
}
