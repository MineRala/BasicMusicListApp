//
//  ViewController.swift
//  MyMusicPlayer
//
//  Created by Mine Rala on 27.06.2021.
//

import UIKit

struct Song{
    let name : String
    let albumName : String
    let artistName : String
    let imageName : String
    let trackName : String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
  
    @IBOutlet var tableView : UITableView!
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureSongs(){
        songs.append(Song(name: "Someone Like You ", albumName: "Adele21", artistName: "Adele", imageName: "someonelikeyou", trackName: "song1"))
        songs.append(Song(name: "Yol ", albumName: "Single", artistName: "Zeynep Bastık", imageName: "yol", trackName: "song2"))
        songs.append(Song(name: "Böyle Sever ", albumName: "19", artistName: "Kahraman Deniz", imageName: "böylesever", trackName: "song3"))
        songs.append(Song(name: "Benim O", albumName: "Single", artistName: "Tuğba Yurt", imageName: "benimo", trackName: "song4"))
        songs.append(Song(name: "Martılar ", albumName: "Single", artistName: "Edis", imageName: "martı", trackName: "song5"))
        songs.append(Song(name: "Alaz Alaz ", albumName: "Single", artistName: "Buray", imageName: "alazalaz", trackName: "song6"))
        songs.append(Song(name: "Yaz Gülü ", albumName: "Single", artistName: "Yalın", imageName: "yazgülü", trackName: "song7"))
        songs.append(Song(name: "Hay Hay", albumName: "Single", artistName: "Hadise", imageName: "hayhay", trackName: "song8"))
        
    
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        let song = songs[indexPath.row]
        //configure
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //present the player
        let position = indexPath.row
        //song
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
            return
        }
        vc.position = position
        vc.songs = songs
        present(vc, animated: true, completion: nil)
    }
}


