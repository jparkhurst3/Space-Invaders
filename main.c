#include <stdlib.h>
#include "myLib.h"
#include "text.h"
#include "splash.h"
#include "player.h"
#include "enemy1.h"
#include "enemy2.h"
#include "enemy3.h"
#include "title.h"
#include "heart.h"
#include "pause.h"
#include "win.h"
#include "lose.h"
#include <time.h>
#include "brickHealth3.h"
#include "brickHealth2.h"
#include "BrickHealth1.h"

#define SPLASHCREEN 0
#define GAMESCREEN 1
#define PAUSESCREEN 2
#define WINSCREEN 3
#define LOSESCREEN 4

int state;
int seed;

unsigned int buttons;
unsigned int oldButtons;

int updateE;
int updateB;
int activeBullets;
int activeBombs;
int enemiesKilled;
int lives;
int needToDrawText;

///////////////////////STRUCTS
//Enemy Struct
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int active;
} ENEMY;

ENEMY enemies[60];
ENEMY oldEnemies[60];

//Player Struct
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int active;
} PLAYER;

PLAYER player;
PLAYER oldPlayer;

//Bullet Struct
typedef struct {
    int row;
    int col;
    int velocity;
    int active;
    u16 color;
} BULLET;

BULLET bullets[20];
BULLET oldBullets[20];

//Bomb Struct
typedef struct {
    int row; 
    int col; 
    int velocity;
    int active;
    u16 color;
} BOMB;

BOMB bombs[10];
BOMB oldBombs[10];

//Brick Struct
typedef struct {
    int row; 
    int col;
    int health;
    u16 color;
} BRICK;

BRICK bricks[3];
BRICK oldBricks[3];

int main()
{
	initialize();

    initSplash();

	while(1)
	{
		oldButtons = buttons;
		buttons = BUTTONS;
		switch(state)
		{
			case SPLASHCREEN:
				splash();
				break;
			case GAMESCREEN:
				game();
				break;
            case PAUSESCREEN:
                pause();
                break;
            case WINSCREEN:
                win();
                break;
            case LOSESCREEN:
                lose();
                break;
		}

		waitForVblank();
    	flipPage();

    }

	return 0;
}

void initialize()
{
	REG_DISPCTL = MODE4 | BG2_ENABLE;

	buttons = BUTTONS;

    seed = 0;

    //Initialize Player
    player.row = 150;
    player.col = 110;
    player.rdel = 0;
    player.cdel = 2;
    player.active = 1;

    //Initialize Enemies
    int startingRow = 20;
    int startingCol = 32;
    for(int i=0; i<60; i++) {
        enemies[i].row = startingRow;
        enemies[i].col = startingCol;
        startingCol += 18;
        if((i == 9) | (i==19) | (i==29) | (i==39) | (i==49) | (i==59)) {
            startingRow +=12;
            startingCol = 32;
        }
        enemies[i].rdel = 2;
        enemies[i].cdel = 2;
        enemies[i].active = 1;
    }
    updateE = 0;

    //Initialize Bullets
    for(int i=0; i<20; i++) {
        bullets[i].row = 150;
        bullets[i].col = 70;
        bullets[i].velocity = 2;
        bullets[i].active = 0;
        bullets[i].color = BLACKINDEX;
    }
    activeBullets = 0;

    //Initialize Bombs (bullets from enemies)
    for(int i=0; i<10; i++) {
        bombs[i].velocity = 2;
        bombs[i].active = 0;
        bombs[i].color = BLACKINDEX;
    }
    srand(time(NULL));
    updateB = 0;

    //Initialize Bricks
    int a = 0;
    for(int i=0; i<3; i++) {
        bricks[i].row = 130;
        bricks[i].col = 50+a;
        a += 60;
        bricks[i].health = 3;
    }

    enemiesKilled = 0;
    lives = 3;
    needToDrawText = 1;
}

void initSplash()
{
	loadPalette(splashPal);

	flipPage();
	drawBackgroundImage4(splashBitmap);
	flipPage();
	drawBackgroundImage4(splashBitmap);

	state = SPLASHCREEN;
}

void splash()
{
    seed++;

	if(BUTTON_PRESSED(BUTTON_START))
	{
		initGame();
	}
}

void initGame()
{
	loadPalette(playerPal);

	state = GAMESCREEN;
    srand(seed);
}

void game()
{
    //Update
    updateBullets();
    updateBomb();
    updateEnemies();
    updateBricks();
    updatePlayer();

	waitForVblank();

    //Draw
    drawText();
    drawOldBullets();
    drawOldBombs();
    drawBricks();
	drawEnemies();
    drawPlayer();
    drawNewBullets();
    drawNewBombs();

	if(BUTTON_PRESSED(BUTTON_START))
	{
    	initialize();
        initSplash();
	}

    if(BUTTON_PRESSED(BUTTON_A)) {
        initPause();
    }
}

