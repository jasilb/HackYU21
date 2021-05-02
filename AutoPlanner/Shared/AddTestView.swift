//
//  AddTestView.swift
//  AutoPlannerClient
//
//  Created by Michael Berk on 5/2/21.
//

import SwiftUI

struct AddTestView: View {
	@EnvironmentObject var dataManager: DataManager
	@State var test: Test
	@State var subject: Subject? = nil
	@Environment(\.presentationMode) var pMode
    var body: some View {
		NavigationView {
			Form {
				TextField("Test Name", text: $test.name)
				Picker(selection: $subject, label: Text("Subject"), content: {
					ForEach(dataManager.subjects) {
						Text($0.name).id($0.name)
					}
				})
				DatePicker("", selection: .init(get: {
					DateComponents(calendar: .current, year: 2021, month: test.month, day: test.day).date ?? Date()
					
				}, set: {
					let comps = Calendar.current.dateComponents([.day, .month], from: $0)
					test.day = comps.day ?? 1
					test.month = comps.month ?? 1
				}), displayedComponents: [.date])
				.datePickerStyle(GraphicalDatePickerStyle())
			}
			.navigationTitle("Test")
			.toolbar(content: {
				ToolbarItem(placement: .confirmationAction, content: {
					Button(action: {
						self.dataManager.tests.append(test)
						self.pMode.wrappedValue.dismiss()
					}, label: {
						Text("Done")
					})
				})
				ToolbarItem(placement: .cancellationAction, content: {
					Button(action: {
						self.pMode.wrappedValue.dismiss()
					}, label: {
						Text("Cancel")
					})
				})
			})
		}
    }
}

struct AddTestView_Previews: PreviewProvider {
    static var previews: some View {
        AddTestView(test: Test(name: "", month: 1, day: 1))
    }
}
