//
//  AddSubjectView.swift
//  AutoPlannerClient
//
//  Created by Michael Berk on 5/2/21.
//

import SwiftUI

struct KeyboardTypeModifier: ViewModifier {
	func body(content: Content) -> some View {
		#if os(iOS)
		return content.keyboardType(.decimalPad)
		#else
		return content
		#endif
	}
}


struct AddSubjectView: View {
	@EnvironmentObject var dataManager: DataManager
	@State var subject: Subject
	@Environment(\.presentationMode) var pMode
    var body: some View {
		NavigationView {
			Form {
				TextField("Name", text: $subject.name)
				TextField("Priority", text: .init(get: {
					subject.priority == 0 ? "" : "\(subject.priority)"
				}, set: {subject.priority = Double($0) ?? 0}))
				.modifier(KeyboardTypeModifier())
			}
			.navigationTitle("Subject")
			.toolbar(content: {
				ToolbarItem(placement: .cancellationAction, content: {
					Button(action: {
//						subject.name = ""
//						subject.priority = 0.0
						self.pMode.wrappedValue.dismiss()
					}, label: {
						Text("Cancel")
					})
				})
				ToolbarItem(placement: .confirmationAction, content: {
					Button(action: {
						dataManager.subjects.append(subject)
						self.pMode.wrappedValue.dismiss()
					}, label: {
						Text("Done")
					})
				})
			})
		}
    }
}

struct AddSubjectView_Previews: PreviewProvider {
    static var previews: some View {
		AddSubjectView(subject: Subject(name: "", priority: 0, totalDuration: 0))
			.environmentObject(DataManager())
    }
}
