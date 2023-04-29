//Names: Radin Ahari, Felix Zhao //<>//
//Date: 06/17/2022
//Teacher: Ms. Basaraba
//Description: Our interactive story for the ICS culminating. 

import processing.sound.*;
SoundFile title;
SoundFile minuteTheme;
SoundFile greySpaceTheme;
SoundFile borbTheme;
SoundFile glade;
SoundFile win;
SoundFile lose;
SoundFile sugarStar;
SoundFile stardust;
SoundFile trouble;
SoundFile worldsEnd;
SoundFile omori;
SoundFile duet;
SoundFile oyasumi;
SoundFile slam;
SoundFile wherePlay;

PFont fontNormal; //font variable
PFont fontCursed; //font variable

int textY = 600; //the values for the Y values for the scrolling text

int creditsRotation;//controls the rotation of the characters in the credits sequence

int titleTimer;
int minuteTimer;
int greyTimer;
int borbTimer;
int minuteTordTimer;
int gladeTimer;
int winTimer;
int loseTimer;
int sugarStarTimer;
int stardustTimer;
int troubleTimer;
int worldsEndTimer;
int omoriTimer;
int duetTimer;
int oyasumiTimer;
int slamTimer;
int wherePlayTimer;
int borbArbyTimer;
int minuteBageTimer;
int minuteThreeTimer;
int greyGoodTimer;
int greyBadTimer;
int greySecretTimer;

int timer;//the timer for timing minute forest
int timerGreySpace;//timer for grey space
int timerBorbRoom;//timer for borb room
int timerBoss; //timer to control when you can click buttons in boss fights
int timerTordBoss;//Tord Boss Timer 
int timerMinuteTordBoss;//Timer for minute forest when tord boss happens
int timerCloudyRoom;//Timer for cloudy's room
int timerStairs;//Timer for stairs
int timerBorbRoomArby;//timer for borb room with Arby
int timerMinuteBageBoss;//timer for minute forest when bage boss happens
int timerMinuteBage;//timer for minute forest when bage is rescued
int timerSpaceBoss;//timer for minute forest when bage boss happens
int timerSpace;//Timer for Space World
int timerTrash;//Timer for Trash Pile
int timerAmoriBoss;//Timer for grey space when amori boss happens
int timerBad; //Timer for bad ending
int timerGood; //Timer for good ending
int timerSecret; //timer for secret ending
int timerSecretStairs; //timer for secret ending
int timerSecretWorld; //timer for secret ending

int slide = 0; //the variable for the slide number

float amoriX, amoriY; //variables for the x and y values of amori
float amoriScale;//the size of amori

float tordDeerX, tordDeerY; //variables for the x and y values of tord deer
float tordDeerScale;//the size of tord deer

float bageX, bageY; //variables for the x and y values of bage
float bageScale;//the size of bage

float cloudyX, cloudyY; //variables for the x and y values of cloudy
float cloudyScale;//the size of cloudy

float lambX, lambY; //variables for the x and y values of lamb

float handX, handY; //variables for the x and y values of purple hands
float handScale;//the size of hand
float handDir = 1; //Hand direction

float tordX, tordY;//variables for the x and y values of tord
float tordScale;//the size of tord

float celX, celY; //variables for the x and y values of cel
float celScale;//the size of cel

float arbyX, arbyY; //variables for the x and y values of arby
float arbyScale;//the size of arby

float hereX, hereY;//variables for the x and y values of here
float hereScale;//the size of here

float worldwideX, worldwideY;//variables for the x and y values of mr worldwide
float worldwideScale;//the size of mr worldwide

float cloudAnimation = 50; //variable for the x values of the clouds
float cloudDirection = -0.5; //direction of clouds

int counter = 0; //variable for typewriter effect and counts current index of letter

int tordHealth = 2147483647; //Tords health, cannot be defeated
int amoriHealth = 140; //amori Health
int amoriBossHealth = 6000; //Amori boss health 
int bageHealth = 200; //health for bage boss fight
int mrWorldwideHealth = 1000; //Mr. Worldwide health
int cloudyHealth = 300; //Cloudy health 

int tordDamage = int(random(40, 60)); //range of damage tord deals
int amoriDamage = int(random(50, 80)); //range of damage amori deals
int amoriHeal = int(random(20, 30)); //range of damage amori heals
int cloudyHeal = int(random(100, 200)); //range of damage cloudy can heal
int amoriBossDamage = int(random(70, 150));
int mrWorldwideDamage = int(random(20, 30)); //range of damage Mr. Worldwide deals
int enemyDamage = int(random(0, 20)); //range of damage enemies deals
int bageDamage = 60; //range of damage for bage boss
int cloudyDamage = int(random(30, 100)); //range of damage Cloudy deals

boolean attacked; //the variable to check if the user attacked
boolean healed; //the variable to check if the user healed

String name; //the variable for the name of the main character inputted by the user

boolean paused = false; //used to check if the story is paused

int previousSlide; //used to store the previous slide before pausing

void setup() {
  frameRate(120);
  size(800, 500);
}

