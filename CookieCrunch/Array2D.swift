public struct Array2D<T> {
    let columns: Int
    let rows: Int
    private var array: Array<T?>
    
    public init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        array = Array<T?>(count: rows * columns, repeatedValue: nil)
    }
    
    public var count: Int {
        return array.count
    }
    
    public subscript(column: Int, row: Int) -> T? {
        get {
            return array[row * columns + column]
        }
        
        set {
            array[row * columns + column] = newValue
        }
    }
}