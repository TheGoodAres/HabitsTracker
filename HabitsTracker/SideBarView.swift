//
//  SideBarView.swift
//  HabitsTracker
//
//  Created by Robert-Dumitru Oprea on 13/10/2023.
//

import SwiftUI

struct SideBarView: View {
    @EnvironmentObject var dataController: DataController
    let smartFilters: [Filter] = [.all, .recent]

    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var tags: FetchedResults<Tag>

    var tagFilters: [Filter] {
        tags.map { tag in
            Filter(id: tag.id ?? UUID(), name: tag.name ?? "No Name", icon: "tag", tag: tag)
        }
    }

    var body: some View {
        List(selection: $dataController.selectedFiler) {
            Section("Smart Filters") {
                ForEach(smartFilters) { filter in
                    NavigationLink(value: filter) {
                        Label(filter.name, systemImage: filter.icon)
                    }
                }
            }
            Section("Tags") {
                ForEach(tagFilters) {filter in
                    NavigationLink(value: filter) {
                        Label(filter.name, systemImage: filter.icon)
                    }
                }
            }
        }
        .toolbar {
            Button{
                dataController.deleteAll()
                dataController.createSampleData()
            } label: {
                Label("ADD SAMPLES", systemImage: "flame")
            }
        }
    }
}

#Preview {
    SideBarView()
}
