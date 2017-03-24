//
//  QHSFirstViewController.swift
//  QHSTableViewPractice
//
//  Created by david on 2017/3/24.
//  Copyright © 2017年 Charles. All rights reserved.
//

import UIKit

class QHSFirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let vm: QHSFirstViewModel = QHSFirstViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vm.updateViewModel()

        tableView.register(UINib(nibName: "QHSMainTableViewCell", bundle: nil), forCellReuseIdentifier: "QHSMainTableViewCell")
        tableView.register(UINib(nibName: "QHSExpandTableViewCell", bundle: nil), forCellReuseIdentifier: "QHSExpandTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.arrCellViewModels.count * 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            print("heightForRowAt \(indexPath) 120")
            return 120
        } else {
            if vm.arrCellViewModels[(indexPath.row - 1) / 2].isExpand {
                print("heightForRowAt \(indexPath) 50")
                return 50
            }
            print("heightForRowAt \(indexPath) 0")
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QHSMainTableViewCell", for: indexPath) as! QHSMainTableViewCell
            cell.blkExpand = {
                if indexPath.row == 0 {
                    self.vm.arrCellViewModels.first?.updateExpandStatus()
                } else {
                    self.vm.arrCellViewModels[indexPath.row / 2].updateExpandStatus()
                }
                let tempIndex = IndexPath(row: indexPath.row + 1, section: 0)
                print("\(tempIndex)")
                tableView.reloadRows(at: [tempIndex], with: .top)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QHSExpandTableViewCell", for: indexPath)
            return cell
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
