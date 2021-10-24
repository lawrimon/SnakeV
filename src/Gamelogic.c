
void logic(){
int leftborder,rightborder,topborder,bottomborder;
int gameover, score;
int snakelength;
int snake[25];


//Gameover mit Border
if( x < leftborder || x > rightborder|| y < topborder || y > bottomborder )  {
    gameover = 1; // Globale Variable die überprüft wird
}  

//Picking up the fruit and updating the score
if(x == fruitx && fruity){
    //Fruit muss random platziert werden
    while(fruitx == 0){
        fruitx = rand()%20;
    }
     while(fruity == 0){
        fruity = rand()%20;
    }
    score = score + 10; //Score erhöhen
    
}

//Function that checks if the Snake hits its own tail
for(int i = 0; i < snakelength; i++){
    if(x == snake[i] && y == snake[i] && snake[i] == 1) // Überprüfen ob x und y gleich sind und ob eine 1 gesetzt ist
    {
        gameover = 1;
    }
}


}

