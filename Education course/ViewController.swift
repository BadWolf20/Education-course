

import UIKit

class ViewController: UIViewController {
    //MARK:  - Outlets
    @IBOutlet var labelResult: UILabel!
    @IBOutlet var texfieldName: UITextField!
    @IBOutlet var buttonPushSettings: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView(){
        view.backgroundColor = .systemBlue
        buttonPushSettings.backgroundColor = .systemIndigo
    }

    @IBAction func buttonPush(_ sender: Any) {
        if !(texfieldName.text?.isEmpty ?? true){
            labelResult.text = texfieldName.text
            texfieldName.text = ""
        }
    }
}