void initPause() {
    loadPalette(splashPal);

    flipPage();
    drawBackgroundImage4(pauseBitmap);
    flipPage();
    drawBackgroundImage4(pauseBitmap);

    state = PAUSESCREEN;
}

void pause() {
    if(BUTTON_PRESSED(BUTTON_A)) {
        initGame();
    }
}

void initWin() {
    loadPalette(winPal);

    flipPage();
    drawBackgroundImage4(winBitmap);

    state = WINSCREEN;
}

void win() {
    loadPalette(winPal);
    drawBackgroundImage4(winBitmap);

    if(BUTTON_PRESSED(BUTTON_START)) {
        initialize();
        initSplash();
    }
}

void initLose() {
    loadPalette(losePal);

    flipPage();
    drawBackgroundImage4(loseBitmap);

    state = LOSESCREEN;
}

void lose() {
    loadPalette(losePal);
    drawBackgroundImage4(loseBitmap);

    if(BUTTON_PRESSED(BUTTON_START)) {
        initialize();
        initSplash();
    }    
}

//////////////////////////////ENEMY CONTROL///////////////////////////////////
void updateEnemies() {
    updateE++;
    if(updateE == 10) {
        updateE = 0;
        for(int a=0; a<60; a++) {
            oldEnemies[a] = enemies[a];
        }
        if((enemies[9].col > 227) | (enemies[0].col < 2)) {
            for(int i=0; i<60; i++) {
                enemies[i].cdel = -enemies[i].cdel;
                enemies[i].row += enemies[i].rdel;
            }
        }
        for(int i=0; i<60; i++) {
            enemies[i].col += enemies[i].cdel;
        }
        int randNum;
        randNum = rand() % 60;
        if(enemies[randNum].active == 1) {
            updateB++;
            if(updateB == 3) {
                dropBomb(randNum);
                updateB = 0;
            }
        }
    }
    if(enemies[59].row > 140) {
        initLose();
    }
}

void drawEnemies() {
    for(int i=0; i<20; i++) {
        drawRect4(oldEnemies[i].row - 2, oldEnemies[i].col -2, 12, 16, BLACK);
        if(enemies[i].active == 1) {
            drawImage4(enemy1Bitmap, enemies[i].row, enemies[i].col, 8, 12);    
        }
    }
    for(int i=20; i<40; i++) {
        drawRect4(oldEnemies[i].row - 2, oldEnemies[i].col -2, 12, 16, BLACK);
        if(enemies[i].active == 1) {
            drawImage4(enemy2Bitmap, enemies[i].row, enemies[i].col, 8, 12);    
        }
    }
    for(int i=40; i<60; i++) {
        drawRect4(oldEnemies[i].row - 2, oldEnemies[i].col -2, 12, 16, BLACK);
        if(enemies[i].active ==1) {
            drawImage4(enemy3Bitmap, enemies[i].row, enemies[i].col, 8, 12);
        }
    }
}

