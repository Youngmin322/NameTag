//
//  Onboarding.swift
//  NameTag
//
//  Created by Youngmin Cho on 1/27/26.
//

import SwiftUI

struct OnboardingPage: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
}

struct OnboardingView: View {
    @State private var currentPage = 0
    
    init(currentPage: Int = 0) {
        self._currentPage = State(initialValue: currentPage)
    }

    private let pages: [OnboardingPage] = [
        OnboardingPage(
            title: "신사적인 명함 교환 \n카디에요.",
            subtitle: "지금부터 카디의 사용법을 알려드릴게요",
            imageName: "Cardy"
        ),
        OnboardingPage(
            title: "내 주변에 위치한 상대의 명함들을 스캔해요",
            subtitle: "상대방이 명함을 공개상태로 해야만 목록이 떠요.",
            imageName: "CardySearch"
        ),
        OnboardingPage(
            title: "교환하기를 눌러 쉽게 명함을 교환해보세요",
            subtitle: "원하는 디자인으로\n나만의 명함을 꾸며보세요",
            imageName: "Cardy"
        ),
    ]

    var body: some View {
        VStack(spacing: -20) {
            TabView(selection: $currentPage) {
                ForEach(Array(pages.enumerated()), id: \.element.id) { index, page in
                    OnboardingPageView(page: page)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never)) // 시스템 도트 숨김

            // 커스텀 페이지 도트
            HStack(spacing: 8) {
                ForEach(0..<pages.count, id: \.self) { index in
                    Circle()
                        .fill(currentPage == index ? Color("PrimaryColor") : Color.gray.opacity(0.3))
                        .frame(width: currentPage == index ? 10 : 8, height: currentPage == index ? 10 : 8)
                        .animation(.easeInOut(duration: 0.2), value: currentPage)
                }
            }
            .padding(.bottom, 40)

            // 버튼
            VStack(spacing: 24) {
                Button {
                    if currentPage < pages.count - 1 {
                        withAnimation { currentPage += 1 }
                    } else {
                        
                    }
                } label: {
                    Text(currentPage == pages.count - 1 ? "시작하기" : "다음으로")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color("PrimaryColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(.horizontal, 14)
            }
            .padding(.bottom, 40)
        }
    }
}

struct OnboardingPageView: View {
    let page: OnboardingPage

    var body: some View {
        VStack {
            Text(page.title)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 15)
                .font(.title)
                .bold()
                .padding(.top, 40)

            Text(page.subtitle)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 15)
                .foregroundColor(.gray)
                .font(.subheadline)
                .padding(.top, 2)

            Spacer()

            Image(page.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 350)
                .padding(.top, -80)

            Spacer()
        }
    }
}

#Preview {
    OnboardingView(currentPage: 1)
}
