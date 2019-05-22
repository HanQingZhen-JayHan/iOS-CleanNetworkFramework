//
//  ViewController.swift
//  CleanNetworkFramework
//
//  Created by Qingzhen Han on 2019-05-08.
//  Copyright © 2019 Qingzhen Han. All rights reserved.
//

import UIKit

class ComicListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let model = ComicModel()
    private var exampleContent = ["This is a short text.", "This is another text, and it is a little bit longer.", "Wow, this text is really very very long! I hope it can be read completely! Luckily, we are using automatic row height!"]
    
    @IBOutlet weak var comicTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Commic List"

        //comicTableView.translatesAutoresizingMaskIntoConstraints = false
        comicTableView.delegate = self
        comicTableView.dataSource = self
        comicTableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        comicTableView.rowHeight = UITableView.automaticDimension
        comicTableView.estimatedRowHeight = 600
        comicTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
        sendRequest()
        sendRequest()
        sendRequest()
        sendRequest()
        sendRequest()
        sendRequest()
        sendRequest()
        sendRequest()
    }
    
    func sendRequest() {
        model.getRandoComic{[unowned self](result) in
            switch result {
            case .success(let comic):
                self.handleSuccess(comic)
            case .failure(let error):
                self.handleFailure(error)
            }
        }
    }
    
    private func handleSuccess(_ comic: Comic){
        comicList.append(comic)
        comicTableView.reloadData()
    }
    
    private func handleFailure(_ error: Error){
        print(error)
    }
    
    var comicList:[Comic] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  comicTableView.dequeueReusableCell(withIdentifier: "tableViewCellIdentifier") as! ComicTableViewCell
        let comic: Comic = comicList[indexPath.row]
        //let str = exampleContent[indexPath.row]
        cell.customLabel.numberOfLines = 0
        cell.customLabel.text = comic.safeTitle
        cell.customLabel.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        cell.leftBottom.numberOfLines = 0
        cell.leftBottom.text = comic.transcript
        cell.leftBottom.textColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
                DispatchQueue.global().async {
                    let comicURL = URL(string: comic.img)!
                    let data = try! Data(contentsOf: comicURL)
                    DispatchQueue.main.async {
                        let comicImage = UIImage(data: data)
                        cell.comicImage.image = comicImage
                    }
                }
        return cell
    }
    
    // UITableViewAutomaticDimension calculates height of label contents/text
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
