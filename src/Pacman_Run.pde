int ROOM_WIDTH = 400;
int ROOM_HEIGHT = 400;
int PACMAN_WIDTH = 40;
int PACMAN_HEIGHT = 40;
int posXPacman = 200;
int posYPacman = 380;

PImage monster1 ;
int MONSTER1_WIDTH = 60;
int MONSTER1_HEIGHT = 60;
int posXMonster1 = 170;
int POS_Y_MONSTER_1 = 270;
int rightOrLeftMonster1 = ceil(random(0, 2));

PImage monster2;
int MONSTER2_WIDTH = 70;
int MONSTER2_HEIGHT = 70;
int posXMonster2 = 170;
int POS_Y_MONSTER_2 = 170;
int rightOrLeftMonster2 = ceil(random(0, 2));

PImage monster3 ;
int MONSTER3_WIDTH = 80;
int MONSTER3_HEIGHT = 80;
int posXMonster3 = 170;
int POS_Y_MONSTER_3 = 70;
int rightOrLeftMonster3 = ceil(random(0, 2));



// mouth angles for pacman
int arcStartAngleRight = 70;
int arcStopAngleRight = 290;
boolean StartAngleIncreaseRight = false;
boolean StartAngleDecreaseRight = true;
boolean StopAngleIncreaseRight = true;
boolean StopAngleDecreaseRight = false;
int arcStartAngleUp = -20;
int arcStopAngleUp = 200;
boolean StartAngleIncreaseUp = false;
boolean StartAngleDecreaseUp = true;
boolean StopAngleIncreaseUp = true;
boolean StopAngleDecreaseUp = false;
int arcStartAngleLeft = -110;
int arcStopAngleLeft = 110;
boolean StartAngleIncreaseLeft = false;
boolean StartAngleDecreaseLeft = true;
boolean StopAngleIncreaseLeft = true;
boolean StopAngleDecreaseLeft = false;
int arcStartAngleDown = -200;
int arcStopAngleDown = 20;
boolean StartAngleIncreaseDown = false;
boolean StartAngleDecreaseDown = true;
boolean StopAngleIncreaseDown = true;
boolean StopAngleDecreaseDown = false;
int arcStartAngleStay = 0;
int arcStopAngleStay = 360;

boolean start = true;
boolean instructionsAppear = false;
boolean gameWin = false;
boolean gameOver = false;

void setup(){
  size(400, 400);
  frameRate(30);
  monster1 = loadImage("MrPinkGreen.png");
  monster2 = loadImage("MrPinkGreen.png");
  monster3 = loadImage("MrPinkGreen.png");
}

void startScreen () {
    int POS_X_RECT = 125;
    int POS_Y_RECT = 160;
    int RECT_WIDTH = 150;
    int RECT_HEIGHT = 60;
    int POS_X_RECT_INSTRUCTIONS = 125;
    int POS_Y_RECT_INSTRUCTIONS = 240;
    int RECT_WIDTH_INSTRUCTIONS = 150;
    int RECT_HEIGHT_INSTRUCTIONS = 60;
    
    background(55, 212, 136);
    fill(237, 237, 5);
    textSize(50);
    text("PACMAN RUN", 35, 120);
    fill(201, 173, 173);
    strokeWeight(5);
    rect(POS_X_RECT, POS_Y_RECT, RECT_WIDTH, RECT_HEIGHT);
    rect(POS_X_RECT_INSTRUCTIONS, POS_Y_RECT_INSTRUCTIONS, RECT_WIDTH_INSTRUCTIONS,        RECT_HEIGHT_INSTRUCTIONS);
    fill(18, 18, 17);
    textSize(25);
    text("Play", POS_X_RECT + 42, POS_Y_RECT + 42);
    text("Instructions", POS_X_RECT_INSTRUCTIONS + 10, POS_Y_RECT_INSTRUCTIONS + 42);
    if (mouseX > POS_X_RECT && mouseX < POS_X_RECT + RECT_WIDTH && mouseY > POS_Y_RECT     && mouseY < POS_Y_RECT + RECT_HEIGHT) {
        fill(245, 223, 223);
        rect(POS_X_RECT, POS_Y_RECT, RECT_WIDTH, RECT_HEIGHT);
        fill(10, 8, 8);
        text("Play", POS_X_RECT + 42, POS_Y_RECT + 42);
        if(mousePressed) {
            start = false;
        }
        
    }
    if (mouseX > POS_X_RECT_INSTRUCTIONS && mouseX < POS_X_RECT_INSTRUCTIONS +      RECT_WIDTH_INSTRUCTIONS && mouseY > POS_Y_RECT_INSTRUCTIONS && mouseY < POS_Y_RECT_INSTRUCTIONS + RECT_HEIGHT_INSTRUCTIONS) {
        fill(245, 223, 223);
        rect(POS_X_RECT_INSTRUCTIONS, POS_Y_RECT_INSTRUCTIONS, RECT_WIDTH_INSTRUCTIONS, RECT_HEIGHT_INSTRUCTIONS);
        fill(10, 8, 8);
        text("Instructions", POS_X_RECT_INSTRUCTIONS + 10, POS_Y_RECT_INSTRUCTIONS + 42         );
        if(mousePressed) {
            instructionsAppear = true;
            start = false;
        }
        
    }
    
};

