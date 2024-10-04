import UIKit

func fibonacciAbility (n: Int) -> Int {
    var a = 0
    var b = 1
    var index = 2

    if (n == 0) {
        return a
    }

    while index <= n {
        let c = a + b

        a = b
        b = c
        index += 1
    }

    return b
}

print(fibonacciAbility(n: 6))

struct Creature {
    var name: String
    var description: String
    var isGood: Bool
    var magicPower: Int

    var ability: String {
        var abilityRating = fibonacciAbility(n: magicPower)

        if (abilityRating < 10) {
            return "rainbows and puppies"
        }

        return "obliteration by fire"
    }

    func interactWith (creature: Creature) -> String {
        switch true {
        case creature.isGood && isGood:
            return "there is peace."
        case !creature.isGood && isGood || creature.isGood && !isGood:
            return "there is war."
        default:
            return "there is an apocalypse."
        }
    }
}

let Unicorn: Creature = Creature(name: "Unicorn", description: "horse with a horn", isGood: true, magicPower: 3)
let Dragon: Creature = Creature(name: "Dragon", description: "big lizard", isGood: false, magicPower: 9)
let Phoenix = Creature(name: "Phoenix", description: "Jesus bird on fire.", isGood: true, magicPower: 10)
let Chimera: Creature = Creature(name: "Chimera", description: "hot mess", isGood: false, magicPower: 5)

let creatureCatalog: [Creature] = [Unicorn, Dragon, Phoenix, Chimera]

func describeCreature (beastiary: [Creature]) {
    for creature in beastiary {
        var otherBeasts = beastiary.filter({ $0.name != creature.name })

        print("The \(creature.name) is a \(creature.description) with the ability to create \(creature.ability)")

        for beast in otherBeasts {
            print("When the \(creature.name) meets a \(beast.name) \(creature.interactWith(creature: beast))")
        }
    }
}

describeCreature(beastiary: creatureCatalog)
