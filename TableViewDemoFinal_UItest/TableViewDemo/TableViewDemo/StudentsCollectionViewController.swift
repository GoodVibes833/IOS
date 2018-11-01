//
//  StudentsCollectionViewController.swift
//  TableViewDemo
//
//  Created by Derrick Park on 2018-10-17.
//  Copyright © 2018 Derrick Park. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CollectionCell"

class StudentsCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		let width = (view.frame.size.width - 20) / 3
		let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
		layout.itemSize = CGSize(width: width, height: width)
		
		let refresh = UIRefreshControl()
		refresh.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
		collectionView.refreshControl = refresh
		
		navigationItem.rightBarButtonItem = editButtonItem
		navigationController?.isToolbarHidden = true
		
    }
	
	@IBAction func deleteItems(_ sender: UIBarButtonItem) {
		// update model
		if let indexPaths = collectionView.indexPathsForSelectedItems {
//			indexPaths.sort { $0.item > $1.item }
			let indices = indexPaths.map { $0.item }.sorted().reversed()
			for index in indices {
				ViewController.students.remove(at: index)
			}
			// update collectionView
			collectionView.deleteItems(at: indexPaths)
			navigationController?.isToolbarHidden = true
		}
	}
	
	override func setEditing(_ editing: Bool, animated: Bool) {
		super.setEditing(editing, animated: animated)
		
		collectionView.allowsMultipleSelection = true
		let indexPaths = collectionView.indexPathsForVisibleItems
		for indexPath in indexPaths {
			let cell = collectionView.cellForItem(at: indexPath) as! StudentCollectionViewCell
			cell.isEditing = editing
		}
		if !editing {
			navigationController?.isToolbarHidden = true
		}
		
	}
	
	func addStudent() {
		// update our model
		ViewController.students.append("Apple")
		// update collectionView
		let indexPath = IndexPath(item: ViewController.students.count - 1, section: 0)
		collectionView.insertItems(at: [indexPath])
	}
	
	@objc func refresh() {
		// add 1 more extra student!
		addStudent()
		collectionView.refreshControl?.endRefreshing()
	}
	
	// DataSource - how we display cells...
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return ViewController.students.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! StudentCollectionViewCell
		// configure cell
		cell.nameLabel.text = ViewController.students[indexPath.item]
		cell.profileImage.image = UIImage(named: "placeholder")
		cell.isEditing = isEditing
		return cell
	}
	
	// Delegate - what to do...
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if isEditing {
			navigationController?.isToolbarHidden = false
		} else {
			performSegue(withIdentifier: "DetailFromCollection", sender: indexPath)
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "DetailFromCollection" {
			if let dest = segue.destination as? DetailViewController, let index = sender as? IndexPath {
				
				dest.nameString = ViewController.students[index.item]
				dest.positionString = ViewController.positions[index.item]
			}
		}
	}
	
	override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
		if isEditing {
			if let indexPaths = collectionView.indexPathsForSelectedItems, indexPaths.count == 0 {
				navigationController?.isToolbarHidden = true
			}
		}
	}
	
}
