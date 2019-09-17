//
//  VisitorStateMachine.swift
//  swift-equatable-identifiable
//
//  Created by Jeffrey Macko on 18/09/2019.
//  Copyright © 2019 Jeffrey Macko. All rights reserved.
//

import Foundation

/// Represent where we are in the parsing
/// We need to have a struct or a class that have a inheritance of Identifiable
class VisitorStateMachine {
  enum State {
    case start
    case didFindObjectName
    case didFindInheritance
    case didFindIdentifiableProtocol
  }
  
  var structName : String = ""
  var isValid : Bool = false
  var state : State = .start

  func restart() {
    isValid = false
    state = .start
    structName = ""
  }
}