void instructionScreen () {
    int POS_X_RECT_BACK = 125;
    int POS_Y_RECT_BACK = 330;
    int RECT_WIDTH_BACK = 150;
    int RECT_HEIGHT_BACK = 60;
    
    background(55, 212, 136);
    textSize(50);
    fill(237, 237, 5);
    text("PACMAN RUN", 35, 120);
    fill(15, 13, 13);
    textSize(20);
    text("Pacman must get to the finish, however", 10, 180); 
    text("three evil monsters stand in his way!", 10, 210);
    text("Help Pacman reach the finish while", 10, 240);
    text("avoiding the monsters. Use the arrow keys", 10, 270);
    text("to control Pacman and good luck!", 10, 300);
    fill(201, 173, 173);
    rect(POS_X_RECT_BACK, POS_Y_RECT_BACK, RECT_WIDTH_BACK, RECT_HEIGHT_BACK);
    fill(15, 13, 13);
    textSize(30);
    text("Back", POS_X_RECT_BACK + 40, POS_Y_RECT_BACK + 40);
    if (mouseX > POS_X_RECT_BACK && mouseX < POS_X_RECT_BACK + RECT_WIDTH_BACK && mouseY > POS_Y_RECT_BACK && mouseY < POS_Y_RECT_BACK + RECT_HEIGHT_BACK) {
        fill(245, 223, 223);
        rect(POS_X_RECT_BACK, POS_Y_RECT_BACK, RECT_WIDTH_BACK, RECT_HEIGHT_BACK);
        fill(10, 8, 8);
        text("Back", POS_X_RECT_BACK + 40, POS_Y_RECT_BACK + 40);
        if(mousePressed) {
            instructionsAppear = false;
            start = true;
            
        }
}
};

void gameWinScreen () {
    background(41, 217, 230);
    textSize(30);
    fill(15, 10, 5);
    text("Great job! Pacman is", 10, 250);
    text("forever in your debt!", 10, 280);
    textSize(20);
    text("Thanks for playing!", 86, 390);
    fill(255, 0, 0);
    for (int posXTongue = 80; posXTongue < 380; posXTongue += 120) {
        ellipse(posXTongue, 120, 50, 50);
    }
    fill(235, 225, 30);
    for (posXPacman = 80; posXPacman < 380; posXPacman += 120) {
        arc(posXPacman, 120, 120, 120,radians(arcStartAngleUp), radians(arcStopAngleUp));
    }
    if (StartAngleIncreaseUp == true) {
        arcStartAngleUp += 10;
    }
    if (StartAngleDecreaseUp == true) {
        arcStartAngleUp -= 10;
    } 
    if (StopAngleIncreaseUp == true) {
        arcStopAngleUp += 10;
    }
    if (StopAngleDecreaseUp == true) {
        arcStopAngleUp -= 10;
    }
    if (arcStartAngleUp == -100) {
        StartAngleIncreaseUp = true;
        StartAngleDecreaseUp = false;
    }
    if (arcStartAngleUp == -20) {
        StartAngleDecreaseUp = true;
        StartAngleIncreaseUp = false;
    }
    if (arcStopAngleUp == 200) {
        StopAngleIncreaseUp = true;
        StopAngleDecreaseUp = false;
    }
    if (arcStopAngleUp == 280) {
        StopAngleDecreaseUp = true;
        StopAngleIncreaseUp = false;
    }

};

void gameoverScreen () {
    background(219, 83, 83);
    fill(230, 193, 80);
    textSize(50);
    text("Gameover", 86, 120);
    textSize(20);
    text("Thanks for playing!", 100, 390);
    image(monster1, 140, 140);
};



