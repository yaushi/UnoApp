public class player
{
  //手札を表す
 //ベクタークラスのＨＡＮＤＳに、ベクタークラスの新しいオブジェクトを代入する 
  public Vector<Integer> hands = new Vector<Integer>();
  //そのターン内において、すでにドローがされたかを示す変数
  boolean drew = false ; 
    player()
   {   
     
      System.out.println("初期状態の手札設定します");
       //初期状態の手札を設定する
         for(i=0; i<7; i++){
           //山札からカードを選択
            int rand =int(random(108));
           //選んだカードが-1であれば選びなおす
            while(talon[rand] == -1){
              rand =int(random(108));
            }
            //手札に加える
             hands.add(talon[rand]);
                //すでに引いた札を使用不可とする
                talon[rand] = -1;
            
           System.out.println(hands.get(i));
          
         }
         
         
         
         
         
         
   } 
   //手札を画面上に表示するメソッド
    public void show()
   {
     
       for(int k=0 ;k <= hands.size() - 1 ;k++){
         //カード番号を文字列に変換
          String s1 = String.valueOf( hands.get(k));
         //画像ファイル名にするため結合する
          String str = s1 + ".PNG";
          
         // System.out.println(str);
         //文字カードは未作成なため表示するのは50までとする
        // if(hands.get(k) <50){ 
            PImage img = loadImage(str);
            image(img , 30 +(k * 80),480  );
            
          //  System.out.println("/////////////////////////////");
          //  System.out.println(hands.size());
         //}
       }
     
   }
   
   void draw_hand()
   {
     if(drew == false){
           //山札からカードを選択
            int rand =int(random(108));
           //選んだカードが-1であれば選びなおす
            while(talon[rand] == -1){
              rand =int(random(108));
            }
           //手札に加える
             hands.add(talon[rand]);
             
             drew = true ;
     }
     
     
   }
   
   //場にカードを出し、手札を更新
   void choice(int num)
   {
     //引数は何枚目の手札がクリックされたかを示す
     
     int  handcolor;
     
     
     
     //手札の色を判定
     if(hands.get(num) < 50){
       handcolor = hands.get(num) /10 ;
     } else if(hands.get(num) > 100){
       handcolor = (hands.get(num) -100)/10 ;
     }else{
       handcolor = 99;
     }
     
        //色が同じ　OR　wildカード　であれば実行
        //場札がWILDカードであれば、選択した色を場の色とする
     if(field == 50 || field ==51){
       if( (selectedcolor == handcolor) || (handcolor == 99)  ){
       board.add(hands.get(num));
       hands.remove(num);
       time=time+1;
       }
      }else if( (fieldcolor == handcolor) || (handcolor == 99)  ){
            board.add(hands.get(num));
            hands.remove(num);
            time=time+1;
      //カードを出したので、一枚ドローする
       //draw_hand();
     }
     
     //ターンの進行
     
   }
   
}
