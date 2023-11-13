//
//  NoIssueView.swift
//  HabitsTracker
//
//  Created by Robert-Dumitru Oprea on 15/10/2023.
//

import SwiftUI

struct NoIssueView: View {
    @EnvironmentObject var dataController: DataController
    var body: some View {
        Text("No Issue Selected")
            .font(.title)
            .foregroundStyle(.secondary)
        Button("New Issue") {
            //make a new issue
        }
    }
}

#Preview {
    NoIssueView()
}
