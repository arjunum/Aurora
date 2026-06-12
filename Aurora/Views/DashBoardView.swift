//
//  ContentView.swift
//  Aurora
//
//  Created by Arjun on 10/06/26.
//

import SwiftUI

struct DashboardView: View {

    var body: some View {

        ScrollView(showsIndicators: false) {

            VStack(spacing: 12) {

                HeaderView()

                AuroraStatusCard()

                MetricsGrid()

                TodaysFocusCard()

                InsightCard()

                VoiceAgentCard()
            }
            .padding()
        }
        .background(Color.background)
    }
}

struct HeaderView: View {

    var body: some View {

        HStack(alignment: .top){

            VStack(alignment: .leading, spacing: 4){

                Text("Good Morning")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Let's make today amazing.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            HStack(spacing: 12) {

                Button { } label: {
                    Image(systemName: "bell")
                        .font(.system(size: 22))
                }

                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.auroraPurple, .auroraBlue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 36, height: 36)
                    .overlay {
                        Text("A")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    }
            }
        }
    }
}

import SwiftUI

struct AuroraStatusCard: View {

    let score: Int = 92

    var body: some View {

        HStack(alignment: .center) {

            VStack(alignment: .leading, spacing: 8) {

                Text("Aurora Status")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text("Healthy Today")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.top, 2)

                VStack(alignment: .leading, spacing: 2) {

                    Text("\(score)%")
                        .font(.system(size: 38, weight: .bold))

                    Text("Confidence Score")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 3)

                VStack(alignment: .leading, spacing: 3) {

                    StatusRow(
                        icon: "drop.fill",
                        color: .blue,
                        text: "Hydration on track"
                    )

                    StatusRow(
                        icon: "checkmark.circle.fill",
                        color: .green,
                        text: "Habit consistency strong"
                    )

                    StatusRow(
                        icon: "arrow.up.right",
                        color: .green,
                        text: "8% better than yesterday"
                    )
                }
            }

            Spacer()

            VStack {
                ScoreRing(score: score)
                Spacer()
            }
        }
        .padding(22)
        .frame(height: 210)
        .background(
            LinearGradient(
                colors: [
                    Color.auroraPurple.opacity(0.10),
                    Color.auroraBlue.opacity(0.06)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(
                    Color.white.opacity(0.7),
                    lineWidth: 1
                )
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 30)
        )
    }
}
struct StatusRow: View {

    let icon: String
    let color: Color
    let text: String

