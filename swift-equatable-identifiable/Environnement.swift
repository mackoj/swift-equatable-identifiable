//
//  Environnement.swift
//  swift-equatable-identifiable
//
//  Created by Jeffrey Macko on 18/09/2019.
//  Copyright © 2019 Jeffrey Macko. All rights reserved.
//

import Foundation

// Super Singleton - yeah I know
struct Environnement {
  
  // State of the visitor for a `CodeBlockItemSyntax`
  var vsm = VisitorStateMachine()
  
  // Content that will be added to the end of the file
  var buffer = ""
}

#if DEBUG
var Current = Environnement()
#else
let Current = Environnement()
#endif
