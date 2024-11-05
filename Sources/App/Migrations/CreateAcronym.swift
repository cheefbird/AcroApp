//
//  CreateAcronym.swift
//  AcroApp
//
//  Created by Francis Breidenbach on 11/4/24.
//
import Fluent

struct CreateAcronym: Migration {
  func prepare(on database: any Database) -> EventLoopFuture<Void> {
    database.schema("acronyms")
      .id()
      .field("short", .string, .required)
      .field("long", .string, .required)
      .create()
  }
  
  func revert(on database: any Database) -> EventLoopFuture<Void> {
    database.schema("acronyms").delete()
  }
}
