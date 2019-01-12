int[] talon;  
int i, j, k=0,l,m;
int field;
int fieldcolor;
int selectedcolor;
int time;
boolean normal = true;
//スーパークラスの配列を準備
player[] players =new player[1]; 
enemy[] enemies = new enemy[3];
Vector<Integer> board = new Vector<Integer>();

void setup()
{
  size(800,600);
  background(0,150,0);
  //カードを定義
 int[][] card = {
            {10,-1,20,-1,30,-1,40,-1,50},
            {11,11,21,21,31,31,41,41,50},
            {12,12,22,22,32,32,42,42,50},
            {13,13,23,23,33,33,43,43,50},
            {14,14,24,24,34,34,44,44,51},
            {15,15,25,25,35,35,45,45,51},
            {16,16,26,26,36,36,46,46,51},
            {17,17,27,27,37,37,47,47,51},
            {18,18,28,28,38,38,48,48,-1},
            {19,19,29,29,39,39,49,49,-1},
            {110,110,120,120,130,130,140,140,-1},
            {111,111,121,121,131,131,141,141,-1},
            {112,112,122,122,132,132,142,142,-1}
  } ;
  
  
    //ターンの初期設定   
    time = 0;  
   
  
  
   talon = new int[108];
  //山札を一次元の配列に代入
  for(i=0 ; i<13 ;i++){
        for(j=0; j<9 ;j++){
          if(card[i][j] != -1){
            
            talon[k] = card[i][j];
            k++;
           
          }  
        }
  }
  
  
  /*for(i=0;i<108;i++){
    System.out.println(talon[i]); 
  }*/
//ためしに画像を表示
 // PImage img =loadImage("r5.PNG");
  
//image(img, 300,300 );
//オブジェクト作成
 for(l=0; l<4 ; l++){
   if(l==0){
     //0バンの配列ににプレーヤーのオブジェクトを作成し、代入
     players[0] = new player();
     players[0].show();
     System.out.println("//////0番目のオブジェクトを作成しました//////");
   }else{
     //1～3バンにエネミークラスのオブジェクトを作成し、代入
     enemies[l-1] = new enemy();
     System.out.println(l +"番目のオブジェクトを作成しました//////");
   }
 }
 
//山札の初期設定
 int rand1 = int(random(108)) ;
 while(talon[rand1] == -1 ||  talon[rand1] > 50){
              rand1 =int(random(108));
            }
 board.add(talon[rand1]);
 
 talon[rand1] = -1;
 
// System.out.println(board.get(0));
 show_board(board.get(0));
 
 //テスト

}
//状態表示メソッド
void show_board(int num)
{
        background(0,150,0);
      
         //カード番号を文字列に変換
          String s1 = String.valueOf( num);
         //画像ファイル名にするため結合する
          String str = s1 + ".PNG";
          
          //System.out.println(str);
         //文字カードは未作成なため表示するのは50までとする
       //  if(num <50){ 
            PImage img = loadImage(str);
            image(img , 350,200  );
        // }
        
        players[0].show();
        text("■ 一枚カードを引く",650,450);
         enemies[0].show(1);
         enemies[1].show(2);
         enemies[2].show(3);
          
}

