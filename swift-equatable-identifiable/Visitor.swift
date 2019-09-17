//
//  Visitor.swift
//  swift-equatable-identifiable
//
//  Created by Jeffrey Macko on 18/09/2019.
//  Copyright © 2019 Jeffrey Macko. All rights reserved.
//

import Foundation
import SwiftSyntax

// This go through the `CodeBlockItemSyntax` in order to find specific `Syntax` in a specific order
// The goal is to change the state of the visitor state machine in order to see if we
// have the good combinaison of `Syntax`
class Visitor : SyntaxVisitor {
  override func visit(_ node: StructDeclSyntax) -> SyntaxVisitorContinueKind {
    guard Current.vsm.state == .start else { return .visitChildren }
    Current.vsm.structName = node.identifier.text
    Current.vsm.state = .didFindObjectName
    return .visitChildren
  }

  override func visit(_ node: ClassDeclSyntax) -> SyntaxVisitorContinueKind {
    guard Current.vsm.state == .start else { return .visitChildren }
    Current.vsm.structName = node.identifier.text
    Current.vsm.state = .didFindObjectName
    return .visitChildren
  }

  override func visit(_ node: TypeInheritanceClauseSyntax) -> SyntaxVisitorContinueKind {
    guard Current.vsm.state == .didFindObjectName else { return .visitChildren }
    Current.vsm.state = .didFindInheritance
    return .visitChildren
  }
  
  override func visit(_ node: SimpleTypeIdentifierSyntax) -> SyntaxVisitorContinueKind {
    guard Current.vsm.state == .didFindInheritance else { return .visitChildren }
    if node.name.text == "Identifiable" {
      Current.vsm.state = .didFindIdentifiableProtocol
      Current.vsm.isValid = true
    }
    return .visitChildren
  }
}
