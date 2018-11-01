//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Derrick Park on 2018-10-09.
//  Copyright © 2018 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	static var students = ["Kenta", "Minami", "Marcelo", "Giada", "Nagisa", "Bianca", "Yukako",
						   "Rei", "Alex", "Javier", "Juan", "Natsumi", "Suelen", "Marla",
						   "Emre E", "Gustavo", "Chin", "Charles", "Emre A"]
	
	static var positions = ["Japan", "Japan", "Brazil", "Italy", "Japan", "Brazil", "Japan",
						   "Japan", "Korea", "Brazil", "Mexico", "Japan", "Brazil", "Brazil",
						   "Turkey", "Brazil", "Thailand", "China", "Turkey"]
	
	
	@IBOutlet weak var myTableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		myTableView.dataSource = self
		myTableView.rowHeight = 90
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "Details", let detailVC = segue.destination as? DetailViewController {
			if let cell = sender as? StudentTableViewCell, let indexPath = myTableView.indexPath(for: cell) {
				let selectedIndex = indexPath.row
				detailVC.nameString = ViewController.students[selectedIndex]
				detailVC.positionString = ViewController.positions[selectedIndex]
			}
		}
	}

}

extension ViewController: UITableViewDataSource {
	// how many rows?
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return ViewController.students.count
	}
	// how many sections?
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	// how to display (cell)
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! StudentTableViewCell
		// cell.profileImage.image = UIImage(named: "")
		cell.studentName.text = ViewController.students[indexPath.row]
		cell.position.text = ViewController.positions[indexPath.row]
		return cell
	}
}

extension ViewController: UITableViewDelegate {
	
}
