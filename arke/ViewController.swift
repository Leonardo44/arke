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
        let modelEntiy = ModelEntity()
        let anchorEntity = AnchorEntity(plane: .horizontal)
       
        modelEntiy.addChild(xmasTree)
        anchorEntity.addChild(modelEntiy)
        
        // Gestures
        modelEntiy.generateCollisionShapes(recursive: true)
        arView.installGestures([.translation, .rotation, .scale], for: modelEntiy)

        arView.scene.addAnchor(anchorEntity)
    }
}

extension ViewController {
    func enableObjectRemoval() {
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(recognizer:)))
        
        arView.addGestureRecognizer(longPressGestureRecognizer)
    }
    
    @objc func handleLongPress(recognizer: UILongPressGestureRecognizer) {
        let location = recognizer.location(in: arView)
        
        if let entity = arView.entity(at: location) {
            
        }
    }
}
