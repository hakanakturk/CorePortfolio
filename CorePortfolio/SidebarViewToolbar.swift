//
//  SidebarViewToolbar.swift
//  CorePortfolio
//
//  Created by Hakan Aktürk on 13.06.2023.
//

import SwiftUI

struct SidebarViewToolbar: View {
    @EnvironmentObject var dataController: DataController
    @State private var showingAwards = false
    var body: some View {
        Button(action: dataController.newTag) {
            Label("Add tag", systemImage: "plus")
        }
        
        Button {
            showingAwards.toggle()
        } label: {
            Label("Show awards", systemImage: "rosette")
        }
        .sheet(isPresented: $showingAwards, content: AwardsView.init)
        
        #if DEBUG
        Button {
            dataController.deleteAll()
            dataController.createSampleData()
        }label: {
            Label("Add Samples", systemImage: "flame")
        }
        #endif
    }
}

struct SidebarViewToolbar_Previews: PreviewProvider {
    static var previews: some View {
        SidebarViewToolbar()
    }
}
