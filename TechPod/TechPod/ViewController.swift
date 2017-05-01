//
//  ViewController.swift
//  TechPod
//
//  Created by Aoi Sakaue on 2016/12/07.
//  Copyright © 2016年 Sakaue Aoi. All rights reserved.
//

import UIKit
import AVFoundation
//UITableViewのDataSource（データソース）メソッドを使うための「プロトコル宣言」を行う
//UITableViewのDelegate（デリゲート）メソッドを使うための「プロトコル宣言」を行う
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    //StoryBoardで扱うTableViewを宣言
    @IBOutlet var table: UITableView!
    
    //曲名を入れるための配列
    var songNameArray = [String]()
    //曲のファイル名を入れるための配列
    var fileNameArray = [String]()
    //音楽家の画像を入れるための配列
    var imageNameArray = [String]()
    
    //音楽を再生するための変数
    var audioPlayer : AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //テーブルビューのデータソースメソッドはViewControllerクラスに書くよ、という設定
        table.dataSource = self
        
        //テーブルビューのデリゲートメソッドはViewControllerメソッドに書くよ、という設定
        table.delegate = self
        
        //songNameArrayに曲名を入れていく
        songNameArray = ["One way or another", "shut up and dance", "something new"]
        
        //fileNameArrayにファイル名を入れていく
        //音楽ファイルの拡張子はこの後で指定
        fileNameArray = ["One_way_or_another", "shut_up_and_dance", "something_new"]
        
        //imageNameArrayに曲の画像の名前を入れていく
        imageNameArray = ["one_way_or_another.jpeg", "shut_up_and_dance.jpg", "something_new.jpg"]

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //セルの数をsongNameArrayの数にする
        return songNameArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        //セルにsongNameArrayの曲名を表示する
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
        //セルに曲のアートワークを表示する
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
print("た！")
        return cell!
    }
    
    //セルが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました！")
        
        //音楽ファイルの設定
        //音楽ファイルのファイル名を指定してパスを取得
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row],ofType:"mp3")!)
        
        //再生の準備
        //AVAudioPlayerに音楽ファイルのパスを渡してあげる
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        
        //音楽を再生
        //audioPlayerインスタンスに対してplayメソッドを呼び出す
        audioPlayer.play()
        
    }
}