void draw() {
  //menu slide
  if (slide == 0) { //checks if it is in the menu slide
    menu();
    titleTimer++;
    if(titleTimer >= 0 && titleTimer < 2){
      title = new SoundFile(this, "01 Title.mp3");
      minuteTheme = new SoundFile(this, "18 Poems In The Fog.mp3");
      greySpaceTheme = new SoundFile(this, "02 WHITE SPACE.mp3");
      borbTheme = new SoundFile(this, "03 Lost At A Sleepover.mp3");
      glade = new SoundFile(this, "136 Glade.mp3");
      win = new SoundFile(this, "10 So, How'd We Do-.mp3");;
      lose = new SoundFile(this, "11 It's Okay To Try Again....mp3");
      sugarStar = new SoundFile(this, "21 Sugar Star Planetarium.mp3");
      stardust = new SoundFile(this, "32 Stardust Diving.mp3");
      trouble = new SoundFile(this, "39 Trouble - NEVER-ALWAYS.mp3");
      worldsEnd = new SoundFile(this, "86 World's End Valentine.mp3");
      omori = new SoundFile(this, "168 OMORI.mp3");
      duet = new SoundFile(this, "172 DUET.mp3");
      oyasumi = new SoundFile(this, "MyTime.mp3");
      slam = new SoundFile(this, "paino.mp3");
      wherePlay = new SoundFile(this, "44 Where We Used To Play.mp3");
      title.loop(); 
    }
  }

  textSize(48);

  if (slide == -1) { //checks if it is in the instructions slide
    title.stop();
    instructions();
    if (keyPressed) { //checks if the period key is pressed to go to the next slide
      if (key == '.') {
        slide = 1;
      }
    }
  }
  //first scene
  if (slide == 1) { //runs code when the slide is equal to 1
    timer++; //increments timer
    minuteTimer++;
    if(minuteTimer >= 0 && minuteTimer < 2){
      minuteTheme.loop(); 
    }
    
    minuteForest();

    //Amori Circle Position

    pushMatrix();
    translate(amoriX, amoriY);
    amori();
    popMatrix();

    if (timer >= 0 && timer <= 500) {
      amoriY += 0.3;
    }

    if (timer > 500 && timer <= 800) {
      amoriY = 110;
    }

    //Bage Circle Position

    pushMatrix();
    translate(bageX, bageY);
    bage();
    popMatrix();
    if (timer >= 0 && timer <= 530) {
      bageY += 0.3;
    }


    if (timer > 550 && timer <= 700) {
      bageX += 0.3;
    }


    if (timer > 700 && timer < 750) {
      bageY += 0.3;
    }

    //Cel Circle Position
    pushMatrix();
    translate(celX-1, celY-1);
    cel();
    popMatrix();

    if (timer >= 0 && timer <= 550) {
      celY += 0.3;
    }

    if (timer>550 && timer<650) {
      celX -= 0.3;
    }

    if (timer > 650 && timer < 900) {
      celY += 0.3;
    }

    //Arby Circle Position
    pushMatrix();
    translate(arbyX, arbyY);
    arby();
    popMatrix();

    if (timer >= 0 && timer <= 500) {
      arbyY -= 0.3;
    }

    //Here Circle Position
    pushMatrix();
    translate(hereX, hereY);
    here();
    popMatrix();

    if (timer >= 0 && timer <= 500) {
      hereY -= 0.3;
    }

    if (timer > 500 && timer < 600) {
      hereX += 0.3;
    }

    if (timer >= 600 && timer < 625) {
      hereY -= 0.3;
    }

    //Text

    if (timer >= 900 && timer < 1100) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("Cel: I am going to do a little trolling.");
      popMatrix();
    }

    if (timer == 1100) {
      counter = 0;
    }

    if (timer >= 1100 && timer < 1300) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("Arby: How???");
      popMatrix();
    }

    if (timer == 1300) {
      counter = 0;
    }

    if (timer >= 1300 && timer < 1500) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("Cel: We should play hide and seek!!");
      popMatrix();
    }

    if (timer == 1500) {
      counter = 0;
    }

    if (timer >= 1500 && timer < 1700) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("Here: Yes!!");
      popMatrix();
    }

    if (timer == 1700) {
      counter = 0;
    }

    if (timer >= 1700 && timer < 1900) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("Cel: Hmm, who should be the seeker?");
      popMatrix();
    }

    if (timer == 1900) {
      counter = 0;
    }

    if (timer >= 1900 && timer < 2100) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("Arby: Oh I know! Amori should!");
      popMatrix();
    }

    if (timer == 2100) {
      counter = 0;
    }

    if (timer >= 2100 && timer < 2300) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("Amori: ...");
      popMatrix();
    }

    if (timer == 2300) {
      counter = 0;
    }

    if (timer >= 2300 && timer < 2500) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("Arby: Please?");
      popMatrix();
    }

    if (timer == 2500) {
      counter = 0;
    }

    if (timer >= 2500 && timer < 2700) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("Amori: ...");
      popMatrix();
    }

    if (timer == 2700) {
      counter = 0;
    }

    if (timer >= 2700 && timer < 2900) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("Arby: Okay! You're the seeker Amori!!");
      popMatrix();
    }

    if (timer == 2900) {
      counter = 0;
    }

    if (timer >= 2900 && timer < 3100) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      textSize(35);
      typewriterText("Cel: Hey Amori, are you sure you want to seek?");
      popMatrix();
    }

    if (timer == 3100) {
      counter = 0;
    }

    if (timer >= 3100 && timer < 3300) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      textSize(48);
      typewriterText("Amori: ...");
      popMatrix();
    }

    if (timer == 3300) {
      counter = 0;
    }

    if (timer >= 3300 && timer < 3500) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("Cel: All right, start counting!");
      popMatrix();
    }

    //Amori Goes Behind Tree
    if (timer > 3500 && timer < 3700) {
      amoriY -= 0.3;
    }

    if (timer > 3700 && timer < 3775) {
      amoriX += 0.3;
    }

    //Counting Sequence

    if (timer == 3775) {
      counter = 0;
    }

    if (timer >= 3775 && timer < 3900) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("10");
      popMatrix();
    }

    if (timer == 3900) {
      counter = 0;
    }

    if (timer >= 3900 && timer < 4000) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("9");
      popMatrix();
    }

    if (timer == 4000) {
      counter = 0;
    }

    if (timer >= 4000 && timer < 4100) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("8");
      popMatrix();
    }

    if (timer == 4100) {
      counter = 0;
    }

    if (timer >= 4100 && timer < 4200) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("7");
      popMatrix();
    }

    if (timer == 3975) {
      counter = 0;
    }

    if (timer >= 4200 && timer < 4300) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("6");
      popMatrix();
    }

    if (timer == 4300) {
      counter = 0;
    }

    if (timer >= 4300 && timer < 4400) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("5");
      popMatrix();
    }

    if (timer == 4400) {
      counter = 0;
    }

    if (timer >= 4400 && timer < 4500) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("4");
      popMatrix();
    }

    if (timer == 4500) {
      counter = 0;
    }

    if (timer >= 4500 && timer < 4600) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("3");
      popMatrix();
    }

    if (timer == 4600) {
      counter = 0;
    }

    if (timer >= 4600 && timer < 4700) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("2");
      popMatrix();
    }

    if (timer == 4700) {
      counter = 0;
    }

    if (timer >= 4700 && timer < 4800) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("1");
      popMatrix();
    }

    //Arby Hiding Spot
    if (timer > 3775 && timer < 4100) {
      arbyX += 0.3;
    }

    if (timer > 4100 && timer < 4230) {
      arbyY -= 0.3;
    }

    if (timer > 4230 && timer < 4370) {
      arbyX += 0.3;
    }

    //Here Hiding Spot
    if (timer > 3775 && timer < 4250) {
      hereX += 0.3;
    }

    //Bage Hiding Spot
    if (timer > 3775 && timer < 4000) {
      bageX += 0.3;
    }

    if (timer >= 4000 && timer < 4100) {
      bageY -= 0.3;
    }  

    //Cel Hiding Spot
    if (timer > 3775 && timer < 4000) {
      celX += 0.3;
    }

    if (timer >= 4000 && timer < 4100) {
      celY -= 0.3;
    }  

    //Bage Kidnapping
    pushMatrix();
    translate(tordX, tordY);
    scale(tordScale);
    tord();
    popMatrix();
    if (timer >= 4100 && timer < 4260) {
      tordX -= 3;
    }

    if (timer >= 4260 && timer < 4500) {
      bageX += 1.5;
      tordX += 3;
    }
    //Amori Searching for other friends
    if (timer >= 4800 && timer < 4850) {
      amoriX -= 0.3;
    }

    if (timer >= 4850 && timer < 5000) {
      amoriY += 0.3;
    }

    if (timer >= 5000 && timer < 5200) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("Cel: Shhh, I did a little trolling.");
      popMatrix();
    }

    if (timer >= 5200 && timer < 5300) {
      amoriY += 0.3;
    }
    if (timer >= 5300 && timer < 5650) {
      amoriX += 0.3;
    }

    if (timer == 5650) {
      counter = 0;
    }

    if (timer >= 5650 && timer < 5850) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      typewriterText("Arby: NOO, you found me...");
      popMatrix();
    }

    if (timer >= 5850 && timer < 5900) {
      amoriX -= 0.3;
    }

    if (timer >= 5900 && timer < 6050) {
      amoriY += 0.3;
    }

    if (timer >= 6050 && timer < 6200) {
      amoriX += 0.3;
    }

    if (timer == 6200) {
      counter = 0;
    }

    if (timer >= 6200 && timer < 6400) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      textSize(40);
      typewriterText("Here: You found me! Where's Bage?");
      popMatrix();
    }

    if (timer == 6400) {
      counter = 0;
    }

    if (timer >= 6400 && timer < 6600) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      textSize(40);
      typewriterText("Arby: I saw him near that giant stump.");
      popMatrix();
    }

    if (timer == 6600) {
      counter = 0;
    }

    if (timer >= 6600 && timer < 6800) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      textSize(40);
      typewriterText("Arby: Let's go examine it.");
      popMatrix();
    }

    //Characters going to stump

    if (timer >= 6800 && timer < 6900) {
      amoriX -= 0.3;
    }

    if (timer >= 6800 && timer < 6900) {
      hereX -= 0.3;
    }

    if (timer >= 6800 && timer < 6900) {
      arbyX -= 0.3;
    }

    if (timer >= 6900 && timer < 6950) {
      arbyY += 0.3;
    }

    if (timer >= 6800 && timer < 6900) {
      celX += 0.3;
    }

    if (timer >= 6900 && timer < 7100) {
      celY += 0.3;
    }

    if (timer >= 7100 && timer < 7200) {
      celX += 0.3;
    }

    if (timer == 7200) {
      counter = 0;
    }

    if (timer >= 7200 && timer < 7400) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      textSize(40);
      typewriterText("Cel: OH!! THERE IS A GIANT HOLE.");
      popMatrix();
    }

    if (timer == 7400) {
      counter = 0;
    }

    if (timer >= 7400 && timer < 7600) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      textSize(40);
      typewriterText("Cel: LET’S GO IN.");
      popMatrix();
    }

    //Going into hole

    if (timer >= 7600 && timer < 7700) {
      hereY -= 0.3;
    }

    if (timer >= 7700 && timer < 7703) {
      hereX = 840;
    }

    if (timer == 7700) {
      counter = 0;
    }

    if (timer >= 7700 && timer < 8800) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      translate(400, 400);
      textSize(40);
      typewriterText("AAAAAAAAAAAAAAAAAAAAA!!");
      popMatrix();
    }

    if (timer >= 7700 && timer < 7800) {
      amoriX += 0.3;
    }

    if (timer >= 7800 && timer < 7900) {
      amoriY -= 0.3;
    }

    if (timer >= 7900 && timer < 7903) {
      amoriX = 840;
    }

    if (timer >= 8000 && timer < 8100) {
      celY += 0.3;
    }

    if (timer >= 8100 && timer < 8300) {
      celX += 0.3;
    }

    if (timer >= 8300 && timer < 8400) {
      celY -= 0.3;
    }

    if (timer >= 8400 && timer < 8403) {
      celX = 840;
    }

    if (timer >= 8400 && timer < 8550) {
      arbyY += 0.3;
    }

    if (timer >= 8550 && timer < 8650) {
      arbyX += 0.3;
    }

    if (timer >= 8650 && timer < 8750) {
      arbyY -= 0.3;
    }

    if (timer >= 8750 && timer < 8753) {
      arbyX = 840;
    }

    if (keyPressed) {
      if (timer >= 8753 && key == '.') {
        counter = 0;
        slide = 2;
      }
    }

    if (timer >= 0 && timer <= 1000000) { //draws trees on top
      tree();

      pushMatrix();
      translate(50, 60);
      tree();
      popMatrix();

      pushMatrix();
      translate(167, 62);
      tree();
      popMatrix();

      pushMatrix();
      translate(210, 103);
      tree();
      popMatrix();

      pushMatrix();
      translate(245, 17);
      tree();
      popMatrix();

      pushMatrix();
      translate(-56, 120);
      tree();
      popMatrix();

      pushMatrix();
      translate(-120, -30);
      tree();
      popMatrix();

      pushMatrix();
      translate(-340, -120);
      tree();
      popMatrix();

      pushMatrix();
      translate(-145, -180);
      tree();
      popMatrix();

      pushMatrix();
      translate(-230, -195);
      tree();
      popMatrix();

      pushMatrix();
      translate(-123, -158);
      tree();
      popMatrix();

      pushMatrix();
      translate(-243, -180);
      tree();
      popMatrix();

      pushMatrix();
      translate(50, -180);
      tree();
      popMatrix();

      pushMatrix();
      translate(120, -156);
      tree();
      popMatrix();

      pushMatrix();
      translate(180, -213);
      tree();
      popMatrix();

      pushMatrix();
      translate(200, -143);
      tree();
      popMatrix();
    }
  }

  if (slide == 2) { //runs code when the slide is equal to 2
    minuteTheme.stop();
    greyTimer++;
    if(greyTimer >= 0 && greyTimer < 2){
      greySpaceTheme.loop(); 
    }
    timerGreySpace++; //increments timer in greyspace
    greySpace();
    pushMatrix();
    translate(amoriX, amoriY);
    amori();
    popMatrix();

    if (timerGreySpace == 0) { //when the timer is 0, text counter is reset
      counter = 0;
    }
    //Text
    if (timerGreySpace > 5 && timerGreySpace < 200) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Amori: Where am I?");
      popMatrix();
    }

    if (timerGreySpace == 200) {
      counter = 0;
    }

    if (timerGreySpace >= 200 && timerGreySpace < 400) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(36);
      typewriterText("Amori: There's a door! I'll run into it and open it.");
      popMatrix();
    }

    if (timerGreySpace == 400) {
      counter = 0;
    }

    //Amori on screen
    if (timerGreySpace >= 0 && timerGreySpace < 403) {
      amoriX = 200;
      amoriY = 125;
    }

    //Amori Looks Around
    if (timerGreySpace >= 410 && timerGreySpace < 600) {
      amoriX += 0.3;
    }

    if (timerGreySpace >= 600 && timerGreySpace < 650) {
      amoriY += 0.3;
    }

    if (timerGreySpace >= 650 && timerGreySpace < 1025) {
      amoriX -= 0.3;
    }

    //Door Headbutt  
    if (timerGreySpace >= 1025 && timerGreySpace < 1075) {
      amoriY += 0.1;
    }

    if (timerGreySpace >= 1075 && timerGreySpace < 1150) {
      amoriY -= 1.3;
    }

    if (timerGreySpace >= 1150) {
      amoriX = 840;
      slide = 3; //goes to the next screen when the timer reaches 1150
    }
  }

  if (slide == 3) { //runs next background when slide is equal to 3
    greySpaceTheme.stop();
    borbTimer++;
    if(borbTimer >= 0 && borbTimer < 2){
      borbTheme.loop(); 
    }
    borbRoom(); 
    pushMatrix();
    translate(amoriX, amoriY);
    amori();
    popMatrix();
    timerBorbRoom++;

    pushMatrix();
    translate(lambX, lambY);
    lamb();
    popMatrix();

    //Text
    if (timerBorbRoom >= 0 && timerBorbRoom < 200) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Amori: Oh! Arby's Lamb Doll!");
      popMatrix();
    }

    if (timerBorbRoom == 200) {
      counter = 0;
    }

    if (timerBorbRoom >= 200 && timerBorbRoom < 400) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Amori: Let me throw it at that bird!!");
      popMatrix();
    }

    if (timerBorbRoom == 400) {
      counter = 0;
    }

    if (timerBorbRoom >= 0 && timerBorbRoom < 2  ) { //sets the position of all objects
      amoriX = 100;
      amoriY = 250; 
      lambX = 640;
      lambY = 180;
    }
    //Movement
    if (timerBorbRoom >= 0 && timerBorbRoom < 30) {
      amoriY -= 1.2;
    }

    if (timerBorbRoom >= 430 && timerBorbRoom < 1200) {
      amoriX += 0.3;
    }

    if (timerBorbRoom >= 1200 && timerBorbRoom < 1425) {
      amoriY -= 0.3;
    }

    if (timerBorbRoom >= 1425 && timerBorbRoom <  1725) {
      lambX -= 0.77;
      lambY -= 0.3;
    }
    if (timerBorbRoom >= 1725) {
      lambX = 10000;
    }
    //Text
    if (timerBorbRoom >= 1725 && timerBorbRoom < 1925) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Amori: Oh no, the doll was eaten!");
      popMatrix();
    }

    if (timerBorbRoom == 1925) {
      counter = 0;
    }

    if (timerBorbRoom >= 1925 && timerBorbRoom < 2025) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Amori: Huh!?");
      popMatrix();
    }

    if (timerBorbRoom == 2025) {
      counter = 0;
    }

    if (timerBorbRoom >= 2025 && timerBorbRoom < 2275) {
      amoriX -= 0.55;
      amoriY -= 0.35;
    }

    if (timerBorbRoom >= 2275) {
      amoriX = 10000;
    }

    if (keyPressed) { //checks if the period key is pressed, goes to the next slide
      if (timerBorbRoom >= 2275 && key == '.') {
        slide = 4;
      }
    }
  }

  if (slide == 4) { //runs if slide is equal to 4

    timerMinuteTordBoss++; //increments timer in the scene

    borbTheme.stop();
    
    minuteTordTimer++; 
    
    if(minuteTordTimer >= 0 && minuteTordTimer < 2){
      minuteTheme.loop(); 
    }
    
    minuteForest();

    pushMatrix();
    translate(amoriX, amoriY);
    amori();
    popMatrix();

    tordDeerScale = 0.5;

    pushMatrix();
    translate(tordDeerX, tordDeerY);
    scale(tordDeerScale);
    tordDeer();
    popMatrix();

    //Amori Fall

    if (timerMinuteTordBoss >= 0 && timerMinuteTordBoss <= 3) {
      amoriX = 200;
      amoriY = -80;
      tordDeerX = 550;
      tordDeerY = 100;
    }

    if (timerMinuteTordBoss >= 0 && timerMinuteTordBoss < 50) {
      amoriY += 2;
    }

    //Amori thinking

    if (timerMinuteTordBoss == 0) {
      counter = 0;
    }

    if (timerMinuteTordBoss >= 50 && timerMinuteTordBoss < 250) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Amori: Where did everyone go?");
      popMatrix();
    }

    if (timerMinuteTordBoss == 250) {
      counter = 0;
    }

    if (timerMinuteTordBoss >= 250 && timerMinuteTordBoss < 450) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Amori: Oh, that stump.");
      popMatrix();
    }

    if (timerMinuteTordBoss == 450) {
      counter = 0;
    }

    if (timerMinuteTordBoss >= 450 && timerMinuteTordBoss < 650) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(38);
      typewriterText("Amori: Anyways I'm going to explore the forest.");
      popMatrix();
    }

    if (timerMinuteTordBoss == 650) {
      textSize(48);
      counter = 0;
    }

    //Amori Movement

    if (timerMinuteTordBoss >= 650 && timerMinuteTordBoss < 750) {
      amoriX += 0.3;
    }

    if (timerMinuteTordBoss >= 750 && timerMinuteTordBoss < 1100) {
      amoriY += 0.3;
    }

    if (timerMinuteTordBoss >= 1100 && timerMinuteTordBoss < 1300) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(38);
      typewriterText("Amori: Nice stump, I wonder why it's rainbow.");
      popMatrix();
    }

    if (timerMinuteTordBoss == 1300) {
      counter = 0;
    }

    if (timerMinuteTordBoss >= 1300 && timerMinuteTordBoss < 1400) {
      amoriY -= 0.3;
    }


    if (timerMinuteTordBoss >= 1400 && timerMinuteTordBoss < 1500) {
      tordDeerX -= 0.5;
    }

    if (timerMinuteTordBoss >= 1500 && timerMinuteTordBoss < 1700) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Amori: Huh???");
      popMatrix();
    }

    if (timerMinuteTordBoss == 1700) {
      counter = 0;
    }

    if (timerMinuteTordBoss >= 1700 && timerMinuteTordBoss < 1900) {
      tordDeerX -= 0.5;
    }

    if (timerMinuteTordBoss >= 1900 && timerMinuteTordBoss < 2100) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Amori: Stop getting closer!");
      popMatrix();
    }

    if (timerMinuteTordBoss == 2100) {
      counter = 0;
    }

    if (timerMinuteTordBoss >= 2100 && timerMinuteTordBoss < 2300) {
      tordDeerX += 0.1;
    }

    if (timerMinuteTordBoss >= 2300 && timerMinuteTordBoss < 2500) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Amori: YAY!!");
      popMatrix();
    }

    if (timerMinuteTordBoss == 2500) {
      counter = 0;
    }

    if (timerMinuteTordBoss >= 2500 && timerMinuteTordBoss < 2535) {
      tordDeerX -= 2;
    }

    if (timerMinuteTordBoss >= 2535 && timerMinuteTordBoss < 2600) {
      black();
    }

    if (timerMinuteTordBoss == 2600) {
      slide = 5;
    }

    if (timerMinuteTordBoss >= 0 && timerMinuteTordBoss < 2535) { //draws trees on top

      tree();

      pushMatrix();
      translate(50, 60);
      tree();
      popMatrix();

      pushMatrix();
      translate(167, 62);
      tree();
      popMatrix();

      pushMatrix();
      translate(210, 103);
      tree();
      popMatrix();

      pushMatrix();
      translate(245, 17);
      tree();
      popMatrix();

      pushMatrix();
      translate(-56, 120);
      tree();
      popMatrix();

      pushMatrix();
      translate(-120, -30);
      tree();
      popMatrix();

      pushMatrix();
      translate(-340, -120);
      tree();
      popMatrix();

      pushMatrix();
      translate(-145, -180);
      tree();
      popMatrix();

      pushMatrix();
      translate(-230, -195);
      tree();
      popMatrix();

      pushMatrix();
      translate(-123, -158);
      tree();
      popMatrix();

      pushMatrix();
      translate(-243, -180);
      tree();
      popMatrix();

      pushMatrix();
      translate(50, -180);
      tree();
      popMatrix();

      pushMatrix();
      translate(120, -156);
      tree();
      popMatrix();

      pushMatrix();
      translate(180, -213);
      tree();
      popMatrix();

      pushMatrix();
      translate(200, -143);
      tree();
      popMatrix();
    }
  }

  if (slide == 5) { //runs boss scene if the slide is 5
    minuteTheme.stop();
    gladeTimer++;
    if(gladeTimer >= 0 && gladeTimer < 2){
      glade.loop();
    }
    tordBoss();
  }

  if (slide == 6) { //runs if boss is beaten and when slide is 6
    cloudyRoom(); 
    glade.stop();
    wherePlayTimer++;
    if(wherePlayTimer >= 0 && wherePlayTimer < 2){
      wherePlay.loop();
    }

    timerCloudyRoom++; //increments timer for scene

    cloudy();

    if (timerCloudyRoom >= 0 && timerCloudyRoom < 3) {
      cloudyX = 650;
      cloudyY = 220;
      cloudyScale = 0.5;
    }

    if (timerCloudyRoom >= 50 && timerCloudyRoom < 500) {
      cloudyX -= 0.3;
    }
    //Text
    if (timerCloudyRoom >= 500 && timerCloudyRoom < 700) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      typewriterText(name + ": Oh! That was a dream.");
      popMatrix();
    }

    if (timerCloudyRoom == 700) {
      counter = 0;
    }
    //Movement
    if (timerCloudyRoom >= 700 && timerCloudyRoom < 1100) {
      cloudyY += 0.3;
    }

    if (timerCloudyRoom >=1100 && timerCloudyRoom < 1400) {
      cloudyX -= 0.3;
    }
    //Text
    if (timerCloudyRoom >= 1400 && timerCloudyRoom < 1600) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      typewriterText(name + ": We're moving soon.");
      popMatrix();
    }

    if (timerCloudyRoom == 1600) {
      counter = 0;
    }

    if (timerCloudyRoom >= 1600 && timerCloudyRoom < 1800) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      typewriterText(name + ": We have so much stuff.");
      popMatrix();
    }

    if (timerCloudyRoom == 1800) {
      counter = 0;
    }
    //Movement
    if (timerCloudyRoom >= 1800 && timerCloudyRoom < 3000) {
      cloudyX -= 0.3;
    }

    if (timerCloudyRoom >= 3000 && timerCloudyRoom < 3700) {
      cloudyY += 0.3;
    }

    if (keyPressed) { //checks if period was pressed
      if (timerCloudyRoom >= 3600 && key == '.') {
        slide = 7; //goes to the next slide
      }
    }
  }

  if (slide == 7) { //runs stairs scene if the slide is 7
    stairs();
    cloudy();
    timerStairs++;
    //Movement
    if (timerStairs >= 0 && timerStairs < 3) {
      cloudyX = 375;
      cloudyY = 25;
    }

    if (timerStairs >= 0 && timerStairs < 1100) {
      cloudyY += 0.4;
    }

    if (timerStairs == 1100) {
      stairs();
      cloudyY = 25;
    }

    if (timerStairs >= 1100 && timerStairs < 2200) {
      cloudyY += 0.4;
    }

    if (timerStairs == 2200) {
      stairs();
      cloudyY = 25;
    }

    if (timerStairs >= 2200 && timerStairs < 2900) {
      cloudyY += 0.4;
    }
    //Jumpscare
    if (timerStairs >= 2900 && timerStairs < 3100) {
      wherePlay.stop();
      slamTimer++;
      if(slamTimer >= 0 && slamTimer < 2){
        slam.loop();  
      }
      background(7, 18, 67);
      pushMatrix();
      translate(400, 350);
      tord();
      popMatrix();
    }

    if (timerStairs == 3000) {
      counter = 0;
    }
    //Text
    if (timerStairs >= 3100 && timerStairs < 3300) {
      slam.stop();
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      typewriterText(name + ": AAAAAAAAAA!");
      popMatrix();
    }

    if (timerStairs == 3300) {
      counter = 0;
    }

    if (timerStairs >= 3100 && timerStairs < 3300) {
      cloudyY += 1.3;
    }

    if (keyPressed) { //checks if the period key is pressed
      if (timerStairs >= 3600 && key == '.') {
        slide = 8; //goes to the next slide
      }
    }
  }

  if (slide == 8) { //runs when the slide is 8
    strokeWeight(1);
    borbRoom();  
    timerBorbRoomArby++; //increments the timer for the scene
    
      borbArbyTimer++;
      if(borbArbyTimer >= 0 && borbArbyTimer < 2){
        borbTheme.loop();  
      }
    
    amori();
    arby();
    
    if (timerBorbRoomArby >= 0 && timerBorbRoomArby < 3) { //setup of characters
      amoriX = 400;
      amoriY = 350;
      amoriScale = 0.5;
      arbyX = 200;
      arbyY = 350;
      arbyScale = 0.5;
    }
    //Movement
    if (timerBorbRoomArby >= 200 && timerBorbRoomArby < 400) {
      arbyX += 0.7;
    }
    //Text
    if (timerBorbRoomArby >= 0 && timerBorbRoomArby < 200) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      typewriterText("Amori: ?????");
      popMatrix();
    }

    if (timerBorbRoomArby == 200) {
      counter = 0;
    }

    if (timerBorbRoomArby >= 400 && timerBorbRoomArby < 600) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      typewriterText("Arby: Amori!! There you are!!");
      popMatrix();
    }

    if (timerBorbRoomArby == 600) {
      counter = 0;
    }

    if (timerBorbRoomArby >= 600 && timerBorbRoomArby < 800) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      typewriterText("Arby: Where are Here and Cel?");
      popMatrix();
    }

    if (timerBorbRoomArby == 800) {
      counter = 0;
    }

    if (timerBorbRoomArby >= 800 && timerBorbRoomArby < 1000) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      typewriterText("Amori: ...");
      popMatrix();
    }

    if (timerBorbRoomArby == 1000) {
      counter = 0;
    }

    if (timerBorbRoomArby >= 1000 && timerBorbRoomArby < 1200) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      typewriterText("Arby: Oh, you don’t know? ");
      popMatrix();
    }

    if (timerBorbRoomArby == 1200) {
      counter = 0;
    }

    if (timerBorbRoomArby >= 1200 && timerBorbRoomArby < 1400) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      typewriterText("Arby: Well let's go find them!");
      popMatrix();
    }

    if (timerBorbRoomArby == 1400) {
      counter = 0;
    }
    //Movement
    if (timerBorbRoomArby >= 1400 && timerBorbRoomArby < 2200) {
      arbyX += 0.6;
      amoriX += 0.6;
    }

    if (keyPressed) { //checks if period is pressed
      if (timerBorbRoomArby >= 2200 && key == '.') {
        slide = 9; //goes to the next slide
      }
    }
  }

  if (slide == 9) { //checks if slide is 9
    minuteForest();

    //Draws trees
    tree();

    pushMatrix();
    translate(50, 60);
    tree();
    popMatrix();

    pushMatrix();
    translate(167, 62);
    tree();
    popMatrix();

    pushMatrix();
    translate(210, 103);
    tree();
    popMatrix();

    pushMatrix();
    translate(245, 17);
    tree();
    popMatrix();

    pushMatrix();
    translate(-56, 120);
    tree();
    popMatrix();

    pushMatrix();
    translate(-120, -30);
    tree();
    popMatrix();

    pushMatrix();
    translate(-340, -120);
    tree();
    popMatrix();

    pushMatrix();
    translate(-145, -180);
    tree();
    popMatrix();

    pushMatrix();
    translate(-230, -195);
    tree();
    popMatrix();

    pushMatrix();
    translate(-123, -158);
    tree();
    popMatrix();

    pushMatrix();
    translate(-243, -180);
    tree();
    popMatrix();

    pushMatrix();
    translate(50, -180);
    tree();
    popMatrix();

    pushMatrix();
    translate(120, -156);
    tree();
    popMatrix();

    pushMatrix();
    translate(180, -213);
    tree();
    popMatrix();

    pushMatrix();
    translate(200, -143);
    tree();
    popMatrix();

    amori();
    arby();
    bage();
    
    minuteBageTimer++;
    borbTheme.stop();
      if(minuteBageTimer >= 0 && minuteBageTimer < 2){
        minuteTheme.loop();  
      }

    timerMinuteBageBoss++; //increments the timer for the scene


    if (timerMinuteBageBoss >= 0 && timerMinuteBageBoss < 3) { //setup of the characters
      amoriX = -40;
      amoriY = 250;
      amoriScale = 0.5;
      arbyX = -100;
      arbyY = 250;
      arbyScale = 0.5;
      bageX = 625;
      bageY = 250;
      bageScale = 0.5;
    }
    //Movement
    if (timerMinuteBageBoss >= 0 && timerMinuteBageBoss < 500) {
      amoriX += 0.6;
      arbyX += 0.6;
    }

    if (timerMinuteBageBoss >= 500 && timerMinuteBageBoss < 600) {
      amoriY -= 0.6;
      arbyX += 0.6;
    }

    if (timerMinuteBageBoss >= 600 && timerMinuteBageBoss < 700) {
      amoriY -= 0.6;
      arbyY -= 0.6;
    }

    if (timerMinuteBageBoss >= 700 && timerMinuteBageBoss < 1300) {
      amoriX += 0.6;
    }

    if (timerMinuteBageBoss >= 700 && timerMinuteBageBoss < 800) {
      arbyY -= 0.6;
    }

    if (timerMinuteBageBoss >= 800 && timerMinuteBageBoss < 1300) {
      arbyX += 0.6;
    }

    if (timerMinuteBageBoss == 1300) {
      counter = 0;
    }
    //Text
    if (timerMinuteBageBoss >= 1300 && timerMinuteBageBoss < 1500) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      typewriterText("Arby: BAGE STOPPPP!!");
      popMatrix();
    }

    if (timerMinuteBageBoss == 1500) {
      counter = 0;
    }

    if (timerMinuteBageBoss >= 1500 && timerMinuteBageBoss < 1700) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      typewriterText("Bage: NEVER I AM TORD.");
      popMatrix();
    }

    if (timerMinuteBageBoss == 1700) {
      counter = 0;
    }

    if (timerMinuteBageBoss >= 1700 && timerMinuteBageBoss < 1900) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      textSize(44);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      typewriterText("Bage: REFER TO ME CORRECTLY.");
      popMatrix();
    }

    if (timerMinuteBageBoss == 1900) {
      counter = 0;
    }

    if (timerMinuteBageBoss >= 1900 && timerMinuteBageBoss < 2100) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      typewriterText("Arby: Amori we must become one.");
      popMatrix();
    }

    if (timerMinuteBageBoss == 2100) { //goes to the next slide if the timer reaches 2100
      counter = 0; 
      slide = 10;
    }
  }

  if (slide == 10) { //runs the boss scene if the slide is 10
    bageBoss();
    worldsEndTimer++;
    minuteTheme.stop();
      if(worldsEndTimer >= 0 && worldsEndTimer < 2){
        worldsEnd.loop();  
        loseTimer = 0;
      }
  }

  if (slide == 1000) { //checks if the character’s hp is below 0 and runs the retry slide
    loseTimer++;
    worldsEnd.stop();
      if(loseTimer >= 0 && loseTimer < 2){
        lose.loop();  
      }
    retry1();
  }

  if (slide == 2000) { //if the user presses exit on the retry scene, goes to the credits
    credits();
  }

  if (slide == 11) { //checks if the slide is 11
    minuteThreeTimer++;
    minuteForest();
    worldsEnd.stop();
      if(minuteThreeTimer >= 0 && minuteThreeTimer < 2){
        minuteTheme.loop();  
      }

    amori();
    bage();
    arby();
    hands();
    pushMatrix();
    translate(tordX, tordY);
    scale(tordScale);
    tord();
    popMatrix();

    //Draws trees
    tree();


    pushMatrix();
    translate(50, 60);
    tree();
    popMatrix();

    pushMatrix();
    translate(167, 62);
    tree();
    popMatrix();

    pushMatrix();
    translate(210, 103);
    tree();
    popMatrix();

    pushMatrix();
    translate(245, 17);
    tree();
    popMatrix();

    pushMatrix();
    translate(-56, 120);
    tree();
    popMatrix();

    pushMatrix();
    translate(-120, -30);
    tree();
    popMatrix();

    pushMatrix();
    translate(-340, -120);
    tree();
    popMatrix();

    pushMatrix();
    translate(-145, -180);
    tree();
    popMatrix();

    pushMatrix();
    translate(-230, -195);
    tree();
    popMatrix();

    pushMatrix();
    translate(-123, -158);
    tree();
    popMatrix();

    pushMatrix();
    translate(-243, -180);
    tree();
    popMatrix();

    pushMatrix();
    translate(50, -180);
    tree();
    popMatrix();

    pushMatrix();
    translate(120, -156);
    tree();
    popMatrix();

    pushMatrix();
    translate(180, -213);
    tree();
    popMatrix();

    pushMatrix();
    translate(200, -143);
    tree();
    popMatrix();

    timerMinuteBage++;
  
  
    if (timerMinuteBage >= 0 && timerMinuteBage < 3) { //Scales and positions
      amoriX = 619;
      amoriY = 130;
      amoriScale = 0.5;
      arbyX = 559;
      arbyY = 130;
      arbyScale = 0.5;
      bageX = 625;
      bageY = 250;
      bageScale = 0.5;
      handX = 625;
      handY = 600;
      handScale = 0.5;
    }

    if (timerMinuteBage >= 0 && timerMinuteBage < 150) { //hand goes up
      handY -= 2;
    }

    if (timerMinuteBage >= 200  && timerMinuteBage < 350) { //hand goes back
      handY += 0.6;
    }

    if (timerMinuteBage == 200) {//tord appears
      tordX = 625;
      tordY = 250;
      tordScale = 0.3;
    }

    if (timerMinuteBage >= 200 && timerMinuteBage < 350) {//tord goes back
      tordY += 0.6;
    }

    if (timerMinuteBage >= 450 && timerMinuteBage < 575) { //hand and tord go back
      tordY += 2;
      handY += 2;
    }

    if (timerMinuteBage >= 575 && timerMinuteBage < 775) { //text
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      typewriterText("Bage: Oh nonononononono.");
      popMatrix();
    }

    if (timerMinuteBage == 775) {
      counter = 0;
    }

    if (timerMinuteBage >= 775 && timerMinuteBage < 975) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(38);
      typewriterText("Bage: I'm so sorry, I was possessed by Tord.");
      popMatrix();
    }

    if (timerMinuteBage == 975) {
      counter = 0;
    }

    if (timerMinuteBage >= 975 && timerMinuteBage < 1175) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Arby: Don’t worry! It's okay!");
      popMatrix();
    }

    if (timerMinuteBage == 1175) {
      counter = 0;
    }

    if (timerMinuteBage >= 1175 && timerMinuteBage < 1375) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      typewriterText("Arby: Now let’s find Cel and Here!");
      popMatrix();
    }

    if (timerMinuteBage == 1375) {
      counter = 0;
    }

    //movement

    if (timerMinuteBage >= 1375 && timerMinuteBage < 1850) {
      amoriX += 0.6;
      arbyX += 0.6;
    }

    if (timerMinuteBage >= 1850 && timerMinuteBage < 1950) {
      bageY -= 1;
    }

    if (timerMinuteBage >= 1950 && timerMinuteBage < 2100) {
      bageX += 1.5;
    }

    if (keyPressed) { //makes slide 12
      if (timerMinuteBage >= 2100 && key == '.') {
        slide = 12;
      }
    }
  }

  if (slide == 12) {//checks is slide is 12
    spaceWorld();

    sugarStarTimer++;

    minuteTheme.stop();
      if(sugarStarTimer >= 0 && sugarStarTimer < 2){
        sugarStar.loop();  
      }

    amori();
    arby();
    bage();
    worldwide();

    timerSpaceBoss++;

    if (timerSpaceBoss >= 0 && timerSpaceBoss < 3) {//sets positions and scales
      amoriX = 440;
      amoriY = 520;
      amoriScale = 0.5;
      arbyX = 439;
      arbyY = 580;
      arbyScale = 0.5;
      bageX = 440;
      bageY = 640;
      bageScale = 0.5;
      worldwideX = 345;
      worldwideY = 200;
      worldwideScale = 0.5;
    }

    //movement

    if (timerSpaceBoss >= 0 && timerSpaceBoss < 400) {
      amoriY -= 0.6;
      arbyY -= 0.6;
      bageY -= 0.6;
    }

    if (timerSpaceBoss >= 400 && timerSpaceBoss < 550) {
      amoriX -= 0.6;
    }

    if (timerSpaceBoss >= 400 && timerSpaceBoss < 500) {
      arbyY -= 0.6;
      bageY -= 0.6;
    }

    if (timerSpaceBoss >= 500 && timerSpaceBoss < 600) {
      amoriY -= 0.6;
      arbyX -= 0.6;
      bageY -= 0.6;
    }

    if (timerSpaceBoss >= 600 && timerSpaceBoss < 650) {
      arbyX -= 0.6;
      bageX -= 0.6;
    }

    //text

    if (timerSpaceBoss >= 650 && timerSpaceBoss < 850) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      typewriterText("Mr. Worldwide: Greetings peasants.");
      popMatrix();
    }

    if (timerSpaceBoss == 850) {
      counter = 0;
    }

    if (timerSpaceBoss >= 850 && timerSpaceBoss < 1050) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(46);
      typewriterText("Arby: Hello! Can we please go through?");
      popMatrix();
    }

    if (timerSpaceBoss == 1050) {
      counter = 0;
    }

    if (timerSpaceBoss >= 1050 && timerSpaceBoss < 1250) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(44);
      typewriterText("Mr. Worldwide: Excuse me? Go through?");
      popMatrix();
    }

    if (timerSpaceBoss == 1250) {
      counter = 0;
    }

    if (timerSpaceBoss >= 1250 && timerSpaceBoss < 1450) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Arby: Yes!");
      popMatrix();
    }

    if (timerSpaceBoss == 1450) {
      counter = 0;
    }

    if (timerSpaceBoss >= 1450 && timerSpaceBoss < 1650) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Mr. Worldwide: To get through...");
      popMatrix();
    }

    if (timerSpaceBoss == 1650) {
      counter = 0;
    }

    if (timerSpaceBoss >= 1650 && timerSpaceBoss < 1850) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Mr. Worldwide: You must fight me!");
      popMatrix();
    }

    if (timerSpaceBoss == 1850) {
      counter = 0;
    }

    if (timerSpaceBoss >= 1850 && timerSpaceBoss < 2100) { //Blackens the screen
      black();
    }

    if (timerSpaceBoss >= 2100) { //Makes slide 13
      slide = 13;
    }
  }

  if (slide == 13) {//checks if slide is 13 and then starts a boss
    troubleTimer++;
    sugarStar.stop();
      if(troubleTimer >= 0 && troubleTimer < 2){
        trouble.loop();  
        loseTimer = 0;
        sugarStarTimer = 0;
      }
    worldwideBoss();
  }

  if (slide == 1001) { //Sets slide to the retry screen
    loseTimer++;
    trouble.stop();
      if(loseTimer >= 0 && loseTimer < 2){
        lose.loop();  
      }
    retry2();
  }

  if (slide == 14) { //checks if slide is 14
    spaceWorld();
    
    sugarStarTimer++;
    
    trouble.stop();
      if(sugarStarTimer >= 0 && sugarStarTimer < 2){
        sugarStar.loop();  
      }

    amori();
    arby();
    bage();

    timerSpace++;

    if (timerSpace >= 0 && timerSpace < 3) { //sets positions and scales
      amoriX = 345;
      amoriY = 200;
      amoriScale = 0.5;
      arbyX = 345;
      arbyY = 260;
      arbyScale = 0.5;
      bageX = 405;
      bageY = 260;
      bageScale = 0.5;
    }

    //movement

    if (timerSpace >= 0 && timerSpace < 100) {
      amoriY -= 0.6;
    }

    if (timerSpace == 100) {
      amoriX = 1000;
    }
    if (timerSpace >= 0 && timerSpace < 225) {
      arbyY -= 0.6;
    }

    if (timerSpace == 225) {
      arbyX = 1000;
    }

    if (timerSpace >= 0 && timerSpace < 100) {
      bageX -= 0.6;
    }

    if (timerSpace >= 100 && timerSpace < 300) {
      bageY -= 0.6;
    }

    if (timerSpace == 300) {
      bageX = 1000;
    }

    if (keyPressed) { //makes slide 15
      if (timerSpace >= 300 && key == '.') {
        slide = 15;
      }
    }
  }

  if (slide == 15) { //Checks if slide is 15
    stardustTimer++;
    sugarStar.stop();
    if(stardustTimer >= 0 && stardustTimer < 2){
      stardust.loop();  
    }
    trash();
    pushMatrix();
    amori();
    popMatrix();
    arby();
    bage();
    here();
    cel();

    timerTrash++;

    if (timerTrash >= 0 && timerTrash < 3) { //sets positions and scales
      amoriX = 400;
      amoriY = 530;
      amoriScale = 0.5;
      arbyX = 400;
      arbyY = 590;
      arbyScale = 0.5;
      bageX = 400;
      bageY = 650;
      bageScale = 0.5;
      celX = 430;
      celY = 230;
      celScale = 0.5;
      hereX = 500;
      hereY = 200;
      hereScale = 0.5;
    }

    //movement

    if (timerTrash >= 0 && timerTrash < 300) {
      amoriY -= 0.6;
    }

    if (timerTrash >= 300 && timerTrash < 350) {
      amoriX += 0.6;
    }

    if (timerTrash >= 350 && timerTrash < 450) {
      amoriY -= 0.6;
    }

    if (timerTrash >= 0 && timerTrash < 400) {
      arbyY -= 0.6;
    }

    if (timerTrash >= 400 && timerTrash < 450) {
      arbyX += 0.6;
    }

    if (timerTrash >= 0 && timerTrash < 400) {
      bageY -= 0.6;
    }

    if (timerTrash >= 400 && timerTrash < 450) {
      bageX += 0.6;
    }

    if (timerTrash >= 450 && timerTrash < 650) { //text
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(44);
      typewriterText("Cel: LETS GO! You guys are finally here!");
      popMatrix();
    }

    if (timerTrash == 650) {
      counter = 0;
    }

    if (timerTrash >= 650 && timerTrash < 690) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(44);
      typewriterText("Cel: Let's go back to the Borb Room.");
      popMatrix();
    }

    if (timerTrash == 1000) {
      counter = 0;
    }


    if (timerTrash >= 650 && timerTrash < 680) { //screen is barely black
      rectMode(CORNER);
      fill(0, 0, 0, 10);
      stroke(0, 0, 0, 10);
      rect(0, 0, 800, 500);
    }

    if (timerTrash >= 680 && timerTrash < 710) { //screen is almost black
      fill(0, 0, 0, 80);
      stroke(0, 0, 0, 80);
      rect(0, 0, 3000, 1000);
    }

    if (timerTrash == 700) {
      counter = 0;
    }

    if (timerTrash >= 710 && timerTrash < 1000) { //screen is black
      fill(0, 0, 0);
      stroke(0, 0, 0);
      rect(0, 0, 3000, 1000);
    }



    if (timerTrash >= 730 && timerTrash < 930) { //Text
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(44);
      typewriterText("You passed out.");
      popMatrix();
    }

    if (timerTrash == 930) {
      counter = 0;
      slide = 16;
      greyTimer = 0;
    }
  }

  if (slide == 16) { //checks if slide is 16
    greyTimer++;
    stardust.stop();
      if(greyTimer >= 0 && greyTimer < 2){
        greySpaceTheme.loop();  
      }
    greySpace();
    amori();
    cloudy();

    timerAmoriBoss++;

    if (timerAmoriBoss >= 0 && timerAmoriBoss < 3) { //Sets positions and scales
      amoriX = 500;
      amoriY = 250;
      amoriScale = 0.5;
      cloudyX = 300;
      cloudyY = 250;
      cloudyScale = 0.5;
    }

    if (timerAmoriBoss >= 0 && timerAmoriBoss < 200) { //Text
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(44);
      typewriterText(name + ": Where am I?");
      popMatrix();
    }

    if (timerAmoriBoss == 200) {
      counter = 0;
    }

    if (timerAmoriBoss >= 200 && timerAmoriBoss < 400) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(44);
      typewriterText("Amori: Grey Space.");
      popMatrix();
    }

    if (timerAmoriBoss == 400) {
      counter = 0;
    }

    if (timerAmoriBoss >= 400 && timerAmoriBoss < 600) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(44);
      typewriterText(name +": Why am I here??");
      popMatrix();
    }

    if (timerAmoriBoss == 600) {
      counter = 0;
    }

    if (timerAmoriBoss >= 600 && timerAmoriBoss < 800) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(44);
      typewriterText("Amori: Because...");
      popMatrix();
    }

    if (timerAmoriBoss == 800) {
      counter = 0;
    }

    if (timerAmoriBoss >= 800 && timerAmoriBoss < 1000) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(44);
      typewriterText("Amori: You've caused so much suffering...");
      popMatrix();
    }

    if (timerAmoriBoss == 1000) {
      counter = 0;
    }

    if (timerAmoriBoss >= 1000 && timerAmoriBoss < 1200) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(40);
      typewriterText("Amori: Your friends will never forgive you.");
      popMatrix();
    }

    if (timerAmoriBoss == 1200) {
      counter = 0;
    }


    if (timerAmoriBoss >= 1200 && timerAmoriBoss < 1400) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(40);
      typewriterText("Amori: They'll abandon you like you did them...");
      popMatrix();
    }

    if (timerAmoriBoss == 1400) {
      counter = 0;
    }

    if (timerAmoriBoss >= 1400 && timerAmoriBoss < 1600) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Amori: and that's what you deserve.");
      popMatrix();
    }

    if (timerAmoriBoss == 1600) {
      counter = 0;
    }

    if (timerAmoriBoss >= 1600 && timerAmoriBoss < 1800) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Amori: You're nothing but a liar...");
      popMatrix();
    }

    if (timerAmoriBoss == 1800) {
      counter = 0;
    }

    if (timerAmoriBoss >= 1800 && timerAmoriBoss < 2000) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Amori: and when they see the truth...");
      popMatrix();
    }

    if (timerAmoriBoss == 2000) {
      counter = 0;
    }

    if (timerAmoriBoss >= 2000 && timerAmoriBoss < 2200) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(34);
      typewriterText("Amori: They'll hate you as much as you hate yourself.");
      popMatrix();
    }

    if (timerAmoriBoss == 2200) {
      counter = 0;
    }

    if (timerAmoriBoss >= 2200 && timerAmoriBoss < 2400) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(32);
      typewriterText("Amori: You loved them and you abandoned everything.");
      popMatrix();
    }

    if (timerAmoriBoss == 2400) {
      counter = 0;
    }

    if (timerAmoriBoss >= 2400 && timerAmoriBoss < 2600) {
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Amori: You should just disappear.");
      popMatrix();
    }

    if (timerAmoriBoss == 2600) {
      counter = 0;
    }

    if (timerAmoriBoss >= 2600 && timerAmoriBoss < 2800) { //covers the screen with a black rectangle
      black();
    }

    if (timerAmoriBoss == 2800) { //sets slide to 17
      slide = 17;
    }
  }

  if (slide == 17) { //checks if slide is 17
    amoriBoss();
    omoriTimer++;
    greySpaceTheme.stop();
    if(omoriTimer >= 0 && omoriTimer < 2){
      omori = new SoundFile(this, "168 OMORI.mp3");
      duet = new SoundFile(this, "172 DUET.mp3");
      oyasumi = new SoundFile(this, "MyTime.mp3");
      wherePlay = new SoundFile(this, "44 Where We Used To Play.mp3");
      omori.loop();  
      loseTimer = 0;
    }
  }

  if (slide == 18) { //checks slide is 18
    
    greySpace(); 
    cloudy();
    amori();
    timerGood++;

    if (timerGood >= 0 && timerGood < 3) { //sets positions
      amoriX = 500;
      amoriY = 250;
      amoriScale = 0.5;
      cloudyX = 300;
      cloudyY = 250;
      cloudyScale = 0.5;
    }

    if (timerGood >= 0 && timerGood < 200) { //amori disappears
      amoriY += 1.5;
    }

    if (timerGood == 200 && name.compareTo("Cloudy") == 0) { //goes to secret ending
      greySecretTimer++;
      omori.stop();
      if(greySecretTimer >= 0 && greySecretTimer < 2){
        wherePlay.loop();  
      }
      slide = 20;
    } 
    else if (timerGood == 200 && name.compareTo("Cloudy") != 0) { //goes to credits is name isnt cloudy
        greyGoodTimer++;
        omori.stop();
          if(greyGoodTimer >= 0 && greyGoodTimer < 2){
            duet.loop();  
          }
        slide = 2000;
    }
  }

  if (slide == 20) { //checks if screen is 20
    cloudyRoom(); 

    timerSecret++;

    cloudy();

    if (timerSecret >= 0 && timerSecret < 3) { //sets positions and scales
      cloudyX = 650;
      cloudyY = 220;
      cloudyScale = 0.5;
    }
    
    //movement
    
    if (timerSecret >= 50 && timerSecret < 500) {
      cloudyX -= 0.3;
    }

    if (timerSecret >= 500 && timerSecret < 900) {
      cloudyY += 0.3;
    }

    if (timerSecret >= 900 && timerSecret < 1200) {
      cloudyX -= 0.3;
    }

    if (timerSecret >= 1200 && timerSecret < 2400) {
      cloudyX -= 0.3;
    }

    if (timerSecret >= 2400 && timerSecret < 3100) {
      cloudyY += 0.3;
    }

    if (keyPressed) { //Changes screen to 21
      if (timerSecret >= 3100 && key == '.') {
        slide = 21;
      }
    }
  }

  if (slide == 21) {
    stairs();
    cloudy();
    timerSecretStairs++;

    if (timerSecretStairs >= 0 && timerSecretStairs < 3) { //Sets position
      cloudyX = 375;
      cloudyY = -25;
    }

    if (timerSecretStairs >= 0 && timerSecretStairs < 1375) {
      cloudyY += 0.4; //Goes down stairs
    }

    if (keyPressed) { //Switches screen to 22
      if (timerSecretStairs >= 1375 && key == '.') {
        slide = 22;
      }
    }
  }

  if (slide == 22) {//checks if slide is 22
    realWorld();
    cloudy();
    arby();
    cel();
    here();
    bage();

    tree(); //Draws trees

    pushMatrix();
    translate(50, 60);
    tree();
    popMatrix();

    pushMatrix();
    translate(167, 62);
    tree();
    popMatrix();

    pushMatrix();
    translate(210, 103);
    tree();
    popMatrix();

    pushMatrix();
    translate(245, 17);
    tree();
    popMatrix();

    pushMatrix();
    translate(-56, 120);
    tree();
    popMatrix();

    pushMatrix();
    translate(-120, -30);
    tree();
    popMatrix();

    pushMatrix();
    translate(-340, -120);
    tree();
    popMatrix();

    pushMatrix();
    translate(-145, -180);
    tree();
    popMatrix();

    pushMatrix();
    translate(-230, -195);
    tree();
    popMatrix();

    pushMatrix();
    translate(-123, -158);
    tree();
    popMatrix();

    pushMatrix();
    translate(-243, -180);
    tree();
    popMatrix();

    pushMatrix();
    translate(50, -180);
    tree();
    popMatrix();

    pushMatrix();
    translate(120, -156);
    tree();
    popMatrix();

    pushMatrix();
    translate(180, -213);
    tree();
    popMatrix();

    pushMatrix();
    translate(200, -143);
    tree();
    popMatrix();

    timerSecretWorld++;

    if (timerSecretWorld >= 0 && timerSecretWorld < 3) { //Sets positions and scales
      cloudyX = 50;
      cloudyY = -40;
      cloudyScale = 0.5;
      arbyX = 600;
      arbyY = 350;
      arbyScale = 0.5;
      bageX = 320;
      bageY = 100;
      bageScale = 0.5;
      celX = 230;
      celY = 230;
      celScale = 0.5;
      hereX = 280;
      hereY = 200;
      hereScale = 0.5;
    }

    if (timerSecretWorld >= 0 && timerSecretWorld < 500) { 
      cloudyY += 0.6; //Cloudy walks on screen
    }

    if (timerSecretWorld == 500) {
      counter = 0;
    }

    if (timerSecretWorld >= 500 && timerSecretWorld < 700) { //Text
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(36);
      typewriterText("Bage: Hey Cloudy! We haven’t seen you in a while!");
      popMatrix();
    }

    if (timerSecretWorld == 700) {
      counter = 0;
    }

    if (timerSecretWorld >= 700 && timerSecretWorld < 900) { //Text
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Cel: Yeah!! Where were you?");
      popMatrix();
    }

    if (timerSecretWorld == 900) {
      counter = 0;
    }

    if (timerSecretWorld >= 900 && timerSecretWorld < 1100) { //Text
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Cel: I couldn’t buy my Grape Joe.");
      popMatrix();
    }

    if (timerSecretWorld == 1100) {
      counter = 0;
    }

    if (timerSecretWorld >= 1100 && timerSecretWorld < 1300) { //Text
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(48);
      typewriterText("Here: We’ve all missed you!");
      popMatrix();
    }

    if (timerSecretWorld == 1300) {
      counter = 0;
    }

    if (timerSecretWorld >= 1300 && timerSecretWorld < 1400) { 
      arbyY += 1; //Arby falling in the lake
    }

    if (timerSecretWorld == 1375) { //Arby disappearing
      arbyX = 1000;
    }

    if (timerSecretWorld >= 1375 && timerSecretWorld < 1575) { //Text
      fill(0);
      stroke(255);
      strokeWeight(3);
      rectMode(CENTER);
      rect(400, 450, 600, 75);
      pushMatrix();
      textAlign(CENTER);
      translate(400, 625);
      fontNormal = createFont("fontNormal.ttf", 48);
      textFont(fontNormal);
      textSize(32);
      typewriterText("Cloudy tells his friends what happened and is forgiven.");
      popMatrix();
    }

    if (timerSecretWorld == 1575) { //Sets slide to credits
      counter = 0;
      slide = 2000;
    }
  }

  if (slide == 19) { //checks if slide is the bad ending
    greyBadTimer++;
      omori.stop();
        if(greyBadTimer >= 0 && greyBadTimer < 2){
          oyasumi.loop();  
        }
    greySpace(); 
    cloudy();
    amori();
    timerBad++;

    if (timerBad >= 0 && timerBad < 3) { //Sets all positions and scales
      amoriX = 500;
      amoriY = 250;
      amoriScale = 0.5;
      cloudyX = 300;
      cloudyY = 250;
      cloudyScale = 0.5;
    }
    
    
    
    if (timerBad >= 0 && timerBad < 200) {
      cloudyY += 1.5; //Cloudy Disappears
    }

    //Sets slide to the credits

    if (timerBad == 200) {
      slide = 2000;
    }
  }

  //Pause menu, checks if the key is pressed and then changes the slide

  if (keyPressed && key == 'p' && slide != 100) {
    paused = true;
    previousSlide = slide;
  }

  if (paused == true && !keyPressed) {
    slide = 100;
    pause();
  }
}

void black() { //Draws a black rect over the screen
  fill(0);
  rectMode(CENTER);
  rect(400, 250, 1000, 1000);
}

void lamb() {
  strokeWeight(1);
  pushMatrix();
  //Head
  fill(255);
  stroke(255);
  ellipse(0, 0, 30, 30);

  //Body
  ellipse(0, 35, 25, 50);

  //Arms
  ellipse(0, 25, 45, 20);

  //Legs
  ellipse(0, 55, 30, 15);

  //Ears
  ellipse(0, -5, 40, 10);
  popMatrix();

  //Face
  fill(222, 184, 145);
  ellipse(0, 0, 20, 20);

  //Eyes
  fill(0);
  ellipse(9, -4, 5, 5);
  ellipse(-9, -4, 5, 5);

  //Mouth
  stroke(160, 135, 110);
  strokeWeight(2);
  line(0, 0, 0, 3);
}

void typewriterText(String text1) { //Makes a typewriter effect for the text
  if (counter < text1.length())
    counter++;
  fill(255);
  text(text1.substring(0, counter), 0, 40, width, height);
}