//frameRate(30);
void draw () {
    if (gameOver) {
        gameoverScreen();
    }
    else if (gameWin) {
        gameWinScreen();
    }
    else if (start) {
        startScreen();
    }
    else if (instructionsAppear) {
        instructionScreen();
    }
    else {
        
    background(55, 212, 136);
    
    if (keyPressed && keyCode == RIGHT && posXPacman <= ROOM_WIDTH - PACMAN_WIDTH / 2) {
    // Right direction eating animation
    
    fill(255, 0, 0);
    ellipse(posXPacman, posYPacman, 18, 18);
    fill(240, 229, 17);
    arc(posXPacman, posYPacman, 40, 40, radians(arcStartAngleRight), radians(arcStopAngleRight));
    if (StartAngleIncreaseRight == true) {
        arcStartAngleRight += 10;
    }
    if (StartAngleDecreaseRight == true) {
        arcStartAngleRight -= 10;
    } 
    if (StopAngleIncreaseRight == true) {
        arcStopAngleRight += 10;
    }
    if (StopAngleDecreaseRight == true) {
        arcStopAngleRight -= 10;
    }
    if (arcStartAngleRight == -10) {
        StartAngleIncreaseRight = true;
        StartAngleDecreaseRight = false;
    }
    if (arcStartAngleRight == 70) {
        StartAngleDecreaseRight = true;
        StartAngleIncreaseRight = false;
    }
    if (arcStopAngleRight == 290) {
        StopAngleIncreaseRight = true;
        StopAngleDecreaseRight = false;
    }
    if (arcStopAngleRight == 370) {
        StopAngleDecreaseRight = true;
        StopAngleIncreaseRight = false;
    }
    
    posXPacman += 5;
}
    
    if (keyPressed && keyCode == LEFT && posXPacman >= PACMAN_WIDTH / 2) {
        //Left Direction eating animation
        
         fill(255, 0, 0);
        ellipse(posXPacman, posYPacman, 18, 18);
        fill(240, 229, 17);
        arc(posXPacman, posYPacman, 40, 40, radians(arcStartAngleLeft), radians(arcStopAngleLeft));
        if (StartAngleIncreaseLeft == true) {
        arcStartAngleLeft += 10;
    }
        if (StartAngleDecreaseLeft == true) {
            arcStartAngleLeft -= 10;
        } 
        if (StopAngleIncreaseLeft == true) {
            arcStopAngleLeft += 10;
        }
        if (StopAngleDecreaseLeft == true) {
            arcStopAngleLeft -= 10;
        }
        if (arcStartAngleLeft == -190) {
            StartAngleIncreaseLeft = true;
            StartAngleDecreaseLeft = false;
        }
        if (arcStartAngleLeft == -110) {
            StartAngleDecreaseLeft = true;
            StartAngleIncreaseLeft = false;
        }
        if (arcStopAngleLeft == 110) {
            StopAngleIncreaseLeft = true;
            StopAngleDecreaseLeft = false;
        }
        if (arcStopAngleLeft == 190) {
            StopAngleDecreaseLeft = true;
            StopAngleIncreaseLeft = false;
        }
    
        posXPacman -= 5;
    }
    
    if (keyPressed && keyCode == DOWN && posYPacman <= ROOM_HEIGHT - PACMAN_HEIGHT / 2) {
        //Down Direction eating animation
        
        fill(255, 0, 0);
        ellipse(posXPacman, posYPacman, 18, 18);
        fill(240, 229, 17);
        arc(posXPacman, posYPacman, 40, 40, radians(arcStartAngleDown), radians(arcStopAngleDown));
        if (StartAngleIncreaseDown == true) {
        arcStartAngleDown += 10;
    }
        if (StartAngleDecreaseDown == true) {
            arcStartAngleDown -= 10;
        } 
        if (StopAngleIncreaseDown == true) {
            arcStopAngleDown += 10;
        }
        if (StopAngleDecreaseDown == true) {
            arcStopAngleDown -= 10;
        }
        if (arcStartAngleDown == -280) {
            StartAngleIncreaseDown = true;
            StartAngleDecreaseDown = false;
        }
        if (arcStartAngleDown == -200) {
            StartAngleDecreaseDown = true;
            StartAngleIncreaseDown = false;
        }
        if (arcStopAngleDown == 20) {
            StopAngleIncreaseDown = true;
            StopAngleDecreaseDown = false;
        }
        if (arcStopAngleDown == 100) {
            StopAngleDecreaseDown = true;
            StopAngleIncreaseDown = false;
        }
    
        posYPacman += 5;
}
    
     if (keyPressed && keyCode == UP && posYPacman >= PACMAN_HEIGHT / 2) {
        //Up Direction eating animation
        
        fill(255, 0, 0);
        ellipse(posXPacman, posYPacman, 18, 18);
        fill(240, 229, 17);
        arc(posXPacman, posYPacman, 40, 40, radians(arcStartAngleUp), radians(arcStopAngleUp));

        if (StartAngleIncreaseUp == true) {
        arcStartAngleUp += 10;
        }
        if (StartAngleDecreaseUp == true) {
            arcStartAngleUp -= 10;
        } 
        if (StopAngleIncreaseUp == true) {
            arcStopAngleUp += 10;
        }
        if (StopAngleDecreaseUp == true) {
            arcStopAngleUp -= 10;
        }
        if (arcStartAngleUp == -100) {
            StartAngleIncreaseUp = true;
            StartAngleDecreaseUp = false;
        }
        if (arcStartAngleUp == -20) {
            StartAngleDecreaseUp = true;
            StartAngleIncreaseUp = false;
        }
        if (arcStopAngleUp == 200) {
            StopAngleIncreaseUp = true;
            StopAngleDecreaseUp = false;
        }
        if (arcStopAngleUp == 280) {
            StopAngleDecreaseUp = true;
            StopAngleIncreaseUp = false;
        }
     
        posYPacman -= 5;
     }
     
      if (keyPressed) {
      }
      else {
        //Stay direction eating animation  
      fill(255, 0, 0);
      ellipse(posXPacman, posYPacman, 18, 18);
      fill(240, 229, 17);
      arc(posXPacman, posYPacman, 40, 40, arcStartAngleStay, arcStopAngleStay);
      }
    
    // movement of monsters
    image(monster1, posXMonster1, POS_Y_MONSTER_1, MONSTER1_WIDTH, MONSTER1_HEIGHT);
    if (rightOrLeftMonster1 == 1) {
        posXMonster1 += 11;
    }
    else {
        posXMonster1 -= 11;
    }
    if (posXMonster1 >= ROOM_WIDTH - MONSTER1_WIDTH) {
        rightOrLeftMonster1 = 2;
    }
    if (posXMonster1 <= 0) {
        rightOrLeftMonster1 = 1;
    }
    
    image(monster2, posXMonster2, POS_Y_MONSTER_2, MONSTER2_WIDTH, MONSTER2_HEIGHT);
    if (rightOrLeftMonster2 == 1) {
        posXMonster2 += 13;
    }
    else {
        posXMonster2 -= 13;
    }
    if (posXMonster2 >= ROOM_WIDTH - MONSTER2_WIDTH) {
        rightOrLeftMonster2 = 2;
    }
    if (posXMonster2 <= 0) {
        rightOrLeftMonster2 = 1;
    }
    
    image(monster3, posXMonster3, POS_Y_MONSTER_3, MONSTER3_WIDTH, MONSTER3_HEIGHT);
    if (rightOrLeftMonster3 == 1) {
        posXMonster3 += 15;
    }
    else {
        posXMonster3 -= 15;
    }
    if (posXMonster3 >= ROOM_WIDTH - MONSTER2_WIDTH) {
        rightOrLeftMonster3 = 2;
    }
    if (posXMonster3 <= 0) {
        rightOrLeftMonster3 = 1;
    }
    // checking for collisions betwwen Pacman and monsters
    if ((posYPacman - PACMAN_HEIGHT / 2 >= POS_Y_MONSTER_1 && posYPacman - PACMAN_HEIGHT / 2 <= POS_Y_MONSTER_1 + MONSTER1_HEIGHT) && (posXPacman - PACMAN_WIDTH / 2 >= posXMonster1 && posXPacman - PACMAN_WIDTH / 2 <= posXMonster1 + MONSTER1_WIDTH) ||(posYPacman - PACMAN_HEIGHT / 2 >= POS_Y_MONSTER_2 && posYPacman - PACMAN_HEIGHT / 2 <= POS_Y_MONSTER_2 + MONSTER2_HEIGHT) && (posXPacman - PACMAN_WIDTH / 2 >= posXMonster2 && posXPacman - PACMAN_WIDTH / 2 <= posXMonster2 + MONSTER2_WIDTH) || (posYPacman - PACMAN_HEIGHT / 2 >= POS_Y_MONSTER_3 && posYPacman - PACMAN_HEIGHT / 2 <= POS_Y_MONSTER_3 + MONSTER3_HEIGHT) && (posXPacman - PACMAN_WIDTH / 2 >= posXMonster3 && posXPacman - PACMAN_WIDTH / 2 <= posXMonster3 + MONSTER3_WIDTH) ){
         gameOver = true;
    }
    // finish point
    int POS_X_RECT_FINISH = 150;
    int POS_Y_RECT_FINISH = 2;
    int RECT_FINISH_WIDTH = 100;
    int RECT_FINISH_HEIGHT = 20;
    
    fill(41, 217, 230);
    rect(POS_X_RECT_FINISH, POS_Y_RECT_FINISH, RECT_FINISH_WIDTH, RECT_FINISH_HEIGHT);
    
    if ((posXPacman >= POS_X_RECT_FINISH && posXPacman <= POS_X_RECT_FINISH + RECT_FINISH_WIDTH) && posYPacman >= POS_Y_RECT_FINISH && posYPacman <= POS_Y_RECT_FINISH + RECT_FINISH_HEIGHT) {
        gameWin = true;
    }
}
};
    
