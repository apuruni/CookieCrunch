public struct Set<T: Hashable>: SequenceType, Printable {
    private var dictionary = Dictionary<T, Bool>()
    
    public init() {
        
    }
    
    public mutating func addElement(newElement: T) {
        dictionary[newElement] = true
    }
    
    public mutating func removeElement(element: T) {
        dictionary[element] = nil
    }
    
    public func containsElement(element: T) -> Bool {
        return dictionary[element] != nil
    }
    
    public func allElements() -> [T] {
        return Array(dictionary.keys)
    }
    
    public var count: Int {
        return dictionary.count
    }
    
    public func unionSet(otherSet: Set<T>) -> Set<T> {
        var combined = Set<T>()
        
        for obj in dictionary.keys {
            combined.dictionary[obj] = true
        }
        
        for obj in otherSet.dictionary.keys {
            combined.dictionary[obj] = true
        }
        
        return combined
    }
    
    public func generate() -> IndexingGenerator<Array<T>> {
        return allElements().generate()
    }
    
    public var description: String {
        return dictionary.description
    }
}