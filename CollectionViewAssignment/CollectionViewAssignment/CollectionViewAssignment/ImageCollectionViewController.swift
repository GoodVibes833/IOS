//
//  ImageCollectionViewController.swift
//  CollectionViewAssignment
//
//  Created by Derrick Park on 2018-10-29.
//  Copyright © 2018 Derrick Park. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ImageCollectionViewController: UICollectionViewController {
	
	@IBOutlet weak var segmentControl: UISegmentedControl!
	let photoFactory = PhotoFactory()
	
	@IBAction func segmentedControllTapped(_ sender: UISegmentedControl) {
		if sender.selectedSegmentIndex == 0 {
			
		
			
			print("Subject")
		} else {
			// location
			print("Location")
		}
	}
	
	@IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
		print(sender.scale)
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
	}
	
	// MARK: UICollectionViewDataSource
	
	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		
		return 1
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if segmentControl.selectedSegmentIndex == 0 {
			
		} else {
			
		}
		return photoFactory.images.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageCollectionViewCell
		
		cell.imageView.image = UIImage(named: photoFactory.images[indexPath.item].imageName)
		
		return cell
	}
	
}
