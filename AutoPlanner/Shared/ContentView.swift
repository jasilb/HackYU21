//
//  ContentView.swift
//  Shared
//
//  Created by Michael Berk on 5/1/21.
//

import SwiftUI


enum TabOption: Int, CaseIterable, Identifiable {
	case today
	case subjects
//	case homework
	case tests
	var id: Int {
		return self.rawValue
	}
	
	var title: String {
		switch self {
		case .today:
			return "Today"
		case .subjects:
			return "Subjects"
		case .tests:
			return "Tests"
		}
	}
	var icon: Image {
		switch self {
		case .today:
			return Image(systemName: "rectangle.3.offgrid.fill")
		case .subjects:
			return Image("mortarboard")
				.resizable()
//		case .homework:
//			return Image(systemName: "doc.text.fill")
		case .tests:
			return Image(systemName: "doc.text.fill")
		}
	}
}

struct ContentView: View {
	@State var subjects: [Subject] = Subjects_Previews.subs
	@ObservedObject var dataManager = DataManager()
    var body: some View {
		TabView {
			ForEach(TabOption.allCases) { tab in
				Group {
					switch tab {
					case .today:
						DashboardView()
							.environmentObject(dataManager)
					case .subjects:
						SubjectsView()
							.environmentObject(dataManager)
					case .tests:
					TestsView()
						.environmentObject(dataManager)
					default:
						Text(tab.title)
					}
				}
				.tabItem { Label(
					title: { Text(tab.title) },
					icon: { tab.icon
						.resizable()
						
					}
				) }
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
