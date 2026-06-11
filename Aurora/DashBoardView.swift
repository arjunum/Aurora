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

            VStack(spacing: 20) {

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

            ZStack{
                Circle()
                    .fill(.white)

                Image(systemName: "bell")
            }
            .frame(width: 42,height: 42)
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


struct MetricCard: View {

    let title: String
    let value: String
    let icon: String
    let color: Color

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(color)

            Spacer()

            Text(value)
                .font(.title2)
                .fontWeight(.bold)

            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(height: 120)
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 24)
        )
        .shadow(
            color: .black.opacity(0.04),
            radius: 8,
            y: 4
        )
    }
}

struct MetricsGrid: View {

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {

        LazyVGrid(
            columns: columns,
            spacing: 16
        ) {

            MetricCard(
                title: "Hydration",
                value: "1.5L",
                icon: "drop.fill",
                color: .blue
            )

            MetricCard(
                title: "Habit Score",
                value: "76%",
                icon: "checkmark.circle.fill",
                color: .green
            )

            MetricCard(
                title: "Current Streak",
                value: "7 Days",
                icon: "flame.fill",
                color: .orange
            )

            MetricCard(
                title: "Energy",
                value: "86%",
                icon: "bolt.fill",
                color: .yellow
            )
        }
    }
}

struct TodaysFocusCard: View {

    var body: some View {

        VStack(alignment: .leading, spacing: 18) {

            Text("Today's Focus")
                .font(.headline)

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
        .padding()
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 24)
        )
    }
}

struct FocusRow: View {

    let title: String
    let completed: Bool

    var body: some View {

        HStack {

            Image(systemName:
                    completed
                  ? "checkmark.circle.fill"
                  : "circle"
            )
            .foregroundStyle(
                completed
                ? .green
                : .gray
            )

            Text(title)

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


struct VoiceAgentCard: View {

    var body: some View {

        VStack(spacing: 20) {

            Text("Talk to Aurora")
                .font(.title3)
                .fontWeight(.semibold)

            ZStack {

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
                    .frame(width: 90, height: 90)

                Image(systemName: "mic.fill")
                    .font(.title)
                    .foregroundStyle(.white)
            }

            Text("Hold to speak")
                .foregroundStyle(.secondary)
                .font(.caption)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 220)
        .background(.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 24)
        )
    }
}

#Preview {
    DashboardView()
}