void tordBoss() {
  background(7, 18, 67);
  pushMatrix();
  translate(200, 15);
  //Text Box
  stroke(255);
  noFill();
  rect(200, 0, 400, 50);
  popMatrix();

  fill(255);
  fontNormal = createFont("fontNormal.ttf", 24);
  textFont(fontNormal);
  textAlign(CENTER, CENTER);
  text("You encountered Something", 400, 15);

  //Enemy Health Box
  pushMatrix();
  translate(50, 15);
  noFill();
  rect(625, 0, 112, 40);
  popMatrix();
  text("Null" + "/" + "Null", 662, 15);

  fill(103, 78, 167);
  stroke(103, 78, 167);
  ellipseMode(CENTER);
  ellipse(700, 15, 11, 11); //Heart
  ellipse(710, 15, 11, 11); //Heart
  triangle(694, 16, 715, 16, 705, 27); //heart

  //Boss
  tordDeerX = 400;
  tordDeerY = 250;
  tordDeerScale = 1.5;
  tordDeer();

  //Character Box
  amoriX = 100;
  amoriY = 350;
  amoriScale = 1.5;
  amori();
  stroke(255);
  noFill();
  rect(100, 330, 125, 110);
  fill(255);
  rect(100, 406, 125, 40);
  fill(7, 18, 67);
  stroke(7, 18, 67);
  rect(100, 448, 125, 40);
  noFill();
  stroke(255);
  rect(100, 349, 135, 160);

  //Cloudy HP
  text(amoriHealth + "/" + 140, 83, 401);
  fill(204, 0, 0);
  stroke(204, 0, 0);
  ellipse(130, 404, 11, 11); //Heart
  ellipse(140, 404, 11, 11); //Heart
  triangle(124, 405, 145, 405, 135, 416); //heart

  //Buttons
  rectMode(CENTER);
  strokeWeight(4);
  textSize(24);

  if ((abs(mouseX - 250) <= 50) && (abs(mouseY - 400) <= 25) && timerBoss >= 120) {
    stroke(0);
    fill(255);
    rect(250, 400, 100, 50);
    fill(0);
    text("ATTACK", 250, 388);
    if (mousePressed && (mouseButton == LEFT)) {
      timerBoss = 0;
      attacked = true;
      healed = false;
      amoriDamage = int(random(50, 80));
      tordDamage = int(random(40, 60));
      timer = 0;
      tordHealth -= amoriDamage;
      amoriHealth -= tordDamage;
      timer++;
    }
  } else {
    stroke(255);
    fill(7, 18, 67);
    rect(250, 400, 100, 50);
    fill(255);
    text("ATTACK", 250, 388);
  }

  if ((abs(mouseX - 550) <= 50) && (abs(mouseY - 400) <= 25) && timerBoss >= 120) {
    stroke(0);
    fill(255);
    rect(550, 400, 100, 50);
    fill(0);
    text("HEAL", 550, 388);
    if (mousePressed && (mouseButton == LEFT)) {
      timerBoss = 0;
      healed = true;
      attacked = false;
      amoriHeal = int(random(20, 30));
      tordDamage = int(random(40, 60));
      timer = 0;
      amoriHealth += amoriHeal;
      amoriHealth -= tordDamage;
      if (amoriHealth + amoriHeal > 140) {
        amoriHealth = 140;
      }
      timer++;
    }
  } else {
    stroke(255);
    fill(7, 18, 67);
    rect(550, 400, 100, 50);
    fill(255);
    text("HEAL", 550, 388);
  }

  //attack and heal code
  if (timer >= 1 && healed == false && attacked == true) {
    fill(255);
    text("you did " + amoriDamage + " damage.", 400, 100);
    text("you took " + tordDamage + " damage.", 400, 125);
    timer = 1;
  }
  if (timer >= 1 && attacked == false && healed == true) {
    fill(255);
    text("you healed " + amoriHeal + " damage.", 400, 100);
    text("you took " + tordDamage + " damage.", 400, 125);
    timer = 1;
  }

  //checks if hp is below 0
  if (amoriHealth <= 0) {
    slide++;
    amoriHealth = 140;
    attacked = false;
    healed = false;
  }
  timerBoss++;
}

void bageBoss() {
  background(7, 18, 67);
  pushMatrix();
  translate(200, 15);
  //Text Box
  stroke(255);
  noFill();
  rect(200, 0, 400, 50);
  popMatrix();

  fill(255);
  fontNormal = createFont("fontNormal.ttf", 24);
  textFont(fontNormal);
  textAlign(CENTER, CENTER);
  text("Bage", 400, 15);

  //Enemy Health Box
  pushMatrix();
  translate(50, 15);
  noFill();
  rect(625, 0, 112, 40);
  popMatrix();
  text(bageHealth + "/" + "200", 662, 15);

  fill(103, 78, 167);
  stroke(103, 78, 167);
  ellipseMode(CENTER);
  ellipse(700, 15, 11, 11); //Heart
  ellipse(710, 15, 11, 11); //Heart
  triangle(694, 16, 715, 16, 705, 27); //heart

  //Boss
  bageX = 400;
  bageY = 250;
  bageScale = 3;
  bage();
  fill(255, 0, 0);
  rect(358, 268, 12, 36);
  rect(442, 268, 12, 36);

  //Character Box
  amoriX = 100;
  amoriY = 350;
  amoriScale = 1.5;
  amori();
  stroke(255);
  noFill();
  rect(100, 330, 125, 110);
  fill(255);
  rect(100, 406, 125, 40);
  fill(7, 18, 67);
  stroke(7, 18, 67);
  rect(100, 448, 125, 40);
  noFill();
  stroke(255);
  rect(100, 349, 135, 160);

  //Cloudy HP
  text(amoriHealth + "/" + 140, 83, 401);
  fill(204, 0, 0);
  stroke(204, 0, 0);
  ellipse(130, 404, 11, 11); //Heart
  ellipse(140, 404, 11, 11); //Heart
  triangle(124, 405, 145, 405, 135, 416); //heart

  //Buttons
  rectMode(CENTER);
  strokeWeight(4);
  textSize(24);

  if ((abs(mouseX - 250) <= 50) && (abs(mouseY - 400) <= 25) && timerBoss >= 120) {
    stroke(0);
    fill(255);
    rect(250, 400, 100, 50);
    fill(0);
    text("ATTACK", 250, 388);
    if (mousePressed && (mouseButton == LEFT)) {
      timerBoss = 0;
      attacked = true;
      healed = false;
      amoriDamage = int(random(50, 80));
      timer = 0;
      bageHealth -= amoriDamage;
      amoriHealth -= bageDamage;
      timer++;
    }
  } else {
    stroke(255);
    fill(7, 18, 67);
    rect(250, 400, 100, 50);
    fill(255);
    text("ATTACK", 250, 388);
  }

  if ((abs(mouseX - 550) <= 50) && (abs(mouseY - 400) <= 25) && timerBoss >= 120) {
    stroke(0);
    fill(255);
    rect(550, 400, 100, 50);
    fill(0);
    text("HEAL", 550, 388);
    if (mousePressed && (mouseButton == LEFT)) {
      timerBoss = 0;
      healed = true;
      attacked = false;
      amoriHeal = int(random(50, 70));
      timer = 0;
      amoriHealth += amoriHeal;
      amoriHealth -= bageDamage;
      if (amoriHealth > 140) {
        amoriHealth = 140;
      }
      timer++;
    }
  } else {
    stroke(255);
    fill(7, 18, 67);
    rect(550, 400, 100, 50);
    fill(255);
    text("HEAL", 550, 388);
  }

  //attack and heal code
  if (timer >= 1 && healed == false && attacked == true) {
    fill(255);
    text("you did " + amoriDamage + " damage.", 400, 75);
    text("you took " + bageDamage + " damage.", 400, 100);
    timer = 1;
  }
  if (timer >= 1 && attacked == false && healed == true) {
    fill(255);
    text("you healed " + amoriHeal + " damage.", 400, 75);
    text("you took " + bageDamage + " damage.", 400, 100);
    timer = 1;
  }

  //checks if hp is below 0
  if (bageHealth <= 0 || (bageHealth <= 0 && amoriHealth <= 0)) {
    slide++;
    amoriHealth = 140;
    attacked = false;
    healed = false;
  }

  if (amoriHealth <= 0) {
    slide = 1000;
    amoriHealth = 140;
    attacked = false;
    healed = false;
  }
  timerBoss++;
}

void worldwideBoss() {
  rectMode(CENTER);
  background(7, 18, 67);
  pushMatrix();
  translate(200, 15);
  //Text Box
  stroke(255);
  noFill();
  rect(200, 0, 400, 50);
  popMatrix();

  fill(255);
  fontNormal = createFont("fontNormal.ttf", 24);
  textFont(fontNormal);
  textAlign(CENTER, CENTER);
  text("Mr. Worldwide", 400, 15);

  //Enemy Health Box
  pushMatrix();
  translate(50, 15);
  noFill();
  rect(625, 0, 112, 40);
  popMatrix();
  textSize(20);
  text(mrWorldwideHealth + "/" + "1000", 657, 15);
  textSize(24);

  fill(103, 78, 167);
  stroke(103, 78, 167);
  ellipseMode(CENTER);
  ellipse(700, 15, 11, 11); //Heart
  ellipse(710, 15, 11, 11); //Heart
  triangle(694, 16, 715, 16, 705, 27); //heart

  //Boss
  worldwideX = 352;
  worldwideY = 460;
  worldwideScale = 3;
  worldwide();
  fill(255, 0, 0);

  //Character Box
  amoriX = 100;
  amoriY = 350;
  amoriScale = 1.5;
  amori();
  stroke(255);
  noFill();
  rect(100, 330, 125, 110);
  fill(255);
  rect(100, 406, 125, 40);
  fill(7, 18, 67);
  stroke(7, 18, 67);
  rect(100, 448, 125, 40);
  noFill();
  stroke(255);
  rect(100, 349, 135, 160);

  //Cloudy HP
  text(amoriHealth + "/" + 140, 83, 401);
  fill(204, 0, 0);
  stroke(204, 0, 0);
  ellipse(130, 404, 11, 11); //Heart
  ellipse(140, 404, 11, 11); //Heart
  triangle(124, 405, 145, 405, 135, 416); //heart

  //Buttons
  rectMode(CENTER);
  strokeWeight(4);
  textSize(24);

  if ((abs(mouseX - 250) <= 50) && (abs(mouseY - 400) <= 25) && timerBoss >= 120) {
    stroke(0);
    fill(255);
    rect(250, 400, 100, 50);
    fill(0);
    text("ATTACK", 250, 388);
    if (mousePressed && (mouseButton == LEFT)) {
      timerBoss = 0;
      attacked = true;
      healed = false;
      amoriDamage = int(random(90, 100));
      mrWorldwideDamage = int(random(40, 50));
      timer = 0;
      mrWorldwideHealth -= amoriDamage;
      amoriHealth -= mrWorldwideDamage;
      timer++;
    }
  } else {
    stroke(255);
    fill(7, 18, 67);
    rect(250, 400, 100, 50);
    fill(255);
    text("ATTACK", 250, 388);
  }

  if ((abs(mouseX - 550) <= 50) && (abs(mouseY - 400) <= 25) && timerBoss >= 120) {
    stroke(0);
    fill(255);
    rect(550, 400, 100, 50);
    fill(0);
    text("HEAL", 550, 388);
    if (mousePressed && (mouseButton == LEFT)) {
      timerBoss = 0;
      healed = true;
      attacked = false;
      amoriHeal = int(random(50, 70));
      mrWorldwideDamage = int(random(40, 50));
      timer = 0;
      amoriHealth += amoriHeal;
      amoriHealth -= mrWorldwideDamage;
      if (amoriHealth > 140) {
        amoriHealth = 140;
      }
      timer++;
    }
  } else {
    stroke(255);
    fill(7, 18, 67);
    rect(550, 400, 100, 50);
    fill(255);
    text("HEAL", 550, 388);
  }

  //attack and heal code
  if (timer >= 1 && healed == false && attacked == true) {
    fill(255);
    text("you did " + amoriDamage + " damage.", 400, 75);
    text("you took " + mrWorldwideDamage + " damage.", 400, 100);
    timer = 1;
  }
  if (timer >= 1 && attacked == false && healed == true) {
    fill(255);
    text("you healed " + amoriHeal + " damage.", 400, 75);
    text("you took " + mrWorldwideDamage + " damage.", 400, 100);
    timer = 1;
  }

  //checks if hp is below 0
  if (mrWorldwideHealth <= 0 || (mrWorldwideHealth <= 0 && amoriHealth <= 0)) {
    slide++;
    amoriHealth = 140;
    attacked = false;
    healed = false;
  }

  if (amoriHealth <= 0) {
    slide = 1001;
    amoriHealth = 140;
    attacked = false;
    healed = false;
  }
  timerBoss++;
}

void amoriBoss() {
  background(7, 18, 67);
  pushMatrix();
  translate(200, 15);
  //Text Box
  stroke(255);
  noFill();
  rect(200, 0, 400, 50);
  popMatrix();

  fill(255);
  fontNormal = createFont("fontNormal.ttf", 24);
  textFont(fontNormal);
  textAlign(CENTER, CENTER);
  text("Amori", 400, 15);

  //Enemy Health Box
  pushMatrix();
  translate(50, 15);
  noFill();
  rect(625, 0, 112, 40);
  popMatrix();
  textSize(20);
  text(amoriBossHealth + "/" + "6000", 657, 15);
  textSize(24);

  fill(103, 78, 167);
  stroke(103, 78, 167);
  ellipseMode(CENTER);
  ellipse(700, 15, 11, 11); //Heart
  ellipse(710, 15, 11, 11); //Heart
  triangle(694, 16, 715, 16, 705, 27); //heart

  //Boss
  amoriX = 400;
  amoriY = 250;
  amoriScale = 3;
  amori();
  fill(255, 0, 0);
  rect(358, 268, 12, 36);
  rect(442, 268, 12, 36);

  //Character Box
  cloudyX = 100;
  cloudyY = 350;
  cloudyScale = 1.5;
  cloudy();
  stroke(255);
  noFill();
  rect(100, 330, 125, 110);
  fill(255);
  rect(100, 406, 125, 40);
  fill(7, 18, 67);
  stroke(7, 18, 67);
  rect(100, 448, 125, 40);
  noFill();
  stroke(255);
  rect(100, 349, 135, 160);

  //Cloudy HP
  text(cloudyHealth + "/" + 300, 83, 401);
  fill(204, 0, 0);
  stroke(204, 0, 0);
  ellipse(130, 404, 11, 11); //Heart
  ellipse(140, 404, 11, 11); //Heart
  triangle(124, 405, 145, 405, 135, 416); //heart

  //Buttons
  rectMode(CENTER);
  strokeWeight(4);
  textSize(24);

  if ((abs(mouseX - 250) <= 50) && (abs(mouseY - 400) <= 25) && timerBoss >= 120) {
    stroke(0);
    fill(255);
    rect(250, 400, 100, 50);
    fill(0);
    text("ATTACK", 250, 388);
    if (mousePressed && (mouseButton == LEFT)) {
      timerBoss = 0;
      attacked = true;
      healed = false;
      cloudyDamage = int(random(590, 600));
      amoriBossDamage = int(random(70, 150));
      timer = 0;
      amoriBossHealth -= cloudyDamage;
      cloudyHealth -= amoriBossDamage;
      timer++;
    }
  } else {
    stroke(255);
    fill(7, 18, 67);
    rect(250, 400, 100, 50);
    fill(255);
    text("ATTACK", 250, 388);
  }

  if ((abs(mouseX - 550) <= 50) && (abs(mouseY - 400) <= 25) && timerBoss >= 120) {
    stroke(0);
    fill(255);
    rect(550, 400, 100, 50);
    fill(0);
    text("HEAL", 550, 388);
    if (mousePressed && (mouseButton == LEFT)) {
      timerBoss = 0;
      healed = true;
      attacked = false;
      cloudyHeal = int(random(100, 200));
      amoriBossDamage = int(random(70, 150));
      timer = 0;
      cloudyHealth += cloudyHeal;
      cloudyHealth -= amoriBossDamage;
      if (cloudyHealth > 300) {
        cloudyHealth = 300;
      }
      timer++;
    }
  } else {
    stroke(255);
    fill(7, 18, 67);
    rect(550, 400, 100, 50);
    fill(255);
    text("HEAL", 550, 388);
  }

  //attack and heal code
  if (timer >= 1 && healed == false && attacked == true) {
    fill(255);
    text("you did " + cloudyDamage + " damage.", 400, 75);
    text("you took " + amoriBossDamage + " damage.", 400, 100);
    timer = 1;
  }
  if (timer >= 1 && attacked == false && healed == true) {
    fill(255);
    text("you healed " + cloudyHeal + " damage.", 400, 75);
    text("you took " + amoriBossDamage + " damage.", 400, 100);
    timer = 1;
  }

  //checks if hp is below 0
  if (amoriBossHealth <= 0 || (amoriBossHealth <= 0 && amoriBossHealth <= 0)) {
    slide = 18;
    cloudyHealth = 300;
    attacked = false;
    healed = false;
  }

  if (cloudyHealth <= 0) {
    slide = 19;
    cloudyHealth = 300;
    attacked = false;
    healed = false;
  }
  timerBoss++;
}

void retry1() {
  background(0);
  //Text
  fontCursed = createFont("fontCursed.ttf", 144);
  fontNormal = createFont("fontNormal.ttf", 144);
  textFont(fontNormal);
  textAlign(CENTER, CENTER);
  textFont(fontCursed);
  textAlign(CENTER, CENTER);
  fill(255);
  text("GAME", 400, 100);
  text("OVER", 400, 200);
  textFont(fontNormal);
  textSize(24);
  text("Do you want to retry?", 400, 300);

  //Buttons for the retry and exit buttons
  rectMode(CENTER);
  strokeWeight(2);
  if ((abs(mouseX - 325) <= 25) && (abs(mouseY - 350) <= 15)) {
    stroke(0);
    fill(255);
    rect(325, 350, 50, 30);
    fill(0);
    text("YES", 325, 345); 
    if (mousePressed && (mouseButton == LEFT)) { //if the user presses button
      worldsEndTimer = 0;
      slide = 10; //goes back to the slide for bage
      bageHealth = 200; //sets the health back to 200
      lose.stop();
    }
  } else {
    stroke(255);
    fill(0);
    rect(325, 350, 50, 30);
    fill(255);
    text("YES", 324, 345);
  }

  if ((abs(mouseX - 475) <= 25) && (abs(mouseY - 350) <= 15)) {
    stroke(0);  
    fill(255);
    rect(475, 350, 50, 30);
    fill(0);
    text("NO", 475, 345);
    if (mousePressed && (mouseButton == LEFT)) { //checks if user presses the button
      slide = 2000; //goes to credits
    }
  } else {
    stroke(255);
    fill(0);
    rect(475, 350, 50, 30);
    fill(255);
    text("NO", 475, 345);
  }
}

void retry2() {
  background(0);
  //Text
  fontCursed = createFont("fontCursed.ttf", 144);
  fontNormal = createFont("fontNormal.ttf", 144);
  textFont(fontNormal);
  textAlign(CENTER, CENTER);
  textFont(fontCursed);
  textAlign(CENTER, CENTER);
  fill(255);
  text("GAME", 400, 100);
  text("OVER", 400, 200);
  textFont(fontNormal);
  textSize(24);
  text("Do you want to retry?", 400, 300);

  //Buttons
  rectMode(CENTER);
  strokeWeight(2);
  if ((abs(mouseX - 325) <= 25) && (abs(mouseY - 350) <= 15)) {
    stroke(0);
    fill(255);
    rect(325, 350, 50, 30);
    fill(0);
    text("YES", 325, 345);
    if (mousePressed && (mouseButton == LEFT)) { //checks if the user presses the button
      troubleTimer = 0;
      slide = 13; //sets slide back to the boss
      mrWorldwideHealth = 1000; //sets health back to full
      lose.stop();
    }
  } else {
    stroke(255);
    fill(0);
    rect(325, 350, 50, 30);
    fill(255);
    text("YES", 324, 345);
  }

  if ((abs(mouseX - 475) <= 25) && (abs(mouseY - 350) <= 15)) {
    stroke(0);
    fill(255);
    rect(475, 350, 50, 30);
    fill(0);
    text("NO", 475, 345);
    if (mousePressed && (mouseButton == LEFT)) { //checks if the user presses the button
      slide = 2000; //goes to credits
    }
  } else {
    stroke(255);
    fill(0);
    rect(475, 350, 50, 30);
    fill(255);
    text("NO", 475, 345);
  }
}

void credits() {
  //Creates font and background
  background(0);
  fontNormal = createFont("fontNormal.ttf", 144);
  textFont(fontNormal);
  textAlign(CENTER, CENTER);
  textSize(48);

  //Text
  
  fill(255);
  text("CREDITS", 400, textY);

  text("STORY:", 400, textY+100);
  text("Radin and Felix", 400, textY+150);

  text("ART:", 400, textY+250);
  text("Radin and Felix", 400, textY+300);

  text("CODE:", 400, textY+400);
  text("Radin and Felix", 400, textY+450);

  text("MUSIC:", 400, textY+550);
  text("Radin and Felix", 400, textY+600);

  textSize(80);
  text("THANK YOU FOR PLAYING!", 400, textY+750);

  if (textY+750 <= 250) { //Stops text from moving
    textY = -500;


    //Positions and scales

    cloudyX = 0;
    cloudyY = 0;
    cloudyScale = 1;

    bageX = 0;
    bageY = 0;
    bageScale = 1;

    celX = 0;
    celY = 0;
    celScale = 1;

    arbyX = 0;
    arbyY = 0;
    arbyScale = 1;

    hereX = 0;
    hereY = 0;
    hereScale = 1;

    //Rotates everyone in a circle    

    pushMatrix();
    translate(400, 250);
    rotate(radians(creditsRotation));

    pushMatrix();
    translate(0, -100);
    cloudy();
    popMatrix();

    pushMatrix();
    rotate(radians(72));
    translate(0, -100);
    bage();
    popMatrix();

    pushMatrix();
    rotate(radians(144));
    translate(0, -100);
    arby();
    popMatrix();

    pushMatrix();
    rotate(radians(216));
    translate(0, -100);
    cel();
    popMatrix();

    pushMatrix();
    rotate(radians(288));
    translate(0, -100);
    here();
    popMatrix();

    popMatrix();
    
    //Text
    
    fill(255);
    text("THANK YOU FOR PLAYING!", 400, textY+750);
    textSize(48);
    rectMode(CENTER);
    if ((abs(mouseX - 250) <= 100) && (abs(mouseY - 400) <= 50)) {
      stroke(0);
      fill(255);
      rect(250, 400, 200, 100);
      fill(0);
      text("RESTART", 250, 388);
      if (mousePressed && (mouseButton == LEFT)) {
        slide = 0; //goes back to the beginning
        
        wherePlay.stop();
        duet.stop();
        oyasumi.stop();
        
        //sets all health back to default
        tordHealth = 2147483647;
        amoriHealth = 140;
        amoriBossHealth = 6000;
        bageHealth = 200;
        mrWorldwideHealth = 1000;
        cloudyHealth = 300;
        
        //sets all timers back to 0
        timer = 0;
        timerGreySpace = 0;
        timerBorbRoom = 0;
        timerTordBoss = 0;
        timerMinuteTordBoss = 0;
        timerCloudyRoom = 0;
        timerStairs = 0;
        timerBorbRoomArby = 0;
        timerMinuteBageBoss = 0;
        timerMinuteBage = 0;
        timerSpaceBoss = 0;
        timerSpace = 0;
        timerTrash = 0;
        timerAmoriBoss = 0;
        timerBad = 0;
        timerGood = 0;
        timerSecret = 0;
        timerSecretStairs = 0;
        timerSecretWorld = 0;
        
        titleTimer = 0;
        minuteTimer = 0;
        greyTimer = 0;
        borbTimer = 0;
        minuteTordTimer = 0;
        gladeTimer = 0;
        winTimer = 0;
        loseTimer = 0;
        sugarStarTimer = 0;
        stardustTimer = 0;
        troubleTimer = 0;
        worldsEndTimer = 0;
        omoriTimer = 0;
        duetTimer = 0;
        oyasumiTimer = 0;
        slamTimer = 0;
        wherePlayTimer = 0;
        borbArbyTimer = 0;
        minuteBageTimer = 0;
        minuteThreeTimer = 0;
        greyGoodTimer = 0;
        greyBadTimer = 0;
        greySecretTimer = 0;
        
        //sets the credits back to the original value
        textY = 600;
      }
    } else { //Exit text
      stroke(255);
      fill(0);
      rect(250, 400, 200, 100);
      fill(255);
      text("RESTART", 250, 388);
    }
    if ((abs(mouseX - 550) <= 100) && (abs(mouseY - 400) <= 50)) {
      stroke(0);
      fill(255);
      rect(550, 400, 200, 100);
      fill(0);
      text("EXIT", 550, 388);
      if (mousePressed && (mouseButton == LEFT)) {
        exit(); //exits the program
      }
    } else { //Exit text
      stroke(255);
      fill(0);
      rect(550, 400, 200, 100);
      fill(255);
      text("EXIT", 550, 388);
    }
    creditsRotation += 3;
  }
  textY -= 1;
}

void menu() {
  background(87, 177, 253);
  fontNormal = createFont("fontNormal.ttf", 144);
  textFont(fontNormal);
  textAlign(CENTER, CENTER);
  fill(0);
  text("AM  RI", 400, 50);

  //Light
  noFill();
  stroke(0);
  strokeWeight(3);

  pushMatrix();
  scale(1.5);
  translate(-172, -45);
  ellipse(450, 100, 20, 20);//main bulb
  //lines representing light
  pushMatrix();
  translate(450, 100);
  line(0, -15, 0, -25);
  popMatrix();
  pushMatrix();
  translate(450, 100);
  rotate(radians(36));
  line(0, -15, 0, -25);
  popMatrix();
  pushMatrix();
  translate(450, 100);
  rotate(radians(72));
  line(0, -15, 0, -25);
  popMatrix();
  pushMatrix();
  translate(450, 100);
  rotate(radians(108));
  line(0, -15, 0, -25);
  popMatrix();
  pushMatrix();
  translate(450, 100);
  rotate(radians(144));
  line(0, -15, 0, -25);
  popMatrix();
  pushMatrix();
  translate(450, 100);
  rotate(radians(180));
  line(0, -15, 0, -25);
  popMatrix();
  pushMatrix();
  translate(450, 100);
  rotate(radians(216));
  line(0, -15, 0, -25);
  popMatrix();
  pushMatrix();
  translate(450, 100);
  rotate(radians(252));
  line(0, -15, 0, -25);
  popMatrix();
  pushMatrix();
  translate(450, 100);
  rotate(radians(288));
  line(0, -15, 0, -25);
  popMatrix();
  pushMatrix();
  translate(450, 100);
  rotate(radians(324));
  line(0, -15, 0, -25);
  popMatrix();
  //filament of light bulb
  beginShape();
  vertex(448, 90);
  vertex(447, 100);
  vertex(453, 100);
  vertex(452, 90);
  endShape();
  line(450, 90, 450, 0);
  popMatrix();

  //Clouds
  noStroke();
  fill(235, 238, 240);
  pushMatrix();
  translate(cloudAnimation, 0);
  ellipse(280, 175, 80, 50);
  ellipse(240, 175, 20, 20);
  ellipse(320, 180, 30, 30);
  ellipse(280, 190, 160, 20);
  ellipse(300, 200, 100, 20);
  popMatrix();

  pushMatrix();
  translate(cloudAnimation + 250, 20);
  ellipse(280, 175, 80, 50);
  ellipse(240, 175, 20, 20);
  ellipse(320, 180, 30, 30);
  ellipse(280, 190, 160, 20);
  ellipse(270, 200, 100, 20);
  popMatrix();

  pushMatrix();
  translate(cloudAnimation - 250, 140);
  ellipse(280, 175, 80, 50);
  ellipse(240, 175, 20, 20);
  ellipse(320, 180, 30, 30);
  ellipse(280, 180, 160, 20);
  ellipse(270, 190, 100, 20);
  popMatrix();

  pushMatrix();
  translate(cloudAnimation + 300, 160);
  ellipse(280, 175, 80, 50);
  ellipse(240, 175, 20, 20);
  ellipse(320, 180, 30, 30);
  ellipse(280, 180, 160, 20);
  ellipse(270, 190, 100, 20);
  popMatrix();

  cloudAnimation += cloudDirection;

  if (cloudAnimation + 600 >= 900) {
    cloudDirection = -cloudDirection;
  }

  if (cloudAnimation <= -100) {
    cloudDirection = -cloudDirection;
  }

  //Amori
  amoriX = 400;
  amoriY = 250;
  amoriScale = 3;
  amori();

  //Buttons
  rectMode(CENTER);
  strokeWeight(4);
  textSize(48);

  if ((abs(mouseX - 150) <= 100) && (abs(mouseY - 400) <= 50)) {
    stroke(0);
    fill(255);
    rect(150, 400, 200, 100);
    fill(0);
    text("CONTINUE", 150, 388);
    if (mousePressed && (mouseButton == LEFT)) {
      name = getString("Please enter your name (put Cloudy for a surprise!): ");
      if (!name.isEmpty()) { //checks if the name the user inputted is not empty
        slide = -1;
        amoriX = 50;
        amoriY = -40;
        amoriScale = 0.5;
        bageX = 50;
        bageY = -80;
        bageScale = 0.5;
        celX = 50;
        celY = -120;
        celScale = 0.5;
        arbyX = 50;
        arbyY = 290;
        arbyScale = 0.5;
        hereX = 50;
        hereY = 330;
        hereScale = 0.5;
        tordX = 840;
        tordY = 200;
        tordScale = 0.3;
      }
    }
  } else {
    stroke(255);
    fill(0);
    rect(150, 400, 200, 100);
    fill(255);
    text("CONTINUE", 150, 388);
  }

  if ((abs(mouseX - 650) <= 100) && (abs(mouseY - 400) <= 50)) {
    stroke(0);
    fill(255);
    rect(650, 400, 200, 100);
    fill(0);
    text("EXIT", 650, 388);
    if (mousePressed && (mouseButton == LEFT)) {
      exit(); //exits the program
    }
  } else {
    stroke(255);
    fill(0);
    rect(650, 400, 200, 100);
    fill(255);
    text("EXIT", 650, 388);
  }
}

void instructions() {
  background(0); //Background and font
  fontNormal = createFont("fontNormal.ttf", 24);
  textFont(fontNormal);
  textAlign(CENTER, CENTER);
  text("Welcome to Amori, press “.” at the end of the scene to go to the next slide.", 400, 225); //Text with instructions
  text("You can also press “p” to pause.", 400, 275); //Text with Instructions
}

void pause() {

  //Creates UI
  noStroke();
  fontNormal = createFont("fontNormal.ttf", 48);
  textFont(fontNormal);
  textAlign(CENTER, CENTER);
  fill(0);
  rectMode(CORNER);
  rect(0, 0, 800, 500);
  rectMode(CENTER);
  fill(0);
  stroke(255);
  strokeWeight(2);
  rect(400, 200, 150, 50);

  fill(255);
  textSize(48);
  text("PAUSED", 400, 190);

  //Checks if continue button is pressed and takes back to the slide

  textSize(24);
  if ((abs(mouseX - 300) <= 50) && (abs(mouseY - 275) <= 25)) {
    stroke(0);
    fill(255);
    rect(300, 275, 100, 50);
    fill(0);
    text("CONTINUE", 300, 270);
    if (mousePressed && (mouseButton == LEFT)) {
      paused = false;
      slide = previousSlide;
    }
  } else {
    stroke(255);
    fill(0);
    rect(300, 275, 100, 50);
    fill(255);
    text("CONTINUE", 300, 270);
  }

  //Checks if the exit button is pressed and takes you to the credits

  if ((abs(mouseX - 500) <= 50) && (abs(mouseY - 275) <= 25)) {
    stroke(0);
    fill(255);
    rect(500, 275, 100, 50);
    fill(0);
    text("EXIT", 500, 270);
    if (mousePressed && (mouseButton == LEFT)) {
      slide = 2000;
      paused = false;
    }
  } else {
    stroke(255);
    fill(0);
    rect(500, 275, 100, 50);
    fill(255);
    text("EXIT", 500, 270);
  }
}


