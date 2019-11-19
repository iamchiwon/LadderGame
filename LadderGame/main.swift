//
//  main.swift
//  LadderGame
//
//  Created by JK on 2019/11/11.
//  Copyright © 2019 codesquad. All rights reserved.

import Foundation

class InputHandler: InputHandlable {
    func getHeight() -> Int {
        print("사다리 높이를 입력해주세요.")
        let height = readLine() ?? ""
        return Int(height) ?? 0
    }

    func getNames() -> [LadderPlayer] {
        print("참여할 사람 이름을 입력하세요.")
        let players = readLine() ?? ""
        return players.split(separator: ",")
            .map { String($0) }
            .map { LadderPlayer(name: $0) }
    }
}

class OutputHandler: OutputHandlable {
    func printLadder(ladder: [String]) {
        ladder.forEach { print($0) }
    }
}

// -------------------------------

struct LadderPlayer {
    var name = ""
}

protocol InputHandlable {
    func getHeight() -> Int
    func getNames() -> [LadderPlayer]
}

protocol OutputHandlable {
    func printLadder(ladder: [String])
}

func play(input: InputHandlable, output: OutputHandlable) {
    let height = input.getHeight()
    let players = input.getNames()

    let ladder = (0 ..< height).map { _ -> String in
        var line = "|"

        (0 ..< players.count).forEach { _ in
            line += Bool.random() ? "---|" : "   |"
        }

        return line
    }

    output.printLadder(ladder: ladder)
}

play(input: InputHandler(), output: OutputHandler())
