//
//  Tests.swift
//  AutoPlannerClient
//
//  Created by Michael Berk on 5/2/21.
//

import SwiftUI

struct TestsView : View {
	@EnvironmentObject var dataManager: DataManager
	@State var showTestEditor = false
	var body: some View {
		NavigationView {
			List(dataManager.tests, id: \.self) { test in
				Text(test.name)
			}
			.toolbar(content: {
				ToolbarItem(placement: .navigationBarTrailing, content: {
					Button(action: {
						showTestEditor = true
					}, label: {
						Image(systemName: "plus")
					})
				})
			})
			.modifier(InsetGroup())
			.navigationTitle("Tests")
			.sheet(isPresented: $showTestEditor, content: {
				AddTestView(test: Test(name: "", month: 1, day: 1))
					.environmentObject(dataManager)
			})
		}
		.navigationViewStyle(StackNavigationViewStyle())
	}
}

struct TestsView_Preview: PreviewProvider {
	static var tests: [Test] = [
		Test(name: "Boring", month: 10, day: 21)
	]
	
	static var previews: some View {
		TestsView()
			.environmentObject(DataManager())
	}
}
