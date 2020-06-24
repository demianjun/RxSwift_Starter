//
//  Memo.swift
//  StartRxSwift
//
//  Created by Demian on 2020/06/24.
//  Copyright © 2020 Demian. All rights reserved.
//

import Foundation

struct Memo: Equatable {
  var content: String
  var insertDate: Date
  var identity: String
  
  init(content: String, insertDate: Date = Date()) {
    self.content = content
    self.insertDate = insertDate
    self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
  }
  
  init(original: Memo, updateContent: String) {
    self = original
    self.content = updateContent
  }
}
