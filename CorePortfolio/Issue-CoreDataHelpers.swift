//
//  Issue-CoreDataHelpers.swift
//  CorePortfolio
//
//  Created by Hakan Aktürk on 31.03.2023.
//

import Foundation

extension Issue {
    var issueTitle: String {
        get { title ?? ""}
        set { title = newValue }
    }
    
    var issueContent: String {
        get { content ?? ""}
        set { content = newValue }
    }
    
    var issueCreationDate: Date {
        creationDate ?? .now
    }
    
    var issueModificationDate: Date {
        modificationDate ?? .now
    }
    
    var issueTags: [Tag] {
        let result = tags?.allObjects as? [Tag] ?? []
        return result.sorted()
    }
    
    var issueTagsList: String {
        guard let tags else { return "No Tags" }
        
        if tags.count == 0 {
            return "No Tags"
        } else {
            return issueTags.map(\.tagName).formatted()
        }
    }
    
    var issueStatus: String {
        if completed {
           return "Closed"
        }else {
            return "Open"
        }
    }
    
    static var example: Issue {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let issue = Issue(context: viewContext)
        issue.title = "Example issue"
        issue.content = "ex content"
        issue.priority = 2
        issue.creationDate = .now
        return issue
    }
}

extension Issue: Comparable {
    public static func <(lhs: Issue, rhs: Issue) -> Bool {
        let left = lhs.issueTitle.localizedLowercase
        let right = rhs.issueTitle.localizedLowercase
        
        if left == right {
            return lhs.issueCreationDate < rhs.issueCreationDate
        } else {
            return left < right
        }
    }
}