void amori() {
  noStroke();
  rectMode(CENTER);
  
  pushMatrix();
  translate(amoriX, amoriY);
  scale(amoriScale);

  //Grey fill
  fill(128);

  rect(-34, -6, 4, 4);
  rect(6, -6, 4, 4);
  rect(10, -6, 4, 4);
  rect(34, -6, 4, 4);

  rect(-34, -2, 4, 4);

  rect(-2, -2, 4, 4);
  rect(2, -2, 4, 4);
  rect(6, -2, 4, 4);
  rect(10, -2, 4, 4);
  rect(14, -2, 4, 4);
  rect(34, -2, 4, 4);

  rect(-34, 2, 4, 4);
  rect(-30, 2, 4, 4);
  rect(-10, 2, 4, 4);
  rect(-6, 2, 4, 4);
  rect(-2, 2, 4, 4);
  rect(2, 2, 4, 4);
  rect(6, 2, 4, 4);
  rect(10, 2, 4, 4);
  rect(18, 2, 4, 4);
  rect(30, 2, 4, 4);
  rect(34, 2, 4, 4);

  rect(-30, 6, 4, 4);
  rect(-22, 6, 4, 4);
  rect(-18, 6, 4, 4);
  rect(-10, 6, 4, 4);
  rect(-6, 6, 4, 4);
  rect(-2, 6, 4, 4);
  rect(2, 6, 4, 4);
  rect(6, 6, 4, 4);
  rect(10, 6, 4, 4);
  rect(18, 6, 4, 4);
  rect(22, 6, 4, 4);
  rect(30, 6, 4, 4);

  rect(-30, 10, 4, 4);
  rect(-22, 10, 4, 4);
  rect(-18, 10, 4, 4);
  rect(-10, 10, 4, 4);
  rect(-6, 10, 4, 4);
  rect(-2, 10, 4, 4);
  rect(2, 10, 4, 4);
  rect(6, 10, 4, 4);
  rect(10, 10, 4, 4);
  rect(18, 10, 4, 4);
  rect(22, 10, 4, 4);
  rect(30, 10, 4, 4);

  rect(-18, 14, 4, 4);
  rect(-14, 14, 4, 4);
  rect(-10, 14, 4, 4);
  rect(-6, 14, 4, 4);
  rect(-2, 14, 4, 4);
  rect(2, 14, 4, 4);
  rect(6, 14, 4, 4);
  rect(10, 14, 4, 4);
  rect(14, 14, 4, 4);
  rect(18, 14, 4, 4);

  rect(-10, 18, 4, 4);
  rect(-6, 18, 4, 4);
  rect(-2, 18, 4, 4);
  rect(2, 18, 4, 4);
  rect(6, 18, 4, 4);
  rect(10, 18, 4, 4);

  rect(-2, 22, 4, 4);
  rect(2, 22, 4, 4);

  rect(-14, 26, 4, 4);
  rect(14, 26, 4, 4);

  rect(-18, 30, 4, 4);
  rect(-14, 30, 4, 4);
  rect(14, 30, 4, 4);
  rect(18, 30, 4, 4);

  rect(-22, 34, 4, 4);
  rect(-18, 34, 4, 4);
  rect(18, 34, 4, 4);
  rect(22, 34, 4, 4);

  rect(-26, 38, 4, 4);
  rect(-22, 38, 4, 4);
  rect(22, 38, 4, 4);
  rect(26, 38, 4, 4);

  rect(-26, 42, 4, 4);
  rect(-22, 42, 4, 4);
  rect(-14, 42, 4, 4);
  rect(14, 42, 4, 4);
  rect(22, 42, 4, 4);
  rect(26, 42, 4, 4);

  rect(-14, 46, 4, 4);
  rect(-6, 46, 4, 4);
  rect(6, 46, 4, 4);
  rect(14, 46, 4, 4);

  rect(-14, 54, 4, 4);
  rect(-10, 54, 4, 4);
  rect(10, 54, 4, 4);
  rect(14, 54, 4, 4);

  //Black outlines and hair
  fill(0);

  rect(-14, 62, 4, 4);
  rect(-10, 62, 4, 4);
  rect(10, 62, 4, 4);
  rect(14, 62, 4, 4);

  rect(-18, 58, 4, 4);
  rect(-14, 58, 4, 4);
  rect(-10, 58, 4, 4);
  rect(-6, 58, 4, 4);
  rect(6, 58, 4, 4);
  rect(10, 58, 4, 4);
  rect(14, 58, 4, 4);
  rect(18, 58, 4, 4);

  rect(-18, 54, 4, 4);
  rect(-6, 54, 4, 4);
  rect(6, 54, 4, 4);
  rect(18, 54, 4, 4);

  rect(-18, 50, 4, 4);
  rect(-14, 50, 4, 4);
  rect(-10, 50, 4, 4);
  rect(-6, 50, 4, 4);
  rect(-2, 50, 4, 4);
  rect(2, 50, 4, 4);
  rect(6, 50, 4, 4);
  rect(10, 50, 4, 4);
  rect(14, 50, 4, 4);
  rect(18, 50, 4, 4);

  rect(-26, 46, 4, 4);
  rect(-22, 46, 4, 4);
  rect(-18, 46, 4, 4);
  rect(-10, 46, 4, 4);
  rect(-2, 46, 4, 4);
  rect(2, 46, 4, 4);
  rect(10, 46, 4, 4);
  rect(18, 46, 4, 4);
  rect(22, 46, 4, 4);
  rect(26, 46, 4, 4);

  rect(-30, 42, 4, 4);
  rect(-18, 42, 4, 4);
  rect(-10, 42, 4, 4);
  rect(-6, 42, 4, 4);
  rect(-2, 42, 4, 4);
  rect(2, 42, 4, 4);
  rect(6, 42, 4, 4);
  rect(10, 42, 4, 4);
  rect(18, 42, 4, 4);
  rect(30, 42, 4, 4);

  rect(-30, 38, 4, 4);
  rect(-18, 38, 4, 4);
  rect(-14, 38, 4, 4);
  rect(-10, 38, 4, 4);
  rect(-6, 38, 4, 4);
  rect(-2, 38, 4, 4);
  rect(2, 38, 4, 4);
  rect(6, 38, 4, 4);
  rect(10, 38, 4, 4);
  rect(14, 38, 4, 4);
  rect(18, 38, 4, 4);
  rect(30, 38, 4, 4);

  rect(-26, 34, 4, 4);
  rect(-14, 34, 4, 4);
  rect(-10, 34, 4, 4);
  rect(-6, 34, 4, 4);
  rect(-2, 34, 4, 4);
  rect(2, 34, 4, 4);
  rect(6, 34, 4, 4);
  rect(10, 34, 4, 4);
  rect(14, 34, 4, 4);
  rect(26, 34, 4, 4);

  rect(-22, 30, 4, 4);
  rect(-10, 30, 4, 4);
  rect(-6, 30, 4, 4);
  rect(-2, 30, 4, 4);
  rect(2, 30, 4, 4);
  rect(6, 30, 4, 4);
  rect(10, 30, 4, 4);
  rect(22, 30, 4, 4);

  rect(-18, 26, 4, 4);
  rect(-10, 26, 4, 4);
  rect(-6, 26, 4, 4);
  rect(-2, 26, 4, 4);
  rect(2, 26, 4, 4);
  rect(6, 26, 4, 4);
  rect(10, 26, 4, 4);
  rect(18, 26, 4, 4);

  rect(-14, 22, 4, 4);
  rect(-10, 22, 4, 4);
  rect(-6, 22, 4, 4);
  rect(6, 22, 4, 4);
  rect(10, 22, 4, 4);
  rect(14, 22, 4, 4);

  rect(-18, 18, 4, 4);
  rect(-14, 18, 4, 4);
  rect(14, 18, 4, 4);
  rect(18, 18, 4, 4);

  rect(-22, 14, 4, 4);
  rect(22, 14, 4, 4);

  rect(-30, 10, 4, 4);
  rect(-26, 10, 4, 4);
  rect(-14, 10, 4, 4);
  rect(14, 10, 4, 4);
  rect(26, 10, 4, 4);
  rect(30, 10, 4, 4);

  rect(-34, 6, 4, 4);
  rect(-26, 6, 4, 4);
  rect(-14, 6, 4, 4);
  rect(14, 6, 4, 4);
  rect(26, 6, 4, 4);
  rect(34, 6, 4, 4);

  rect(-38, 2, 4, 4);
  rect(-26, 2, 4, 4);
  rect(-22, 2, 4, 4);
  rect(-18, 2, 4, 4);
  rect(-14, 2, 4, 4);
  rect(14, 2, 4, 4);
  rect(22, 2, 4, 4);
  rect(26, 2, 4, 4);
  rect(38, 2, 4, 4);

  rect(-38, -2, 4, 4);
  rect(-30, -2, 4, 4);
  rect(-26, -2, 4, 4);
  rect(-22, -2, 4, 4);
  rect(-18, -2, 4, 4);
  rect(-14, -2, 4, 4);
  rect(-10, -2, 4, 4);
  rect(-6, -2, 4, 4);
  rect(18, -2, 4, 4);
  rect(22, -2, 4, 4);
  rect(26, -2, 4, 4);
  rect(30, -2, 4, 4);
  rect(38, -2, 4, 4);

  rect(-38, -6, 4, 4);
  rect(-30, -6, 4, 4);
  rect(-26, -6, 4, 4);
  rect(-22, -6, 4, 4);
  rect(-18, -6, 4, 4);
  rect(-14, -6, 4, 4);
  rect(-10, -6, 4, 4);
  rect(-6, -6, 4, 4);
  rect(-2, -6, 4, 4);
  rect(2, -6, 4, 4);
  rect(14, -6, 4, 4);
  rect(18, -6, 4, 4);
  rect(22, -6, 4, 4);
  rect(26, -6, 4, 4);
  rect(30, -6, 4, 4);
  rect(38, -6, 4, 4);

  rect(-34, -10, 4, 4);
  rect(-30, -10, 4, 4);
  rect(-26, -10, 4, 4);
  rect(-22, -10, 4, 4);
  rect(-18, -10, 4, 4);
  rect(-14, -10, 4, 4);
  rect(-10, -10, 4, 4);
  rect(-6, -10, 4, 4);
  rect(-2, -10, 4, 4);
  rect(2, -10, 4, 4);
  rect(6, -10, 4, 4);
  rect(10, -10, 4, 4);
  rect(14, -10, 4, 4);
  rect(18, -10, 4, 4);
  rect(22, -10, 4, 4);
  rect(26, -10, 4, 4);
  rect(30, -10, 4, 4);
  rect(34, -10, 4, 4);

  rect(-34, -14, 4, 4);
  rect(-30, -14, 4, 4);
  rect(-26, -14, 4, 4);
  rect(-22, -14, 4, 4);
  rect(-18, -14, 4, 4);
  rect(-14, -14, 4, 4);
  rect(-10, -14, 4, 4);
  rect(-6, -14, 4, 4);
  rect(-2, -14, 4, 4);
  rect(2, -14, 4, 4);
  rect(6, -14, 4, 4);
  rect(10, -14, 4, 4);
  rect(14, -14, 4, 4);
  rect(18, -14, 4, 4);
  rect(22, -14, 4, 4);
  rect(26, -14, 4, 4);
  rect(30, -14, 4, 4);
  rect(34, -14, 4, 4);

  rect(-34, -18, 4, 4);
  rect(-30, -18, 4, 4);
  rect(-26, -18, 4, 4);
  rect(-22, -18, 4, 4);
  rect(-18, -18, 4, 4);
  rect(-14, -18, 4, 4);
  rect(-10, -18, 4, 4);
  rect(-6, -18, 4, 4);
  rect(-2, -18, 4, 4);
  rect(2, -18, 4, 4);
  rect(6, -18, 4, 4);
  rect(10, -18, 4, 4);
  rect(14, -18, 4, 4);
  rect(18, -18, 4, 4);
  rect(22, -18, 4, 4);
  rect(26, -18, 4, 4);
  rect(30, -18, 4, 4);
  rect(34, -18, 4, 4);

  rect(-34, -22, 4, 4);
  rect(-30, -22, 4, 4);
  rect(-26, -22, 4, 4);
  rect(-22, -22, 4, 4);
  rect(-18, -22, 4, 4);
  rect(-14, -22, 4, 4);
  rect(-10, -22, 4, 4);
  rect(-6, -22, 4, 4);
  rect(-2, -22, 4, 4);
  rect(2, -22, 4, 4);
  rect(6, -22, 4, 4);
  rect(10, -22, 4, 4);
  rect(14, -22, 4, 4);
  rect(18, -22, 4, 4);
  rect(22, -22, 4, 4);
  rect(26, -22, 4, 4);
  rect(30, -22, 4, 4);
  rect(34, -22, 4, 4);

  rect(-30, -26, 4, 4);
  rect(-26, -26, 4, 4);
  rect(-22, -26, 4, 4);
  rect(-18, -26, 4, 4);
  rect(-14, -26, 4, 4);
  rect(-10, -26, 4, 4);
  rect(-6, -26, 4, 4);
  rect(-2, -26, 4, 4);
  rect(2, -26, 4, 4);
  rect(6, -26, 4, 4);
  rect(10, -26, 4, 4);
  rect(14, -26, 4, 4);
  rect(18, -26, 4, 4);
  rect(22, -26, 4, 4);
  rect(26, -26, 4, 4);
  rect(30, -26, 4, 4);

  rect(-30, -30, 4, 4);
  rect(-26, -30, 4, 4);
  rect(-22, -30, 4, 4);
  rect(-18, -30, 4, 4);
  rect(-14, -30, 4, 4);
  rect(-10, -30, 4, 4);
  rect(-6, -30, 4, 4);
  rect(-2, -30, 4, 4);
  rect(2, -30, 4, 4);
  rect(6, -30, 4, 4);
  rect(10, -30, 4, 4);
  rect(14, -30, 4, 4);
  rect(18, -30, 4, 4);
  rect(22, -30, 4, 4);
  rect(26, -30, 4, 4);
  rect(30, -30, 4, 4);

  rect(-26, -34, 4, 4);
  rect(-22, -34, 4, 4);
  rect(-18, -34, 4, 4);
  rect(-14, -34, 4, 4);
  rect(-10, -34, 4, 4);
  rect(-6, -34, 4, 4);
  rect(-2, -34, 4, 4);
  rect(2, -34, 4, 4);
  rect(6, -34, 4, 4);
  rect(10, -34, 4, 4);
  rect(14, -34, 4, 4);
  rect(18, -34, 4, 4);
  rect(22, -34, 4, 4);
  rect(26, -34, 4, 4);

  rect(-22, -38, 4, 4);
  rect(-18, -38, 4, 4);
  rect(-14, -38, 4, 4);
  rect(-10, -38, 4, 4);
  rect(-6, -38, 4, 4);
  rect(-2, -38, 4, 4);
  rect(2, -38, 4, 4);
  rect(6, -38, 4, 4);
  rect(10, -38, 4, 4);
  rect(14, -38, 4, 4);
  rect(18, -38, 4, 4);
  rect(22, -38, 4, 4);
  rect(26, -38, 4, 4);
  rect(30, -38, 4, 4);
  rect(34, -38, 4, 4);

  rect(-14, -42, 4, 4);
  rect(-10, -42, 4, 4);
  rect(-6, -42, 4, 4);
  rect(-2, -42, 4, 4);
  rect(2, -42, 4, 4);
  rect(6, -42, 4, 4);
  rect(10, -42, 4, 4);
  rect(14, -42, 4, 4);
  rect(26, -42, 4, 4);
  rect(26, -46, 4, 4);
  popMatrix();
}

void bage() {
  noStroke();
  pushMatrix();
  translate(bageX, bageY);
  scale(bageScale);

  fill(233, 208, 255);
  rect(-14, -38, 4, 4);
  rect(-10, -38, 4, 4);
  rect(-6, -38, 4, 4);
  rect(-2, -38, 4, 4);
  rect(2, -38, 4, 4);
  rect(6, -38, 4, 4);
  rect(10, -38, 4, 4);
  rect(14, -38, 4, 4);

  rect(-26, -34, 4, 4);
  rect(-22, -34, 4, 4);
  rect(-18, -34, 4, 4);
  rect(-14, -34, 4, 4);
  rect(-10, -34, 4, 4);
  rect(-6, -34, 4, 4);
  rect(-2, -34, 4, 4);
  rect(2, -34, 4, 4);
  rect(6, -34, 4, 4);
  rect(10, -34, 4, 4);
  rect(14, -34, 4, 4);
  rect(22, -34, 4, 4);
  rect(26, -34, 4, 4);

  rect(-38, -30, 4, 4);
  rect(-34, -30, 4, 4);
  rect(-26, -30, 4, 4);
  rect(-18, -30, 4, 4);
  rect(-6, -30, 4, 4);
  rect(2, -30, 4, 4);
  rect(6, -30, 4, 4);
  rect(30, -30, 4, 4);
  rect(34, -30, 4, 4);

  rect(-38, -26, 4, 4);
  rect(-34, -26, 4, 4);
  rect(-14, -26, 4, 4);
  rect(-10, -26, 4, 4);
  rect(-2, -26, 4, 4);
  rect(2, -26, 4, 4);
  rect(10, -26, 4, 4);
  rect(14, -26, 4, 4);
  rect(30, -26, 4, 4);
  rect(34, -26, 4, 4);

  rect(-46, -22, 4, 4);
  rect(-42, -22, 4, 4);
  rect(-30, -22, 4, 4);
  rect(-26, -22, 4, 4);
  rect(-18, -22, 4, 4);
  rect(-14, -22, 4, 4);
  rect(-10, -22, 4, 4);
  rect(10, -22, 4, 4);
  rect(14, -22, 4, 4);
  rect(26, -22, 4, 4);
  rect(38, -22, 4, 4);
  rect(42, -22, 4, 4);

  rect(-46, -18, 4, 4);
  rect(-26, -18, 4, 4);
  rect(-18, -18, 4, 4);
  rect(-6, -18, 4, 4);
  rect(2, -18, 4, 4);
  rect(6, -18, 4, 4);
  rect(18, -18, 4, 4);
  rect(22, -18, 4, 4);
  rect(42, -18, 4, 4);

  rect(-50, -14, 4, 4);
  rect(-42, -14, 4, 4);
  rect(-34, -14, 4, 4);
  rect(-30, -14, 4, 4);
  rect(-22, -14, 4, 4);
  rect(2, -14, 4, 4);
  rect(22, -14, 4, 4);
  rect(30, -14, 4, 4);
  rect(38, -14, 4, 4);
  rect(46, -14, 4, 4);

  rect(-42, -10, 4, 4);
  rect(-34, -10, 4, 4);
  rect(-30, -10, 4, 4);
  rect(-18, -10, 4, 4);
  rect(-10, -10, 4, 4);
  rect(-6, -10, 4, 4);
  rect(6, -10, 4, 4);
  rect(10, -10, 4, 4);
  rect(18, -10, 4, 4);
  rect(26, -10, 4, 4);
  rect(30, -10, 4, 4);
  rect(38, -10, 4, 4);

  rect(-38, -6, 4, 4);
  rect(-26, -6, 4, 4);
  rect(-18, -6, 4, 4);
  rect(-10, -6, 4, 4);
  rect(-6, -6, 4, 4);
  rect(6, -6, 4, 4);
  rect(10, -6, 4, 4);
  rect(18, -6, 4, 4);
  rect(34, -6, 4, 4);

  rect(-38, -2, 4, 4);
  rect(-34, -2, 4, 4);
  rect(-26, -2, 4, 4);
  rect(-14, -2, 4, 4);
  rect(-2, -2, 4, 4);
  rect(2, -2, 4, 4);
  rect(14, -2, 4, 4);
  rect(26, -2, 4, 4);
  rect(34, -2, 4, 4);
  rect(38, -2, 4, 4);

  rect(-26, 2, 4, 4);
  rect(-18, 2, 4, 4);
  rect(-10, 2, 4, 4);
  rect(-2, 2, 4, 4);
  rect(6, 2, 4, 4);
  rect(10, 2, 4, 4);
  rect(18, 2, 4, 4);
  rect(26, 2, 4, 4);
  rect(34, 2, 4, 4);

  rect(-30, 6, 4, 4);
  rect(-22, 6, 4, 4);
  rect(-18, 6, 4, 4);
  rect(-10, 6, 4, 4);
  rect(-6, 6, 4, 4);
  rect(6, 6, 4, 4);
  rect(10, 6, 4, 4);
  rect(18, 6, 4, 4);
  rect(22, 6, 4, 4);
  rect(30, 6, 4, 4);

  rect(-30, 10, 4, 4);
  rect(-22, 10, 4, 4);
  rect(-18, 10, 4, 4);
  rect(-10, 10, 4, 4);
  rect(-6, 10, 4, 4);
  rect(-2, 10, 4, 4);
  rect(6, 10, 4, 4);
  rect(10, 10, 4, 4);
  rect(18, 10, 4, 4);
  rect(22, 10, 4, 4);
  rect(30, 10, 4, 4);

  rect(-30, 14, 4, 4);
  rect(-26, 14, 4, 4);
  rect(-10, 14, 4, 4);
  rect(-6, 14, 4, 4);
  rect(-2, 14, 4, 4);
  rect(2, 14, 4, 4);
  rect(6, 14, 4, 4);
  rect(10, 14, 4, 4);
  rect(26, 14, 4, 4);
  rect(30, 14, 4, 4);

  rect(-30, 18, 4, 4);
  rect(-14, 18, 4, 4);
  rect(-10, 18, 4, 4);
  rect(-6, 18, 4, 4);
  rect(-2, 18, 4, 4);
  rect(2, 18, 4, 4);
  rect(6, 18, 4, 4);
  rect(10, 18, 4, 4);
  rect(14, 18, 4, 4);
  rect(30, 18, 4, 4);

  rect(-14, 26, 4, 4);
  rect(-6, 26, 4, 4);
  rect(-2, 26, 4, 4);
  rect(2, 26, 4, 4);
  rect(6, 26, 4, 4);
  rect(14, 26, 4, 4);

  rect(-18, 30, 4, 4);
  rect(-14, 30, 4, 4);
  rect(14, 30, 4, 4);
  rect(18, 30, 4, 4);

  rect(-22, 34, 4, 4);
  rect(-18, 34, 4, 4);
  rect(-6, 34, 4, 4);
  rect(-2, 34, 4, 4);
  rect(2, 34, 4, 4);
  rect(6, 34, 4, 4);
  rect(18, 34, 4, 4);
  rect(22, 34, 4, 4);

  rect(-26, 38, 4, 4);
  rect(26, 38, 4, 4);

  rect(-26, 42, 4, 4);
  rect(-22, 42, 4, 4);
  rect(-2, 42, 4, 4);
  rect(2, 42, 4, 4);
  rect(22, 42, 4, 4);
  rect(26, 42, 4, 4);

  rect(-14, 62, 4, 4);
  rect(-10, 62, 4, 4);
  rect(10, 62, 4, 4);
  rect(14, 62, 4, 4);

  rect(-14, 66, 4, 4);
  rect(-10, 66, 4, 4);
  rect(10, 66, 4, 4);
  rect(14, 66, 4, 4);

  //dark blue
  fill(19, 34, 166);
  rect(-14, -42, 4, 4);
  rect(-10, -42, 4, 4);
  rect(-6, -42, 4, 4);
  rect(-2, -42, 4, 4);
  rect(2, -42, 4, 4);
  rect(6, -42, 4, 4);
  rect(10, -42, 4, 4);
  rect(14, -42, 4, 4);

  rect(-26, -38, 4, 4);
  rect(-22, -38, 4, 4);
  rect(-18, -38, 4, 4);
  rect(18, -38, 4, 4);
  rect(22, -38, 4, 4);
  rect(26, -38, 4, 4);

  rect(-38, -34, 4, 4);
  rect(-34, -34, 4, 4);
  rect(-30, -34, 4, 4);
  rect(18, -34, 4, 4);
  rect(30, -34, 4, 4);
  rect(34, -34, 4, 4);

  rect(-42, -30, 4, 4);
  rect(-30, -30, 4, 4);
  rect(-22, -30, 4, 4);
  rect(-14, -30, 4, 4);
  rect(-10, -30, 4, 4);
  rect(-2, -30, 4, 4);
  rect(10, -30, 4, 4);
  rect(14, -30, 4, 4);
  rect(18, -30, 4, 4);
  rect(22, -30, 4, 4);
  rect(26, -30, 4, 4);
  rect(38, -30, 4, 4);

  rect(-46, -26, 4, 4);
  rect(-42, -26, 4, 4);
  rect(-30, -26, 4, 4);
  rect(-26, -26, 4, 4);
  rect(-22, -26, 4, 4);
  rect(-18, -26, 4, 4);
  rect(-6, -26, 4, 4);
  rect(6, -26, 4, 4);
  rect(18, -26, 4, 4);
  rect(22, -26, 4, 4);
  rect(26, -26, 4, 4);
  rect(38, -26, 4, 4);
  rect(42, -26, 4, 4);

  rect(-50, -22, 4, 4);
  rect(-22, -22, 4, 4);
  rect(-18, -22, 4, 4);
  rect(-6, -22, 4, 4);
  rect(-2, -22, 4, 4);
  rect(2, -22, 4, 4);
  rect(6, -22, 4, 4);
  rect(18, -22, 4, 4);
  rect(22, -22, 4, 4);
  rect(46, -22, 4, 4);

  rect(-50, -18, 4, 4);
  rect(-42, -18, 4, 4);
  rect(-30, -18, 4, 4);
  rect(-22, -18, 4, 4);
  rect(-2, -18, 4, 4);
  rect(26, -18, 4, 4);
  rect(38, -18, 4, 4);
  rect(46, -18, 4, 4);

  rect(-54, -14, 4, 4);
  rect(-46, -14, 4, 4);
  rect(-38, -14, 4, 4);
  rect(-26, -14, 4, 4);
  rect(-18, -14, 4, 4);
  rect(-6, -14, 4, 4);
  rect(-2, -14, 4, 4);
  rect(6, -14, 4, 4);
  rect(18, -14, 4, 4);
  rect(26, -14, 4, 4);
  rect(34, -14, 4, 4);
  rect(42, -14, 4, 4);
  rect(50, -14, 4, 4);

  rect(-50, -10, 4, 4);
  rect(-46, -10, 4, 4);
  rect(-38, -10, 4, 4);
  rect(-26, -10, 4, 4);
  rect(-22, -10, 4, 4);
  rect(-14, -10, 4, 4);
  rect(-2, -10, 4, 4);
  rect(2, -10, 4, 4);
  rect(14, -10, 4, 4);
  rect(22, -10, 4, 4);
  rect(34, -10, 4, 4);
  rect(42, -10, 4, 4);
  rect(46, -10, 4, 4);

  rect(-46, -6, 4, 4);
  rect(-42, -6, 4, 4);
  rect(-34, -6, 4, 4);
  rect(-30, -6, 4, 4);
  rect(-22, -6, 4, 4);
  rect(-14, -6, 4, 4);
  rect(-2, -6, 4, 4);
  rect(2, -6, 4, 4);
  rect(14, -6, 4, 4);
  rect(22, -6, 4, 4);
  rect(26, -6, 4, 4);
  rect(30, -6, 4, 4);
  rect(38, -6, 4, 4);
  rect(42, -6, 4, 4);

  rect(-42, -2, 4, 4);
  rect(-30, -2, 4, 4);
  rect(-22, -2, 4, 4);
  rect(-18, -2, 4, 4);
  rect(-10, -2, 4, 4);
  rect(-6, -2, 4, 4);
  rect(6, -2, 4, 4);
  rect(10, -2, 4, 4);
  rect(18, -2, 4, 4);
  rect(22, -2, 4, 4);
  rect(30, -2, 4, 4);
  rect(42, -2, 4, 4);

  rect(-38, 2, 4, 4);
  rect(-34, 2, 4, 4);
  rect(-30, 2, 4, 4);
  rect(-22, 2, 4, 4);
  rect(-14, 2, 4, 4);
  rect(-6, 2, 4, 4);
  rect(2, 2, 4, 4);
  rect(14, 2, 4, 4);
  rect(22, 2, 4, 4);
  rect(30, 2, 4, 4);
  rect(38, 2, 4, 4);

  rect(-34, 6, 4, 4);
  rect(-26, 6, 4, 4);
  rect(-14, 6, 4, 4);
  rect(-2, 6, 4, 4);
  rect(2, 6, 4, 4);
  rect(14, 6, 4, 4);
  rect(26, 6, 4, 4);
  rect(34, 6, 4, 4);

  rect(-34, 10, 4, 4);
  rect(-26, 10, 4, 4);
  rect(-14, 10, 4, 4);
  rect(2, 10, 4, 4);
  rect(14, 10, 4, 4);
  rect(26, 10, 4, 4);
  rect(34, 10, 4, 4);

  rect(-34, 14, 4, 4);
  rect(-22, 14, 4, 4);
  rect(22, 14, 4, 4);
  rect(34, 14, 4, 4);

  rect(-34, 18, 4, 4);
  rect(-26, 18, 4, 4);
  rect(-18, 18, 4, 4);
  rect(18, 18, 4, 4);
  rect(26, 18, 4, 4);
  rect(34, 18, 4, 4);

  rect(-30, 22, 4, 4);
  rect(-14, 22, 4, 4);
  rect(-10, 22, 4, 4);
  rect(-6, 22, 4, 4);
  rect(-2, 22, 4, 4);
  rect(2, 22, 4, 4);
  rect(6, 22, 4, 4);
  rect(10, 22, 4, 4);
  rect(14, 22, 4, 4);
  rect(30, 22, 4, 4);

  rect(-18, 26, 4, 4);
  rect(-10, 26, 4, 4);
  rect(10, 26, 4, 4);
  rect(18, 26, 4, 4);

  rect(-22, 30, 4, 4);
  rect(-6, 30, 4, 4);
  rect(-2, 30, 4, 4);
  rect(2, 30, 4, 4);
  rect(6, 30, 4, 4);
  rect(22, 30, 4, 4);

  rect(-26, 34, 4, 4);
  rect(-14, 34, 4, 4);
  rect(14, 34, 4, 4);
  rect(26, 34, 4, 4);

  rect(-30, 38, 4, 4);
  rect(-22, 38, 4, 4);
  rect(-18, 38, 4, 4);
  rect(-10, 38, 4, 4);
  rect(10, 38, 4, 4);
  rect(18, 38, 4, 4);
  rect(22, 38, 4, 4);
  rect(30, 38, 4, 4);

  rect(-30, 42, 4, 4);
  rect(-18, 42, 4, 4);
  rect(18, 42, 4, 4);
  rect(30, 42, 4, 4);

  rect(-26, 46, 4, 4);
  rect(-22, 46, 4, 4);
  rect(-18, 46, 4, 4);
  rect(18, 46, 4, 4);
  rect(22, 46, 4, 4);
  rect(26, 46, 4, 4);

  rect(-18, 50, 4, 4);
  rect(18, 50, 4, 4);

  rect(-18, 54, 4, 4);
  rect(-2, 54, 4, 4);
  rect(2, 54, 4, 4);
  rect(18, 54, 4, 4);

  rect(-18, 58, 4, 4);
  rect(-14, 58, 4, 4);
  rect(-10, 58, 4, 4);
  rect(-6, 58, 4, 4);
  rect(6, 58, 4, 4);
  rect(10, 58, 4, 4);
  rect(14, 58, 4, 4);
  rect(18, 58, 4, 4);

  rect(-18, 62, 4, 4);
  rect(-6, 62, 4, 4);
  rect(6, 62, 4, 4);
  rect(18, 62, 4, 4);

  rect(-18, 66, 4, 4);
  rect(-6, 66, 4, 4);
  rect(6, 66, 4, 4);
  rect(18, 66, 4, 4);

  rect(-14, 70, 4, 4);
  rect(-10, 70, 4, 4);
  rect(10, 70, 4, 4);
  rect(14, 70, 4, 4);

  //flower center
  fill(116, 130, 247);
  rect(-34, -22, 4, 4);
  rect(30, -22, 4, 4);

  rect(-38, -18, 4, 4);
  rect(-34, -18, 4, 4);
  rect(-10, -18, 4, 4);
  rect(10, -18, 4, 4);
  rect(30, -18, 4, 4);
  rect(34, -18, 4, 4);

  rect(-14, -14, 4, 4);
  rect(-10, -14, 4, 4);
  rect(10, -14, 4, 4);
  rect(14, -14, 4, 4);

  fill(255);
  rect(-38, -22, 4, 4);
  rect(34, -22, 4, 4);

  rect(-14, -18, 4, 4);
  rect(14, -18, 4, 4);

  //blush and clothing colour
  fill(191, 146, 231);
  rect(-18, 14, 4, 4);
  rect(-14, 14, 4, 4);
  rect(14, 14, 4, 4);
  rect(18, 14, 4, 4);

  rect(-10, 30, 4, 4);
  rect(10, 30, 4, 4);

  rect(-10, 34, 4, 4);
  rect(10, 34, 4, 4);

  rect(-14, 38, 4, 4);
  rect(-6, 38, 4, 4);
  rect(-2, 38, 4, 4);
  rect(2, 38, 4, 4);
  rect(6, 38, 4, 4);
  rect(14, 38, 4, 4);

  rect(-14, 42, 4, 4);
  rect(-10, 42, 4, 4);
  rect(-6, 42, 4, 4);
  rect(6, 42, 4, 4);
  rect(10, 42, 4, 4);
  rect(14, 42, 4, 4);

  rect(-14, 46, 4, 4);
  rect(-10, 46, 4, 4);
  rect(-6, 46, 4, 4);
  rect(-2, 46, 4, 4);
  rect(2, 46, 4, 4);
  rect(6, 46, 4, 4);
  rect(10, 46, 4, 4);
  rect(14, 46, 4, 4);

  rect(-14, 50, 4, 4);
  rect(-10, 50, 4, 4);
  rect(-6, 50, 4, 4);
  rect(-2, 50, 4, 4);
  rect(2, 50, 4, 4);
  rect(6, 50, 4, 4);
  rect(10, 50, 4, 4);
  rect(14, 50, 4, 4);

  rect(-14, 54, 4, 4);
  rect(-10, 54, 4, 4);
  rect(-6, 54, 4, 4);
  rect(6, 54, 4, 4);
  rect(10, 54, 4, 4);
  rect(14, 54, 4, 4);
  popMatrix();
}

