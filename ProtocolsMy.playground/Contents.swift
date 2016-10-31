//: Playground - noun: a place where people can play

import Cocoa

func paddingLabel(amount: Int) -> String {
    var label = ""
    for _ in 0..<amount {
        label += " "
    }
    return label
}

func printTable(rowLabels: [String], headerLabels: [String], data: [[Int]]) {
    let labelWidths = rowLabels.map { $0.characters.count }
    
    guard let maxLabelWidth = labelWidths.max() else {
        return
    }
    
    var header = paddingLabel(amount: maxLabelWidth) + " |"
    var columnWidths = [Int]()
    for label in headerLabels {
        let columnHeader = " \(label) |"
        header += columnHeader
        columnWidths.append(columnHeader.characters.count)
    }
    print(header)
    
    columnWidths
    
    for (i, row) in data.enumerated() {
        let padding = maxLabelWidth - labelWidths[i]
        var out = rowLabels[i] + paddingLabel(amount: padding) + " |"
        for (j, item) in row.enumerated() {
            let itemString = " \(item) |"
            let padding = columnWidths[j] - itemString.characters.count
            out += paddingLabel(amount: padding) + itemString
        }
        print(out)
    }
}

let rowLabels = ["Joe", "Karen", "Fred"]
let columnLabels = ["Age", "Years of experience"]
let data = [
    [30, 6],
    [40, 18],
    [50, 20],
]

printTable(rowLabels: rowLabels, headerLabels: columnLabels, data: data)
