import Fluent
import Vapor

func routes(_ app: Application) throws {
  app.get { req async in
    "It works!"
  }

  app.get("hello") { req async -> String in
    "Hello, world!"
  }
  /// CREATE one Acronym
  app.post("api", "acronyms") { req -> EventLoopFuture<Acronym> in
    let acronym = try req.content.decode(Acronym.self)
    return acronym.save(on: req.db).map { acronym }
  }

  /// GET all acronyms
  
}
