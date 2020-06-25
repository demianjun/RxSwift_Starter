//
//  WriteViewController.swift
//  StartRxSwift
//
//  Created by Demian on 2020/06/24.
//  Copyright © 2020 Demian. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx


class MemoComposeViewController: UIViewController, ViewModelBindableType {
  var viewModel: MemoComposeViewModel!
  
  @IBOutlet weak var cancelButton: UIBarButtonItem!
  @IBOutlet weak var saveButton: UIBarButtonItem!
  @IBOutlet weak var contentTextView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
  }
  
  func bindViewModel() {
    viewModel.title
      .drive(navigationItem.rx.title)
      .disposed(by: rx.disposeBag)
    
    viewModel.initialText
      .drive(contentTextView.rx.text)
      .disposed(by: rx.disposeBag)
    
    cancelButton.rx.action = viewModel.cancelAction
    
    saveButton.rx.tap
      .throttle(.microseconds(500), scheduler: MainScheduler.instance)
      .withLatestFrom(contentTextView.rx.text.orEmpty)
      .bind(to: viewModel.saveAction.inputs)
      .disposed(by: rx.disposeBag)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    contentTextView.becomeFirstResponder()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if contentTextView.isFirstResponder {
      contentTextView.resignFirstResponder()
    }
  }
}
