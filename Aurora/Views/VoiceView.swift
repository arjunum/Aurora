//
//  VoiceView.swift
//  Aurora
//
//  Created by Arjun on 11/06/26.
//

import SwiftUI

struct VoiceView: View {

    var body: some View {

        NavigationStack {

            ScrollView(showsIndicators: false) {

                VStack(spacing: 20) {

                    header

                    VoiceOrbCard()

                    SuggestedQuestionsCard()

                    ConversationCard()
                }
                .padding()
                .padding(.bottom, 120)
            }
            .background(Color.background)
            .navigationBarHidden(true)
        }
    }

    private var header: some View {

        VStack(alignment: .leading, spacing: 8) {

            Text("Aurora")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Your AI Wellness Companion")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct VoiceOrbCard: View {

    var body: some View {

        VStack(spacing: 20) {

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
                    .frame(width: 140, height: 140)

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
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(
            color: .black.opacity(0.03),
            radius: 10,
            y: 4
        )
    }
}

struct SuggestedQuestionsCard: View {

    let questions = [
        "How healthy am I today?",
        "What should I improve?",
        "Summarize my habits",
        "What do you remember about me?"
    ]

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {

            Text("Try Asking")
                .font(.headline)

            ForEach(questions, id: \.self) { question in

                HStack {

                    Image(systemName: "sparkles")
                        .foregroundColor(.auroraPurple)

                    Text(question)
                        .font(.subheadline)

                    Spacer()
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(
                    Color.auroraPurple.opacity(0.06)
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            }
        }
        .padding(18)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct ConversationCard: View {

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            Text("Conversation")
                .font(.headline)

            UserBubble(
                text: "How healthy am I today?"
            )

            AuroraBubble(
                text:
            """
            You are healthy today with 92% confidence.

            Hydration is on track.

            Habit consistency is strong.

            I remember that improving hydration is one of your current wellness goals.

            Drink another 500ml before noon to improve your wellness score.
            """
            )
        }
        .padding(18)
        .background(.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
    }
}

struct UserBubble: View {

    let text: String

    var body: some View {

        HStack {

            Spacer()

            Text(text)
                .padding()
                .background(
                    Color.auroraPurple
                )
                .foregroundStyle(.white)
                .clipShape(
                    RoundedRectangle(cornerRadius: 16)
                )
        }
    }
}

struct AuroraBubble: View {

    let text: String

    var body: some View {

        HStack {

            Text(text)
                .padding()
                .background(
                    Color.gray.opacity(0.1)
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: 16)
                )

            Spacer()
        }
    }
}

#Preview {
    VoiceView()
}
