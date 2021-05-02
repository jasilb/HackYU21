//
//  Subjects.swift
//  AutoPlannerClient
//
//  Created by Michael Berk on 5/2/21.
//

import SwiftUI

struct InsetGroup: ViewModifier {
	func body(content: Content) -> some View {
		#if os(iOS)
		return
			
			content.listStyle(InsetGroupedListStyle())
		#else
		return content
		#endif
		
	}
}

class DataManager: ObservableObject {
	@Published var subjects: [Subject] = [
		Subject(name: "D&A Algorithms", priority: 10, totalDuration: 50),
		Subject(name: "Operating Systems", priority: 10, totalDuration: 20),
		Subject(name: "Architecture", priority: 10, totalDuration: 5)
	]
	
	@Published var tests: [Test] = [
		Test(name: "Final", month: 10, day: 21)
	]
	
	
	
}

struct SubjectsView: View {
	@EnvironmentObject var dataManager: DataManager
	@State var editingSubject: Subject?
	@State var addSubject = false
	
    var body: some View {
		NavigationView {
			List(dataManager.subjects, id: \.self) { subject in
				HStack {
					Text(subject.name)
					Spacer()
					Text(String(format: "%.1f", subject.priority))
				}
			}
			.modifier(InsetGroup())
			.toolbar(content: {
				ToolbarItem(placement: .confirmationAction, content: {
					Button(action: {
						editingSubject = Subject(name: "hey", priority: 0, totalDuration: 0)
						DispatchQueue.main.async {
							addSubject = true
						}
					}, label: {
						Image(systemName: "plus")
					})
					.buttonStyle(ButtonyButton())
				})
			})
			.navigationTitle("Subjects")
			.sheet(isPresented: $addSubject, onDismiss: {
//				if let es = editingSubject, es.name != "" && es.priority != 0 {
////					datamane.subjects.append(es)
//				}
			}, content: {
				AddSubjectView(subject: Subject(name: "", priority: 0, totalDuration: 0))
					.environmentObject(dataManager)
			})
		}
		.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Subjects_Previews: PreviewProvider {
	static let subs = [
		Subject(name: "D&A Algorithms", priority: 10, totalDuration: 50),
		Subject(name: "Operating Systems", priority: 10, totalDuration: 20),
		Subject(name: "Architecture", priority: 10, totalDuration: 5)
	]
    static var previews: some View {
		SubjectsView()
			.environmentObject(DataManager())
    }
}
