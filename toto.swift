import Foundation

/// Valid Test
struct Test1 : Identifiable {
  let id : String
  let foo : String
  let bar : Int
}

struct Test2 {
  let id : String
  let foo : String
  let bar : Int
}

extension Test2 : Identifiable {}

class Test3 : Identifiable {
  let id : String = ""
  let foo : String = ""
  let bar : Int = 0
}

class Test4 {
  let id : String = ""
  let foo : String = ""
  let bar : Int = 0
}

extension Test4 : Identifiable {}

/// Failure

protocol FakeIdentifiable {}

struct Test5 : FakeIdentifiable {
  let id : String
  let foo : String
  let bar : Int
}

struct Test6 {
  let id : String
  let foo : String
  let bar : Int
}

extension Test6 : FakeIdentifiable {}

class Test7 : FakeIdentifiable {
  let id : String = ""
  let foo : String = ""
  let bar : Int = 0
}

class Test8 {
  let id : String = ""
  let foo : String = ""
  let bar : Int = 0
}

extension Test8 : FakeIdentifiable {}
