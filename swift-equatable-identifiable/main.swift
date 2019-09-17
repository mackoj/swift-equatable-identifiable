//
//  main.swift
//  swift-equatable-identifiable
//
//  Created by Jeffrey Macko on 17/09/2019.
//  Copyright © 2019 Jeffrey Macko. All rights reserved.
//

import Foundation
import SwiftSyntax


/// Entry point
func main(_ args : [String]) {
  guard args.count == 2 else {
    print(#"Usage: ./swift-equatable-identifiable <file.swift> "#)
    exit(EXIT_FAILURE)
  }
  
  let file = args[1]
  let url = URL(fileURLWithPath: file)
  do {
    let sourceFile = try SyntaxTreeParser.parse(url)
    _ = Rewriter().visit(sourceFile)
    var fileContent = try String(contentsOf: url)
    fileContent.append(Current.buffer)
    try fileContent.write(to: url, atomically: true, encoding: .utf8)
  } catch {
    print(error.localizedDescription)
  }
}

main(CommandLine.arguments)
