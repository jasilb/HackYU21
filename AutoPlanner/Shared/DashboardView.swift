//
//  DashboardView.swift
//  AutoPlannerClient
//
//  Created by Michael Berk on 5/2/21.
//

import SwiftUI
import BarChart



struct DashboardView: View {
	
	var secondaryBackgroundColor: Color {
		#if os(iOS)
		return Color(UIColor.secondarySystemBackground)
		#else
		return Color(NSColor.controlBackgroundColor)
		#endif
		
	}
	
	@EnvironmentObject var dataManager: DataManager
	
	var dataEntries: [ChartDataEntry] {
		var entries = [ChartDataEntry]()
		for subject in dataManager.subjects {
			entries.append(ChartDataEntry(x: subject.name, y: subject.totalDuration))
		}
		return entries
	}
	let config = ChartConfiguration()
    var body: some View {
		NavigationView {
			
			ScrollView {
				VStack {
					ZStack {
						BarChartView(config: config)
							.onAppear(perform: {
								self.config.data.entries = dataEntries
								self.config.data.color = .red
								self.config.xAxis.labelsColor = .gray
								self.config.xAxis.ticksColor = .gray
								self.config.xAxis.ticksDash = [2, 4]
								self.config.yAxis.labelsColor = .gray
								self.config.yAxis.ticksColor = .gray
								self.config.yAxis.ticksDash = [2, 4]
								self.config.yAxis.minTicksSpacing = 30.0
							})
							.padding()
							.background(secondaryBackgroundColor
											.shadow(radius: 10))
							.frame(height: 500)
							.padding()
					}
					.transition(.slide)
					.animation(.spring())
					Spacer()
					Button(action: {}, label: {
						Label(
							title: { Text("Schedule...") },
							icon: { Image(systemName: "calendar.badge.plus") }
						)
					})
					.buttonStyle(ButtonyButton())
				}
			}
			.navigationTitle("Today")
			
		}
		.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ButtonyButton: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.foregroundColor(.white)
			.padding()
			.background(RoundedRectangle(cornerRadius: 10)
							.foregroundColor(.blue))
			.shadow(radius: 10)
			.scaleEffect(configuration.isPressed ? 0.8 : 1)
			.animation(.spring())
	}
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
		DashboardView()
			.environmentObject(DataManager())
    }
}
