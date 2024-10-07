import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        
        // Sun and planets with realistic sizes and distances in proportion
        let sun = createSphere(radius: 0.4, content: "sun.jpeg", vector: SCNVector3(0, 0.2, -0.5))
        sceneView.scene.rootNode.addChildNode(sun)
        
        let mercury = createSphere(radius: 0.02, content: "mercury.jpeg", vector: SCNVector3(0.5, 0.2, -0.5))
        sceneView.scene.rootNode.addChildNode(mercury)
        
        let venus = createSphere(radius: 0.05, content: "venus.jpeg", vector: SCNVector3(0.8, 0.2, -0.5))
        sceneView.scene.rootNode.addChildNode(venus)
        
        let earth = createSphere(radius: 0.05, content: "earth.jpeg", vector: SCNVector3(1.1, 0.2, -0.5))
        sceneView.scene.rootNode.addChildNode(earth)
        
        let mars = createSphere(radius: 0.03, content: "mars.jpeg", vector: SCNVector3(1.5, 0.2, -0.5))
        sceneView.scene.rootNode.addChildNode(mars)
        
        let jupiter = createSphere(radius: 0.1, content: "jupiter.jpeg", vector: SCNVector3(2.0, 0.2, -0.5))
        sceneView.scene.rootNode.addChildNode(jupiter)
        
        let saturn = createSphere(radius: 0.09, content: "saturn.jpeg", vector: SCNVector3(2.5, 0.2, -0.5))
        sceneView.scene.rootNode.addChildNode(saturn)
        
        let uranus = createSphere(radius: 0.07, content: "uranus.jpeg", vector: SCNVector3(3.0, 0.2, -0.5))
        sceneView.scene.rootNode.addChildNode(uranus)
        
        let neptune = createSphere(radius: 0.07, content: "neptune.jpeg", vector: SCNVector3(3.5, 0.2, -0.5))
        sceneView.scene.rootNode.addChildNode(neptune)
        
        sceneView.automaticallyUpdatesLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    func createSphere(radius: CGFloat, content: String, vector: SCNVector3) -> SCNNode {
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
