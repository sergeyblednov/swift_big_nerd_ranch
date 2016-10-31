//: Playground - noun: a place where people can play

import Cocoa

func padding(amount: Int) -> String {
    var paddingString = ""
    for _ in 0..<amount {
        paddingString += " "
    }
    return paddingString
}

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }

    func labelsForRow(row: Int) -> String
    func labelsForColumn(column: Int) -> String
    
    func itemForRow(row: Int, column: Int) -> Int
    func maxValueForColumn(column: Int) -> Int?
}


func printTable(dataSource: TabularDataSource & CustomStringConvertible) {
    
    print("Table: \(dataSource.description)")
    //Create arrays of the row and column labels
    let rowLabels = (0 ..< dataSource.numberOfRows).map { dataSource.labelsForRow(row: $0) }
    let columnLabels = (0 ..< dataSource.numberOfColumns).map { dataSource.labelsForColumn(column: $0) }
    
    //Create a n array of thewidth of each row label
    let rowLabelWidths = rowLabels.map{ $0.characters.count }
    
    //Determine length of longest row label
    guard let maxRowLabelWidth = rowLabelWidths.max() else {
        return
    }
    
    //Createfirst row containing column headers
    var firstRow: String = padding(amount: maxRowLabelWidth) + " |"
    
    //Keep track of the widths of each column
    var columnWidths = [Int]()
    
    for (i, columnLabel) in columnLabels.enumerated() {
        let columnString = " \(columnLabel) |"
        var columnHeader = ""
        if let maxItem = dataSource.maxValueForColumn(column: i) {
            let maxItemString = " \(maxItem) |"
            if columnString.characters.count < maxItemString.characters.count {
                columnHeader = padding(amount: (maxItemString.characters.count - columnString.characters.count)) + columnString
            } else {
                columnHeader = columnString
            }
        } else {
            columnHeader = columnString
        }
        firstRow += columnHeader
        columnWidths.append(columnHeader.characters.count)
    }
    print(firstRow)
    
//    for (i, row) in data.enumerated() {
    for i in 0 ..< dataSource.numberOfRows {
        //Pad the row label out so they are all the same lenght
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i] 
        
        var out = rowLabels[i] + padding(amount: paddingAmount) + " |"
        
        //Append each item in this row to our string
//        for (j, item) in row.enumerated() {
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemForRow(row: i, column: j)
            let itemString = " \(item) |"
            let paddingAmount = abs(columnWidths[j] - itemString.characters.count)
            out += padding(amount: paddingAmount) + itemString
        }
        print(out)
    }
}

//let rowLabels = ["Joe", "Karen", "Fred"]
//let columnLabels = ["Age", "Years of Experience"]
//let data = [
//    [30, 6],
//    [40, 18],
//    [50, 20],
//]
//
//printTable(rowLabels: rowLabels, columnLabels: columnLabels, data: data)

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department : TabularDataSource, CustomStringConvertible {
    let name: String
    var people = [Person]()
    
    init(name: String) {
        self.name = name
    }
    
    mutating func addPerson(person: Person) {
        people.append(person)
    }
    
    //TabularDataSource
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 2
    }
    
    func labelsForRow(row: Int) -> String {
        return people[row].name
    }
    
    func labelsForColumn(column: Int) -> String {
        switch column {
        case 0:
            return "Age"
        case 1:
            return "Years of Experience"
        default:
            fatalError("Invalid column!")
        }
    }
    
    func itemForRow(row: Int, column: Int) -> Int {
        let person = people[row]
        switch column {
        case 0:
            return person.age
        case 1:
            return person.yearsOfExperience
        default:
            fatalError("Invalid column!")
        }
    }
    
    func maxValueForColumn(column: Int) -> Int? {
        var values = [Int]()
        for i in 0 ..< people.count {
            let person = people[i]
            switch column {
            case 0:
                values.append(person.age)
            case 1:
                values.append(person.yearsOfExperience)
            default:
                fatalError("Invalid column!")
            }
        }
        guard let maxValue = values.max() else {
            return nil
        }
        return maxValue
    }
    
    //CustomStringConvertible
    
    var description: String {
        return "Department (\(name))"
    }
}

var department = Department(name: "Engineering")
department.addPerson(person: Person(name: "Joe", age: 30, yearsOfExperience: 6))
department.addPerson(person: Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.addPerson(person: Person(name: "Fred", age: 50, yearsOfExperience: 20))

printTable(dataSource: department)
