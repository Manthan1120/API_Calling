//
//  ViewController.swift
//  API_Calling
//
//  Created by R86 on 16/03/23.
//

import UIKit
import Alamofire

struct GetApi: Codable{
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    @IBOutlet weak var tableView: UITableView!
    var array : [GetApi] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
       
    }
    

    
//    func getData() {
//        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
//        var store = URLRequest(url: url!)
//        store.httpMethod = "GET"
//
//        URLSession.shared.dataTask(with: store) { data, response, error in
//            do{
//               if error == nil {
//                self.array = try JSONDecoder().decode([GetApi].self, from: data!)
//                   print(self.array)
//                   DispatchQueue.main.async {
//                       self.tableView.reloadData()
//                   }
//                }
//            }
//            catch{
//                print(error.localizedDescription)
//            }
//        }.resume()
//    }
    func getData() {
        AF.request("https://jsonplaceholder.typicode.com/posts",method: .get).responseData { response in
            
            
            switch response.result {
            case .success(let data):
         
                do{
                    if data == response.value {
                        self.array = try JSONDecoder().decode([GetApi].self, from: data)
                               print(self.array)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
                catch{
                        print(error.localizedDescription)
                    }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.lableForId.text = "\(array[indexPath.row].id)"
        cell.lableForTitle.text = array[indexPath.row].title
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
    }
}

