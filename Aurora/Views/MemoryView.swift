//
//  MemoryView.swift
//  Aurora
//
//  Created by Arjun on 11/06/26.
//

import SwiftUI

struct MemoryView: View {

    var body: some View {

        NavigationStack {

            ScrollView(showsIndicators: false) {

                VStack(alignment: .leading, spacing: 20) {

                    memoryHeader

                    MemoryCard(
                        icon: "drop.fill",
                        color: .blue,
                        title: "Improve Hydration",
                        date: "Today",
                        memory: "\"I need to drink more water.\"",
                        recommendation:
                        "Drink 500ml before noon."
                    )

                    MemoryCard(
                        icon: "moon.fill",
                        color: .indigo,
                        title: "Better Sleep",
                        date: "Yesterday",
                        memory: "\"I'm not sleeping well lately.\"",
                        recommendation:
                        "Avoid caffeine after 4 PM."
                    )

                    MemoryCard(
                        icon: "figure.walk",
                        color: .green,
                        title: "More Movement",
                        date: "3 Days Ago",
                        memory: "\"I want to become more active.\"",
                        recommendation:
                        "Take a 15-minute evening walk."
                    )
                }
                .padding()
                .padding(.bottom, 120)
            }
            .background(Color.background)
            .navigationBarHidden(true)
        }
    }

    private var memoryHeader: some View {

        VStack(alignment: .leading, spacing: 8) {

            Text("Aurora Memory")
                .font(.system(size: 30))
                .fontWeight(.bold)

            Text("Your wellness journey, remembered by Aurora.")
                .font(.system(size: 15))
                .foregroundStyle(.secondary)
        }
    }
}

struct MemoryCard: View {

    let icon: String
    let color: Color
    let title: String
    let date: String
    let memory: String
    let recommendation: String

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            HStack {

                ZStack {

                    Circle()
                        .fill(color.opacity(0.15))
                        .frame(width: 44, height: 44)

                    Image(systemName: icon)
                        .foregroundStyle(color)
                }

                VStack(alignment: .leading) {

                    Text(title)
                        .fontWeight(.semibold)

                    Text(date)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer()
            }
//            Text("Remembered")
//                   .font(.caption2)
//                   .fontWeight(.medium)
//                   .padding(.horizontal, 10)
//                   .padding(.vertical, 4)
//                   .background(
//                       Color.auroraPurple.opacity(0.12)
//                   )
//                   .foregroundColor(.auroraPurple)
//                   .clipShape(Capsule())

            VStack(alignment: .leading, spacing: 8) {

                Text("You said")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text(memory)
            }

            Divider()

            VStack(alignment: .leading, spacing: 8) {

                Text("What Aurora Remembered")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text(recommendation)
                    .fontWeight(.medium)
            }
        }
        .padding(18)
        .background(.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
        .shadow(
            color: .black.opacity(0.03),
            radius: 10,
            y: 4
        )
    }
}


#Preview {
    MemoryView()
}
