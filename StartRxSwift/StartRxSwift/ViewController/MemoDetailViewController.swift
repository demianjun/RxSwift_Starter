//
//  MainViewController.swift
//  StartRxSwift
//
//  Created by Demian on 2020/06/24.
//  Copyright © 2020 Demian. All rights reserved.
//

import UIKit
import SnapKit
import Then

class MemoDetailViewController: UIViewController, ViewModelBindableType {
  var viewModel: MemoDetailViewModel!
 
  
  @IBOutlet weak var listTableView: UITableView!
  
  @IBOutlet weak var deleteButton: UIBarButtonItem!
  @IBOutlet weak var editButton: UIBarButtonItem!
  @IBOutlet weak var sharedButton: UIBarButtonItem!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  func bindViewModel() {
    
  }
  
}