//場の色を変えるメソッド
void change_color(int num)
{
   selectedcolor = num;
  
}

   
void draw()
{  
  //System.out.println(mouseX);
  //System.out.println(mouseY);
  //場札を表示
  field = board.get(board.size()-1);
   show_board(field);
   //player.
  // System.out.println("/////場札/////////////////////////////");
   //場札の色を判定
     if(field < 50){
       fieldcolor = field /10 ;
     } else if(field > 100){
       fieldcolor = (field -100)/10 ;
     }else{
       fieldcolor = 99;
     } 
    
    if(field ==50 || field == 51){
        text("■赤　  ■黄　  ■青　  ■緑　",300,400); 
    }
    
  //  System.out.println(field);
   // System.out.println("/////場札/////////////////////////////");
  //ドローボタンの表示
 // textSize(30); 
  if(time == 4){
    try{Thread.sleep(500);}catch(InterruptedException e){}
   time = 0; 
  }
   
  /* System.out.println("/////手札の枚数/////////////////////////////");
    int test = players[0].hands.size();
   System.out.println(test);
   */
   //ターンの初期設定
  
   if(time == 0){
     text("プレイヤーのターン",400,420);
     try{Thread.sleep(1500);}catch(InterruptedException e){}
     
     
   }else if(time == 1){
     text("エネミー１のターン",400,420);
     try{Thread.sleep(1500);}catch(InterruptedException e){}
     
     enemies[0].choice();
     
     enemies[0].drew = false ;
     time++;
   }else if(time == 2){
     text("エネミー２のターン",400,420);
     try{Thread.sleep(1500);}catch(InterruptedException e){}
     
     enemies[1].choice();
     enemies[1].drew =false;
     time++;
   }else if(time == 3){
     text("エネミー３のターン",400,420);
     try{Thread.sleep(1500);}catch(InterruptedException e){}
     time++;
     enemies[2].choice();
     enemies[2].drew = false;
     
     //現状は、ドロー変数の更新をここにしている
     players[0].drew = false;
     
   }
   
   
   
 /*   field = board.get(board.size()-1);
   show_board(field);
   if(field ==50 || field == 51){
        text("■赤　  ■黄　  ■青　  ■緑　",300,400); 
    }
   */
}
//クリックされたときに実行
void mouseClicked() 
{
  if(time == 0){
    //範囲を指定
    if( 480 < mouseY  && mouseY <580){
         if(30 < mouseX  && mouseX <105){
           //手札が一枚以上であれば実行
           if(players[0].hands.size() >= 1){
            // background(0,150,0);
             players[0].choice(0);
            // players[0].show();
           }
             
           
         }
         
         if(110 < mouseX  && mouseX <185){
           if(players[0].hands.size() >= 2){
             //background(0,150,0);
             players[0].choice(1);
             //players[0].show();
           }
             
           
         }
         
         if(190 < mouseX  && mouseX <265){
           if(players[0].hands.size() >= 3){
           //  background(0,150,0);
             players[0].choice(2);
            // players[0].show();
           }
             
           
         }
         
         if(270 < mouseX  && mouseX < 345){
           if(players[0].hands.size() >= 4){
            // background(0,150,0);
             players[0].choice(3);
            // players[0].show();
           }
             
           
         }
         
         if(350 < mouseX  && mouseX < 425){
           if(players[0].hands.size() >= 5){
            // background(0,150,0);
             players[0].choice(4);
            // players[0].show();
           }
             
           
         }
         
         if(430 < mouseX  && mouseX <505){
           if(players[0].hands.size() >= 6){
            // background(0,150,0);
             players[0].choice(5);
            // players[0].show();
           } 
           
         }
         
         if(510 < mouseX  && mouseX <585){
           //手札が７枚以上であれば実行
           if(players[0].hands.size() >= 7){
            // background(0,150,0);
             players[0].choice(6);
            // players[0].show();
           }
           
         }
         
         if(590 < mouseX  && mouseX <665){
           //手札が8枚以上であれば実行
           if(players[0].hands.size() >= 8){
            // background(0,150,0);
             players[0].choice(7);
            // players[0].show();
           }
           
         }
         
         if(670 < mouseX  && mouseX <745){
           //手札が9枚以上であれば実行
           if(players[0].hands.size() >= 9){
            // background(0,150,0);
             players[0].choice(8);
            // players[0].show();
           }
           
         }
      
    }
  
  
  //ドローボタン
  if( 440 < mouseY  && mouseY <450){
      if(650 < mouseX  && mouseX <660){
        // background(0,150,0);
         players[0].draw_hand();
        // players[0].show();
      }
    
  }
  
  //色変え
  if( 390 < mouseY  && mouseY <400){
    if(300 < mouseX  && mouseX < 310){
         change_color(1);
    }
    if(340 < mouseX  && mouseX < 350){
         change_color(2);
    }
    if(380 < mouseX  && mouseX < 390){
         change_color(3);
    }
    if(420 < mouseX  && mouseX < 430){
         change_color(4);
    }
    
    
  
  }
  
  }
  
}
