//
//  ListViewController.swift
//  Facebook Integration
//
//  Created by Lakith Jayalath on 2022-04-20.
//

import UIKit
import Alamofire

class ListViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var logoutButton: UIButton!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var hotelData: [HotelData] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
    
    func setUp() {
        setUpTableView()
        fetchHotels()
        self.setActivityIndicatorVisibility(show: true)
    }
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        setUpTableViewCell()
    }
    
    func setActivityIndicatorVisibility(show: Bool) {
        self.activityIndicator.isHidden = !show
        if show {
            self.activityIndicator.startAnimating()
        }else {
            self.tableView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
    
    func setUpTableViewCell() {
        let cellIdentifier: String = String(describing: HotelTableViewCell.self)
        let nibName = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: cellIdentifier)
    }
    
    func fetchHotels() {
        
        AF.request("https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels.json")
          .validate()
          .responseDecodable(of: Hotel.self) { (response) in
            guard let hotel = response.value else { return }
              self.hotelData = hotel.data
              self.tableView.reloadData()
              self.setActivityIndicatorVisibility(show: false)
              
              print("HOTEL ", hotel.data)
          }
        
      }
      
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HotelTableViewCell.self), for: indexPath) as? HotelTableViewCell
        cell?.selectionStyle = .none
        cell?.titleLabel.text = hotelData[indexPath.row].title
        cell?.addressLabel.text = hotelData[indexPath.row].address
        cell?.catImageView.layer.cornerRadius = ((cell?.imageView?.frame.height)!)/2
        cell?.placeImage(url: URL(string: hotelData[indexPath.row].image.small))
        cell?.clipsToBounds = true
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        controller.hotelTitle = hotelData[indexPath.row].title
        controller.hotelDescription = hotelData[indexPath.row].description
        controller.imageURL = URL(string: hotelData[indexPath.row].image.small)
        navigationController?.pushViewController(controller, animated: true)
    }

}
