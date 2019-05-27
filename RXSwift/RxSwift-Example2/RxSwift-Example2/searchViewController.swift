//
//  searchViewController.swift
//  RxSwift-Example2
//
//  Created by iti on 5/27/19.
//  Copyright © 2019 Sally Ahmed. All rights reserved.
//

import UIKit
import RxSwift
import  RxCocoa
class searchViewController: UIViewController {

    @IBOutlet weak var searchField: UITextField!
    
    
    @IBOutlet weak var searchResultlabel: UILabel!
    
    let disposeBag = DisposeBag() //define life time of object disposed by it

    override func viewDidLoad() {
        super.viewDidLoad()

        
//        searchField.rx
//            .controlEvent(.editingDidEndOnExit).asObservable()
//            .map{self.searchField.text}
//            .subscribe(onNext: { (value) in print(value)
//                self.searchResultlabel.text?.append(contentsOf: value!)
//            })
        
        
//        searchField.rx
//            .controlEvent(.editingDidEndOnExit)
//            .asObservable()
//            .map{self.searchField.text}
//            .debounce(2, scheduler:MainScheduler.asyncInstance)
//            .subscribe(onNext: { (value) in print(value)
//                self.searchResultlabel.text?.append(contentsOf: value!)
//            })
//        
        
        searchField.rx
            .controlEvent(.editingDidEndOnExit)
            .asObservable()
            .map{self.searchField.text}
            .throttle(2, scheduler:MainScheduler.asyncInstance)
            .subscribe(onNext: { (value) in print(value)
                self.searchResultlabel.text?.append(contentsOf: value!)
            }).disposed(by: disposeBag)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
