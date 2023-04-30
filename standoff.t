setscreen ("offscreenonly")

var chars : array char of boolean
var d : int := 1
var cowboy1LeftPic : int
var cowboy2LeftPic : int
var cowboy1RightPic : int
var cowboy2RightPic : int
var horizontalmomentum1 : int := 0
var verticalmomentum1 : int := 0
var horizontalmomentum2 : int := 0
var verticalmomentum2 : int := 0
cowboy1LeftPic := Pic.FileNew ("cowboy2left5.bmp")
cowboy2LeftPic := Pic.FileNew ("cowboy1left5.bmp")
cowboy1RightPic := Pic.FileNew ("cowboy2right5.bmp")
cowboy2RightPic := Pic.FileNew ("cowboy1right5.bmp")
var detroit : int
detroit := Pic.FileNew ("detroit.bmp")
var welcomeScreen : int
welcomeScreen := Pic.FileNew ("desert3.bmp")
var background : int
background := Pic.FileNew ("thehood.bmp")
var background2 : int
background2 := Pic.FileNew ("space45.bmp")
var x1 : int := 20
var y1 : int := 40
var x2 : int := 495
var y2 : int := 40
var count : int := 0
var direction1 : string := "right"
var direction2 : string := "left"
var bulletx1 : array 1 .. 15 of int
var bullety1 : array 1 .. 15 of real
var bulletx2 : array 1 .. 15 of int
var bullety2 : array 1 .. 15 of real
var bulletdirection1 : array 1 .. 15 of int
var bulletdirection2 : array 1 .. 15 of int
var bulletdirectiony1 : array 1 .. 15 of real
var bulletdirectiony2 : array 1 .. 15 of real
var bulletalive1 : array 1 .. 15 of boolean
var bulletalive2 : array 1 .. 15 of boolean



var bulletx3 : int := 0
var bulletx4 : int := 0
var bullety3 : real
var bullety4 : real
var bulletdirection3 : int
var bulletdirection4 : int
var bulletdirectiony3 : real
var bulletdirectiony4 : real
var bulletalive3 : boolean := false
var bulletalive4 : boolean := false
var bulletcount3 : int := 0
var bulletcount4 : int := 0

var count1 : int := 0
var count2 : int := 0

var hp1 : int := 15
var hp2 : int := 15
var font1 : int
var font2 : int
font1 := Font.New ("algerian:32:bold,italic")
font2 := Font.New ("algerian:32:bold,italic")
var endbackground1 : int
endbackground1 := Pic.FileNew ("end1.bmp")
var endbackground2 : int
endbackground2 := Pic.FileNew ("end2.bmp")
var heart1 : int
var heart2 : int
heart1 := Pic.FileNew ("heart1.bmp")
heart2 := Pic.FileNew ("heart2.bmp")
var mode : int
var selection : int
selection := Pic.FileNew ("space381.bmp")
var bulletcount1 : int := 0
var bulletcount2 : int := 0
for i : 1 .. 15

    bulletx1 (i) := 0
    bulletx2 (i) := 0
    bullety1 (i) := 0
    bullety2 (i) := 0
    bulletdirection1 (i) := 0
    bulletdirection2 (i) := 0
    bulletdirectiony1 (i) := 0
    bulletdirectiony2 (i) := 0
    bulletalive1 (i) := false
    bulletalive2 (i) := false

end for


loop
    Input.KeyDown (chars)
    Pic.Draw (welcomeScreen, 0, 0, picCopy)
    View.Update
    exit when chars (' ')
end loop
loop
    Pic.Draw (selection, 0, 0, picCopy)
    View.Update
    Input.KeyDown (chars)
    if chars ('1') then
	mode := 1
	exit                         % mode selection
    elsif chars ('2') then
	mode := 2
	background := background2
	hp1 := 10
	hp2 := 10
	exit
    elsif chars ('3') then
	mode := 3
	hp1 := 100
	hp2 := 100
	background := detroit
	exit
    end if