///////////////////////////PLAYER CONTROLS///////////////////////////////////////
void updatePlayer() {
    oldPlayer = player;
    if(BUTTON_HELD(BUTTON_LEFT)) {
        player.col = player.col - player.cdel;
        if(player.col < 0) {
            player.col = 0;
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        player.col = player.col + player.cdel;
        if(player.col > (227)) {
            player.col = 226;
        }
    }
    if(BUTTON_PRESSED(BUTTON_UP)) {
        shootBullet();
    }
}

void drawPlayer() {
    drawRect4(oldPlayer.row - 3, oldPlayer.col - 3, 14, 17, BLACK);
    drawImage4(playerBitmap, player.row, player.col, 8, 12);
}

/////////////////////////////BULLET CONTROLS/////////////////////////////////////
void updateBullets() {
    for(int a=0; a<20; a++) {
        oldBullets[a] = bullets[a];
    }
    //CHECK FOR COLLISION
    for(int i=0; i<20; i++) { //for each active bullet
        if(bullets[i].active == 1) {
            int yes = 0;
            bullets[i].row -= bullets[i].velocity;//move bullet up

            for(int j=0; j<60; j++) { //for each active enemy
                if(enemies[j].active == 1) {

                    if(bullets[i].row > enemies[j].row) {
                        if(bullets[i].row < (enemies[j].row + 8)) {
                            yes++;
                        }
                    }
                    if(bullets[i].col > enemies[j].col - 3) {
                        if(bullets[i].col < (enemies[j].col + 14)) {
                            yes++;
                        }
                    }
                    if(yes == 2) {
                        enemies[j].active = 0;
                        bullets[i].active = 0;
                        enemiesKilled++;
                        if(enemiesKilled > 59) {
                            initWin();
                        }
                    }
                    yes = 0;
                }
            }
            if(bullets[i].row < 12) {
                bullets[i].row = 12;
                bullets[i].active = 0;
            }
        }
    }
}

void drawOldBullets() {
    for(int i=0; i<20; i++) {
        drawRect4(oldBullets[i].row - 1, oldBullets[i].col -1 , 9, 4, BLACKINDEX);   
    }
}

void drawNewBullets() {
    for(int i=0; i<20; i++) {
        if(bullets[i].active == 1) {   
            drawRect4(bullets[i].row, bullets[i].col, 5, 3, REDINDEX);
        }
    }
}

void shootBullet() {
    bullets[activeBullets].active = 1;
    bullets[activeBullets].row = 140;
    bullets[activeBullets].col = player.col + 6;
    activeBullets++;
    if(activeBullets == 19) {
        activeBullets = 0;
    }
}

///////////////////////////BOMB CONTROLS////////////////////////////////
void dropBomb(int randomEnemy) {
    bombs[activeBombs].active = 1;
    bombs[activeBombs].row = enemies[randomEnemy].row + 8;
    bombs[activeBombs].col = enemies[randomEnemy].col + 6;
    activeBombs++;
    if(activeBombs == 9) {
        activeBombs = 0;
    }
}

void updateBomb() {
    for(int a=0; a<10; a++) {
        oldBombs[a] = bombs[a];
    }
    for(int i=0; i<10; i++) { //for each active bomb
        if(bombs[i].active == 1) {
            int yes = 0;
            bombs[i].row += bombs[i].velocity;//move bomb down

            if(bombs[i].row > player.row - 3) {
                yes++;
            }
            if(bombs[i].col > player.col - 3) {
                if(bombs[i].col < (player.col + 14)) {
                    yes++;
                }
            }
            if(yes == 2) {
                bombs[i].active = 0;
                lives--;
                if(lives == 0) {
                    initLose();
                }
            }
            yes = 0;
        }
        if(bombs[i].row > 155) {
            bombs[i].row = 155;
            bombs[i].active = 0;
        }
    }
}

void drawOldBombs() {
    for(int i=0; i<10; i++) {
        drawRect4(oldBombs[i].row - 3, oldBombs[i].col -1 , 9, 4, BLACKINDEX);   
    }
}

void drawNewBombs() {
    for(int i=0; i<10; i++) {
        if(bombs[i].active == 1) {   
            drawRect4(bombs[i].row, bombs[i].col, 5, 3, REDINDEX);
        }
    }
}

///////////////////////////BRICK CONTROLS ///////////////////////////////////////
void updateBricks() {
    //CHECK FOR COLLISION WITH BOMBS
    for(int i=0; i<10; i++) { //for each active bomb
        if(bombs[i].active == 1) {
            for(int b=0; b<3; b++) { //for each brick
                if(bricks[b].health > 0) {
                    int yes = 0;

                    if(bombs[i].row > bricks[b].row - 3) {
                        yes++;
                    }
                    if(bombs[i].col > bricks[b].col - 3) {
                        if(bombs[i].col < (bricks[b].col + 25)) {
                            yes++;
                        }
                    }
                    if(yes == 2) {
                        bombs[i].active = 0;
                        bricks[b].health--;
                    }
                    yes = 0;
                }
            }
        }
    }
    //CHECK FOR COLLISIONS WITH BULLLETS
    for(int i=0; i<20; i++) { //for each active bullet
        if(bullets[i].active == 1) {
            for(int b=0; b<3; b++) { //for each brick
                if(bricks[b].health > 0) {
                    int yes = 0;

                    if(bullets[i].row < bricks[b].row + 10) {
                        yes++;
                    }
                    if(bullets[i].col > bricks[b].col - 3) {
                        if(bullets[i].col < (bricks[b].col + 25)) {
                            yes++;
                        }
                    }
                    if(yes == 2) {
                        bullets[i].active = 0;
                        bricks[b].health--;
                    }
                    yes = 0;
                }
            }
        }
    }
}

void drawBricks() {
    for(int i=0; i<3; i++) {
        if(bricks[i].health == 3) {
            drawImage4(brickHealth3Bitmap, bricks[i].row, bricks[i].col, 10, 24);
        }
        if(bricks[i].health == 2) {
            drawImage4(brickHealth2Bitmap, bricks[i].row, bricks[i].col, 10, 24);
        }
        if(bricks[i].health == 1) {
            drawImage4(BrickHealth1Bitmap, bricks[i].row, bricks[i].col, 10, 24);
        }
    }
}

//////////////////////////TEXT & OTHER CONTROLS///////////////////////////////////
void drawText() {
    drawRect4(0, 0, 160, 240, BLACK);
    drawImage4(titleBitmap, 2, 40, 10, 100);

    drawRect4(2, 143, 10, 40, BLACKINDEX);
    int a = 0;
    for(int j=0; j<lives; j++) {
        drawImage4(playerBitmap, 2, 145+a, 8, 12);
        a += 16;
    }
}