//
//  MemoListViewModel.swift
//  StartRxSwift
//
//  Created by Demian on 2020/06/24.
//  Copyright © 2020 Demian. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MemoListViewModel: CommonViewModel {
  var memoList: Observable<[Memo]> {
    return storage.memoList()
  }
}
