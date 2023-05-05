//
//  ViewController.swift
//  TableViewBeginner
//
//  Created by West Agile labs on 14/04/23.
//

import UIKit

class ViewController: UIViewController  {
    
    var topYoutubers = [Files]()

    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
        
        let newIteam = Files()
        newIteam.title = "Sean"
        topYoutubers.append(newIteam)
        
        let anotherIteam = Files()
        anotherIteam.title = "allean"
        topYoutubers.append(anotherIteam)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topYoutubers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result = TableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let value = topYoutubers[indexPath.row]
        result.textLabel?.text = value.title
        result.accessoryType = value.done ? .checkmark : .none
        return result

    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        topYoutubers[indexPath.row].done = !topYoutubers[indexPath.row].done
        tableView.reloadData()
    }
}
