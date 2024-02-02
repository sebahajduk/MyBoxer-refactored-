//
//  BoxersRepository.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 02/02/2024.
//

import Foundation

struct BoxersRepository {
    static var lightweightBoxers: [Boxer] = [
        Opponent(forLevel: 1, name: "Devin Colbert", wins: 0, draws: 0, losses: 11),
        Opponent(forLevel: 2, name: "Colt Street", wins: 1, draws: 1, losses: 8),
        Opponent(forLevel: 4, name: "Deryck Michaels", wins: 3, draws: 1, losses: 13),
        Opponent(forLevel: 8, name: "Brody Miller", wins: 4, draws: 2, losses: 4),
        Opponent(forLevel: 16, name: "Theo Barker", wins: 7, draws: 0, losses: 8),
        Opponent(forLevel: 24, name: "Hughie Mcbride", wins: 6, draws: 1, losses: 4),
        Opponent(forLevel: 32, name: "Alvin Blair", wins: 8, draws: 0, losses: 5),
        Opponent(forLevel: 40, name: "Randolph Barton", wins: 10, draws: 1, losses: 7),
        Opponent(forLevel: 48, name: "Gaylord Saunders", wins: 11, draws: 0, losses: 4),
        Opponent(forLevel: 56, name: "Atwater Fitzgerald", wins: 15, draws: 2, losses: 7),
        Opponent(forLevel: 64, name: "Marsh Bell", wins: 21, draws: 0, losses: 9),
        Opponent(forLevel: 72, name: "Justin Andrews", wins: 22, draws: 1, losses: 5),
        Opponent(forLevel: 80, name: "Jordan Jenning", wins: 29, draws: 0, losses: 3)
    ]

    static var middleweightBoxers: [Boxer] = [
        Opponent(forLevel: 1, name: "Martin Roffe", wins: 0, draws: 0, losses: 3),
        Opponent(forLevel: 2, name: "Charlie Hines", wins: 2, draws: 0, losses: 5),
        Opponent(forLevel: 4, name: "Zach Cooke", wins: 2, draws: 1, losses: 3),
        Opponent(forLevel: 8, name: "Scott Poole", wins: 4, draws: 0, losses: 4),
        Opponent(forLevel: 16, name: "Waldo Pierce", wins: 3, draws: 1, losses: 3),
        Opponent(forLevel: 24, name: "Alfred Osborne", wins: 8, draws: 0, losses: 6),
        Opponent(forLevel: 32, name: "Chris Alvarez", wins: 12, draws: 2, losses: 9),
        Opponent(forLevel: 40, name: "Alec Erickson", wins: 12, draws: 1, losses: 6),
        Opponent(forLevel: 48, name: "Joey Barnes", wins: 17, draws: 3, losses: 11),
        Opponent(forLevel: 56, name: "Rocky Ballard", wins: 19, draws: 0, losses: 10),
        Opponent(forLevel: 64, name: "Happy Lawrence", wins: 24, draws: 1, losses: 10),
        Opponent(forLevel: 72, name: "Nicholas Ford", wins: 30, draws: 0, losses: 9),
        Opponent(forLevel: 80, name: "Elliot Windrow", wins: 34, draws: 0, losses: 2)
    ]

    static var heavyweightBoxers: [Boxer] = [
        Opponent(forLevel: 1, name: "Bert Pierce", wins: 18, draws: 0, losses: 1),
        Opponent(forLevel: 2, name: "Clement Neel", wins: 20, draws: 1, losses: 2),
        Opponent(forLevel: 4, name: "Richard Simonds", wins: 15, draws: 0, losses: 0),
        Opponent(forLevel: 8, name: "Lionel Blake", wins: 33, draws: 0, losses: 3),
        Opponent(forLevel: 16, name: "Philip Rios", wins: 21, draws: 0, losses: 0),
        Opponent(forLevel: 24, name: "Alec Bishop", wins: 29, draws: 0, losses: 3),
        Opponent(forLevel: 32, name: "Lincoln Ray", wins: 28, draws: 0, losses: 3),
        Opponent(forLevel: 40, name: "Alexis Hines", wins: 35, draws: 0, losses: 2),
        Opponent(forLevel: 48, name: "Morton Steele", wins: 15, draws: 0, losses: 0),
        Opponent(forLevel: 56, name: "Hadwin Lyons", wins: 24, draws: 0, losses: 3),
        Opponent(forLevel: 64, name: "Edgar Lawson", wins: 43, draws: 1, losses: 2),
        Opponent(forLevel: 72, name: "Jenson Neal", wins: 20, draws: 0, losses: 0),
        Opponent(forLevel: 80, name: "Mortimer Nunez", wins: 32, draws: 1, losses: 0)
    ]
}
