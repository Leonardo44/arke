//
//  ViewController.swift
//  arke
//
//  Created by Leo Lopez on 18/10/21.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    @IBOutlet weak var arView: ARView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xmasTree = try! ModelEntity.load(named: "Xmas_tree")
        let anchor = AnchorEntity(plane: .horizontal)
        anchor.addChild(xmasTree)
        
        arView.scene.addAnchor(anchor)
    }
}

