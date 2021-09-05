# お笑いジャッジ.com  
<br />

## アプリ概要
**お笑い三大賞レース（M-1, キングオブコント, R-1）の国民審査アプリ**です。  
観ている賞レースを審査員目線で得点をつけ、結果をTwitterでシェアしましょう。  
審査結果は集計され、国民審査員として投票者全員の平均得点が表示されます。  
<br />
<br />

## 作成した経緯
お笑い賞レースを観るときは審査員になりきって、友達と「何点にした?」いうやりとりが毎年の恒例です。  
Twitter上でも審査結果を晒すのがお笑いファンの中でも恒例ですが、わざわざファイナリストの名前を入力するのが面倒な一面がありました。  
また、自分の意見を正義と思い込み「あの審査員はおかしい！」「面白くなかったのに贔屓で勝ち上がった」など、心を痛めるようなツイートが近年多く見られるようになりました。  
この現状を変えるには、「入力の手間が省ける審査アプリ」「国民の審査を客観的に見られるアプリ」が必要だと思い作成しました。  
<br />
<br />

## リンク（取得予定）
owarai-judge.com  
<br />
<br />

## 使用画面サンプル（Figmaの画面です）
<br />

| Top画面 | 年代選択画面 | 審査画面 | 審査結果画面 |
| :---: | :---: | :---: | :---: |
| <img width="172" alt="スクリーンショット 2021-09-05 11 21 58" src="https://user-images.githubusercontent.com/69828703/132112821-103351d0-a0bd-4743-b22d-428154c61304.png"> | <img width="167" alt="スクリーンショット 2021-09-05 11 22 16" src="https://user-images.githubusercontent.com/69828703/132112829-b0a095ec-00c9-49ef-8b3d-f00d4947ccd6.png"> | <img width="167" alt="スクリーンショット 2021-09-05 11 22 29" src="https://user-images.githubusercontent.com/69828703/132112839-4d068ee2-85c4-4a51-ab5c-ee21871b73b7.png"> | <img width="166" alt="スクリーンショット 2021-09-05 11 22 45" src="https://user-images.githubusercontent.com/69828703/132112847-8f86cb25-a6a5-4cac-a18f-bd41692298a2.png"> |  
<br />
<br />
<br />

# 使用技術
スマートフォンでの使用を想定したSPAを作成しました。

### フロントエンド
- React　&ensp; 17.0.2
  - react-router-dom &ensp; 5.2.1
  - styled-components　&ensp; 5.3.1
- TypeScript　&ensp; 4.1.2
- axios　&ensp; 0.21.1
- Chakra UI　&ensp; 1.6.6

### バックエンド
- Ruby　&ensp; 2.6.6
- Rails(API)　&ensp; 6.0.4.1
  - seed-fu &ensp; 2.3.9 

### インフラ
- MySQL　&ensp; 

