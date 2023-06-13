//
//  TagsMenuView.swift
//  CorePortfolio
//
//  Created by Hakan Aktürk on 13.06.2023.
//

import SwiftUI

struct TagsMenuView: View {
    @EnvironmentObject var dataController: DataController
    @ObservedObject var issue: Issue
    var body: some View {
        Menu {
            ForEach(issue.issueTags) { tag in
                Button {
                    issue.removeFromTags(tag)
                }label: {
                    Label(tag.tagName, systemImage: "checkmark")
                }
            }
            
            let otherTags = dataController.missingTags(from: issue)
            
            if otherTags.isEmpty == false {
                Divider()
                
                Section("Add Tags") {
                    ForEach(otherTags) { tag in
                        Button(tag.tagName) {
                            issue.addToTags(tag)
                        }
                    }
                }
            }
        }label: {
            Text(issue.issueTagsList)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .animation(nil, value: issue.issueTagsList)
        }
    }
}

struct TagsMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TagsMenuView(issue: Issue.example)
            .environmentObject(DataController(inMemory: true))
    }
}