void hands() {
  pushMatrix();
  translate(handX, handY);
  scale(0.5, 0.5);
  rotate(radians(180));
  noStroke();
  fill(184, 0, 255);

  rectMode(CORNER);

  //Outline
  rect(0, 0, 8, 4);
  rect(8, 4, 4, 8);
  rect(4, 12, 4, 4);
  rect(0, 16, 4, 12);
  rect(4, 28, 4, 4);
  rect(8, 32, 4, 4);
  rect(12, 36, 4, 24);
  rect(8, 60, 4, 4);
  rect(4, 64, 4, 4);
  rect(8, 68, 4, 4);
  rect(12, 72, 4, 4);
  rect(16, 76, 4, 12);
  rect(12, 88, 4, 20);
  rect(4, 108, 8, 4);
  rect(4, 88, 4, 20);
  rect(0, 112, 4, 4);
  rect(-4, 88, 4, 20);
  rect(-8, 108, 8, 4);
  rect(-12, 80, 4, 28);
  rect(-16, 96, 4, 4);
  rect(-20, 72, 4, 24);
  rect(-16, 68, 4, 4);
  rect(-12, 64, 4, 4);
  rect(-8, 60, 4, 4);
  rect(-4, 56, 4, 4);
  rect(0, 44, 4, 12);
  rect(-4, 40, 4, 4);
  rect(-8, 36, 4, 4);
  rect(-12, 12, 4, 24);
  rect(-8, 8, 4, 4);
  rect(-4, 4, 4, 4);

  //Fill
  fill(233, 208, 255);
  rect(0, 4, 8, 8);
  rect(-4, 8, 8, 8);
  rect(-8, 12, 8, 24);
  rect(-4, 28, 8, 12);
  rect(0, 32, 8, 12);
  rect(4, 36, 8, 24);
  rect(0, 56, 8, 8);
  rect(-4, 60, 8, 8);
  rect(-8, 64, 4, 4);
  rect(-12, 68, 20, 12);
  rect(-16, 72, 4, 24);
  rect(-8, 72, 4, 36);
  rect(-4, 80, 4, 8);
  rect(0, 72, 4, 40);
  rect(4, 80, 4, 8);
  rect(8, 72, 4, 36);
  rect(12, 76, 4, 12);
  popMatrix();
}

void cloudy() {
  noStroke();

  pushMatrix();
  translate(cloudyX, cloudyY);
  scale(cloudyScale);

  //Skin colour
  fill(255, 255, 185);
  rect(-34, -6, 4, 4);
  rect(6, -6, 4, 4);
  rect(10, -6, 4, 4);
  rect(34, -6, 4, 4);

  rect(-34, -2, 4, 4);
  rect(-2, -2, 4, 4);
  rect(2, -2, 4, 4);
  rect(6, -2, 4, 4);
  rect(10, -2, 4, 4);
  rect(14, -2, 4, 4);
  rect(34, -2, 4, 4);

  rect(-34, 2, 4, 4);
  rect(-30, 2, 4, 4);
  rect(-10, 2, 4, 4);
  rect(-6, 2, 4, 4);
  rect(-2, 2, 4, 4);
  rect(2, 2, 4, 4);
  rect(6, 2, 4, 4);
  rect(10, 2, 4, 4);
  rect(18, 2, 4, 4);
  rect(30, 2, 4, 4);
  rect(34, 2, 4, 4);

  rect(-30, 6, 4, 4);
  rect(-22, 6, 4, 4);
  rect(-18, 6, 4, 4);
  rect(-10, 6, 4, 4);
  rect(-6, 6, 4, 4);
  rect(-2, 6, 4, 4);
  rect(2, 6, 4, 4);
  rect(6, 6, 4, 4);
  rect(10, 6, 4, 4);
  rect(18, 6, 4, 4);
  rect(22, 6, 4, 4);
  rect(30, 6, 4, 4);

  rect(-30, 10, 4, 4);
  rect(-22, 10, 4, 4);
  rect(-18, 10, 4, 4);
  rect(-10, 10, 4, 4);
  rect(-6, 10, 4, 4);
  rect(-2, 10, 4, 4);
  rect(2, 10, 4, 4);
  rect(6, 10, 4, 4);
  rect(10, 10, 4, 4);
  rect(18, 10, 4, 4);
  rect(22, 10, 4, 4);
  rect(30, 10, 4, 4);

  rect(-18, 14, 4, 4);
  rect(-14, 14, 4, 4);
  rect(-10, 14, 4, 4);
  rect(-6, 14, 4, 4);
  rect(-2, 14, 4, 4);
  rect(2, 14, 4, 4);
  rect(6, 14, 4, 4);
  rect(10, 14, 4, 4);
  rect(14, 14, 4, 4);
  rect(18, 14, 4, 4);

  rect(-10, 18, 4, 4);
  rect(-6, 18, 4, 4);
  rect(-2, 18, 4, 4);
  rect(2, 18, 4, 4);
  rect(6, 18, 4, 4);
  rect(10, 18, 4, 4);

  rect(-22, 34, 4, 4);
  rect(22, 34, 4, 4);

  rect(-26, 38, 4, 4);
  rect(-22, 38, 4, 4);
  rect(22, 38, 4, 4);
  rect(26, 38, 4, 4);

  rect(-26, 42, 4, 4);
  rect(-22, 42, 4, 4);
  rect(22, 42, 4, 4);
  rect(26, 42, 4, 4);

  rect(-14, 58, 4, 4);
  rect(14, 58, 4, 4);

  //Outlines and hair
  fill(0);

  rect(-14, 62, 4, 4);
  rect(-10, 62, 4, 4);
  rect(10, 62, 4, 4);
  rect(14, 62, 4, 4);

  rect(-18, 58, 4, 4);
  rect(-10, 58, 4, 4);
  rect(-6, 58, 4, 4);
  rect(6, 58, 4, 4);
  rect(10, 58, 4, 4);
  rect(18, 58, 4, 4);

  rect(-18, 54, 4, 4);
  rect(-6, 54, 4, 4);
  rect(6, 54, 4, 4);
  rect(18, 54, 4, 4);

  rect(-18, 50, 4, 4);
  rect(-6, 50, 4, 4);
  rect(-2, 50, 4, 4);
  rect(2, 50, 4, 4);
  rect(6, 50, 4, 4);
  rect(18, 50, 4, 4);

  rect(-26, 46, 4, 4);
  rect(-22, 46, 4, 4);
  rect(-18, 46, 4, 4);
  rect(-10, 46, 4, 4);
  rect(-6, 46, 4, 4);
  rect(-2, 46, 4, 4);
  rect(2, 46, 4, 4);
  rect(6, 46, 4, 4);
  rect(10, 46, 4, 4);
  rect(18, 46, 4, 4);
  rect(22, 46, 4, 4);
  rect(26, 46, 4, 4);

  rect(-30, 42, 4, 4);
  rect(-18, 42, 4, 4);
  rect(-14, 42, 4, 4);
  rect(14, 42, 4, 4);
  rect(18, 42, 4, 4);
  rect(30, 42, 4, 4);

  rect(-30, 38, 4, 4);
  rect(-18, 38, 4, 4);
  rect(18, 38, 4, 4);
  rect(30, 38, 4, 4);

  rect(-26, 34, 4, 4);
  rect(-14, 34, 4, 4);
  rect(-2, 34, 4, 4);
  rect(2, 34, 4, 4);
  rect(14, 34, 4, 4);
  rect(26, 34, 4, 4);

  rect(-22, 30, 4, 4);
  rect(-6, 30, 4, 4);
  rect(-2, 30, 4, 4);
  rect(2, 30, 4, 4);
  rect(6, 30, 4, 4);
  rect(22, 30, 4, 4);

  rect(-18, 26, 4, 4);
  rect(-10, 26, 4, 4);
  rect(10, 26, 4, 4);
  rect(18, 26, 4, 4);

  rect(-14, 22, 4, 4);
  rect(-10, 22, 4, 4);
  rect(-6, 22, 4, 4);
  rect(-2, 22, 4, 4);
  rect(2, 22, 4, 4);
  rect(6, 22, 4, 4);
  rect(10, 22, 4, 4);
  rect(14, 22, 4, 4);

  rect(-18, 18, 4, 4);
  rect(-14, 18, 4, 4);
  rect(14, 18, 4, 4);
  rect(18, 18, 4, 4);

  rect(-22, 14, 4, 4);
  rect(22, 14, 4, 4);

  rect(-30, 10, 4, 4);
  rect(-26, 10, 4, 4);
  rect(-14, 10, 4, 4);
  rect(14, 10, 4, 4);  
  rect(26, 10, 4, 4);
  rect(30, 10, 4, 4);

  rect(-34, 6, 4, 4);
  rect(-26, 6, 4, 4);
  rect(-14, 6, 4, 4);
  rect(14, 6, 4, 4);
  rect(26, 6, 4, 4);
  rect(34, 6, 4, 4);

  rect(-38, 2, 4, 4);
  rect(-26, 2, 4, 4);
  rect(-22, 2, 4, 4);
  rect(-18, 2, 4, 4);
  rect(-14, 2, 4, 4);
  rect(14, 2, 4, 4);
  rect(22, 2, 4, 4);
  rect(26, 2, 4, 4);
  rect(38, 2, 4, 4);

  rect(-38, -2, 4, 4);
  rect(-30, -2, 4, 4);
  rect(-26, -2, 4, 4);
  rect(-22, -2, 4, 4);
  rect(-18, -2, 4, 4);
  rect(-14, -2, 4, 4);
  rect(-10, -2, 4, 4);
  rect(-6, -2, 4, 4);
  rect(18, -2, 4, 4);
  rect(22, -2, 4, 4);
  rect(26, -2, 4, 4);
  rect(30, -2, 4, 4);
  rect(38, -2, 4, 4);

  rect(-38, -6, 4, 4);
  rect(-30, -6, 4, 4);
  rect(-26, -6, 4, 4);
  rect(-22, -6, 4, 4);
  rect(-18, -6, 4, 4);
  rect(-14, -6, 4, 4);
  rect(-10, -6, 4, 4);
  rect(-6, -6, 4, 4);
  rect(-2, -6, 4, 4);
  rect(2, -6, 4, 4);
  rect(14, -6, 4, 4);
  rect(18, -6, 4, 4);
  rect(22, -6, 4, 4);
  rect(26, -6, 4, 4);
  rect(30, -6, 4, 4);
  rect(38, -6, 4, 4);

  rect(-34, -10, 4, 4);
  rect(-30, -10, 4, 4);
  rect(-26, -10, 4, 4);
  rect(-22, -10, 4, 4);
  rect(-18, -10, 4, 4);
  rect(-14, -10, 4, 4);
  rect(-10, -10, 4, 4);
  rect(-6, -10, 4, 4);
  rect(-2, -10, 4, 4);
  rect(2, -10, 4, 4);
  rect(6, -10, 4, 4);
  rect(10, -10, 4, 4);
  rect(14, -10, 4, 4);
  rect(18, -10, 4, 4);
  rect(22, -10, 4, 4);
  rect(26, -10, 4, 4);
  rect(30, -10, 4, 4);
  rect(34, -10, 4, 4);

  rect(-34, -14, 4, 4);
  rect(-26, -14, 4, 4);
  rect(-18, -14, 4, 4);
  rect(-10, -14, 4, 4);
  rect(-2, -14, 4, 4);
  rect(2, -14, 4, 4);
  rect(6, -14, 4, 4);
  rect(14, -14, 4, 4);
  rect(22, -14, 4, 4);
  rect(26, -14, 4, 4);
  rect(34, -14, 4, 4);

  rect(-34, -18, 4, 4);
  rect(-26, -18, 4, 4);
  rect(-22, -18, 4, 4);
  rect(-14, -18, 4, 4);
  rect(-10, -18, 4, 4);
  rect(-6, -18, 4, 4);
  rect(-2, -18, 4, 4);
  rect(2, -18, 4, 4);
  rect(6, -18, 4, 4);
  rect(10, -18, 4, 4);
  rect(14, -18, 4, 4);
  rect(18, -18, 4, 4);
  rect(22, -18, 4, 4);
  rect(26, -18, 4, 4);
  rect(34, -18, 4, 4);

  rect(-34, -22, 4, 4);
  rect(-30, -22, 4, 4);

  rect(-22, -22, 4, 4);
  rect(-18, -22, 4, 4);
  rect(-14, -22, 4, 4);
  rect(-10, -22, 4, 4);
  rect(-6, -22, 4, 4);
  rect(-2, -22, 4, 4);
  rect(2, -22, 4, 4);
  rect(6, -22, 4, 4);
  rect(10, -22, 4, 4);
  rect(14, -22, 4, 4);
  rect(18, -22, 4, 4);
  rect(22, -22, 4, 4);

  rect(30, -22, 4, 4);
  rect(34, -22, 4, 4);

  rect(-30, -26, 4, 4);
  rect(-26, -26, 4, 4);
  rect(-22, -26, 4, 4);
  rect(-18, -26, 4, 4);
  rect(-14, -26, 4, 4);
  rect(-10, -26, 4, 4);
  rect(-6, -26, 4, 4);
  rect(-2, -26, 4, 4);
  rect(2, -26, 4, 4);
  rect(6, -26, 4, 4);
  rect(10, -26, 4, 4);
  rect(14, -26, 4, 4);
  rect(18, -26, 4, 4);
  rect(22, -26, 4, 4);
  rect(26, -26, 4, 4);
  rect(30, -26, 4, 4);

  rect(-30, -30, 4, 4);
  rect(-26, -30, 4, 4);
  rect(-22, -30, 4, 4);
  rect(-18, -30, 4, 4);
  rect(-14, -30, 4, 4);
  rect(-10, -30, 4, 4);
  rect(-6, -30, 4, 4);
  rect(-2, -30, 4, 4);
  rect(2, -30, 4, 4);
  rect(6, -30, 4, 4);
  rect(10, -30, 4, 4);
  rect(14, -30, 4, 4);
  rect(18, -30, 4, 4);
  rect(22, -30, 4, 4);
  rect(26, -30, 4, 4);
  rect(30, -30, 4, 4);

  rect(-26, -34, 4, 4);
  rect(-22, -34, 4, 4);
  rect(-18, -34, 4, 4);
  rect(-14, -34, 4, 4);
  rect(-10, -34, 4, 4);
  rect(-6, -34, 4, 4);
  rect(-2, -34, 4, 4);
  rect(2, -34, 4, 4);
  rect(6, -34, 4, 4);
  rect(10, -34, 4, 4);
  rect(14, -34, 4, 4);
  rect(18, -34, 4, 4);
  rect(22, -34, 4, 4);
  rect(26, -34, 4, 4);

  rect(-22, -38, 4, 4);
  rect(-18, -38, 4, 4);
  rect(-14, -38, 4, 4);
  rect(-10, -38, 4, 4);
  rect(-6, -38, 4, 4);
  rect(-2, -38, 4, 4);
  rect(2, -38, 4, 4);
  rect(6, -38, 4, 4);
  rect(10, -38, 4, 4);
  rect(14, -38, 4, 4);
  rect(18, -38, 4, 4);
  rect(22, -38, 4, 4);
  rect(26, -38, 4, 4);
  rect(30, -38, 4, 4);
  rect(34, -38, 4, 4);

  rect(-14, -42, 4, 4);
  rect(-10, -42, 4, 4);
  rect(-6, -42, 4, 4);
  rect(-2, -42, 4, 4);
  rect(2, -42, 4, 4);
  rect(6, -42, 4, 4);
  rect(10, -42, 4, 4);
  rect(14, -42, 4, 4);
  rect(26, -42, 4, 4);
  rect(26, -46, 4, 4);

  fill(145, 84, 76);
  rect(-30, -14, 4, 4);
  rect(-22, -14, 4, 4);
  rect(-14, -14, 4, 4);
  rect(-6, -14, 4, 4);
  rect(10, -14, 4, 4);
  rect(18, -14, 4, 4);
  rect(30, -14, 4, 4);

  rect(-30, -18, 4, 4);
  rect(-18, -18, 4, 4);
  rect(30, -18, 4, 4);

  rect(-26, -22, 4, 4);
  rect(26, -22, 4, 4);

  fill(255, 209, 209);
  rect(-18, 14, 4, 4);
  rect(-14, 14, 4, 4);
  rect(14, 14, 4, 4);
  rect(18, 14, 4, 4);

  fill(255);
  rect(-14, 26, 4, 4);
  rect(-2, 26, 4, 4);
  rect(2, 26, 4, 4);
  rect(14, 26, 4, 4);

  rect(-18, 30, 4, 4);
  rect(-14, 30, 4, 4);
  rect(14, 30, 4, 4);
  rect(18, 30, 4, 4);

  rect(-18, 34, 4, 4);
  rect(18, 34, 4, 4);

  fill(65, 69, 114);
  rect(-6, 26, 4, 4);
  rect(6, 26, 4, 4);

  rect(-10, 30, 4, 4);
  rect(10, 30, 4, 4);

  rect(-10, 34, 4, 4);
  rect(-6, 34, 4, 4);
  rect(6, 34, 4, 4);
  rect(10, 34, 4, 4);

  rect(-14, 38, 4, 4);
  rect(-10, 38, 4, 4);
  rect(-6, 38, 4, 4);
  rect(-2, 38, 4, 4);
  rect(2, 38, 4, 4);
  rect(6, 38, 4, 4);
  rect(10, 38, 4, 4);
  rect(14, 38, 4, 4);

  rect(-10, 42, 4, 4);
  rect(-6, 42, 4, 4);
  rect(-2, 42, 4, 4);
  rect(2, 42, 4, 4);
  rect(6, 42, 4, 4);
  rect(10, 42, 4, 4);

  fill(121, 98, 54);
  rect(-14, 46, 4, 4);
  rect(14, 46, 4, 4);

  rect(-14, 54, 4, 4);
  rect(-10, 54, 4, 4);
  rect(10, 54, 4, 4);
  rect(14, 54, 4, 4);

  fill(225, 192, 129);
  rect(-14, 50, 4, 4);
  rect(-10, 50, 4, 4);
  rect(10, 50, 4, 4);
  rect(14, 50, 4, 4);
  popMatrix();
}

void tord() {
  noStroke();
  rectMode(CORNER);
  pushMatrix();
  fill(202);

  //Outline
  rect(0, 0, 4, 4);
  rect(0, -4, 4, 4);
  rect(0, -8, 4, 4);
  rect(0, -12, 4, 4);
  rect(0, -16, 4, 4);
  rect(0, -20, 4, 4);
  rect(0, -24, 4, 4);

  rect(-4, -8, 4, 4);
  rect(-4, -12, 4, 4);
  rect(-4, -16, 4, 4);
  rect(-4, -20, 4, 4);
  rect(-4, -24, 4, 4);

  rect(4, -28, 4, 4);
  rect(4, -32, 4, 4);
  rect(4, -36, 4, 4);
  rect(4, -40, 4, 4);
  rect(4, -44, 4, 4);

  rect(8, -48, 4, 4);
  rect(8, -52, 4, 4);
  rect(8, -56, 4, 4);
  rect(8, -60, 4, 4);
  rect(8, -64, 4, 4);
  rect(8, -68, 4, 4);
  rect(8, -72, 4, 4);
  rect(8, -76, 4, 4);
  rect(8, -80, 4, 4);
  rect(8, -84, 4, 4);

  rect(12, -88, 4, 4);
  rect(12, -92, 4, 4);
  rect(12, -96, 4, 4);

  rect(16, -100, 4, 4);
  rect(16, -104, 4, 4);
  rect(16, -108, 4, 4);
  rect(16, -112, 4, 4);
  rect(16, -116, 4, 4);
  rect(16, -120, 4, 4);
  rect(16, -124, 4, 4);
  rect(16, -128, 4, 4);
  rect(16, -132, 4, 4);
  rect(16, -136, 4, 4);

  rect(20, -140, 4, 4);
  rect(20, -144, 4, 4);

  rect(24, -148, 4, 4);

  rect(28, -140, 4, 4);
  rect(28, -144, 4, 4);

  rect(32, -136, 4, 4);
  rect(32, -132, 4, 4);

  rect(36, -128, 4, 4);

  rect(40, -124, 4, 4);
  rect(40, -120, 4, 4);
  rect(40, -128, 4, 4);
  rect(40, -132, 4, 4);
  rect(40, -136, 4, 4);
  rect(40, -140, 4, 4);
  rect(40, -144, 4, 4);
  rect(40, -148, 4, 4);
  rect(40, -152, 4, 4);
  rect(40, -156, 4, 4);
  rect(40, -160, 4, 4);
  rect(40, -164, 4, 4);
  rect(40, -168, 4, 4);
  rect(40, -172, 4, 4);
  rect(40, -176, 4, 4);
  rect(40, -180, 4, 4);
  rect(40, -184, 4, 4);
  rect(40, -188, 4, 4);

  rect(36, -192, 4, 4);
  rect(36, -196, 4, 4);
  rect(36, -200, 4, 4);
  rect(36, -204, 4, 4);
  rect(36, -208, 4, 4);
  rect(36, -212, 4, 4);
  rect(36, -216, 4, 4);
  rect(36, -220, 4, 4);
  rect(36, -224, 4, 4);

  rect(32, -228, 4, 4);
  rect(32, -232, 4, 4);

  rect(28, -236, 4, 4);
  rect(28, -240, 4, 4);
  rect(28, -244, 4, 4);

  rect(24, -248, 4, 4);
  rect(24, -252, 4, 4);

  rect(20, -256, 4, 4);

  rect(16, -260, 4, 4);
  rect(12, -260, 4, 4);
  rect(8, -260, 4, 4);
  rect(4, -260, 4, 4);
  rect(0, -260, 4, 4);
  rect(-4, -260, 4, 4);
  rect(-8, -260, 4, 4);
  rect(-12, -260, 4, 4);

  rect(-16, -256, 4, 4);

  rect(-20, -252, 4, 4);

  rect(-24, -248, 4, 4);
  rect(-24, -244, 4, 4);

  rect(-28, -240, 4, 4);

  rect(-32, -236, 4, 4);
  rect(-32, -232, 4, 4);
  rect(-32, -228, 4, 4);
  rect(-32, -224, 4, 4);
  rect(-32, -220, 4, 4);
  rect(-32, -216, 4, 4);
  rect(-32, -212, 4, 4);
  rect(-32, -208, 4, 4);

  rect(-36, -204, 4, 4);
  rect(-36, -200, 4, 4);
  rect(-36, -196, 4, 4);
  rect(-36, -192, 4, 4);
  rect(-36, -188, 4, 4);

  rect(-40, -184, 4, 4);
  rect(-40, -180, 4, 4);
  rect(-40, -176, 4, 4);
  rect(-40, -172, 4, 4);
  rect(-40, -168, 4, 4);
  rect(-40, -164, 4, 4);
  rect(-40, -160, 4, 4);
  rect(-40, -156, 4, 4);

  rect(-44, -152, 4, 4);
  rect(-44, -148, 4, 4);
  rect(-44, -144, 4, 4);
  rect(-44, -140, 4, 4);
  rect(-44, -136, 4, 4);
  rect(-44, -132, 4, 4);
  rect(-44, -128, 4, 4);

  rect(-40, -136, 4, 4);
  rect(-40, -140, 4, 4);

  rect(-36, -144, 4, 4);
  rect(-36, -148, 4, 4);
  rect(-36, -152, 4, 4);

  rect(-32, -156, 4, 4);
  rect(-32, -160, 4, 4);

  rect(-28, -164, 4, 4);
  rect(-24, -164, 4, 4);

  rect(-20, -160, 4, 4);

  rect(-16, -156, 4, 4);
  rect(-16, -152, 4, 4);
  rect(-16, -148, 4, 4);
  rect(-16, -144, 4, 4);
  rect(-16, -140, 4, 4);
  rect(-16, -136, 4, 4);

  rect(-12, -132, 4, 4);
  rect(-12, -128, 4, 4);
  rect(-12, -124, 4, 4);
  rect(-12, -120, 4, 4);

  rect(-8, -116, 4, 4);
  rect(-8, -112, 4, 4);
  rect(-8, -108, 4, 4);
  rect(-8, -104, 4, 4);
  rect(-8, -100, 4, 4);
  rect(-8, -96, 4, 4);
  rect(-8, -92, 4, 4);
  rect(-8, -88, 4, 4);
  rect(-8, -84, 4, 4);
  rect(-8, -80, 4, 4);
  rect(-8, -76, 4, 4);
  rect(-8, -72, 4, 4);
  rect(-8, -68, 4, 4);
  rect(-8, -64, 4, 4);
  rect(-8, -60, 4, 4);
  rect(-8, -56, 4, 4);
  rect(-8, -52, 4, 4);
  rect(-8, -48, 4, 4);

  rect(-4, -44, 4, 4);
  rect(-4, -40, 4, 4);
  rect(-4, -36, 4, 4);
  rect(-4, -32, 4, 4);
  rect(-4, -36, 4, 4);
  rect(-4, -32, 4, 4);
  rect(-4, -28, 4, 4);


  //Fill Right of 0, including 0
  rect(0, -28, 4, 4);
  rect(0, -32, 4, 4);
  rect(0, -36, 4, 4);
  rect(0, -40, 4, 4);
  rect(0, -44, 4, 4);
  rect(0, -48, 4, 4);
  rect(0, -52, 4, 4);
  rect(0, -56, 4, 4);
  rect(0, -60, 4, 4);
  rect(0, -64, 4, 4);
  rect(0, -68, 4, 4);
  rect(0, -72, 4, 4);
  rect(0, -76, 4, 4);
  rect(0, -80, 4, 4);
  rect(0, -84, 4, 4);
  rect(0, -88, 4, 4);
  rect(0, -92, 4, 4);
  rect(0, -96, 4, 4);
  rect(0, -100, 4, 4);
  rect(0, -104, 4, 4);
  rect(0, -108, 4, 4);
  rect(0, -112, 4, 4);
  rect(0, -116, 4, 4);
  rect(0, -120, 4, 4);
  rect(0, -124, 4, 4);
  rect(0, -128, 4, 4);
  rect(0, -132, 4, 4);
  rect(0, -136, 4, 4);
  rect(0, -140, 4, 4);
  rect(0, -144, 4, 4);
  rect(0, -148, 4, 4);
  rect(0, -152, 4, 4);
  rect(0, -156, 4, 4);
  rect(0, -160, 4, 4);
  rect(0, -164, 4, 4);
  rect(0, -168, 4, 4);
  rect(0, -172, 4, 4);
  rect(0, -176, 4, 4);
  rect(0, -180, 4, 4);
  rect(0, -184, 4, 4);
  rect(0, -188, 4, 4);
  rect(0, -192, 4, 4);
  rect(0, -196, 4, 4);
  rect(0, -200, 4, 4);
  rect(0, -204, 4, 4);
  rect(0, -208, 4, 4);
  rect(0, -212, 4, 4);
  rect(0, -216, 4, 4);
  rect(0, -220, 4, 4);
  rect(0, -224, 4, 4);
  rect(0, -228, 4, 4);
  rect(0, -232, 4, 4);
  rect(0, -236, 4, 4);
  rect(0, -240, 4, 4);
  rect(0, -244, 4, 4);
  rect(0, -248, 4, 4);
  rect(0, -252, 4, 4);
  rect(0, -256, 4, 4);

  rect(4, -48, 4, 4);
  rect(4, -52, 4, 4);
  rect(4, -56, 4, 4);
  rect(4, -60, 4, 4);
  rect(4, -64, 4, 4);
  rect(4, -68, 4, 4);
  rect(4, -72, 4, 4);
  rect(4, -76, 4, 4);
  rect(4, -80, 4, 4);
  rect(4, -84, 4, 4);
  rect(4, -88, 4, 4);
  rect(4, -92, 4, 4);
  rect(4, -96, 4, 4);
  rect(4, -100, 4, 4);
  rect(4, -104, 4, 4);
  rect(4, -108, 4, 4);
  rect(4, -112, 4, 4);
  rect(4, -116, 4, 4);
  rect(4, -120, 4, 4);
  rect(4, -124, 4, 4);
  rect(4, -128, 4, 4);
  rect(4, -132, 4, 4);
  rect(4, -136, 4, 4);
  rect(4, -140, 4, 4);
  rect(4, -144, 4, 4);
  rect(4, -148, 4, 4);
  rect(4, -152, 4, 4);
  rect(4, -156, 4, 4);
  rect(4, -160, 4, 4);
  rect(4, -164, 4, 4);
  rect(4, -168, 4, 4);
  rect(4, -172, 4, 4);
  rect(4, -176, 4, 4);
  rect(4, -180, 4, 4);
  rect(4, -184, 4, 4);
  rect(4, -188, 4, 4);
  rect(4, -192, 4, 4);
  rect(4, -196, 4, 4);
  rect(4, -200, 4, 4);
  rect(4, -204, 4, 4);
  rect(4, -208, 4, 4);
  rect(4, -212, 4, 4);
  rect(4, -216, 4, 4);
  rect(4, -220, 4, 4);
  rect(4, -224, 4, 4);
  rect(4, -228, 4, 4);
  rect(4, -232, 4, 4);
  rect(4, -236, 4, 4);
  rect(4, -240, 4, 4);
  rect(4, -244, 4, 4);
  rect(4, -248, 4, 4);
  rect(4, -252, 4, 4);
  rect(4, -256, 4, 4);

  rect(8, -88, 4, 4);
  rect(8, -92, 4, 4);
  rect(8, -96, 4, 4);
  rect(8, -100, 4, 4);
  rect(8, -104, 4, 4);
  rect(8, -108, 4, 4);
  rect(8, -112, 4, 4);
  rect(8, -116, 4, 4);
  rect(8, -120, 4, 4);
  rect(8, -124, 4, 4);
  rect(8, -128, 4, 4);
  rect(8, -132, 4, 4);
  rect(8, -136, 4, 4);
  rect(8, -140, 4, 4);
  rect(8, -144, 4, 4);
  rect(8, -148, 4, 4);
  rect(8, -152, 4, 4);
  rect(8, -156, 4, 4);
  rect(8, -160, 4, 4);
  rect(8, -164, 4, 4);
  rect(8, -168, 4, 4);
  rect(8, -172, 4, 4);
  rect(8, -176, 4, 4);
  rect(8, -180, 4, 4);
  rect(8, -184, 4, 4);
  rect(8, -188, 4, 4);
  rect(8, -192, 4, 4);
  rect(8, -196, 4, 4);
  rect(8, -200, 4, 4);
  rect(8, -204, 4, 4);
  rect(8, -208, 4, 4);
  rect(8, -212, 4, 4);
  rect(8, -216, 4, 4);
  rect(8, -220, 4, 4);
  rect(8, -224, 4, 4);
  rect(8, -228, 4, 4);
  rect(8, -232, 4, 4);
  rect(8, -236, 4, 4);
  rect(8, -240, 4, 4);
  rect(8, -244, 4, 4);
  rect(8, -248, 4, 4);
  rect(8, -252, 4, 4);
  rect(8, -256, 4, 4);

  rect(12, -92, 4, 4);
  rect(12, -96, 4, 4);
  rect(12, -100, 4, 4);
  rect(12, -104, 4, 4);
  rect(12, -108, 4, 4);
  rect(12, -112, 4, 4);
  rect(12, -116, 4, 4);
  rect(12, -120, 4, 4);
  rect(12, -124, 4, 4);
  rect(12, -128, 4, 4);
  rect(12, -132, 4, 4);
  rect(12, -136, 4, 4);
  rect(12, -140, 4, 4);
  rect(12, -144, 4, 4);
  rect(12, -148, 4, 4);
  rect(12, -152, 4, 4);
  rect(12, -156, 4, 4);
  rect(12, -160, 4, 4);
  rect(12, -164, 4, 4);
  rect(12, -168, 4, 4);
  rect(12, -172, 4, 4);
  rect(12, -176, 4, 4);
  rect(12, -180, 4, 4);
  rect(12, -184, 4, 4);
  rect(12, -188, 4, 4);
  rect(12, -192, 4, 4);
  rect(12, -196, 4, 4);
  rect(12, -200, 4, 4);
  rect(12, -204, 4, 4);
  rect(12, -208, 4, 4);
  rect(12, -212, 4, 4);
  rect(12, -216, 4, 4);
  rect(12, -220, 4, 4);
  rect(12, -224, 4, 4);
  rect(12, -228, 4, 4);
  rect(12, -232, 4, 4);
  rect(12, -236, 4, 4);
  rect(12, -240, 4, 4);
  rect(12, -244, 4, 4);
  rect(12, -248, 4, 4);
  rect(12, -252, 4, 4);
  rect(12, -256, 4, 4);

  rect(16, -128, 4, 4);
  rect(16, -132, 4, 4);
  rect(16, -136, 4, 4);
  rect(16, -140, 4, 4);
  rect(16, -144, 4, 4);
  rect(16, -148, 4, 4);
  rect(16, -152, 4, 4);
  rect(16, -156, 4, 4);
  rect(16, -160, 4, 4);
  rect(16, -164, 4, 4);
  rect(16, -168, 4, 4);
  rect(16, -172, 4, 4);
  rect(16, -176, 4, 4);
  rect(16, -180, 4, 4);
  rect(16, -184, 4, 4);
  rect(16, -188, 4, 4);
  rect(16, -192, 4, 4);
  rect(16, -196, 4, 4);
  rect(16, -200, 4, 4);
  rect(16, -204, 4, 4);
  rect(16, -208, 4, 4);
  rect(16, -212, 4, 4);
  rect(16, -216, 4, 4);
  rect(16, -220, 4, 4);
  rect(16, -224, 4, 4);
  rect(16, -228, 4, 4);
  rect(16, -232, 4, 4);
  rect(16, -236, 4, 4);
  rect(16, -240, 4, 4);
  rect(16, -244, 4, 4);
  rect(16, -248, 4, 4);
  rect(16, -252, 4, 4);
  rect(16, -256, 4, 4);

  rect(20, -148, 4, 4);
  rect(20, -152, 4, 4);
  rect(20, -156, 4, 4);
  rect(20, -160, 4, 4);
  rect(20, -164, 4, 4);
  rect(20, -168, 4, 4);
  rect(20, -172, 4, 4);
  rect(20, -176, 4, 4);
  rect(20, -180, 4, 4);
  rect(20, -184, 4, 4);
  rect(20, -188, 4, 4);
  rect(20, -192, 4, 4);
  rect(20, -196, 4, 4);
  rect(20, -200, 4, 4);
  rect(20, -204, 4, 4);
  rect(20, -208, 4, 4);
  rect(20, -212, 4, 4);
  rect(20, -216, 4, 4);
  rect(20, -220, 4, 4);
  rect(20, -224, 4, 4);
  rect(20, -228, 4, 4);
  rect(20, -232, 4, 4);
  rect(20, -236, 4, 4);
  rect(20, -240, 4, 4);
  rect(20, -244, 4, 4);
  rect(20, -248, 4, 4);
  rect(20, -252, 4, 4);

  rect(24, -152, 4, 4);
  rect(24, -156, 4, 4);
  rect(24, -160, 4, 4);
  rect(24, -164, 4, 4);
  rect(24, -168, 4, 4);
  rect(24, -172, 4, 4);
  rect(24, -176, 4, 4);
  rect(24, -180, 4, 4);
  rect(24, -184, 4, 4);
  rect(24, -188, 4, 4);
  rect(24, -192, 4, 4);
  rect(24, -196, 4, 4);
  rect(24, -200, 4, 4);
  rect(24, -204, 4, 4);
  rect(24, -208, 4, 4);
  rect(24, -212, 4, 4);
  rect(24, -216, 4, 4);
  rect(24, -220, 4, 4);
  rect(24, -224, 4, 4);
  rect(24, -228, 4, 4);
  rect(24, -232, 4, 4);
  rect(24, -236, 4, 4);
  rect(24, -240, 4, 4);
  rect(24, -244, 4, 4);

  rect(28, -148, 4, 4);
  rect(28, -152, 4, 4);
  rect(28, -156, 4, 4);
  rect(28, -160, 4, 4);
  rect(28, -164, 4, 4);
  rect(28, -168, 4, 4);
  rect(28, -172, 4, 4);
  rect(28, -176, 4, 4);
  rect(28, -180, 4, 4);
  rect(28, -184, 4, 4);
  rect(28, -188, 4, 4);
  rect(28, -192, 4, 4);
  rect(28, -196, 4, 4);
  rect(28, -200, 4, 4);
  rect(28, -204, 4, 4);
  rect(28, -208, 4, 4);
  rect(28, -212, 4, 4);
  rect(28, -216, 4, 4);
  rect(28, -220, 4, 4);
  rect(28, -224, 4, 4);
  rect(28, -228, 4, 4);
  rect(28, -232, 4, 4);
  rect(28, -236, 4, 4);
  rect(28, -240, 4, 4);
  rect(28, -244, 4, 4);

  rect(32, -132, 4, 4);
  rect(32, -136, 4, 4);
  rect(32, -140, 4, 4);
  rect(32, -144, 4, 4);
  rect(32, -148, 4, 4);
  rect(32, -152, 4, 4);
  rect(32, -156, 4, 4);
  rect(32, -160, 4, 4);
  rect(32, -164, 4, 4);
  rect(32, -168, 4, 4);
  rect(32, -172, 4, 4);
  rect(32, -176, 4, 4);
  rect(32, -180, 4, 4);
  rect(32, -184, 4, 4);
  rect(32, -188, 4, 4);
  rect(32, -192, 4, 4);
  rect(32, -196, 4, 4);
  rect(32, -200, 4, 4);
  rect(32, -204, 4, 4);
  rect(32, -208, 4, 4);
  rect(32, -212, 4, 4);
  rect(32, -216, 4, 4);
  rect(32, -220, 4, 4);
  rect(32, -224, 4, 4);
  rect(32, -228, 4, 4);
  rect(32, -232, 4, 4);
  rect(32, -236, 4, 4);

  rect(36, -132, 4, 4);
  rect(36, -136, 4, 4);
  rect(36, -140, 4, 4);
  rect(36, -144, 4, 4);
  rect(36, -148, 4, 4);
  rect(36, -152, 4, 4);
  rect(36, -156, 4, 4);
  rect(36, -160, 4, 4);
  rect(36, -164, 4, 4);
  rect(36, -168, 4, 4);
  rect(36, -172, 4, 4);
  rect(36, -176, 4, 4);
  rect(36, -180, 4, 4);
  rect(36, -184, 4, 4);
  rect(36, -188, 4, 4);
  rect(36, -192, 4, 4);
  rect(36, -196, 4, 4);
  rect(36, -200, 4, 4);
  rect(36, -204, 4, 4);
  rect(36, -208, 4, 4);

  //Fill left of 0
  rect(-4, -48, 4, 4);
  rect(-4, -52, 4, 4);
  rect(-4, -56, 4, 4);
  rect(-4, -60, 4, 4);
  rect(-4, -64, 4, 4);
  rect(-4, -68, 4, 4);
  rect(-4, -72, 4, 4);
  rect(-4, -76, 4, 4);
  rect(-4, -80, 4, 4);
  rect(-4, -84, 4, 4);
  rect(-4, -88, 4, 4);
  rect(-4, -92, 4, 4);
  rect(-4, -96, 4, 4);
  rect(-4, -100, 4, 4);
  rect(-4, -104, 4, 4);
  rect(-4, -108, 4, 4);
  rect(-4, -112, 4, 4);
  rect(-4, -116, 4, 4);
  rect(-4, -120, 4, 4);
  rect(-4, -124, 4, 4);
  rect(-4, -128, 4, 4);
  rect(-4, -132, 4, 4);
  rect(-4, -136, 4, 4);
  rect(-4, -140, 4, 4);
  rect(-4, -144, 4, 4);
  rect(-4, -148, 4, 4);
  rect(-4, -152, 4, 4);
  rect(-4, -156, 4, 4);
  rect(-4, -160, 4, 4);
  rect(-4, -164, 4, 4);
  rect(-4, -168, 4, 4);
  rect(-4, -172, 4, 4);
  rect(-4, -176, 4, 4);
  rect(-4, -180, 4, 4);
  rect(-4, -184, 4, 4);
  rect(-4, -188, 4, 4);
  rect(-4, -192, 4, 4);
  rect(-4, -196, 4, 4);
  rect(-4, -200, 4, 4);
  rect(-4, -204, 4, 4);
  rect(-4, -208, 4, 4);
  rect(-4, -212, 4, 4);
  rect(-4, -216, 4, 4);
  rect(-4, -220, 4, 4);
  rect(-4, -224, 4, 4);
  rect(-4, -228, 4, 4);
  rect(-4, -232, 4, 4);
  rect(-4, -236, 4, 4);
  rect(-4, -240, 4, 4);
  rect(-4, -244, 4, 4);
  rect(-4, -248, 4, 4);
  rect(-4, -252, 4, 4);
  rect(-4, -256, 4, 4);

  rect(-8, -112, 4, 4);
  rect(-8, -116, 4, 4);
  rect(-8, -120, 4, 4);
  rect(-8, -124, 4, 4);
  rect(-8, -128, 4, 4);
  rect(-8, -132, 4, 4);
  rect(-8, -136, 4, 4);
  rect(-8, -140, 4, 4);
  rect(-8, -144, 4, 4);
  rect(-8, -148, 4, 4);
  rect(-8, -152, 4, 4);
  rect(-8, -156, 4, 4);
  rect(-8, -160, 4, 4);
  rect(-8, -164, 4, 4);
  rect(-8, -168, 4, 4);
  rect(-8, -172, 4, 4);
  rect(-8, -176, 4, 4);
  rect(-8, -180, 4, 4);
  rect(-8, -184, 4, 4);
  rect(-8, -188, 4, 4);
  rect(-8, -192, 4, 4);
  rect(-8, -196, 4, 4);
  rect(-8, -200, 4, 4);
  rect(-8, -204, 4, 4);
  rect(-8, -208, 4, 4);
  rect(-8, -212, 4, 4);
  rect(-8, -216, 4, 4);
  rect(-8, -220, 4, 4);
  rect(-8, -224, 4, 4);
  rect(-8, -228, 4, 4);
  rect(-8, -232, 4, 4);
  rect(-8, -236, 4, 4);
  rect(-8, -240, 4, 4);
  rect(-8, -244, 4, 4);
  rect(-8, -248, 4, 4);
  rect(-8, -252, 4, 4);
  rect(-8, -256, 4, 4);

  rect(-12, -124, 4, 4);
  rect(-12, -128, 4, 4);
  rect(-12, -132, 4, 4);
  rect(-12, -136, 4, 4);
  rect(-12, -140, 4, 4);
  rect(-12, -144, 4, 4);
  rect(-12, -148, 4, 4);
  rect(-12, -152, 4, 4);
  rect(-12, -156, 4, 4);
  rect(-12, -160, 4, 4);
  rect(-12, -164, 4, 4);
  rect(-12, -168, 4, 4);
  rect(-12, -172, 4, 4);
  rect(-12, -176, 4, 4);
  rect(-12, -180, 4, 4);
  rect(-12, -184, 4, 4);
  rect(-12, -188, 4, 4);
  rect(-12, -192, 4, 4);
  rect(-12, -196, 4, 4);
  rect(-12, -200, 4, 4);
  rect(-12, -204, 4, 4);
  rect(-12, -208, 4, 4);
  rect(-12, -212, 4, 4);
  rect(-12, -216, 4, 4);
  rect(-12, -220, 4, 4);
  rect(-12, -224, 4, 4);
  rect(-12, -228, 4, 4);
  rect(-12, -232, 4, 4);
  rect(-12, -236, 4, 4);
  rect(-12, -240, 4, 4);
  rect(-12, -244, 4, 4);
  rect(-12, -248, 4, 4);
  rect(-12, -252, 4, 4);
  rect(-12, -256, 4, 4);


  rect(-16, -156, 4, 4);
  rect(-16, -160, 4, 4);
  rect(-16, -164, 4, 4);
  rect(-16, -168, 4, 4);
  rect(-16, -172, 4, 4);
  rect(-16, -176, 4, 4);
  rect(-16, -180, 4, 4);
  rect(-16, -184, 4, 4);
  rect(-16, -188, 4, 4);
  rect(-16, -192, 4, 4);
  rect(-16, -196, 4, 4);
  rect(-16, -200, 4, 4);
  rect(-16, -204, 4, 4);
  rect(-16, -208, 4, 4);
  rect(-16, -212, 4, 4);
  rect(-16, -216, 4, 4);
  rect(-16, -220, 4, 4);
  rect(-16, -224, 4, 4);
  rect(-16, -228, 4, 4);
  rect(-16, -232, 4, 4);
  rect(-16, -236, 4, 4);
  rect(-16, -240, 4, 4);
  rect(-16, -244, 4, 4);
  rect(-16, -248, 4, 4);
  rect(-16, -252, 4, 4);

  rect(-20, -164, 4, 4);
  rect(-20, -168, 4, 4);
  rect(-20, -172, 4, 4);
  rect(-20, -176, 4, 4);
  rect(-20, -180, 4, 4);
  rect(-20, -184, 4, 4);
  rect(-20, -188, 4, 4);
  rect(-20, -192, 4, 4);
  rect(-20, -196, 4, 4);
  rect(-20, -200, 4, 4);
  rect(-20, -204, 4, 4);
  rect(-20, -208, 4, 4);
  rect(-20, -212, 4, 4);
  rect(-20, -216, 4, 4);
  rect(-20, -220, 4, 4);
  rect(-20, -224, 4, 4);
  rect(-20, -228, 4, 4);
  rect(-20, -232, 4, 4);
  rect(-20, -236, 4, 4);
  rect(-20, -240, 4, 4);
  rect(-20, -244, 4, 4);
  rect(-20, -248, 4, 4);

  rect(-24, -168, 4, 4);
  rect(-24, -172, 4, 4);
  rect(-24, -176, 4, 4);
  rect(-24, -180, 4, 4);
  rect(-24, -184, 4, 4);
  rect(-24, -188, 4, 4);
  rect(-24, -192, 4, 4);
  rect(-24, -196, 4, 4);
  rect(-24, -200, 4, 4);
  rect(-24, -204, 4, 4);
  rect(-24, -208, 4, 4);
  rect(-24, -212, 4, 4);
  rect(-24, -216, 4, 4);
  rect(-24, -220, 4, 4);
  rect(-24, -224, 4, 4);
  rect(-24, -228, 4, 4);
  rect(-24, -232, 4, 4);
  rect(-24, -236, 4, 4);
  rect(-24, -240, 4, 4);

  rect(-28, -168, 4, 4);
  rect(-28, -172, 4, 4);
  rect(-28, -176, 4, 4);
  rect(-28, -180, 4, 4);
  rect(-28, -184, 4, 4);
  rect(-28, -188, 4, 4);
  rect(-28, -192, 4, 4);
  rect(-28, -196, 4, 4);
  rect(-28, -200, 4, 4);
  rect(-28, -204, 4, 4);
  rect(-28, -208, 4, 4);
  rect(-28, -212, 4, 4);
  rect(-28, -216, 4, 4);
  rect(-28, -220, 4, 4);
  rect(-28, -224, 4, 4);
  rect(-28, -228, 4, 4);
  rect(-28, -232, 4, 4);
  rect(-28, -236, 4, 4);

  rect(-32, -164, 4, 4);
  rect(-32, -168, 4, 4);
  rect(-32, -172, 4, 4);
  rect(-32, -176, 4, 4);
  rect(-32, -180, 4, 4);
  rect(-32, -184, 4, 4);
  rect(-32, -188, 4, 4);
  rect(-32, -192, 4, 4);
  rect(-32, -196, 4, 4);
  rect(-32, -200, 4, 4);
  rect(-32, -204, 4, 4);
  rect(-32, -208, 4, 4);
  rect(-32, -212, 4, 4);
  rect(-32, -216, 4, 4);
  rect(-32, -220, 4, 4);
  rect(-32, -224, 4, 4);
  rect(-32, -228, 4, 4);
  rect(-32, -232, 4, 4);
  rect(-32, -236, 4, 4);

  rect(-36, -156, 4, 4);
  rect(-36, -160, 4, 4);
  rect(-36, -164, 4, 4);
  rect(-36, -168, 4, 4);
  rect(-36, -172, 4, 4);
  rect(-36, -176, 4, 4);
  rect(-36, -180, 4, 4);
  rect(-36, -184, 4, 4);
  rect(-36, -188, 4, 4);
  rect(-36, -192, 4, 4);
  rect(-36, -196, 4, 4);
  rect(-36, -200, 4, 4);
  rect(-36, -204, 4, 4);
  rect(-36, -208, 4, 4);
  rect(-36, -212, 4, 4);
  rect(-36, -216, 4, 4);

  rect(-40, -144, 4, 4);
  rect(-40, -148, 4, 4);
  rect(-40, -152, 4, 4);
  rect(-40, -156, 4, 4);

  //Eye outside
  fill(155);
  rect(-4, -188, 4, 4);
  rect(0, -188, 4, 4);

  rect(-4, -192, 4, 4);
  rect(0, -192, 4, 4);
  rect(4, -192, 4, 4);

  rect(-4, -196, 4, 4);
  rect(0, -196, 4, 4);
  rect(4, -196, 4, 4);
  rect(8, -196, 4, 4);

  rect(-8, -216, 20, 20);

  rect(-4, -220, 4, 4);
  rect(0, -220, 4, 4);
  rect(4, -220, 4, 4);

  rect(0, -224, 4, 4);
  rect(4, -224, 4, 4);

  //Eye Inside
  fill(128);
  rect(-4, -212, 12, 12);

  rect(0, -200, 4, 4);
  rect(4, -200, 4, 4);
  popMatrix();
}

