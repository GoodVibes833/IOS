//
//  PhotoFactory.swift
//  CollectionViewAssignment
//
//  Created by Derrick Park on 2018-10-29.
//  Copyright © 2018 Derrick Park. All rights reserved.
//

import Foundation

struct PhotoFactory {
	var images: [Photo]
	var bySubjects: [Photo]
	var byLocations: [Photo]
	init() {
		images = [Photo]()
		images += [
			Photo(subject: "",location: "", imageName: "kitty1"),
			Photo(subject: "",location: "", imageName: "kitty2"),
			Photo(subject: "",location: "", imageName: "kitty3"),
			Photo(subject: "",location: "", imageName: "kitty4"),
			Photo(subject: "",location: "", imageName: "kitty5")
		]
		
		bySubjects = [Photo]()
		byLocations = [Photo]()
	}
	
}