    var body: some View {

        HStack(spacing: 8) {

            Image(systemName: icon)
                .foregroundStyle(color)
                .frame(width: 18)

            Text(text)
                .font(.caption)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
struct ScoreRing: View {

    let score: Int

    var body: some View {

        ZStack {

            Circle()
                .stroke(
                    Color.gray.opacity(0.15),
                    lineWidth: 12
                )

            Circle()
                .trim(
                    from: 0,
                    to: Double(score) / 100
                )
                .stroke(
                    AngularGradient(
                        colors: [
                            .auroraPurple,
                            .auroraBlue
                        ],
                        center: .center
                    ),
                    style: StrokeStyle(
                        lineWidth: 10,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))

            VStack(spacing: 2) {

                Text("\(score)")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("Score")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(width: 78, height: 78)
        .shadow(
            color: .auroraPurple.opacity(0.15),
            radius: 8
        )
    }
}


import SwiftUI

struct MetricCard: View {

    let title: String
    let value: String
    let subtitle: String
    let icon: String
    let color: Color

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {

            HStack(spacing: 8) {

                ZStack {

                    Circle()
                        .fill(color.opacity(0.15))
                        .frame(width: 28, height: 28)

                    Image(systemName: icon)
                        .font(.caption)
                        .foregroundStyle(color)
                }

                Text(title)
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Spacer()
            }

            Text(value)
                .font(.system(size: 24, weight: .bold))

            Text(subtitle)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .padding(14)
        .frame(height: 95)
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
        .shadow(
            color: .black.opacity(0.025),
            radius: 10,
            y: 4
        )
    }
}
import SwiftUI

struct MetricsGrid: View {

    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    var body: some View {

        LazyVGrid(
            columns: columns,
            spacing: 12
        ) {

            MetricCard(
                title: "Hydration",
                value: "1.5L",
                subtitle: "60% Goal",
                icon: "drop.fill",
                color: .blue
            )

            MetricCard(
                title: "Habits",
                value: "76%",
                subtitle: "Great Week",
                icon: "checkmark.circle.fill",
                color: .green
            )

            MetricCard(
                title: "Streak",
                value: "7 Days",
                subtitle: "+2 This Week",
                icon: "flame.fill",
                color: .orange
            )

            MetricCard(
                title: "Energy",
                value: "86%",
                subtitle: "Above Avg",
                icon: "bolt.fill",
                color: .yellow
            )
        }
    }
}

struct TodaysFocusCard: View {

    private let completedTasks = 2
    private let totalTasks = 4

    private var progress: Double {
        Double(completedTasks) / Double(totalTasks)
    }

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            // Header
            HStack {

                VStack(alignment: .leading, spacing: 4) {

                    Text("Today's Focus")
                        .font(.headline)

                    Text("\(completedTasks) of \(totalTasks) completed")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                Text("50%")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.auroraPurple)
            }

            // Progress Bar
            AuroraProgressBar(
                progress: progress
            )
            // Tasks
            VStack(spacing: 12) {

                FocusRow(
                    title: "Drink 2.5L Water",
                    completed: false
                )

                FocusRow(
                    title: "Morning Meditation",
                    completed: true
                )

                FocusRow(
                    title: "Workout",
                    completed: false
                )

                FocusRow(
                    title: "Read 10 Pages",
                    completed: true
                )
            }
        }
        .padding(18)
        .background(.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
        .shadow(
            color: .black.opacity(0.025),
            radius: 10,
            y: 4
        )
    }
}

struct FocusRow: View {
    
    let title: String
    let completed: Bool
    
    var body: some View {
        
        HStack(spacing: 12) {
            
            Image(systemName:
                    completed
                  ? "checkmark.circle.fill"
                  : "circle"
            )
            .foregroundStyle(
                completed
                ? .green
                : .gray.opacity(0.6)
            )
            .font(.title3)
            
            Text(title)
                .font(.subheadline)
            
            Spacer()
        }
    }
}


struct InsightCard: View {

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            HStack {

                Image(systemName: "sparkles")
                    .foregroundColor(.auroraPurple)

                Text("Aurora Insight")
                    .font(.headline)
            }

            Text("""
You've been consistent this week.

Completing hydration before noon can improve energy levels by keeping your body regulated throughout the day.
""")
            .font(.subheadline)
            .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 24)
        )
    }
}


import SwiftUI

struct VoiceAgentCard: View {

    var body: some View {

        VStack(spacing: 18) {

            VStack(spacing: 6) {

                Text("Aurora Assistant")
                    .font(.headline)

                Text("Ask me anything about your health")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            ZStack {

                Circle()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.auroraPurple.opacity(0.15),
                                Color.auroraBlue.opacity(0.15)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)

                Circle()
                    .fill(
                        LinearGradient(
                            colors: [
                                .auroraPurple,
                                .auroraBlue
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 70, height: 70)
                    .shadow(
                        color: .auroraPurple.opacity(0.25),
                        radius: 15
                    )

                Image(systemName: "waveform")
                    .font(.title)
                    .foregroundStyle(.white)
            }

            HStack(spacing: 6) {

                Circle()
                    .fill(.green)
                    .frame(width: 8, height: 8)

                Text("Listening • Ready")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            VStack(alignment: .leading, spacing: 4) {

                Text("Try asking")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text("\"How healthy am I today?\"")
                    .font(.caption)
                    .fontWeight(.medium)
            }

            Button {

            } label: {

                Text("Hold to Talk")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(
                        LinearGradient(
                            colors: [
                                .auroraPurple,
                                .auroraBlue
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .clipShape(
                        RoundedRectangle(cornerRadius: 14)
                    )
            }
        }
        .padding(20)
        .background(.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
        .shadow(
            color: .black.opacity(0.025),
            radius: 10,
            y: 4
        )
    }
}

#Preview {
    DashboardView()
}
