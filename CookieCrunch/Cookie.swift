import SpriteKit

public enum CookieType: Int {
    case Unkown = 0, Croissant, Cupcake, Danish, Donut, Macaroon, SugarCookie
    
    public var spriteName: String {
        let spriteNames = [
            "Croissant",
            "Cupcake",
            "Danish",
            "Donut",
            "Macaroon",
            "SugarCookie"
        ]
        return spriteNames[rawValue - 1]
    }
    
    public var highLightedSpriteName: String {
        return spriteName + "-Highlighted"
    }
    
    public static func random() -> CookieType {
        return CookieType(rawValue: Int(arc4random_uniform(6)) + 1)!
    }
}

public class Cookie: Printable, Hashable {
    var column: Int
    var row: Int
    let cookieType: CookieType
    var sprite: SKSpriteNode?
    
    init(column: Int, row: Int, cookieType: CookieType) {
        self.column = column
        self.row = row
        self.cookieType = cookieType
    }
    
    public var description: String {
        return "type: \(cookieType) square:(\(column), \(row))"
    }
    
    public var hashValue: Int {
        // TODO not best solution
        return row * 10 + column
    }
}

public func ==(lhs: Cookie, rhs: Cookie) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row
}
