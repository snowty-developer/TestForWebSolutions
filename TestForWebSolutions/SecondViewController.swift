//
//  SecondViewController.swift
//  TestForWebSolutions
//
//  Created by Александр Зубарев on 17.04.2021.
//

import UIKit

protocol vpn {
    func setCity(_ city: String)
}

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let city = ["Baltimore","London","Tokyo","New York","Shanghai","Berlin"]
    var indexCity = ""
    
    var delegate: vpn?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return city.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = city[indexPath.row]
        cell.accessoryType = city.firstIndex(of: indexCity) != nil && indexPath.row == city.firstIndex(of: indexCity) ? .checkmark : .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for el in tableView.visibleCells {
            el.accessoryType = .none
        }
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        delegate?.setCity(city[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }

}
