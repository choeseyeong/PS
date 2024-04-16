import Foundation

let n = Int(readLine()!)!
var graph: [[Character]] = []
var graphRB = graph
var resultRGB = 0
var resultRB = 0
for _ in 1...n{
    var input = String(readLine()!)
    graph.append(input.map{ ($0) })
    input = input.replacingOccurrences(of: "G", with: "R")
    graphRB.append(input.map{ ($0) })
}

func dfs(x: Int, y: Int, value: Character) -> Int{
    if x < 0 || y < 0 || x >= n || y >= n{
        return 0
    }
    if graph[x][y] == value{
        graph[x][y] = "A"
        dfs(x: x-1, y: y, value: value)
        dfs(x: x+1, y: y, value: value)
        dfs(x: x, y: y-1, value: value)
        dfs(x: x, y: y+1, value: value)
    }
    return 1
}

for x in 0..<n{
    for y in 0..<n{
        if graph[x][y] != "A"{
            resultRGB += dfs(x: x, y: y, value: graph[x][y])
        }
    }
}

graph = graphRB
for x in 0..<n{
    for y in 0..<n{
        if graph[x][y] != "A"{
            resultRB += dfs(x: x, y: y, value: graph[x][y])
        }
    }
}

print(resultRGB, resultRB)


