//
//  ContentView.swift
//  SFSymbolsAnimation
//
//  Created by Михаил Куприянов on 28.9.23..
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimated = false
    @State private var isHidden = false
    @State private var isActive = false
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .symbolEffect(.pulse)
            Text("pulse")
            HStack(spacing: 20) {
                VStack(spacing: 20) {
                    Image(systemName: "mail.stack")
                        .scaleEffect(3)
                        .foregroundStyle(.tint)
                        .symbolEffect(.bounce.up, value: isAnimated)
                    Text("Animated bounce")
                }
                VStack(spacing: 20) {
                    Image(systemName: "globe")
                        .scaleEffect(3)
                        .foregroundStyle(.teal)
                        .symbolEffect(.pulse, isActive: isAnimated)
                    Text("Animated pulse")
                }
            }
            
            HStack {
                VStack {
                    Image(systemName: "wifi")
                        .scaleEffect(2)
                        .foregroundStyle(.brown)
                        .symbolEffect(.variableColor, isActive: isAnimated)
                        .padding(.bottom)
                    Text("variableColor")
                        .font(.caption)
                }
                VStack {
                    Image(systemName: "wifi")
                        .scaleEffect(2)
                        .foregroundStyle(.pink)
                        .symbolEffect(.variableColor.iterative, isActive: isAnimated)
                        .padding(.bottom)
                    Text("iterative")
                        .font(.caption)
                }
                VStack {
                    Image(systemName: "wifi")
                        .scaleEffect(2)
                        .foregroundColor(.blue)
                        .symbolEffect(.variableColor.cumulative, isActive: isAnimated)
                        .padding(.bottom)
                    Text("cumulative")
                        .font(.caption)
                }
                VStack {
                    Image(systemName: "wifi")
                        .scaleEffect(2)
                        .foregroundColor(.red)
                        .symbolEffect(.variableColor.reversing.iterative, isActive: isAnimated)
                        .padding(.bottom)
                    Text("reversing\niterative")
                        .font(.caption2)
                }
                VStack {
                    Image(systemName: "wifi")
                        .scaleEffect(2)
                        .foregroundColor(.green)
                        .symbolEffect(.variableColor.reversing.cumulative, isActive: isAnimated)
                        .padding(.bottom)
                    Text("reversing\ncumulative")
                        .font(.caption2)
                }
            }
            Text("Animated variableColor")
            HStack(spacing: 30) {
                VStack(spacing: 20) {
                    Image(systemName: "magnifyingglass")
                        .scaleEffect(3)
                        .foregroundStyle(.link)
                        .symbolEffect(.scale.up, isActive: isAnimated)
                    //  .symbolEffect(.scale.down, isActive: isAnimated)
                    Text("scale up/down")
                }
                VStack(spacing: 20) {
                    Image(systemName: "eye")
                        .scaleEffect(3)
                        .foregroundStyle(.green)
                        .symbolEffect(.appear, isActive: isHidden)
                    Text("appear")
                }
                VStack(spacing: 20) {
                    if !isHidden {
                        Image(systemName: "eye")
                            .scaleEffect(3)
                            .foregroundStyle(.green)
                            .transition(.symbolEffect(.disappear))
                    }
                    Text("transition disappear")
                }
            }
            
            HStack(spacing: 50) {
                Button("Animate") {
                    isAnimated.toggle()
                }
                .font(.largeTitle)
                .foregroundColor(.pink)
                Button(isHidden ? "Show eye" : "Hide eye") {
                    isHidden.toggle()
                }
                .font(.largeTitle)
                .foregroundColor(.green)
            }
            HStack {
                VStack(spacing: 20) {
                    Image(systemName: isActive ? "checkmark" : "xmark")
                        .scaleEffect(3)
                        .foregroundStyle(.tint)
                    .contentTransition(.symbolEffect(.replace))
                    Button(isActive ? "Yes" : "No") {
                        isActive.toggle()
                    }
                    .font(.title)
                    .foregroundStyle(.tint)
                    Text("animation replace")
                }
                VStack(spacing: 20) {
                    Image(systemName: "wifi")
                        .scaleEffect(3)
                        .foregroundStyle(.tint)
                        .symbolEffect(.bounce.down,
                                      options: .speed(2).repeat(4),
                                      value: isAnimated)
                    .font(.title)
                    .foregroundStyle(.tint)
                    .padding(.bottom, 40)
                    Text("options speed repeat")

                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
