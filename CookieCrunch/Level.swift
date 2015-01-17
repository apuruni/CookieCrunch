let NumColumns = 9
let NumRows = 9

public class Level {
    private var cookies = Array2D<Cookie>(columns: NumColumns, rows: NumRows)
    
    public func cookieAt(column: Int, row: Int) -> Cookie? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return cookies[column, row]
    }
    
    public func shuffle() -> Set<Cookie> {
        var set = Set<Cookie>()
        
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                var cookieType = CookieType.random()
                let cookie = Cookie(column: column, row: row, cookieType: cookieType)
                cookies[column, row] = cookie
                set.addElement(cookie)
            }
        }
        return set
    }
}