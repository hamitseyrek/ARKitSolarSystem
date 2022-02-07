//
//  ViewController.swift
//  ARKitSolarSystem
//
//  Created by Hamit Seyrek on 6.02.2022.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        /*
        //MARK: - Create a custom box
        let myBox = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.001)
        let boxMaterials = SCNMaterial()
        boxMaterials.diffuse.contents = UIImage(named: "art.scnassets/wall.jpg")
        myBox.materials = [boxMaterials]
        
        let node = SCNNode()
        node.position = SCNVector3(0, 0.1, -0.5)
        node.geometry = myBox
        
        let moveShip = SCNAction.moveBy(x: 1, y: 0.3, z: -1, duration: 2)
        node.runAction(moveShip)
         */
        
        let earth = createSphere(radius: 0.1, content: "earth.jpeg", vector: SCNVector3(0, 0.2, -0.1))
        sceneView.scene.rootNode.addChildNode(earth)
        let mars = createSphere(radius: 0.09, content: "mars.jpeg", vector: SCNVector3(0.25, 0.2, -0.1))
        sceneView.scene.rootNode.addChildNode(mars)
        let sun = createSphere(radius: 0.4, content: "sun.jpeg", vector: SCNVector3(-0.25, 0.2, -0.1))
        sceneView.scene.rootNode.addChildNode(sun)
        let saturn = createSphere(radius: 0.15, content: "saturn.jpeg", vector: SCNVector3(0.5, 0.2, -0.1))
        sceneView.scene.rootNode.addChildNode(saturn)
        let uranus = createSphere(radius: 0.2, content: "uranus.jpeg", vector: SCNVector3(0.75, 0.2, -0.1))
        sceneView.scene.rootNode.addChildNode(uranus)
        let venus = createSphere(radius: 0.22, content: "venus.jpeg", vector: SCNVector3(1, 0.2, -0.1))
        sceneView.scene.rootNode.addChildNode(venus)
        let neptune = createSphere(radius: 0.13, content: "neptune.jpeg", vector: SCNVector3(1.25, 0.2, -0.1))
        sceneView.scene.rootNode.addChildNode(neptune)
        let mercury = createSphere(radius: 0.09, content: "mercury.jpeg", vector: SCNVector3(1.5, 0.2, -0.1))
        sceneView.scene.rootNode.addChildNode(mercury)
        
        sceneView.automaticallyUpdatesLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    //MARK: - Special Functions
    func createSphere(radius: CGFloat, content: String, vector: SCNVector3) ->SCNNode {
        let mySphere = SCNSphere(radius: radius)
        let sphereMaterials = SCNMaterial()
        sphereMaterials.diffuse.contents = UIImage(named: "art.scnassets/\(content)")
        mySphere.materials = [sphereMaterials]
        
        let node = SCNNode()
        node.position = vector
        node.geometry = mySphere
        
        return node
    }
}
