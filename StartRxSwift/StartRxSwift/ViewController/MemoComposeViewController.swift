//
//  WriteViewController.swift
//  StartRxSwift
//
//  Created by Demian on 2020/06/24.
//  Copyright © 2020 Demian. All rights reserved.
//

import UIKit

class MemoComposeViewController: UIViewController, ViewModelBindableType {
  var viewModel: MemoComposeViewModel!
  
  let memoCompNavi = UINavigationController().then {
    $0.navigationBar.prefersLargeTitles = true
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .gray
    self.title = "새 메모"
  }
  
  func bindViewModel() {
    
  }
}