void here() {
  rectMode(CORNER);

  pushMatrix();
  translate(hereX, hereY);
  noStroke();
  scale(hereScale);
  //dark blue outlines
  fill(19, 34, 166);
  //main outline
  rect(-14, -42, 32, 4);
  rect(18, -38, 8, 4);
  rect(26, -34, 4, 4);
  rect(34, -34, 4, 4);
  rect(30, -30, 4, 8);
  rect(34, -22, 4, 16);
  rect(38, -22, 4, 4);
  rect(38, -6, 4, 12);
  rect(34, 6, 4, 4);
  rect(30, 10, 4, 4);
  rect(26, 34, 4, 8);
  rect(30, 42, 4, 12);
  rect(22, 54, 8, 4);
  rect(14, 34, 4, 8);
  rect(18, 42, 4, 32);
  rect(10, 74, 8, 4);
  rect(6, 62, 4, 12);
  rect(-2, 62, 8, 4);
  rect(-6, 62, 4, 12);
  rect(-14, 74, 8, 4);
  rect(-18, 42, 4, 32);
  rect(-14, 34, 4, 8);
  rect(-26, 34, 4, 8);
  rect(-30, 42, 4, 12);
  rect(-26, 54, 8, 4);
  rect(-30, 10, 4, 4);
  rect(-34, 6, 4, 4);
  rect(-38, -6, 4, 12);
  rect(-34, -14, 4, 8);
  rect(-38, -26, 4, 12);
  rect(-42, -26, 4, 4);
  rect(-34, -30, 4, 4);
  rect(-30, -34, 8, 4);
  rect(-22, -38, 8, 4);
  rect(-26, -42, 4, 4);
  rect(-10, 30, 4, 4);
  rect(10, 30, 4, 4);

  //hair and face outlines
  //top of face
  rect(-30, -6, 4, 8);
  rect(-26, -2, 4, 16);
  rect(-22, -2, 4, 4);
  rect(-18, -6, 4, 4);
  rect(-14, -10, 8, 4);
  rect(-6, -6, 4, 8);
  rect(-2, 2, 4, 4);
  rect(2, -2, 4, 4);
  rect(6, -6, 4, 4);
  rect(10, -10, 8, 4);
  rect(18, -6, 4, 4);
  rect(22, -2, 4, 4);
  rect(26, 2, 4, 12);
  rect(30, -6, 4, 8);

  //bottom of face and shirt
  rect(-22, 14, 4, 4);
  rect(-18, 18, 4, 4);
  rect(-14, 22, 32, 4);
  rect(18, 18, 4, 4);
  rect(22, 14, 4, 4);
  rect(-18, 26, 4, 4);
  rect(-22, 30, 4, 4);
  rect(18, 26, 4, 4);
  rect(22, 30, 4, 4);

  //skin colour
  //face and ears
  fill(233, 208, 255);
  rect(-34, -6, 4, 12);
  rect(-30, 2, 4, 8);
  rect(-22, 2, 4, 12);
  rect(-18, -2, 4, 16);
  rect(-14, -6, 4, 8);
  rect(-14, 18, 4, 4);
  rect(-10, -6, 4, 28);
  rect(-6, 2, 4, 20);
  rect(-2, 6, 4, 16);
  rect(2, 2, 4, 20);
  rect(6, -2, 4, 24);
  rect(10, -6, 4, 28);
  rect(14, -6, 4, 8);
  rect(14, 18, 4, 4);
  rect(18, -2, 4, 16);
  rect(22, 2, 4, 12);
  rect(30, 2, 4, 8);
  rect(34, -6, 4, 12);

  //neck, arms, legs
  rect(-26, 50, 8, 4);
  rect(22, 50, 8, 4);
  rect(-14, 70, 8, 4);
  rect(10, 70, 8, 4);

  //eyes
  fill(19, 34, 166);
  rect(-14, 2, 4, 12);
  rect(14, 2, 4, 12);

  //blush
  fill(191, 146, 231);
  rect(-18, 14, 8, 4);
  rect(14, 14, 8, 4);

  //hair
  fill(99, 40, 152);
  rect(-34, -26, 4, 12);
  rect(-30, -30, 4, 8);
  rect(-30, -14, 4, 8);
  rect(-26, -30, 4, 4);
  rect(-26, -22, 4, 20);
  rect(-22, -34, 4, 16);
  rect(-22, -14, 4, 12);
  rect(-18, -34, 4, 12);
  rect(-18, -18, 4, 12);
  rect(-14, -38, 4, 20);
  rect(-14, -14, 4, 4);
  rect(-10, -38, 4, 28);
  rect(-6, -38, 4, 20);
  rect(-6, -14, 4, 8);
  rect(-2, -38, 4, 40);
  rect(2, -38, 4, 36);
  rect(6, -38, 8, 20);
  rect(6, -14, 4, 8);
  rect(10, -14, 4, 4);
  rect(14, -38, 4, 28);
  rect(18, -34, 4, 16);
  rect(18, -14, 4, 8);
  rect(22, -34, 4, 32);
  rect(26, -30, 4, 32);
  rect(30, -14, 4, 8);

  //shadows from hair
  fill(129, 87, 167);
  rect(-30, -22, 4, 8);
  rect(-26, -26, 4, 4);
  rect(-22, -18, 4, 4);
  rect(-18, -22, 4, 4);
  rect(-14, -18, 4, 4);
  rect(-6, -18, 4, 4);
  rect(6, -18, 8, 4);
  rect(18, -18, 4, 4);
  rect(26, -26, 4, 4);
  rect(30, -22, 4, 8);

  //shirt
  //blue
  fill(116, 130, 247);
  rect(-14, 26, 4, 4);
  rect(-18, 30, 4, 4);
  rect(-22, 34, 4, 8);
  rect(-26, 42, 4, 8);
  rect(-14, 42, 4, 8);
  rect(-14, 54, 4, 12);
  rect(-6, 26, 4, 28);
  rect(-6, 58, 4, 4);
  rect(-2, 30, 4, 4);
  rect(-2, 38, 4, 4);
  rect(-2, 46, 4, 4);
  rect(6, 58, 4, 4);
  rect(6, 26, 4, 28);
  rect(14, 54, 4, 12);
  rect(14, 42, 4, 8);
  rect(14, 26, 4, 4);
  rect(18, 30, 4, 4);
  rect(22, 34, 4, 8);
  rect(26, 42, 4, 8);
  //white
  fill(255);
  rect(-10, 26, 4, 4);
  rect(-14, 30, 4, 4);
  rect(-18, 34, 4, 8);
  rect(-22, 42, 4, 8);
  rect(-10, 34, 4, 20);
  rect(-10, 58, 4, 8);
  rect(-2, 58, 8, 4);
  rect(-2, 26, 4, 4);
  rect(-2, 34, 4, 4);
  rect(-2, 42, 4, 4);
  rect(-2, 50, 4, 4);
  rect(2, 26, 4, 28);
  rect(10, 58, 4, 8);
  rect(10, 34, 4, 20);
  rect(10, 26, 4, 4);
  rect(14, 30, 4, 4);
  rect(18, 34, 4, 8);
  rect(22, 42, 4, 8);

  //shirt shadows
  fill(76, 87, 184);
  rect(-14, 50, 4, 4);
  rect(-10, 54, 24, 4);
  rect(14, 50, 4, 4);
  rect(-14, 66, 8, 4);
  rect(10, 66, 8, 4);
  popMatrix();
}

void cel() {
  rectMode(CORNER);
  pushMatrix();
  translate(celX, celY);
  scale(celScale);
  noStroke();
  //dark blue outlines
  fill(19, 34, 166);
  //main outline
  rect(-14, -42, 32, 4);
  rect(18, -38, 8, 4);
  rect(26, -34, 4, 4);
  rect(30, -30, 4, 8);
  rect(34, -22, 4, 16);
  rect(38, -6, 4, 12);
  rect(34, 6, 4, 4);
  rect(30, 10, 4, 4);
  rect(26, 34, 4, 4);
  rect(30, 38, 4, 8);
  rect(22, 46, 8, 4);
  rect(14, 34, 4, 4);
  rect(18, 38, 4, 32);
  rect(10, 70, 8, 4);
  rect(6, 58, 4, 12);
  rect(-2, 54, 8, 4);
  rect(-6, 58, 4, 12);
  rect(-14, 70, 8, 4);
  rect(-18, 38, 4, 32);
  rect(-14, 34, 4, 4);
  rect(-26, 46, 8, 4);
  rect(-30, 38, 4, 8);
  rect(-26, 34, 4, 4);
  rect(-30, 10, 4, 4);
  rect(-34, 6, 4, 4);
  rect(-38, -6, 4, 12);
  rect(-34, -22, 4, 16);
  rect(-30, -30, 4, 8);
  rect(-26, -34, 4, 4);
  rect(-22, -38, 8, 4);
  rect(-10, 26, 4, 8);
  rect(10, 26, 4, 8);

  //hair and face outlines
  //top of face
  rect(-30, -6, 4, 8);
  rect(-26, 2, 4, 12);
  rect(-22, 2, 4, 4);
  rect(-18, -2, 4, 4);
  rect(-14, -6, 8, 4);
  rect(-6, -10, 4, 4);
  rect(-2, -6, 4, 12);
  rect(2, -2, 4, 4);
  rect(6, -6, 4, 4);
  rect(10, -10, 4, 4);
  rect(14, -6, 4, 4);
  rect(18, -2, 4, 4);
  rect(22, 2, 4, 4);
  rect(26, 2, 4, 12);
  rect(30, -6, 4, 8);

  //bottom of face and shirt
  rect(-22, 14, 4, 4);
  rect(-18, 18, 4, 4);
  rect(-14, 22, 32, 4);
  rect(18, 18, 4, 4);
  rect(22, 14, 4, 4);
  rect(-18, 26, 4, 4);
  rect(-22, 30, 4, 4);
  rect(18, 26, 4, 4);
  rect(22, 30, 4, 4);

  //skin colour
  //face
  fill(233, 208, 255);
  rect(-34, -6, 4, 12);
  rect(-30, 2, 4, 8);
  rect(-22, 6, 4, 8);
  rect(-18, 2, 4, 12);
  rect(-14, -2, 4, 4);
  rect(-14, 18, 4, 4);
  rect(-10, -2, 4, 24);
  rect(-6, -6, 4, 28);
  rect(-2, 6, 4, 16);
  rect(2, 2, 4, 20);
  rect(6, -2, 4, 24);
  rect(10, -6, 4, 28);
  rect(14, -2, 4, 4);
  rect(14, 18, 4, 4);
  rect(18, 2, 4, 12);
  rect(22, 6, 4, 8);
  rect(30, 2, 4, 8);
  rect(34, -6, 4, 12);

  //neck, arms, legs
  rect(-18, 30, 4, 8);
  rect(-14, 26, 4, 8);
  rect(-22, 34, 4, 4);
  rect(-26, 38, 8, 8);
  rect(18, 30, 4, 8);
  rect(14, 26, 4, 8);
  rect(22, 34, 4, 4);
  rect(22, 38, 8, 8);
  rect(-14, 58, 8, 12);
  rect(10, 58, 8, 12);

  //eyes
  fill(107, 24, 197);
  rect(-14, 2, 4, 12);
  rect(14, 2, 4, 12);

  //blush
  fill(170, 127, 208);
  rect(-18, 14, 8, 4);
  rect(14, 14, 8, 4);

  //hair
  fill(209, 158, 255);
  rect(-30, -14, 4, 8);
  rect(-26, -30, 4, 4);
  rect(-26, -22, 4, 24);
  rect(-22, -34, 4, 16);
  rect(-22, -14, 4, 16);
  rect(-18, -34, 4, 12);
  rect(-18, -18, 4, 16);
  rect(-14, -38, 4, 20);
  rect(-14, -14, 4, 8);
  rect(-10, -38, 4, 32);
  rect(-6, -38, 4, 20);
  rect(-6, -14, 4, 4);
  rect(-2, -38, 4, 32);
  rect(2, -38, 4, 36);
  rect(6, -38, 8, 20);
  rect(6, -14, 4, 8);
  rect(10, -14, 4, 4);
  rect(14, -38, 4, 32);
  rect(18, -34, 4, 16);
  rect(18, -14, 4, 12);
  rect(22, -34, 4, 36);
  rect(26, -30, 4, 32);
  rect(30, -14, 4, 8);

  //shadows from hair
  fill(170, 127, 208);
  rect(-30, -22, 4, 8);
  rect(-26, -26, 4, 4);
  rect(-22, -18, 4, 4);
  rect(-18, -22, 4, 4);
  rect(-14, -18, 4, 4);
  rect(-6, -18, 4, 4);
  rect(6, -18, 8, 4);
  rect(18, -18, 4, 4);
  rect(26, -26, 4, 4);
  rect(30, -22, 4, 8);

  //shirt
  //blue
  fill(159, 184, 218);
  rect(-6, 26, 4, 4);
  rect(-2, 30, 4, 4);
  rect(6, 30, 4, 4);
  rect(-6, 34, 4, 4);
  rect(2, 34, 4, 4);
  rect(10, 34, 4, 4);
  rect(-10, 38, 4, 4);
  rect(-2, 38, 4, 4);
  rect(6, 38, 4, 4);
  rect(14, 38, 4, 4);
  rect(-6, 42, 4, 4);
  rect(2, 42, 4, 4);
  rect(10, 42, 4, 4);

  //pink
  fill(255, 161, 248);
  rect(6, 26, 4, 4);
  rect(-6, 30, 4, 4);
  rect(2, 30, 4, 4);
  rect(-10, 34, 4, 4);
  rect(-2, 34, 4, 4);
  rect(6, 34, 4, 4);
  rect(-14, 38, 4, 4);
  rect(-6, 38, 4, 4);
  rect(2, 38, 4, 4);
  rect(10, 38, 4, 4);
  rect(-10, 42, 4, 4);
  rect(-2, 42, 4, 4);
  rect(6, 42, 4, 4);

  //pants
  fill(90, 129, 183);
  rect(-14, 46, 4, 8);
  rect(-10, 50, 8, 4);
  rect(6, 50, 8, 4);
  rect(14, 46, 4, 8);

  //shadow
  fill(56, 87, 130);
  rect(-2, 26, 8, 4);
  rect(-14, 42, 4, 4);
  rect(-10, 46, 24, 4);
  rect(14, 42, 4, 4);
  rect(-14, 54, 12, 4);
  rect(-2, 50, 8, 4);
  rect(6, 54, 12, 4);
  popMatrix();
}