end loop
delay (500)
loop


    %draws the pictures of the wild west background, cowboys, font, and where the cowboys start
    count += 1
    count1 += 1
    count2 += 1
    Pic.Draw (background, 0, 0, picCopy)
    if horizontalmomentum2 > 0 then
	Pic.Draw (cowboy2RightPic, x2, y2, picMerge)
	direction2 := "right"
    elsif horizontalmomentum2 < 0 then
	Pic.Draw (cowboy2LeftPic, x2, y2, picMerge)
	direction2 := "left"
    else
	if direction2 = "right" then
	    Pic.Draw (cowboy2RightPic, x2, y2, picMerge)
	else
	    Pic.Draw (cowboy2LeftPic, x2, y2, picMerge)
	end if
    end if
    Font.Draw (intstr (hp1), 55, 355, font1, 42)
    Font.Draw (intstr (hp2), 535, 355, font2, 10)



    if horizontalmomentum1 > 0 then
	Pic.Draw (cowboy1RightPic, x1, y1, picMerge)
	direction1 := "right"
    elsif horizontalmomentum1 < 0 then
	Pic.Draw (cowboy1LeftPic, x1, y1, picMerge)
	direction1 := "left"
    else
	if direction1 = "right" then
	    Pic.Draw (cowboy1RightPic, x1, y1, picMerge)
	else
	    Pic.Draw (cowboy1LeftPic, x1, y1, picMerge)
	end if
    end if



    Pic.Draw (heart1, 20, 350, picMerge)
    Pic.Draw (heart2, 500, 350, picMerge)



    if mode = 1 or mode = 2 then
	if bulletalive3 then
	    Draw.FillOval (bulletx3, round (bullety3), 3, 3, 42)
	end if

	if bulletalive4 then
	    Draw.FillOval (bulletx4, round (bullety4), 3, 3, 10)
	end if

    end if

    %View.Update
    %delay (5)
    %movement for both the cowboys

    Input.KeyDown (chars)
    if chars ('w') and y1 = 40 then
	if (mode = 1 or mode = 3) then
	    verticalmomentum1 := 7
	elsif mode = 2 then
	    verticalmomentum1 := 5
	end if
    end if
    if chars ('a') and x1 > 0 then
	horizontalmomentum1 := -2
    elsif x1 < 0 then
	x1 := 0
    end if
    if chars ('d') and x1 < 545 then
	horizontalmomentum1 := 2
    elsif x1 > 545 then
	x1 := 545
    end if
    if chars (KEY_UP_ARROW) and y2 = 40 then
	if (mode = 1 or mode = 3) then
	    verticalmomentum2 := 7
	elsif mode = 2 then
	    verticalmomentum2 := 5
	end if
    end if
    if chars (KEY_LEFT_ARROW) and x2 > 0 then
	horizontalmomentum2 := -2
    elsif x2 < 0 then
	x2 := 0
    end if
    if chars (KEY_RIGHT_ARROW) and x2 < 545 then
	horizontalmomentum2 := 2
    elsif x2 > 545 then
	x2 := 545
    end if

    x1 += horizontalmomentum1
    y1 += verticalmomentum1
    x2 += horizontalmomentum2
    y2 += verticalmomentum2

    if horizontalmomentum1 > 0 then
	horizontalmomentum1 -= 1
    elsif horizontalmomentum1 < 0 then
	horizontalmomentum1 += 1
    end if

    if y1 > 40 and count mod 5 = 0 and (mode = 1 or mode = 3) then
	verticalmomentum1 -= 1
    end if
    if y1 > 40 and count mod 20 = 0 and mode = 2 then
	verticalmomentum1 -= 1
    end if
    if y1 <= 40 then
	verticalmomentum1 := 0
	y1 := 40
    end if


    if horizontalmomentum2 > 0 then
	horizontalmomentum2 -= 1
    elsif horizontalmomentum2 < 0 then
	horizontalmomentum2 += 1
    end if

    if y2 > 40 and count mod 5 = 0 and (mode = 1 or mode = 3) then
	verticalmomentum2 -= 1
    end if
    if y2 > 40 and count mod 20 = 0 and mode = 2 then
	verticalmomentum2 -= 1
    end if
    if y2 <= 40 then
	verticalmomentum2 := 0
	y2 := 40
    end if

    if (mode = 1 or mode = 2) then
	if chars (' ') and bulletalive3 = false and bulletcount3 = 0 and (mode = 1 or mode = 2) then
	    if direction1 = "right" then
		bulletdirection3 := 5
		bulletx3 := x1 + 95
		bulletalive3 := true
		bullety3 := y1 + 63
	    else
		bulletdirection3 := -5
		bulletx3 := x1
		bulletalive3 := true
		bullety3 := y1 + 63

	    end if
	    bulletdirectiony3 := Rand.Real * 1.6 - 0.8
	    bulletcount3 := 1
	end if

	if bulletalive3 then

	    bulletx3 += bulletdirection3
	    bullety3 += bulletdirectiony3
	    if bulletx3 >= 640 or bulletx3 <= 0 then
		bulletalive3 := false
	    end if

	end if
	if bulletcount3 > 0 then
	    bulletcount3 += 1
	    if bulletcount3 = 150 then
		bulletcount3 := 0
	    end if
	end if

	if chars ('/') and bulletalive4 = false and bulletcount4 = 0 and (mode = 1 or mode = 2) then
	    if direction2 = "right" then
		bulletdirection4 := 5
		bulletx4 := x2 + 95
		bulletalive4 := true
		bullety4 := y2 + 63
	    else
		bulletdirection4 := -5
		bulletx4 := x2
		bulletalive4 := true
		bullety4 := y2 + 63

	    end if
	    bulletdirectiony4 := Rand.Real * 1.6 - 0.8
	    bulletcount4 := 1
	end if

	if bulletalive4 then
	    bulletx4 += bulletdirection4
	    bullety4 += bulletdirectiony4
	    if bulletx4 >= 640 or bulletx4 <= 0 then
		bulletalive4 := false

	    end if
	end if


	if bulletcount4 > 0 then
	    bulletcount4 += 1
	    if bulletcount4 = 150 then
		bulletcount4 := 0
	    end if
	end if



	if direction1 = "right" and bulletalive4 and bulletx4 >= x1 + 16 and bulletx4 <= x1 + 58 and bullety4 >= y1 + 66 and bullety4 <= y1 + 92 then     %legs
	    bulletalive4 := false
	    hp1 := hp1 - 1
	end if
	if direction1 = "right" and bulletalive4 and bulletx4 >= x1 and bulletx4 <= x1 + 55 and bullety4 >= y1 + 34 and bullety4 <= y1 + 64 then     %body
	    bulletalive4 := false
	    hp1 := hp1 - 1
	end if
	if direction1 = "right" and bulletalive4 and bulletx4 >= x1 + 50 and bulletx4 <= x1 + 77 and bullety4 >= y1 + 45 and bullety4 <= y1 + 53 then     %arm
	    bulletalive4 := false
	    hp1 := hp1 - 1
	end if
	if direction1 = "right" and bulletalive4 and (sqrt ((bulletx4 - x1 + 46) ** 2 + (bullety4 - y2 + 27) ** 2) <= 10) then     %headshot
	    bulletalive4 := false
	    hp1 := hp1 - 2
	end if


	if direction2 = "right" and bulletalive3 and bulletx3 >= x2 + 16 and bulletx3 <= x2 + 58 and bullety3 >= y2 + 66 and bullety3 <= y2 + 92 then         %legs
	    bulletalive3 := false
	    hp2 := hp2 - 1
	end if
	if direction2 = "right" and bulletalive3 and bulletx3 >= x2 and bulletx3 <= x2 + 55 and bullety3 >= y2 + 34 and bullety3 <= y2 + 64 then     %body
	    bulletalive3 := false
	    hp2 := hp2 - 1
	end if
	if direction2 = "right" and bulletalive3 and bulletx3 >= x2 + 50 and bulletx3 <= x2 + 77 and bullety3 >= y2 + 45 and bullety3 <= y2 + 53 then     %arm
	    bulletalive3 := false
	    hp2 := hp2 - 1
	end if
	if direction2 = "right" and bulletalive3 and (sqrt ((bulletx3 - x2 + 46) ** 2 + (bullety3 - y2 + 27) ** 2) <= 10) then     %headshot
	    bulletalive3 := false
	    hp2 := hp2 - 2
	end if


	if direction1 = "left" and bulletalive4 and bulletx4 >= x1 + 35 and bulletx4 <= x1 + 78 and bullety4 >= y1 + 66 and bullety4 <= y1 + 92 then         %legs
	    bulletalive4 := false
	    hp1 := hp1 - 1
	end if
	if direction1 = "left" and bulletalive4 and bulletx4 >= x1 + 40 and bulletx4 <= x1 + 94 and bullety4 >= y1 + 33 and bullety4 <= y1 + 65 then     %body
	    bulletalive4 := false
	    hp1 := hp1 - 1
	end if
	if direction1 = "left" and bulletalive4 and bulletx4 >= x1 + 15 and bulletx4 <= x1 + 45 and bullety4 >= y1 + 45 and bullety4 <= y1 + 54 then     %arm
	    bulletalive4 := false
	    hp1 := hp1 - 1
	end if
	if direction1 = "left" and bulletalive4 and (sqrt ((bulletx4 - x1 + 46) ** 2 + (bullety4 - 27) ** 2) <= 10) then     %headshot
	    bulletalive4 := false
	    hp1 := hp1 - 2
	end if


	if direction2 = "left" and bulletalive3 and bulletx3 >= x2 + 16 and bulletx3 <= x2 + 78 and bullety3 >= y2 + 66 and bullety3 <= y2 + 92 then                     %legs
	    bulletalive3 := false
	    hp2 := hp2 - 1
	end if
	if direction2 = "left" and bulletalive3 and bulletx3 >= x2 + 40 and bulletx3 <= x2 + 94 and bullety3 >= y2 + 33 and bullety3 <= y2 + 65 then     %body
	    bulletalive3 := false
	    hp2 := hp2 - 1
	end if
	if direction2 = "left" and bulletalive3 and bulletx3 >= x2 + 15 and bulletx3 <= x2 + 45 and bullety3 >= y2 + 45 and bullety3 <= y2 + 54 then     %arm
	    bulletalive3 := false
	    hp2 := hp2 - 1
	end if
	if direction2 = "left" and bulletalive3 and (sqrt ((bulletx3 - x2 + 46) ** 2 + (bullety3 - 27) ** 2) <= 10) then     %headshot
	    bulletalive3 := false
	    hp2 := hp2 - 2
	end if




    end if






    if mode = 3 then
	for i : 1 .. 15
	    if bulletalive1 (i) then
		Draw.FillOval (bulletx1 (i), round (bullety1 (i)), 3, 3, 42)
	    end if
	    if bulletalive2 (i) then
		Draw.FillOval (bulletx2 (i), round (bullety2 (i)), 3, 3, 10)
	    end if
	    %draws bullets
	    %View.Update
	    if chars (' ') and bulletalive1 (i) = false and bulletcount1 = 0 and count2 mod 10 = 0 then
		if direction1 = "right" then
		    bulletdirection1 (i) := 5
		    bulletx1 (i) := x1 + 95
		    bulletalive1 (i) := true
		    bullety1 (i) := y1 + 63
		else
		    bulletdirection1 (i) := -5
		    bulletx1 (i) := x1
		    bulletalive1 (i) := true
		    bullety1 (i) := y1 + 63
		    %left cowboy shooting
		end if
		bulletdirectiony1 (i) := Rand.Real * 1.3 - 0.65
		bulletcount1 := 1
	    end if

	    if bulletalive1 (i) then
		bulletx1 (i) += bulletdirection1 (i)
		bullety1 (i) += bulletdirectiony1 (i)
		if bulletx1 (i) >= 640 or bulletx1 (i) <= 0 then
		    bulletalive1 (i) := false
		    %so that the bullet moves properly
		end if
	    end if
	    if bulletcount1 > 0 then
		bulletcount1 += 1
		if bulletcount1 = 45 then
		    bulletcount1 := 0
		    %how many shots you can shoot in a certain amount of time
		end if
	    end if

	    if chars ('/') and bulletalive2 (i) = false and bulletcount2 = 0 and count2 mod 10 = 0 then
		if direction2 = "right" then
		    bulletdirection2 (i) := 5
		    bulletx2 (i) := x2 + 95
		    bulletalive2 (i) := true
		    bullety2 (i) := y2 + 63
		else
		    bulletdirection2 (i) := -5
		    bulletx2 (i) := x2
		    bulletalive2 (i) := true
		    bullety2 (i) := y2 + 63
		    %right cowboy shooting
		end if
		bulletdirectiony2 (i) := Rand.Real * 1.3 - 0.65
		bulletcount2 := 1
	    end if

	    if bulletalive2 (i) then
		bulletx2 (i) += bulletdirection2 (i)
		bullety2 (i) += bulletdirectiony2 (i)
		if bulletx2 (i) >= 640 or bulletx2 (i) <= 0 then
		    bulletalive2 (i) := false
		    %so that the bullet moves properly
		end if

	    end if


	    if bulletcount2 > 0 then
		bulletcount2 += 1
		if bulletcount2 = 45 then
		    bulletcount2 := 0
		    %how many shots you can shoot in a certain amount of time
		end if
	    end if



	    if direction1 = "right" and bulletalive2 (i) and bulletx2 (i) >= x1 + 16 and bulletx2 (i) <= x1 + 58 and bullety2 (i) >= y1 + 66 and bullety2 (i) <= y1 + 92 then     %legs
		bulletalive2 (i) := false
		hp1 := hp1 - 1
	    end if
	    if direction1 = "right" and bulletalive2 (i) and bulletx2 (i) >= x1 and bulletx2 (i) <= x1 + 55 and bullety2 (i) >= y1 + 34 and bullety2 (i) <= y1 + 64 then     %body
		bulletalive2 (i) := false
		hp1 := hp1 - 1
	    end if
	    if direction1 = "right" and bulletalive2 (i) and bulletx2 (i) >= x1 + 50 and bulletx2 (i) <= x1 + 77 and bullety2 (i) >= y1 + 45 and bullety2 (i) <= y1 + 53 then     %arm
		bulletalive2 (i) := false
		hp1 := hp1 - 1
	    end if
	    if direction1 = "right" and bulletalive2 (i) and (sqrt ((bulletx2 (i) - x1 + 46) ** 2 + (bullety2 (i) - y2 + 27) ** 2) <= 10) then     %headshot
		bulletalive2 (i) := false
		hp1 := hp1 - 2
	    end if


	    if direction2 = "right" and bulletalive1 (i) and bulletx1 (i) >= x2 + 16 and bulletx1 (i) <= x2 + 58 and bullety1 (i) >= y2 + 66 and bullety1 (i) <= y2 + 92 then     %legs
		bulletalive1 (i) := false
		hp2 := hp2 - 1
	    end if
	    if direction2 = "right" and bulletalive1 (i) and bulletx1 (i) >= x2 and bulletx1 (i) <= x2 + 55 and bullety1 (i) >= y2 + 34 and bullety1 (i) <= y2 + 64 then     %body
		bulletalive1 (i) := false
		hp2 := hp2 - 1
	    end if
	    if direction2 = "right" and bulletalive1 (i) and bulletx1 (i) >= x2 + 50 and bulletx1 (i) <= x2 + 77 and bullety1 (i) >= y2 + 45 and bullety1 (i) <= y2 + 53 then     %arm
		bulletalive1 (i) := false
		hp2 := hp2 - 1
	    end if
	    if direction2 = "right" and bulletalive1 (i) and (sqrt ((bulletx1 (i) - x2 + 46) ** 2 + (bullety1 (i) - y2 + 27) ** 2) <= 10) then     %headshot
		bulletalive1 (i) := false
		hp2 := hp2 - 2
	    end if


	    if direction1 = "left" and bulletalive2 (i) and bulletx2 (i) >= x1 + 35 and bulletx2 (i) <= x1 + 78 and bullety2 (i) >= y1 + 66 and bullety2 (i) <= y1 + 92 then     %legs
		bulletalive2 (i) := false
		hp1 := hp1 - 1
	    end if
	    if direction1 = "left" and bulletalive2 (i) and bulletx2 (i) >= x1 + 40 and bulletx2 (i) <= x1 + 94 and bullety2 (i) >= y1 + 33 and bullety2 (i) <= y1 + 65 then     %body
		bulletalive2 (i) := false
		hp1 := hp1 - 1
	    end if
	    if direction1 = "left" and bulletalive2 (i) and bulletx2 (i) >= x1 + 15 and bulletx2 (i) <= x1 + 45 and bullety2 (i) >= y1 + 45 and bullety2 (i) <= y1 + 54 then     %arm
		bulletalive2 (i) := false
		hp1 := hp1 - 1
	    end if
	    if direction1 = "left" and bulletalive2 (i) and (sqrt ((bulletx2 (i) - x1 + 46) ** 2 + (bullety2 (i) - 27) ** 2) <= 10) then     %headshot
		bulletalive2 (i) := false
		hp1 := hp1 - 2
	    end if


	    if direction2 = "left" and bulletalive1 (i) and bulletx1 (i) >= x2 + 16 and bulletx1 (i) <= x2 + 78 and bullety1 (i) >= y2 + 66 and bullety1 (i) <= y2 + 92 then                 %legs
		bulletalive1 (i) := false
		hp2 := hp2 - 1
	    end if
	    if direction2 = "left" and bulletalive1 (i) and bulletx1 (i) >= x2 + 40 and bulletx1 (i) <= x2 + 94 and bullety1 (i) >= y2 + 33 and bullety1 (i) <= y2 + 65 then     %body
		bulletalive1 (i) := false
		hp2 := hp2 - 1
	    end if
	    if direction2 = "left" and bulletalive1 (i) and bulletx1 (i) >= x2 + 15 and bulletx1 (i) <= x2 + 45 and bullety1 (i) >= y2 + 45 and bullety1 (i) <= y2 + 54 then     %arm
		bulletalive1 (i) := false
		hp2 := hp2 - 1
	    end if
	    if direction2 = "left" and bulletalive1 (i) and (sqrt ((bulletx1 (i) - x2 + 46) ** 2 + (bullety1 (i) - 27) ** 2) <= 10) then     %headshot
		bulletalive1 (i) := false
		hp2 := hp2 - 2
		%all are hitboxes
	    end if

	end for

    end if

    exit when hp2 = 0
    exit when hp1 = 0
    View.Update
    delay (5)

end loop

if hp2 = 0 then
    Pic.Draw (endbackground1, 0, 0, picCopy)
elsif hp1 = 0 then
    Pic.Draw (endbackground2, 0, 0, picCopy)
end if
View.Update
