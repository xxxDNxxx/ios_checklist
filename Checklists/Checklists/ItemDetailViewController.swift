import UIKit

protocol AddItemViewControllerDelegate: class{
    func addItemViewControllerDidCancel(_ controller: ItemDetailViewController)
    func addItemViewController(_ controller: ItemDetailViewController,didFinishAdding item: Checklistitems){
        saveChecklistItems()
    }
    func addItemViewController(_ controller: ItemDetailViewController,didFinishEditing item: Checklistitems){
            saveChecklistItems()
    }
}
class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    weak var delegate: AddItemViewControllerDelegate?
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    var itemToEdit: Checklistitems?
    override func viewDidLoad() {
        super.viewDidLoad()
        doneBarButton.isEnabled = false
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }
    }

    @IBAction func cancel(){
        delegate?.addItemViewControllerDidCancel(self)
    }
    @IBAction func done(){
        if let item = itemToEdit {
            item.text = textField.text!
            delegate?.addItemViewController(self, didFinishEditing: item)
        }else{
        let item = Checklistitems()
        item.text = textField.text!
        delegate?.addItemViewController(self, didFinishAdding: item)
        }
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in:oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        if newText.isEmpty {
            doneBarButton.isEnabled = false
        }else{
            doneBarButton.isEnabled = true
        }
        
        return true
        
    }



}
