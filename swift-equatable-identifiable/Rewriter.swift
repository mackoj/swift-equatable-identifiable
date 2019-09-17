//
//  Rewriter.swift
//  swift-equatable-identifiable
//
//  Created by Jeffrey Macko on 18/09/2019.
//  Copyright © 2019 Jeffrey Macko. All rights reserved.
//

import Foundation
import SwiftSyntax

// This is a fake `SyntaxRewriter`
// This call the Visitor on each `CodeBlockItemSyntax`
// Then the visitor update the state machine if needed
// At the end of each `CodeBlockItemSyntax` it update the buffer
class Rewriter: SyntaxRewriter {
  override func visit(_ node: CodeBlockItemSyntax) -> Syntax {
    node.walk(Visitor())
    return node
  }
  
  override func visitPost(_ node: Syntax) {
    if Current.vsm.isValid == false { return }
    
    /// Fake rewriter sorry peoples
    Current.buffer.append("""

// Generated code from swift-equatable-identifiable
extension \(Current.vsm.structName) :  Equatable {
  static func ==(lhs: Self, rhs: Self) -> Bool {
      return lhs.id == rhs.id
  }
}
""")
    Current.vsm.restart()
  }
}