void arby() {
  rectMode(CORNER);

  pushMatrix();
  translate(arbyX, arbyY);
  noStroke();
  scale(arbyScale);
  //dark blue outlines
  fill(19, 34, 166);
  //main outline
  rect(-14, -42, 20, 4);
  rect(2, -38, 4, 8);
  rect(6, -30, 8, 4);
  rect(14, -26, 8, 4);
  rect(22, -30, 8, 4);
  rect(6, -46, 4, 4);
  rect(10, -42, 4, 4);
  rect(14, -38, 8, 4);
  rect(22, -42, 4, 4);
  rect(26, -46, 4, 4);
  rect(30, -42, 4, 20);
  rect(34, -22, 4, 16);
  rect(38, -6, 4, 12);
  rect(34, 6, 4, 4);
  rect(30, 10, 4, 24);
  rect(26, 34, 4, 4);
  rect(30, 38, 4, 8);
  rect(22, 46, 8, 4);
  rect(14, 34, 4, 4);
  rect(18, 38, 4, 32);
  rect(10, 70, 8, 4);
  rect(6, 62, 4, 8);
  rect(-6, 62, 4, 8);
  rect(-14, 70, 8, 4);
  rect(-18, 38, 4, 32);
  rect(-14, 34, 4, 4);
  rect(-26, 46, 8, 4);
  rect(-30, 38, 4, 8);
  rect(-26, 34, 4, 4);
  rect(-30, 10, 4, 24);
  rect(-34, 6, 4, 4);
  rect(-38, -6, 4, 12);
  rect(-34, -22, 4, 16);
  rect(-30, -30, 4, 8);
  rect(-26, -34, 4, 4);
  rect(-22, -38, 8, 4);

  //hair and face outlines
  //top of face
  rect(-26, 6, 4, 8);
  rect(-22, 2, 4, 4);
  rect(-18, -2, 4, 4);
  rect(-14, -6, 8, 4);
  rect(-6, -10, 4, 4);
  rect(-2, -6, 4, 12);
  rect(2, -2, 4, 4);
  rect(6, -6, 4, 4);
  rect(10, -10, 4, 4);
  rect(14, -6, 4, 4);
  rect(18, -2, 4, 4);
  rect(22, 2, 4, 4);
  rect(26, 6, 4, 8);

  //bottom of face and shirt
  rect(-22, 14, 4, 4);
  rect(-18, 18, 4, 4);
  rect(-14, 22, 32, 4);
  rect(18, 18, 4, 4);
  rect(22, 14, 4, 4);
  rect(-18, 26, 4, 4);
  rect(-22, 30, 4, 4);
  rect(18, 26, 4, 4);
  rect(22, 30, 4, 4);

  //skin colour
  //face
  fill(233, 208, 255);
  rect(-22, 6, 4, 8);
  rect(-18, 2, 4, 12);
  rect(-14, -2, 4, 4);
  rect(-14, 18, 4, 4);
  rect(-10, -2, 4, 24);
  rect(-6, -6, 4, 28);
  rect(-2, 6, 4, 16);
  rect(2, 2, 4, 20);
  rect(6, -2, 4, 24);
  rect(10, -6, 4, 28);
  rect(14, -2, 4, 4);
  rect(14, 18, 4, 4);
  rect(18, 2, 4, 12);
  rect(22, 6, 4, 8);

  //neck, arms, legs
  rect(-6, 26, 16, 4);
  rect(-2, 30, 8, 4);
  rect(-22, 34, 4, 4);
  rect(-26, 38, 8, 8);
  rect(22, 34, 4, 4);
  rect(22, 38, 8, 8);
  rect(-14, 62, 8, 8);
  rect(10, 62, 8, 8);

  //eyes
  fill(107, 24, 197);
  rect(-14, 2, 4, 12);
  rect(14, 2, 4, 12);

  //blush
  fill(240, 146, 146);
  rect(-18, 14, 8, 4);
  rect(14, 14, 8, 4);

  //hair
  //normal hair
  fill(209, 158, 255);
  rect(-26, 14, 4, 20);
  rect(-22, 18, 4, 12);
  rect(-18, 22, 4, 4);
  rect(18, 22, 4, 4);
  rect(22, 18, 4, 12);
  rect(26, 14, 4, 20);
  rect(-34, -6, 4, 12);
  rect(-30, -14, 4, 8);
  rect(-30, 2, 4, 8);
  rect(-26, -30, 4, 4);
  rect(-26, -22, 4, 28);
  rect(-22, -34, 4, 16);
  rect(-22, -14, 4, 16);
  rect(-18, -34, 4, 12);
  rect(-18, -18, 4, 16);
  rect(-14, -38, 4, 20);
  rect(-14, -14, 4, 8);
  rect(-10, -38, 4, 32);
  rect(-6, -38, 4, 20);
  rect(-6, -14, 4, 4);
  rect(-2, -38, 4, 32);
  rect(2, -30, 4, 28);
  rect(6, -26, 8, 8);
  rect(6, -14, 4, 8);
  rect(10, -14, 4, 4);
  rect(14, -22, 4, 16);
  rect(18, -22, 4, 4);
  rect(18, -14, 4, 12);
  rect(22, -26, 4, 28);
  rect(26, -22, 4, 28);
  rect(30, -14, 4, 8);
  rect(30, 2, 4, 8);
  rect(34, -6, 4, 12);

  //shadows from hair
  fill(170, 127, 208);
  rect(-30, -22, 4, 8);
  rect(-30, -6, 4, 8);
  rect(-26, -26, 4, 4);
  rect(-22, -18, 4, 4);
  rect(-18, -22, 4, 4);
  rect(-14, -18, 4, 4);
  rect(-6, -18, 4, 4);
  rect(6, -18, 8, 4);
  rect(18, -18, 4, 4);
  rect(26, -26, 4, 4);
  rect(30, -22, 4, 8);
  rect(30, -6, 4, 8);

  //bow
  fill(59, 179, 197);
  rect(6, -42, 4, 12);
  rect(10, -38, 4, 4);
  rect(14, -34, 8, 8);
  rect(22, -38, 4, 4);
  rect(26, -42, 4, 12);

  //bow shadows
  fill(59, 117, 126);
  rect(10, -34, 4, 4);
  rect(22, -34, 4, 4);

  //dress
  fill(167, 101, 147);
  rect(-18, 30, 4, 8);
  rect(-14, 26, 4, 8);
  rect(-14, 42, 4, 16);
  rect(-10, 30, 4, 28);
  rect(-6, 34, 4, 24);
  rect(-2, 38, 4, 20);
  rect(2, 38, 4, 20);
  rect(6, 34, 4, 24);
  rect(10, 30, 4, 28);
  rect(14, 26, 4, 8);
  rect(14, 42, 4, 16);
  rect(18, 30, 4, 8);

  //dress shadows
  fill(139, 86, 123);
  rect(-14, 38, 4, 4);
  rect(-10, 26, 4, 4);
  rect(-6, 30, 4, 4);
  rect(-2, 34, 8, 4);
  rect(6, 30, 4, 4);
  rect(10, 26, 4, 4);
  rect(14, 38, 4, 4);
  rect(-14, 58, 32, 4);
  popMatrix();
}

void minuteForest() {
  //Background
  background(210, 255, 221);
  strokeWeight(2);

  //Path
  stroke(255, 183, 227);
  fill(249, 229, 252);
  beginShape();
  vertex(0, 300);
  quadraticVertex(25, 300, 25, 275);
  quadraticVertex(25, 250, 50, 250); 
  vertex(100, 250);
  quadraticVertex(125, 250, 125, 225);
  quadraticVertex(125, 200, 150, 200);
  vertex(250, 200);
  quadraticVertex(275, 200, 275, 225);
  quadraticVertex(275, 250, 300, 250);
  quadraticVertex(325, 250, 325, 275);
  vertex(325, 350);
  quadraticVertex(325, 375, 300, 375);
  vertex(225, 375);
  quadraticVertex(200, 375, 200, 400);
  quadraticVertex(200, 425, 175, 425);
  quadraticVertex(150, 425, 150, 450);
  quadraticVertex(150, 475, 125, 475);
  vertex(0, 475);
  endShape();

  //Pebbles
  ellipse(225, 250, 20, 10);
  ellipse(200, 275, 20, 10);
  ellipse(100, 300, 20, 10);
  ellipse(150, 310, 20, 10);
  ellipse(185, 330, 20, 10);
  ellipse(250, 350, 20, 10);
  ellipse(125, 355, 20, 10);
  ellipse(175, 370, 20, 10);
  ellipse(60, 380, 20, 10);
  ellipse(100, 400, 20, 10);
  ellipse(50, 450, 20, 10);

  //Lake
  stroke(0, 46, 132);
  fill(0, 56, 142);
  beginShape();
  vertex(400, 500);
  quadraticVertex(420, 450, 450, 450);
  quadraticVertex(470, 450, 500, 400);
  quadraticVertex(530, 350, 600, 400);
  quadraticVertex(670, 450, 690, 470);
  quadraticVertex(710, 490, 700, 500);
  endShape();

  //Grass
  noStroke();
  fill(159, 220, 198);
  arc(100, 100, 8, 15, radians(120), radians(300));//first blade
  arc(88, 95, 8, 20, radians(270), radians(450));//second blade
  arc(80, 100, 8, 15, radians(240), radians(420));//third blade

  pushMatrix();
  translate(200, 50);
  arc(100, 100, 8, 15, radians(120), radians(300));
  arc(88, 95, 8, 20, radians(270), radians(450));
  arc(80, 100, 8, 15, radians(240), radians(420));
  popMatrix();

  pushMatrix();
  translate(400, 50);
  arc(100, 100, 8, 15, radians(120), radians(300));
  arc(88, 95, 8, 20, radians(270), radians(450));
  arc(80, 100, 8, 15, radians(240), radians(420));
  popMatrix();

  pushMatrix();
  translate(600, 100);
  arc(100, 100, 8, 15, radians(120), radians(300));
  arc(88, 95, 8, 20, radians(270), radians(450));
  arc(80, 100, 8, 15, radians(240), radians(420));
  popMatrix();

  pushMatrix();
  translate(200, 300);
  arc(100, 100, 8, 15, radians(120), radians(300));
  arc(88, 95, 8, 20, radians(270), radians(450));
  arc(80, 100, 8, 15, radians(240), radians(420));
  popMatrix();

  pushMatrix();
  translate(225, 325);
  arc(100, 100, 8, 15, radians(120), radians(300));
  arc(88, 95, 8, 20, radians(270), radians(450));
  arc(80, 100, 8, 15, radians(240), radians(420));
  popMatrix();

  //Stump Emptiness
  fill(0, 56, 142);
  stroke(90, 217, 212);
  rectMode(CENTER);
  rect(400, 280, 50, 55);

  //Stump Shape
  stroke(14, 70, 147);
  fill(255, 230, 243);
  beginShape();
  vertex(358, 250);
  vertex(350, 275);
  vertex(330, 300);
  vertex(328, 310);
  vertex(331, 312);
  vertex(335, 310);
  vertex(338, 307);
  vertex(345, 306);
  vertex(351, 308);
  vertex(352, 312);
  vertex(354, 316);
  vertex(357, 318);
  vertex(360, 316);
  vertex(364, 315);
  vertex(375, 310);
  vertex(377, 307);
  vertex(376, 301);
  vertex(380, 296);
  vertex(391, 289);
  vertex(396, 288);
  vertex(400, 289);
  vertex(404, 292);
  vertex(405, 295);
  vertex(408, 298);
  vertex(410, 300);
  vertex(413, 307);
  vertex(418, 312);
  vertex(423, 315);
  vertex(428, 318);
  vertex(431, 319);
  vertex(434, 319);
  vertex(437, 317);
  vertex(439, 314);
  vertex(438, 312);
  vertex(436, 308);
  vertex(440, 305);
  vertex(442, 303);
  vertex(476, 303);
  vertex(478, 301);
  vertex(477, 299);
  vertex(475, 297);
  vertex(472, 295);
  vertex(465, 292);
  vertex(462, 288);
  vertex(460, 286);
  vertex(457, 283);
  vertex(452, 276);
  vertex(449, 273);
  vertex(442, 250);
  endShape();

  //Stump Rainbow
  ellipseMode(CENTER);
  fill(227, 167, 237);
  stroke(14, 70, 147);
  ellipse(400, 250, 84, 28); //Pink

  fill(111, 117, 251);
  stroke(111, 117, 251);
  ellipse(400, 250, 66, 23); //Indigo

  fill(119, 235, 244);
  stroke(119, 235, 244);
  ellipse(400, 250, 52, 18); //Blue

  fill(250, 251, 160);
  stroke(250, 251, 160);
  ellipse(400, 250, 38, 13); //Yellow

  fill(244, 125, 125);
  stroke(244, 125, 125);
  ellipse(400, 250, 30, 8); //Red  

  //Stump Lines
  strokeWeight(3);
  stroke(255, 183, 227);
  line(349, 294, 373, 271);
  line(364, 294, 388, 271);
  line(427, 294, 416, 271);
  line(439, 294, 425, 271);
}

void tree() {
  //Trees
  //Stump
  fill(255, 183, 227);
  stroke(0, 56, 142);
  strokeWeight(2);
  beginShape();
  vertex(500, 250);
  vertex(501, 254);
  vertex(499, 259);
  vertex(495, 262);
  vertex(492, 264);
  vertex(493, 266);
  vertex(496, 265);
  vertex(499, 266);
  vertex(502, 268);
  vertex(504, 271);
  vertex(506, 270);
  vertex(510, 267);
  vertex(513, 266);
  vertex(517, 269);
  vertex(520, 271);
  vertex(522, 270);
  vertex(525, 267);
  vertex(524, 265);
  vertex(525, 263);
  vertex(529, 262);
  vertex(534, 264);
  vertex(536, 261);
  vertex(533, 258);
  vertex(530, 256);
  vertex(529, 254);
  vertex(528, 251);
  vertex(527, 250);
  endShape(CLOSE);

  //Leaves
  fill(54, 245, 217);
  triangle(470, 250, 557, 250, 513, 230);
  triangle(470, 240, 557, 240, 513, 220);
  triangle(470, 230, 557, 230, 513, 210);
  triangle(470, 220, 557, 220, 513, 200);
  triangle(484, 210, 543, 210, 513, 190);
}

void realWorld() {
  //Background
  background(210, 255, 221);
  strokeWeight(2);

  //Path
  stroke(255, 183, 227);
  fill(249, 229, 252);
  beginShape();
  vertex(0, 300);
  quadraticVertex(25, 300, 25, 275);
  quadraticVertex(25, 250, 50, 250); 
  vertex(100, 250);
  quadraticVertex(125, 250, 125, 225);
  quadraticVertex(125, 200, 150, 200);
  vertex(250, 200);
  quadraticVertex(275, 200, 275, 225);
  quadraticVertex(275, 250, 300, 250);
  quadraticVertex(325, 250, 325, 275);
  vertex(325, 350);
  quadraticVertex(325, 375, 300, 375);
  vertex(225, 375);
  quadraticVertex(200, 375, 200, 400);
  quadraticVertex(200, 425, 175, 425);
  quadraticVertex(150, 425, 150, 450);
  quadraticVertex(150, 475, 125, 475);
  vertex(0, 475);
  endShape();

  //Pebbles
  ellipse(225, 250, 20, 10);
  ellipse(200, 275, 20, 10);
  ellipse(100, 300, 20, 10);
  ellipse(150, 310, 20, 10);
  ellipse(185, 330, 20, 10);
  ellipse(250, 350, 20, 10);
  ellipse(125, 355, 20, 10);
  ellipse(175, 370, 20, 10);
  ellipse(60, 380, 20, 10);
  ellipse(100, 400, 20, 10);
  ellipse(50, 450, 20, 10);

  //Lake
  stroke(0, 46, 132);
  fill(0, 56, 142);
  beginShape();
  vertex(400, 500);
  quadraticVertex(420, 450, 450, 450);
  quadraticVertex(470, 450, 500, 400);
  quadraticVertex(530, 350, 600, 400);
  quadraticVertex(670, 450, 690, 470);
  quadraticVertex(710, 490, 700, 500);
  endShape();

  //Grass
  noStroke();
  fill(159, 220, 198);
  arc(100, 100, 8, 15, radians(120), radians(300));//first blade
  arc(88, 95, 8, 20, radians(270), radians(450));//second blade
  arc(80, 100, 8, 15, radians(240), radians(420));//third blade

  pushMatrix();
  translate(200, 50);
  arc(100, 100, 8, 15, radians(120), radians(300));
  arc(88, 95, 8, 20, radians(270), radians(450));
  arc(80, 100, 8, 15, radians(240), radians(420));
  popMatrix();

  pushMatrix();
  translate(400, 50);
  arc(100, 100, 8, 15, radians(120), radians(300));
  arc(88, 95, 8, 20, radians(270), radians(450));
  arc(80, 100, 8, 15, radians(240), radians(420));
  popMatrix();

  pushMatrix();
  translate(600, 100);
  arc(100, 100, 8, 15, radians(120), radians(300));
  arc(88, 95, 8, 20, radians(270), radians(450));
  arc(80, 100, 8, 15, radians(240), radians(420));
  popMatrix();

  pushMatrix();
  translate(200, 300);
  arc(100, 100, 8, 15, radians(120), radians(300));
  arc(88, 95, 8, 20, radians(270), radians(450));
  arc(80, 100, 8, 15, radians(240), radians(420));
  popMatrix();

  pushMatrix();
  translate(225, 325);
  arc(100, 100, 8, 15, radians(120), radians(300));
  arc(88, 95, 8, 20, radians(270), radians(450));
  arc(80, 100, 8, 15, radians(240), radians(420));
  popMatrix();
}

void greySpace() {
  background(128);
  rectMode(CENTER);
  strokeCap(SQUARE);
  strokeWeight(2);
  stroke(0);
  fill(128);
  //Floor
  rect(400, 250, 300, 200);
  //Door
  rect(300, 75, 50, 75);
  rect(300, 35, 50, 5);
  rect(318, 75, 5, 5);
  rect(276, 55, 5, 5);
  rect(276, 60, 5, 5);
  rect(276, 90, 5, 5);
  rect(276, 95, 5, 5);
  //Ipad
  rect(350, 200, 40, 30);
  rect(365, 200, 8, 30);
  rect(365, 200, 5, 5);
  //Lightbulb
  noFill();
  ellipse(450, 100, 20, 20);

  pushMatrix();
  translate(450, 100);
  line(0, -15, 0, -25);
  popMatrix();

  pushMatrix();
  translate(450, 100);
  rotate(radians(36));
  line(0, -15, 0, -25);
  popMatrix();

  pushMatrix();
  translate(450, 100);
  rotate(radians(72));
  line(0, -15, 0, -25);
  popMatrix();

  pushMatrix();
  translate(450, 100);
  rotate(radians(108));
  line(0, -15, 0, -25);
  popMatrix();

  pushMatrix();
  translate(450, 100);
  rotate(radians(144));
  line(0, -15, 0, -25);
  popMatrix();

  pushMatrix();
  translate(450, 100);
  rotate(radians(180));
  line(0, -15, 0, -25);
  popMatrix();

  pushMatrix();
  translate(450, 100);
  rotate(radians(216));
  line(0, -15, 0, -25);
  popMatrix();

  pushMatrix();
  translate(450, 100);
  rotate(radians(252));
  line(0, -15, 0, -25);
  popMatrix();

  pushMatrix();
  translate(450, 100);
  rotate(radians(288));
  line(0, -15, 0, -25);
  popMatrix();

  pushMatrix();
  translate(450, 100);
  rotate(radians(324));
  line(0, -15, 0, -25);
  popMatrix();

  beginShape();
  vertex(448, 90);
  vertex(447, 100);
  vertex(453, 100);
  vertex(452, 90);
  endShape();
  line(450, 90, 450, 0);
}

void cloudyRoom() {
  background(255, 240, 218);
  rectMode(CENTER);
  fill(246, 226, 182);
  stroke(232, 215, 179);
  strokeWeight(1);
  rect(400, 20, 800, 40); //Wall Top Outside
  rect(400, 20, 785, 30); //Wall Top Inside
  rect(400, 200, 800, 40); //Wall Bottom Outside
  rect(400, 200, 785, 30); //Wall Bottom Inside

  fill(232, 215, 179);
  stroke(232, 215, 179);
  rect(400, 110, 100, 75); //Window Border
  fill(106, 178, 224); 
  stroke(106, 178, 224);
  rect(376, 110, 40, 65); //Sky 1
  rect(425, 110, 40, 65); //Sky 2

  fill(242, 193, 115);
  stroke(219, 172, 100);
  for (int i = 236; i < 515; i += 30 ) {
    rect(400, i, 800, 30); //Planks
  }

  fill(234, 184, 111);
  stroke(35, 35, 50);
  rectMode(CORNER);
  rect(20, 135, 75, 30); //Shelf Top
  fill(181, 136, 94);
  rect(20, 165, 75, 90); //Shelf Body
  //Shelf Drawers
  rect(25, 235, 30, 15);
  rect(60, 235, 30, 15);
  //Empty Shelves
  fill(67);
  rect(20, 170, 75, 25);
  rect(20, 200, 75, 25);

  fill(190, 136, 88);
  beginShape(); //Bed Top
  vertex(600, 145);
  vertex(590, 150);
  vertex(590, 180);
  vertex(710, 180);
  vertex(710, 150);
  vertex(700, 145);
  endShape(CLOSE);
  fill(255);
  rect(590, 180, 120, 40); //Matress
  fill(240, 254, 255);
  stroke(129, 174, 214);
  rect(635, 190, 30, 20); //Pillow
  stroke(35, 35, 50);
  rect(590, 220, 120, 10); //Blanket Top
  fill(129, 174, 214);
  rect(590, 230, 120, 60); //Blanket Bottom

  //Boxes
  fill(181, 136, 94);
  rectMode(CENTER);
  rect(250, 280, 100, 100); //Box Body
  rect(432, 440, 100, 100); //Box Body
  fill(246, 226, 182);
  rect(250, 280, 100, 10); //Tape
  rect(250, 280, 10, 100); //Tape
  rect(432, 440, 100, 10); //Tape
  rect(432, 440, 10, 100); //Tape
}

void stairs() {
  rectMode(CORNER);
  fill(2, 16, 85);
  stroke(3, 28, 97);
  strokeWeight(3);
  rect(0, 0, 10, 500); //Planks
  rect(10, 0, 10, 500); //Planks
  rect(20, 0, 10, 500); //Planks
  rect(30, 0, 10, 500); //Planks
  rect(40, 0, 10, 500); //Planks
  rect(50, 0, 10, 500); //Planks
  rect(60, 0, 10, 500); //Planks
  rect(70, 0, 10, 500); //Planks
  rect(80, 0, 10, 500); //Planks
  rect(90, 0, 10, 500); //Planks
  rect(100, 0, 10, 500); //Planks
  rect(110, 0, 10, 500); //Planks
  rect(120, 0, 10, 500); //Planks
  rect(130, 0, 10, 500); //Planks
  rect(140, 0, 10, 500); //Planks
  rect(150, 0, 10, 500); //Planks
  rect(160, 0, 10, 500); //Planks
  rect(170, 0, 10, 500); //Planks
  rect(180, 0, 10, 500); //Planks
  rect(190, 0, 10, 500); //Planks
  rect(200, 0, 10, 500); //Planks
  rect(210, 0, 10, 500); //Planks
  rect(220, 0, 10, 500); //Planks
  rect(230, 0, 10, 500); //Planks
  rect(240, 0, 10, 500); //Planks
  rect(250, 0, 10, 500); //Planks
  rect(260, 0, 10, 500); //Planks
  rect(270, 0, 10, 500); //Planks
  rect(280, 0, 10, 500); //Planks
  rect(290, 0, 10, 500); //Planks
  rect(300, 0, 10, 500); //Planks
  rect(310, 0, 10, 500); //Planks
  rect(426, 0, 10, 500); //Planks
  rect(436, 0, 10, 500); //Planks
  rect(446, 0, 10, 500); //Planks
  rect(456, 0, 10, 500); //Planks
  rect(466, 0, 10, 500); //Planks
  rect(476, 0, 10, 500); //Planks
  rect(486, 0, 10, 500); //Planks
  rect(496, 0, 10, 500); //Planks
  rect(506, 0, 10, 500); //Planks
  rect(516, 0, 10, 500); //Planks
  rect(526, 0, 10, 500); //Planks
  rect(536, 0, 10, 500); //Planks
  rect(546, 0, 10, 500); //Planks
  rect(556, 0, 10, 500); //Planks
  rect(566, 0, 10, 500); //Planks
  rect(576, 0, 10, 500); //Planks
  rect(586, 0, 10, 500); //Planks
  rect(596, 0, 10, 500); //Planks
  rect(606, 0, 10, 500); //Planks
  rect(616, 0, 10, 500); //Planks
  rect(626, 0, 10, 500); //Planks
  rect(636, 0, 10, 500); //Planks
  rect(646, 0, 10, 500); //Planks
  rect(656, 0, 10, 500); //Planks
  rect(666, 0, 10, 500); //Planks
  rect(676, 0, 10, 500); //Planks
  rect(686, 0, 10, 500); //Planks
  rect(696, 0, 10, 500); //Planks
  rect(706, 0, 10, 500); //Planks
  rect(716, 0, 10, 500); //Planks
  rect(726, 0, 10, 500); //Planks
  rect(736, 0, 10, 500); //Planks
  rect(746, 0, 10, 500); //Planks
  rect(756, 0, 10, 500); //Planks
  rect(766, 0, 10, 500); //Planks
  rect(776, 0, 10, 500); //Planks
  rect(786, 0, 10, 500); //Planks
  rect(796, 0, 10, 500); //Planks



  fill(3, 23, 94);
  stroke(3, 23, 94);
  rect(323, 0, 100, 10); //Stairs
  rect(323, 20, 100, 10); //Stairs
  rect(323, 40, 100, 10); //Stairs
  rect(323, 60, 100, 10); //Stairs
  rect(323, 80, 100, 10); //Stairs
  rect(323, 100, 100, 10); //Stairs
  rect(323, 120, 100, 10); //Stairs
  rect(323, 140, 100, 10); //Stairs
  rect(323, 160, 100, 10); //Stairs
  rect(323, 180, 100, 10); //Stairs
  rect(323, 200, 100, 10); //Stairs
  rect(323, 220, 100, 10); //Stairs
  rect(323, 240, 100, 10); //Stairs
  rect(323, 260, 100, 10); //Stairs
  rect(323, 280, 100, 10); //Stairs
  rect(323, 300, 100, 10); //Stairs
  rect(323, 323, 100, 10); //Stairs
  rect(323, 340, 100, 10); //Stairs
  rect(323, 360, 100, 10); //Stairs
  rect(323, 380, 100, 10); //Stairs
  rect(323, 400, 100, 10); //Stairs
  rect(323, 420, 100, 10); //Stairs
  rect(323, 440, 100, 10); //Stairs
  rect(323, 460, 100, 10); //Stairs
  rect(323, 480, 100, 10); //Stairs
  rect(323, 500, 100, 10); //Stairs
  fill(5, 21, 87);
  stroke(5, 21, 87);
  rect(323, 10, 100, 10); //Stairs
  rect(323, 30, 100, 10); //Stairs
  rect(323, 50, 100, 10); //Stairs
  rect(323, 70, 100, 10); //Stairs
  rect(323, 90, 100, 10); //Stairs
  rect(323, 110, 100, 10); //Stairs
  rect(323, 130, 100, 10); //Stairs
  rect(323, 150, 100, 10); //Stairs
  rect(323, 170, 100, 10); //Stairs
  rect(323, 190, 100, 10); //Stairs
  rect(323, 210, 100, 10); //Stairs
  rect(323, 230, 100, 10); //Stairs
  rect(323, 250, 100, 10); //Stairs
  rect(323, 270, 100, 10); //Stairs
  rect(323, 290, 100, 10); //Stairs
  rect(323, 310, 100, 10); //Stairs
  rect(323, 330, 100, 10); //Stairs
  rect(323, 350, 100, 10); //Stairs
  rect(323, 370, 100, 10); //Stairs
  rect(323, 390, 100, 10); //Stairs
  rect(323, 410, 100, 10); //Stairs
  rect(323, 430, 100, 10); //Stairs
  rect(323, 450, 100, 10); //Stairs
  rect(323, 470, 100, 10); //Stairs
  rect(323, 490, 100, 10); //Stairs
}

void borbRoom() {
  rectMode(CORNER);
  //Pink Ground
  background(255, 217, 255); 

  //Purple Wall
  fill(191, 131, 249);
  stroke(108, 6, 255);
  rect(0, 0, 799, 200);

  //Table Top
  fill(248, 220, 140);
  stroke(236, 151, 89);
  rect(0, 200, 799, 40);

  //Table Bottom
  fill(255, 203, 131);
  stroke(236, 151, 89);
  rect(0, 240, 799, 60); //Main Body
  rect(20, 258, 50, 25); //Drawers
  rect(100, 258, 50, 25); //Drawers
  rect(180, 258, 50, 25); //Drawers
  rect(260, 258, 50, 25); //Drawers
  rect(340, 258, 50, 25); //Drawers
  rect(420, 258, 50, 25); //Drawers
  rect(500, 258, 50, 25); //Drawers
  rect(580, 258, 50, 25); //Drawers
  rect(660, 258, 50, 25); //Drawers
  rect(740, 258, 50, 25); //Drawers

  //Cards
  stroke(255, 158, 174);
  fill(255);
  rect(80, 407, 15, 10); //Card Pile Left
  rect(100, 410, 15, 10); //Card Pile Left
  rect(88, 423, 15, 10); //Card Pile Left
  rect(663, 430, 15, 10); //Card Pile Right
  rect(674, 444, 15, 10); //Card Pile Right

  //Egg
  ellipseMode(CENTER);
  fill(255);
  stroke(255);
  ellipse(156, 378, 60, 25); //Egg White
  fill(248, 220, 140);
  stroke(248, 220, 140);
  ellipse(156, 378, 30, 10); //Yolk
  rectMode(CENTER);
  fill(255);
  stroke(255);
  rect(167, 378, 12, 14); //Egg White

  //Flower
  fill(169, 233, 235);
  stroke(170, 95, 249);
  ellipse(592, 392, 20, 10); //Leaf
  noFill();
  bezier(592, 392, 592, 350, 612, 370, 622, 365); //Stem
  fill(250, 168, 219);
  pushMatrix();
  translate(616, 365);
  arc(0, 0, 10, 25, radians(180), radians(360)); //Petal
  pushMatrix();
  rotate(radians(72));
  arc(0, 0, 10, 25, radians(180), radians(360)); //Petal
  popMatrix();
  pushMatrix();
  rotate(radians(144));
  arc(0, 0, 10, 25, radians(180), radians(360)); //Petal
  popMatrix();
  pushMatrix();
  rotate(radians(216));
  arc(0, 0, 10, 25, radians(180), radians(360)); //Petal
  popMatrix();
  pushMatrix();
  rotate(radians(288));
  arc(0, 0, 10, 25, radians(180), radians(360)); //Petal
  popMatrix();
  popMatrix();
  fill(252, 233, 141);
  ellipse(616, 365, 10, 10); //Center

  //Bird
  fill(243);
  stroke(243);
  quad(300, 200, 500, 200, 450, 100, 350, 100); //Floof 
  fill(252, 233, 141);
  stroke(252, 233, 141);
  ellipse(400, 100, 125, 125); //head
  triangle(343, 75, 360, 25, 365, 75); //feathers
  triangle(363, 75, 380, 12.5, 395, 75); //feathers
  triangle(385, 75, 400, 0, 415, 75); //feathers
  triangle(403, 75, 420, 12.5, 435, 75); //feathers
  triangle(423, 75, 440, 25, 457, 75); //feathers
  fill(255, 140, 0);
  stroke(255, 183, 0);
  quad(400, 100, 380, 110, 400, 135, 420, 110); //Beak
  quad(400, 100, 380, 110, 400, 120, 420, 110); //Beak
  fill(5, 5, 41);
  stroke(5, 5, 41);
  ellipse(370, 90, 20, 20); //Black Part Of Eye
  ellipse(430, 90, 20, 20); //Black Part Of Eye
  fill(255);
  ellipse(367, 87, 10, 10); //Pupil
  ellipse(427, 87, 10, 10); //Pupil
  fill(255, 158, 174);
  stroke(255, 158, 174);
  ellipse(360, 115, 20, 20); //Blush
  ellipse(440, 115, 20, 20); //Blush
}

