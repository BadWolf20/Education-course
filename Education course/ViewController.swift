

import UIKit

class ViewController: UIViewController {

    private lazy var label: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: Metric.labelFontSize)
        label.text = Strings.labelText
        return label
    }()

    private lazy var textField: UITextField = {
        var textField = UITextField()
        textField.font = .systemFont(ofSize: Metric.textFieldFontSize)
        textField.placeholder = Strings.textFieldPlaceHolder
        textField.textAlignment = .center
        return textField
    }()

    private lazy var button: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle(Strings.buttonTitle, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        button.setTitleColor(.systemYellow, for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        return button
    }()

    // MARK: - Lifecycle
    override func  viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()
        setupLayout()
        setupView()
    }

    // MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(button)

    }

    private func setupLayout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: Metric.labelTopOffSet).isActive = true


        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: Metric.textFieldTopOffSet).isActive = true


        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: Metric.buttonTopOffSet).isActive = true
        button.heightAnchor.constraint(equalToConstant: Metric.buttonHeight).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Metric.buttonWeightMultiply).isActive = true
    }

    private func setupView() {
        view.backgroundColor = .systemBlue
    }

    // MARK: - Actions

    @objc private func buttonAction() {
        if !(textField.text?.isEmpty ?? true){
            label.text = textField.text
            textField.text = ""
        }else{
            label.text = Strings.labelText
        }

    }

}
// MARK: - Constants

extension ViewController{
    enum Metric {
        static let labelFontSize: CGFloat = 15
        static let textFieldFontSize: CGFloat = 17
        static let labelTopOffSet: CGFloat = 40
        static let textFieldTopOffSet: CGFloat = 40
        static let buttonTopOffSet: CGFloat = 30
        static let buttonHeight: CGFloat = 40
        static let buttonWeightMultiply: CGFloat = 0.8

    }

    enum Strings {
        static let labelText: String = "Info out"
        static let textFieldPlaceHolder: String = "Enter Name"
        static let buttonTitle: String = "Push me"
    }
}
