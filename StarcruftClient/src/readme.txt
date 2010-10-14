Project organization

Client

Main.hx - Has main (), Creates a Client object (which is a sprite and adds it to the flash library)
  Client.hx - Contains a Ship and a Battlefield
    Ship.hx - is a Space Object. Contains thrusters and logic to update the amount of thrust.
	  SpaceObject.hx - is a Sprite. Contains all the physics variables an update() function.
    Battlefield.hx - is a Sprite. Conatins all the SpaceObjects and draws stars.
	  
	

BattleView.hx - Seems to want to draw a frame. Not used currently.