void trash() {
  rectMode(CORNER);
  background(201, 183, 243);
  //Pink Grass
  fill(245, 210, 252);
  stroke(245, 210, 252);
  rect(0, 125, 119, 200);
  rect(325, 0, 275, 150);

  //fence
  fill(201, 183, 243);
  stroke(88, 75, 130);
  strokeWeight(2);

  //bamboo fence

  //left fence
  rect(120, 50, 20, 200);

  for (int i = 0; i <= 130; i += 20) {
    rect(i, 50, 20, 75);
    ellipse(i + 10, 50, 20, 25);
    arc(i + 10, 124, 20, 20, radians(0), radians(180));
  }

  for (int i = 0; i <= 130; i += 20) {
    rect(i, 250, 20, 75);
    ellipse(i + 10, 250, 20, 25);
    arc(i + 10, 324, 20, 20, radians(0), radians(180));
  }

  for (int i = 75; i <= 225; i += 25) {
    ellipse(130, i, 20, 25);
  }

  //right fence
  for (int i = 10; i <= 110; i += 25) {
    rect(315, i, 20, 75);
    ellipse(325, i, 20, 25);
    arc(325, i + 74, 20, 20, radians(0), radians(180));
  }

  for (int i = 295; i >= 215; i -= 20) {
    rect(i, 110, 20, 75);
    ellipse(i + 10, 110, 20, 25);
    arc(i + 10, 184, 20, 20, radians(0), radians(180));
  }

  for (int i = 135; i <= 235; i += 25) {
    rect(215, i, 20, 75);
    ellipse(225, i, 20, 25);
    arc(225, i + 74, 20, 20, radians(0), radians(180));
  }

  for (int i = 215; i <= 375; i += 20) {
    rect(i, 260, 20, 75);
    ellipse(i + 10, 260, 20, 25);
    arc(i + 10, 334, 20, 20, radians(0), radians(180));
  }

  for (int i = 10; i <= 235; i += 25) {
    rect(595, i, 20, 75);
    ellipse(605, i, 20, 25);
    arc(605, i + 74, 20, 20, radians(0), radians(180));
  }

  for (int i = 495; i <= 595; i += 20) {
    rect(i, 260, 20, 75);
    ellipse(i + 10, 260, 20, 25);
    arc(i + 10, 334, 20, 20, radians(0), radians(180));
  }

  //containers
  rectMode(CENTER);

  for (int i = 43; i <= 344; i += 86) {
    pushMatrix();
    translate(i, 500);
    fill(101, 78, 186);
    rect(0, -45, 80, 5);
    fill(152, 128, 223);
    rect(0, -40, 80, 10);
    rect(0, -30, 80, 10);
    rect(0, -20, 80, 10);
    rect(0, -10, 80, 10);
    rect(0, 0, 80, 10);
    fill(169, 133, 240);
    rect(0, -97, 86, 100);
    popMatrix();
  }

  for (int i = 498; i <= 800; i += 86) {
    pushMatrix();
    translate(i, 500);
    fill(101, 78, 186);
    rect(0, -45, 80, 5);
    fill(152, 128, 223);
    rect(0, -40, 80, 10);
    rect(0, -30, 80, 10);
    rect(0, -20, 80, 10);
    rect(0, -10, 80, 10);
    rect(0, 0, 80, 10);
    fill(169, 133, 240);
    rect(0, -97, 86, 100);
    popMatrix();
  }

  for (int i = 670; i <= 800; i += 86) {
    pushMatrix();
    translate(i, 430);
    fill(101, 78, 186);
    rect(0, -45, 80, 5);
    fill(152, 128, 223);
    rect(0, -40, 80, 10);
    rect(0, -30, 80, 10);
    rect(0, -20, 80, 10);
    rect(0, -10, 80, 10);
    rect(0, 0, 80, 10);
    fill(169, 133, 240);
    rect(0, -97, 86, 100);
    popMatrix();
  }

  pushMatrix();
  translate(756, 360);
  fill(101, 78, 186);
  rect(0, -45, 80, 5);
  fill(152, 128, 223);
  rect(0, -40, 80, 10);
  rect(0, -30, 80, 10);
  rect(0, -20, 80, 10);
  rect(0, -10, 80, 10);
  rect(0, 0, 80, 10);
  fill(169, 133, 240);
  rect(0, -97, 86, 100);
  popMatrix();

  for (int i = 670; i <= 800; i += 86) {
    pushMatrix();
    translate(i, 150);
    fill(101, 78, 186);
    rect(0, -45, 80, 5);
    fill(152, 128, 223);
    rect(0, -40, 80, 10);
    rect(0, -30, 80, 10);
    rect(0, -20, 80, 10);
    rect(0, -10, 80, 10);
    rect(0, 0, 80, 10);
    fill(169, 133, 240);
    rect(0, -97, 86, 100);
    popMatrix();
  }

  //tires
  pushMatrix();
  translate(200, 50);
  fill(108, 84, 174);
  rect(0, 10, 40, 20);
  ellipse(0, 0, 40, 10);
  arc(0, 19, 40, 10, radians(0), radians(180), OPEN);
  fill(88, 75, 130);
  ellipse(0, 0, 25, 5);
  popMatrix();

  pushMatrix();
  translate(25, 200);
  fill(108, 84, 174);
  rect(0, 10, 40, 20);
  ellipse(0, 0, 40, 10);
  arc(0, 19, 40, 10, radians(0), radians(180), OPEN);
  fill(88, 75, 130);
  ellipse(0, 0, 25, 5);
  popMatrix();

  pushMatrix();
  translate(500, 40);
  fill(108, 84, 174);
  rect(0, 10, 40, 20);
  ellipse(0, 0, 40, 10);
  arc(0, 19, 40, 10, radians(0), radians(180), OPEN);
  fill(88, 75, 130);
  ellipse(0, 0, 25, 5);
  popMatrix();

  pushMatrix();
  translate(400, 100);
  fill(108, 84, 174);
  rect(0, 10, 40, 20);
  ellipse(0, 0, 40, 10);
  arc(0, 19, 40, 10, radians(0), radians(180), OPEN);
  fill(88, 75, 130);
  ellipse(0, 0, 25, 5);
  popMatrix();

  pushMatrix();
  translate(650, 200);
  fill(108, 84, 174);
  rect(0, 10, 40, 20);
  ellipse(0, 0, 40, 10);
  arc(0, 19, 40, 10, radians(0), radians(180), OPEN);
  fill(88, 75, 130);
  ellipse(0, 0, 25, 5);
  popMatrix();

  //cars
  //light
  noStroke();
  fill(149, 195, 230);
  pushMatrix();
  translate(250, 200);
  beginShape();
  vertex(0, 20);
  vertex(160, 20);
  vertex(160, -20);
  quadraticVertex(160, -30, 150, -30);
  quadraticVertex(140, -30, 130, -45);
  quadraticVertex(120, -55, 110, -55);
  vertex(70, -55);
  quadraticVertex(60, -55, 50, -45);
  quadraticVertex(40, -35, 30, -30);
  quadraticVertex(0, -20, 0, -10);
  endShape(CLOSE);
  popMatrix();

  //dark
  fill(103, 150, 166);
  pushMatrix();
  translate(250, 230);
  beginShape();
  vertex(10, 0);
  vertex(150, 0);
  quadraticVertex(160, 0, 160, -10);
  vertex(160, -20);
  quadraticVertex(160, -30, 150, -30);
  quadraticVertex(140, -30, 130, -45);
  quadraticVertex(120, -55, 110, -55);
  vertex(70, -55);
  quadraticVertex(60, -55, 50, -45);
  quadraticVertex(40, -35, 30, -30);
  quadraticVertex(0, -20, 0, -10);
  quadraticVertex(0, 0, 10, 0);
  endShape(CLOSE);
  fill(53, 40, 94);
  popMatrix();

  //windows
  //back window
  pushMatrix();
  translate(245, 235);
  beginShape();
  vertex(130, -45);
  quadraticVertex(120, -55, 110, -55);
  vertex(100, -55);
  vertex(100, -30);
  vertex(130, -30);
  endShape();
  popMatrix();

  //front window
  pushMatrix();
  translate(255, 235);
  beginShape();
  vertex(80, -55);
  vertex(70, -55);
  quadraticVertex(60, -55, 50, -45);
  vertex(35, -30);
  vertex(80, -30);
  endShape();
  popMatrix();

  //back windshield
  pushMatrix();
  translate(285, 195);
  scale(0.75);
  beginShape();
  vertex(150, -30);
  quadraticVertex(140, -30, 130, -45);
  quadraticVertex(120, -60, 110, -60);
  vertex(110, -30);
  quadraticVertex(120, -25, 130, -15);
  quadraticVertex(140, 0, 150, 0);
  endShape();
  popMatrix();

  //front windshield
  pushMatrix();
  translate(250, 205);
  scale(0.75);
  beginShape();
  vertex(70, -65);
  quadraticVertex(60, -57, 50, -45);
  vertex(50, -15);
  quadraticVertex(60, -27, 70, -35);
  endShape();
  popMatrix();

  //wheels
  pushMatrix();
  translate(250, 230);
  ellipse(40, 0, 25, 25);
  ellipse(120, 0, 25, 25);
  fill(103, 150, 166);
  ellipse(40, 0, 15, 15);
  ellipse(120, 0, 15, 15);
  popMatrix();
}

void worldwide() {
  rectMode(CORNER);
  pushMatrix();
  translate(worldwideX, worldwideY);
  scale(worldwideScale);
  //Outline
  fill(0);
  noStroke();
  rect(0, 0, 8, 4);
  rect(8, -12, 4, 12);
  rect(12, -8, 8, 4);
  rect(20, -12, 4, 12);
  rect(24, 0, 8, 4);
  rect(32, -12, 4, 12);
  rect(36, -12, 4, 4);
  rect(40, -24, 4, 12);
  rect(36, -24, 4, 4);
  rect(44, -32, 4, 8);
  rect(40, -36, 4, 4);
  rect(36, -40, 4, 4);
  rect(40, -48, 4, 8);
  rect(36, -48, 4, 4);
  fill(255, 0, 0);
  rect(32, -48, 4, 4);
  rect(36, -52, 4, 4);
  rect(40, -56, 4, 4);
  fill(0);
  rect(44, -60, 4, 4);
  rect(48, -64, 4, 4);
  rect(52, -72, 4, 8);
  rect(56, -76, 4, 4);
  rect(60, -80, 4, 4);
  rect(64, -88, 4, 8);
  rect(60, -88, 4, 4);
  rect(56, -84, 4, 4);
  rect(52, -80, 4, 4);
  rect(48, -92, 4, 20);
  rect(44, -100, 4, 8);
  rect(40, -104, 4, 4);
  rect(32, -108, 8, 4);
  rect(24, -112, 8, 4);
  rect(12, -116, 12, 4);

  rect(-4, -12, 4, 12);
  rect(-8, -12, 4, 4);
  rect(-12, -24, 4, 12);
  rect(-8, -24, 4, 4);
  rect(-16, -32, 4, 8);
  rect(-12, -36, 4, 4);
  rect(-8, -40, 4, 4);
  rect(-12, -48, 4, 8);
  rect(-8, -48, 4, 4);
  fill(255, 0, 0);
  rect(-4, -48, 4, 4);
  rect(-8, -52, 4, 4);
  rect(-12, -56, 4, 4);
  fill(0);
  rect(-16, -60, 4, 4);
  rect(-20, -64, 4, 4);
  rect(-24, -72, 4, 8);
  rect(-28, -76, 4, 4);
  rect(-32, -80, 4, 4);
  rect(-36, -88, 4, 8);
  rect(-32, -100, 4, 12);
  rect(-28, -104, 16, 4);
  rect(-12, -108, 4, 4);
  rect(-16, -112, 4, 4);
  rect(-20, -116, 4, 4);
  rect(-16, -120, 28, 4);

  //Gray Fill
  fill(128);
  rect(0, -4, 8, 4);
  rect(0, -12, 8, 4);
  rect(-8, -20, 4, 8);
  rect(-12, -28, 8, 4);
  rect(-8, -36, 8, 4);
  rect(-8, -44, 4, 4);
  rect(0, -32, 4, 4);
  rect(4, -36, 4, 12);
  rect(8, -40, 4, 16);
  rect(12, -44, 8, 4);
  rect(16, -36, 4, 12);
  rect(20, -40, 4, 16);
  rect(24, -36, 4, 12);
  rect(28, -32, 4, 4);
  rect(-16, -68, 4, 8);
  rect(-20, -72, 4, 8);
  rect(-24, -76, 4, 4);
  rect(-28, -80, 4, 4);
  rect(-32, -84, 4, 4);
  rect(-8, -68, 4, 12);
  rect(-4, -68, 4, 16);
  rect(0, -72, 4, 4);
  rect(0, -56, 4, 8);
  rect(4, -72, 4, 24);
  rect(8, -76, 4, 28);
  rect(12, -64, 4, 16);
  rect(16, -68, 4, 20);
  rect(20, -72, 4, 24);
  rect(24, -76, 4, 28);
  rect(28, -76, 4, 8);
  rect(28, -56, 4, 8);
  rect(32, -72, 4, 20);
  rect(36, -68, 4, 12);
  rect(44, -68, 4, 8);
  rect(48, -72, 4, 8);
  rect(52, -76, 4, 4);
  rect(56, -80, 4, 4);
  rect(60, -84, 4, 4);
  rect(36, -44, 4, 4);
  rect(32, -36, 8, 4);
  rect(36, -28, 8, 4);
  rect(36, -20, 4, 8);
  rect(24, -12, 8, 4);
  rect(24, -4, 8, 4);
  rect(12, -12, 8, 4);

  //Black Fill
  fill(0);
  //hair
  rect(-16, -116, 28, 4);
  rect(-12, -112, 36, 4);
  rect(-8, -108, 40, 4);
  rect(-12, -104, 52, 4);
  rect(-28, -100, 72, 4);
  rect(-28, -96, 72, 4);
  rect(-28, -92, 76, 4);
  rect(-32, -88, 80, 4);
  rect(-28, -84, 76, 4);
  rect(-24, -80, 72, 4);
  rect(-20, -76, 28, 4);
  rect(12, -76, 12, 4);
  rect(32, -76, 16, 4);
  rect(-16, -72, 16, 4);
  rect(12, -72, 8, 4);
  rect(36, -72, 12, 4);
  rect(12, -68, 4, 4);
  rect(-12, -68, 4, 12);
  rect(-8, -56, 4, 4);
  rect(-4, -52, 4, 4);
  rect(32, -52, 4, 4);
  rect(36, -56, 4, 4);
  rect(40, -68, 4, 12);

  //body
  rect(-4, -16, 40, 4);
  rect(-4, -20, 40, 4);
  rect(-4, -24, 40, 4);
  rect(-4, -28, 8, 4);
  rect(28, -28, 8, 4);
  rect(-4, -32, 4, 4);
  rect(32, -32, 4, 4);

  //shoulders
  rect(0, -48, 32, 4);

  rect(0, -36, 4, 4);
  rect(-4, -40, 12, 4);
  rect(-4, -44, 12, 4);

  rect(28, -36, 4, 4);
  rect(24, -40, 12, 4);
  rect(24, -44, 12, 4);

  //White Details
  fill(255);
  rect(8, -44, 4, 4);
  rect(20, -44, 4, 4);
  rect(12, -40, 8, 4);
  rect(12, -36, 4, 12);
  rect(-12, -32, 8, 4);
  rect(36, -32, 8, 4);
  rect(0, -8, 8, 4);
  rect(24, -8, 8, 4);


  //Eyes
  fill(255, 0, 0);
  rect(0, -68, 4, 12);
  rect(28, -68, 4, 12);

  //Crown
  //Red outlines
  rect(12, -88, 8, 4);
  rect(20, -92, 12, 4);
  rect(32, -88, 4, 4);
  rect(36, -84, 8, 4);
  rect(40, -88, 4, 4);
  rect(36, -92, 4, 4);
  rect(32, -96, 4, 4);
  rect(24, -100, 8, 4);
  rect(20, -100, 4, 8);
  rect(12, -104, 8, 4);
  rect(8, -100, 4, 8);
  rect(0, -100, 8, 4);
  rect(-4, -96, 4, 4);
  rect(-8, -92, 4, 4);
  rect(-12, -88, 4, 4);
  rect(-12, -84, 8, 4);
  rect(-4, -88, 4, 4);
  rect(0, -92, 12, 4);

  //Grey Fill
  fill(128);
  rect(-8, -88, 4, 4);
  rect(-4, -92, 4, 4);
  rect(0, -96, 8, 4);
  rect(12, -100, 4, 4);
  rect(16, -96, 4, 4);
  rect(24, -96, 8, 4);
  rect(32, -92, 4, 4);
  rect(36, -88, 4, 4);

  //Black Detail
  fill(0);
  rect(12, -96, 4, 4);
  rect(12, -92, 8, 4);

  //White Detail
  fill(255);
  rect(16, -100, 4, 4);

  popMatrix();
}

void spaceWorld() {
  //Sky
  noStroke();
  rectMode(CORNER);
  background(100, 24, 244);

  //Mountains
  fill(53, 40, 94);
  ellipse(0, 150, 500, 200);
  ellipse(200, 150, 200, 150);
  ellipse(700, 150, 600, 250);
  ellipse(800, 50, 200, 100);

  //Ground
  fill(245, 210, 252);
  rect(0, 150, 800, 350);
  //Grass
  noStroke();
  fill(231, 133, 221);
  pushMatrix();
  translate(100, 100);
  arc(100, 100, 8, 15, radians(120), radians(300));//first blade
  arc(88, 95, 8, 20, radians(270), radians(450));//second blade
  arc(80, 100, 8, 15, radians(240), radians(420));//third blade
  popMatrix();

  pushMatrix();
  translate(-10, 290);
  arc(100, 100, 8, 15, radians(120), radians(300));//first blade
  arc(88, 95, 8, 20, radians(270), radians(450));//second blade
  arc(80, 100, 8, 15, radians(240), radians(420));//third blade
  popMatrix();


  pushMatrix();
  translate(500, 180);
  arc(100, 100, 8, 15, radians(120), radians(300));//first blade
  arc(88, 95, 8, 20, radians(270), radians(450));//second blade
  arc(80, 100, 8, 15, radians(240), radians(420));//third blade
  popMatrix();

  pushMatrix();
  translate(540, 142);
  arc(100, 100, 8, 15, radians(120), radians(300));//first blade
  arc(88, 95, 8, 20, radians(270), radians(450));//second blade
  arc(80, 100, 8, 15, radians(240), radians(420));//third blade
  popMatrix();

  pushMatrix();
  translate(225, 272);
  arc(100, 100, 8, 15, radians(120), radians(300));//first blade
  arc(88, 95, 8, 20, radians(270), radians(450));//second blade
  arc(80, 100, 8, 15, radians(240), radians(420));//third blade
  popMatrix();

  //Box
  rectMode(CENTER);
  stroke(95, 61, 94);
  fill(95, 61, 94);
  rect(250, 300, 25, 35);
  fill(76, 49, 75);
  quad(262, 282, 262, 317, 273, 311, 273, 277);
  fill(127, 100, 126);
  quad(262, 282, 237, 283, 243, 278, 273, 277);
  pushMatrix();
  translate(100, 100);
  fill(95, 61, 94);
  stroke(95, 61, 94);
  rect(250, 300, 25, 35);
  fill(76, 49, 75);
  quad(262, 282, 262, 317, 273, 311, 273, 277);
  fill(127, 100, 126);
  quad(262, 282, 237, 283, 243, 278, 273, 277);
  popMatrix();

  pushMatrix();
  translate(-50, -30);
  fill(95, 61, 94);
  stroke(95, 61, 94);
  rect(250, 300, 25, 35);
  fill(76, 49, 75);
  quad(262, 282, 262, 317, 273, 311, 273, 277);
  fill(127, 100, 126);
  quad(262, 282, 237, 283, 243, 278, 273, 277);
  popMatrix();

  pushMatrix();
  translate(440, -90);
  fill(95, 61, 94);
  stroke(95, 61, 94);
  rect(250, 300, 25, 35);
  fill(76, 49, 75);
  quad(262, 282, 262, 317, 273, 311, 273, 277);
  fill(127, 100, 126);
  quad(262, 282, 237, 283, 243, 278, 273, 277);
  popMatrix();

  pushMatrix();
  translate(410, 10);
  fill(95, 61, 94);
  stroke(95, 61, 94);
  rect(250, 300, 25, 35);
  fill(76, 49, 75);
  quad(262, 282, 262, 317, 273, 311, 273, 277);
  fill(127, 100, 126);
  quad(262, 282, 237, 283, 243, 278, 273, 277);
  popMatrix();

  //Path
  strokeWeight(1);
  rectMode(CORNER);
  fill(201, 183, 243);
  stroke(201, 183, 243);
  rect(395, 250, 90, 250);

  rect(305, 120, 90, 225);

  //Stairs
  fill(176, 176, 234);
  stroke(176, 176, 234);
  rect(285, 220, 150, 7);
  rect(285, 206, 150, 7);
  rect(285, 192, 150, 7);
  rect(285, 178, 150, 7);
  rect(285, 164, 150, 7);
  rect(285, 150, 150, 7);
  fill(144, 143, 207);
  stroke(144, 143, 207);
  rect(285, 213, 150, 7);
  rect(285, 199, 150, 7);
  rect(285, 185, 150, 7);
  rect(285, 171, 150, 7);
  rect(285, 157, 150, 7);

  //Pillars  
  pushMatrix();
  translate(50, -35);
  fill(124, 104, 193);
  stroke(124, 104, 193);
  quad(425, 230, 425, 150, 445, 140, 445, 220);
  quad(385, 150, 385, 230, 365, 220, 365, 140);
  fill(144, 143, 207);
  stroke(144, 143, 207);
  rect(385, 150, 40, 80);
  popMatrix();

  pushMatrix();
  translate(-160, -35);
  fill(124, 104, 193);
  stroke(124, 104, 193);
  quad(425, 230, 425, 150, 445, 140, 445, 220);
  quad(385, 150, 385, 230, 365, 220, 365, 140);
  fill(144, 143, 207);
  stroke(144, 143, 207);
  rect(385, 150, 40, 80);
  popMatrix();

  pushMatrix();
  translate(10, 0);
  fill(124, 104, 193);
  stroke(124, 104, 193);
  quad(425, 230, 425, 150, 445, 140, 445, 220);
  quad(385, 150, 385, 230, 365, 220, 365, 140);
  fill(144, 143, 207);
  stroke(144, 143, 207);
  rect(385, 150, 40, 80);
  popMatrix();

  pushMatrix();
  translate(-120, 0);
  fill(124, 104, 193);
  stroke(124, 104, 193);
  quad(425, 230, 425, 150, 445, 140, 445, 220);
  quad(385, 150, 385, 230, 365, 220, 365, 140);
  fill(144, 143, 207);
  stroke(144, 143, 207);
  rect(385, 150, 40, 80);
  popMatrix();

  //High Ground
  fill(245, 210, 252);
  stroke(245, 210, 252);
  beginShape();
  vertex(395, 150);
  vertex(435, 150);
  vertex(455, 140);
  vertex(455, 115);
  vertex(475, 115);
  vertex(495, 105);
  vertex(495, 65);
  vertex(480, 50);
  vertex(220, 50);
  vertex(205, 65);
  vertex(205, 105);
  vertex(225, 115);
  vertex(245, 115);
  vertex(245, 140);
  vertex(265, 150);
  vertex(305, 150);
  vertex(326, 140);
  vertex(326, 150);
  vertex(374, 150);
  vertex(374, 140);
  endShape(CLOSE);

  //Poles
  strokeWeight(3);
  stroke(102, 79, 134);
  line(60, 220, 105, 40);  
  line(150, 220, 105, 40);
  line(105, 250, 105, 40);
  line(105, 180, 130, 150);
  line(105, 150, 140, 180);
  line(105, 180, 80, 150);
  line(105, 150, 70, 180); 
  //Orb
  strokeWeight(6);
  stroke(240, 185, 213);
  fill(102, 79, 134);
  ellipseMode(CENTER);
  ellipse(105, 40, 25, 25);

  //Poles
  pushMatrix();
  translate(500, 0);
  strokeWeight(3);
  stroke(102, 79, 134);
  line(60, 220, 105, 40);  
  line(150, 220, 105, 40);
  line(105, 250, 105, 40);
  line(105, 180, 130, 150);
  line(105, 150, 140, 180);
  line(105, 180, 80, 150);
  line(105, 150, 70, 180); 
  //Orb
  strokeWeight(6);
  stroke(240, 185, 213);
  fill(102, 79, 134);
  ellipseMode(CENTER);
  ellipse(105, 40, 25, 25);
  popMatrix();

  //Moon building
  fill(149, 248, 225);
  stroke(108, 84, 174);
  strokeWeight(2);
  ellipse(350, 75, 150, 150);
  fill(0, 0, 0, 0);
  arc(400, 25, 150, 150, radians(73), radians(196));
  fill(245, 210, 252);
  arc(400, 25, 150, 150, radians(73), radians(160));
  fill(100, 24, 244);
  arc(400, 25, 150, 150, radians(160), radians(196));
  noStroke();
  rect(329, 0, 100, 50);
  triangle(327, 5, 400, 5, 400, 26);
  fill(245, 210, 252);
  rectMode(CORNER);
  rect(400, 50, 50, 45);
  fill(53, 40, 94);
  stroke(108, 84, 174);
  //door
  beginShape();
  vertex(330, 125);
  vertex(330, 150);
  vertex(370, 150);
  vertex(370, 125);
  endShape();
  arc(350, 125, 40, 40, radians(180), radians(360));
  //windows
  fill(144, 200, 241);
  ellipse(390, 115, 20, 20);
  ellipse(317, 97, 20, 20);
  ellipse(305, 70, 20, 20);
  //planet
  ellipse(308, 31, 50, 50);
  rectMode(CENTER);
  fill(209, 119, 241);
  pushMatrix();
  translate(308, 31);
  rotate(radians(30));
  rect(0, 0, 70, 10);
  popMatrix();

  //Fence Left
  strokeWeight(1);
  fill(193, 123, 186);
  stroke(149, 100, 156);
  rectMode(CENTER);
  for (int i = 20; i <= 380; i += 20) {
    rect(i, 449, 15, 100);
  }
  //Fence Horizontal Line Left
  rect(200, 449, 400, 20);

  //Fence Right
  for (int j = 500; j <= 780; j += 20) {
    rect(j, 449, 15, 100);
  }
  //Fence Horizontal Line Right
  rect(640, 449, 320, 20);
}

void tordDeer() {
  noStroke();
  rectMode(CORNER);
  pushMatrix();
  translate(tordDeerX, tordDeerY);
  scale(tordDeerScale);
  //main grey
  fill(202);
  rect(-110, -14, 4, 32);

  rect(-106, -34, 4, 60);
  rect(-106, 38, 4, 20);

  rect(-102, -50, 4, 112);

  rect(-98, -54, 4, 52);
  rect(-98, 14, 4, 36);

  rect(-94, -38, 4, 28);
  rect(-94, 18, 4, 36);

  rect(-90, -26, 4, 20);
  rect(-90, 14, 4, 28);
  rect(-90, 90, 4, 12);
  rect(-90, 114, 4, 28);

  rect(-86, -34, 4, 64);
  rect(-86, 74, 4, 80);

  rect(-82, -46, 4, 72);
  rect(-82, 66, 4, 56);
  rect(-82, 134, 4, 20);

  rect(-78, -50, 4, 60);
  rect(-78, 14, 4, 8);
  rect(-78, 38, 4, 76);

  rect(-74, -54, 4, 36);
  rect(-74, -14, 4, 28);
  rect(-74, 26, 4, 72);

  rect(-70, -58, 4, 40);
  rect(-70, -10, 4, 20);
  rect(-70, 14, 4, 28);
  rect(-70, 46, 4, 24);
  rect(-70, 74, 4, 4);

  rect(-66, -62, 4, 20);
  rect(-66, -38, 4, 8);
  rect(-66, -2, 4, 44);
  rect(-66, 46, 4, 24);

  rect(-62, 2, 8, 64);
  rect(-62, -58, 4, 12);

  rect(-54, -2, 4, 44);
  rect(-54, 46, 4, 24);

  rect(-50, -6, 4, 48);
  rect(-50, 46, 4, 28);
  rect(-50, 94, 4, 12);

  rect(-46, -2, 4, 32);
  rect(-46, 34, 4, 24);
  rect(-46, 62, 4, 16);
  rect(-46, 94, 4, 24);

  rect(-42, -10, 4, 68);
  rect(-42, 62, 4, 16);
  rect(-42, 86, 4, 40);

  rect(-38, -14, 8, 120);
  rect(-38, 106, 4, 28);

  rect(-34, 110, 4, 24);
  rect(-34, 142, 4, 4);

  rect(-30, -18, 4, 92);
  rect(-30, 78, 4, 24);
  rect(-30, 122, 4, 32);

  rect(-26, -18, 4, 48);
  rect(-26, 34, 4, 12);
  rect(-26, 62, 4, 36);
  rect(-26, 142, 4, 12);

  rect(-22, -22, 4, 68);
  rect(-22, 50, 4, 12);
  rect(-22, 66, 4, 4);

  rect(-18, -22, 4, 84);

  rect(-14, -26, 4, 84);

  rect(-10, -26, 4, 4);
  rect(-10, -18, 4, 8);
  rect(-10, -6, 4, 16);
  rect(-10, 14, 4, 28);

  rect(-6, -30, 4, 16);
  rect(-6, -6, 4, 20);
  rect(-6, 22, 4, 12);

  rect(-2, -34, 4, 68);

  rect(2, -38, 4, 68);

  rect(6, -42, 4, 68);

  rect(10, -50, 4, 12);
  rect(10, -34, 4, 24);
  rect(10, -6, 4, 28);

  rect(14, -50, 4, 8);
  rect(14, -34, 4, 52);

  rect(18, -58, 4, 16);
  rect(18, -34, 4, 40);
  rect(18, 14, 4, 4);

  rect(22, -62, 4, 24);
  rect(22, -34, 4, 20);
  rect(22, -2, 4, 12);

  rect(26, -66, 4, 16);
  rect(26, -42, 4, 28);
  rect(26, -6, 4, 20);
  rect(26, 114, 4, 28);

  rect(30, -70, 4, 20);
  rect(30, -46, 4, 20);
  rect(30, -14, 4, 28);
  rect(30, 90, 4, 16);
  rect(30, 114, 4, 12);
  rect(30, 130, 4, 16);
  rect(30, 150, 4, 4);

  rect(34, -70, 4, 44);
  rect(34, -22, 4, 16);
  rect(34, -2, 4, 12);
  rect(34, 78, 4, 48);
  rect(34, 142, 4, 12);

  rect(38, -74, 4, 36);
  rect(38, -34, 4, 40);
  rect(38, 74, 4, 8);
  rect(38, 90, 4, 4);
  rect(38, 98, 4, 20);

  rect(42, -78, 4, 28);
  rect(42, -46, 4, 48);
  rect(42, 70, 4, 28);

  rect(46, -78, 4, 12);
  rect(46, -58, 4, 56);
  rect(46, 26, 4, 24);
  rect(46, 58, 4, 8);
  rect(46, 74, 4, 12);

  rect(50, -82, 4, 76);
  rect(50, 14, 4, 8);
  rect(50, 26, 4, 36);
  rect(50, 66, 4, 16);

  rect(54, -82, 4, 32);
  rect(54, -46, 4, 36);
  rect(54, 6, 4, 12);
  rect(54, 26, 4, 36);
  rect(54, 66, 4, 16);

  rect(58, -82, 4, 36);
  rect(58, -38, 4, 32);
  rect(58, -2, 4, 48);
  rect(58, 54, 4, 20);

  rect(62, -82, 4, 16);
  rect(62, -62, 4, 20);
  rect(62, -38, 4, 84);
  rect(62, 58, 4, 8);

  rect(66, -82, 4, 40);
  rect(66, -38, 4, 100);

  rect(70, -82, 4, 36);
  rect(70, -42, 4, 92);

  rect(74, -78, 8, 128);

  rect(82, -74, 4, 128);

  rect(86, -74, 4, 24);
  rect(86, -46, 4, 40);
  rect(86, -2, 4, 68);

  rect(90, -70, 4, 128);
  rect(90, 62, 4, 4);
  rect(90, 70, 4, 4);

  rect(94, -66, 4, 20);
  rect(94, -42, 4, 64);
  rect(94, 26, 4, 32);
  rect(94, 62, 4, 16);

  rect(98, -58, 4, 80);
  rect(98, 34, 4, 24);
  rect(98, 62, 4, 20);

  rect(102, -38, 4, 44);
  rect(102, 42, 4, 4);
  rect(102, 62, 4, 36);

  rect(106, -30, 4, 28);
  rect(106, 62, 4, 8);
  rect(106, 74, 4, 40);

  rect(110, 70, 4, 72);

  rect(114, 82, 4, 72);

  rect(118, 142, 4, 12);

  //light grey details
  fill(219);
  rect(-102, -66, 4, 12);

  rect(-98, 50, 4, 12);

  rect(-90, 10, 4, 4);

  rect(-86, -38, 4, 4);

  rect(-74, 14, 4, 4);

  rect(-70, 10, 4, 4);
  rect(-70, 42, 8, 4);
  rect(-70, 70, 8, 4);

  rect(-66, -42, 4, 4);

  rect(-62, -70, 4, 8);

  rect(-58, -74, 4, 12);

  rect(-54, 42, 8, 4);

  rect(-46, -6, 4, 4);
  rect(-46, 30, 4, 4);
  rect(-46, 58, 8, 4);
  rect(-46, 90, 4, 4);

  rect(-34, 134, 4, 8);

  rect(-30, 74, 4, 4);

  rect(-26, 30, 4, 4);
  rect(-26, 46, 8, 4);
  rect(-26, 50, 4, 12);

  rect(-22, 62, 8, 4);

  rect(-10, -22, 4, 4);
  rect(-10, -10, 4, 4);
  rect(-10, 10, 4, 4); 

  rect(-6, -14, 4, 8);
  rect(-6, 14, 4, 8);

  rect(10, -38, 16, 4);
  rect(10, -10, 4, 4);

  rect(14, -54, 4, 4);
  rect(14, -42, 8, 4);

  rect(18, 6, 4, 8);

  rect(22, -14, 4, 12);
  rect(22, 10, 4, 4);

  rect(26, -50, 4, 8);
  rect(26, -14, 4, 8);

  rect(30, -50, 4, 4);
  rect(30, -26, 4, 12);
  rect(30, 106, 4, 8);
  rect(30, 126, 4, 4);
  rect(30, 146, 4, 4);

  rect(34, -26, 4, 4);
  rect(34, -6, 4, 4);

  rect(38, -38, 4, 4);
  rect(38, 82, 4, 8);
  rect(38, 94, 4, 4);

  rect(42, -50, 4, 4);

  rect(46, -66, 4, 8);
  rect(46, 66, 4, 8);

  rect(50, 62, 8, 4);
  rect(50, 22, 4, 4);
  rect(50, 82, 4, 4);

  rect(54, -50, 4, 4);
  rect(54, 18, 4, 8);

  rect(58, -46, 4, 8);
  rect(58, 46, 4, 8);

  rect(62, -66, 4, 4);
  rect(62, -42, 8, 4);
  rect(62, 46, 4, 12);

  rect(70, -46, 4, 4);

  rect(86, -50, 4, 4);
  rect(86, -6, 4, 4);

  rect(90, 58, 20, 4);
  rect(90, 66, 4, 4);

  rect(94, -46, 4, 4);
  rect(94, 22, 4, 4);

  rect(102, 46, 4, 12);

  rect(106, 70, 4, 4);

  //dark grey details
  fill(128);
  rect(-102, -54, 4, 4);

  rect(-78, 10, 4, 4);

  rect(-74, -18, 4, 4);

  rect(-62, -62, 4, 4);

  //eye
  //lighter grey
  fill(155);
  rect(-98, -2, 4, 16);

  rect(-94, -10, 4, 12);
  rect(-94, 6, 4, 12);

  rect(-90, -6, 4, 16);

  //pupil
  fill(128);
  rect(-94, 2, 4, 4);
  popMatrix();
}
