class enemy extends player
{
  
  //出すことが可能なカードのリスト
  public Vector<Integer> list1 = new Vector<Integer>();
  //出すことが可能なカードの手札上の番号を代入する
  public Vector<Integer> list_num = new Vector<Integer>();
  //候補カード
  int candidate;
  //候補カードの手札上の番号
  int candidate_num;
  
  public enemy()
  {
    System.out.println("エネミークラスです"); 
  }

 //オーバーライドしたchoiceメソッド  手を決める
  void choice()
   {
     //出せるカードをリストアップ
     search();
     
     if(list1.size() > 0){
       //出せるカードが存在したので優先順位を付ける
       priority();
     
       //優先順位が高いものをだす
        board.add(hands.get(candidate_num));
        hands.remove(candidate_num);
        
       
       
     }else if(drew == false){
       //出せるカードが存在しなかった
       //まだドローをしていなかった
       draw_hand();
       //ドローを行ってチョイスに再帰
       drew = true ;
       choice();
       
     }else{
       //出せるカードが存在せず、すでにドローも行っていた
       //何もしない
     }
       
     
     //出し終えたので、リストを全削除
     list1.removeAllElements();
     list_num.removeAllElements();
     
     
   }
   //オーバーライドしたshowメソッド　手札の枚数を表示する
   public void show(int t)
   {
    // System.out.println(hands.size());
     
     if(t == 1){
         text(hands.size(),100,200);
     }else if(t == 2){
         text(hands.size(),400,100);
     }else if(t == 3){
          text(hands.size(),700,200);
     }
     
   }
   //出せるカードを探す
   void search()
   {
     //手札を場札の色と比較し、同じ色,ワイルドカードの何れかならリストアップする
     for(m = 0; m < hands.size() ; m++){
        if((hands.get(m)/10 == fieldcolor) || (hands.get(m) == 50) || (hands.get(m) == 51)){
            list1.add(hands.get(m));
            //m番目のカードにはmという数字が該当する
            list_num.add(m);
       }
     }
     
     
   }
   //出せるカードの中で優先順位を決める
   void priority()
   {
     
     if(normal == true){
        candidate = list1.get(0);
        candidate_num = list_num.get(0);
      for(int n = 1; n< list1.size(); n++){
       if(candidate ==51){
        candidate =list1.get(n);
        candidate_num = list_num.get(n);
       }else if(candidate ==50){
        if(list1.get(n) != 51){
          candidate =list1.get(n);
          candidate_num = list_num.get(n);
        }
       }else if(candidate > 100){
         if(list1.get(n) < 50){
           candidate = list1.get(n);
           candidate_num = list_num.get(n);
         }
       }else{
         if((candidate %10) > (list1.get(n)%10)){
           candidate = list1.get(n);
           candidate_num = list_num.get(n);
         }
       }
       
       
       
       
   }
   
   }
  
   }
}
