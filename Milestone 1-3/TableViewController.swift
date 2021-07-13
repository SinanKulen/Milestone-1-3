//
//  TableViewController.swift
//  Milestone 1-3
//
//  Created by Sinan Kulen on 6.07.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var country = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Country Flags"

        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("3x.png"){
                country.append(item)
            }
            print(country)
        }
        
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return country.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)

        let label = UILabel(frame: CGRect(x: 210, y: 0, width: 200, height: 80))
        label.text = country[indexPath.row]
        label.text = label.text?.replacingOccurrences(of: "@3x.png", with: " ", options: String.CompareOptions.literal, range: nil).uppercased()
        label.tag = indexPath.row
        cell.contentView.addSubview(label)
        
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 160, height: 80))
        btn.backgroundColor = UIColor.gray
        btn.setImage(UIImage(named: country[indexPath.row]), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(buttonPressed), for: UIControl.Event.touchUpInside)
        btn.tag = indexPath.row
        btn.layer.borderColor = UIColor.lightGray.cgColor
        cell.contentView.addSubview(btn)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    @objc func buttonPressed(sender: UIButton!){
        let buttonRow = sender.tag
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = country[buttonRow]
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
